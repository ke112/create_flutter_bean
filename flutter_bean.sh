#!/bin/bash

# document=$1
# beanName=$2
# json=$3

# document=/Users/ke/Desktop
# beanName=MineHomeBean
# 很全面的一个json
# json1='{"msg":"成功","traceId":"d4eabcd9c4679423","code":200,"data":[{"image":"https://kf-img-oss.manmanstyle.com/roomtype/5BA6BDB53F664B0B.jpg","otherMembers":[{"realName":"爱新觉罗","headImg":"","isOwner":0,"identityId":11,"identity":"保姆","mId":"956013060425531392","mid":956013060425531392,"cId":"990688511457759232","relation":null,"cid":990688511457759232}],"awaitAuthRecords":null,"authState":0,"lng":116.475631,"roomNo":"2002","roomCode":"C8-二单元-20层-2002","housekeeper":null,"familyMembers":[{"realName":"张志华","headImg":"","isOwner":0,"identityId":5,"identity":"爱人","mId":"1107466061856604160","mid":1107466061856604160,"cId":"1107468065299558400","relation":null,"cid":1107468065299558400},{"realName":"qweqew","headImg":null,"isOwner":0,"identityId":5,"identity":"爱人","mId":"1107487903543463936","mid":1107487903543463936,"cId":"1107487903308902400","relation":null,"cid":1107487903308902400}],"roomId":1649,"authRecord":null,"familyName":"相亲相爱一家人213","newMembers":[],"shareClubCards":[],"communityName":"缦合北京","id":24,"communityId":153,"roomCodeSimple":"1-2-20-2002","lat":39.964353},{"image":"https://kf-img-oss.manmanstyle.com/roomtype/5BA6BDB53F664B0B.jpg","otherMembers":[],"awaitAuthRecords":[{"idType":"身份证","headImg":"","idCard":"952***********2960","mobile":"176****8388","mId":"956013060425531392","updateTime":1667979708000,"identityCode":"DRIVER","roomId":1644,"roomName":"C8-二单元-21层-2101","auditState":0,"recordId":"1107821444324503552","realName":"*发","progressRecords":null,"createTime":1667979709000,"isOwner":0,"identity":"司机","communityName":"B区","validTime":1668649771000,"id":5,"communityId":153,"rejectCause":null}],"authState":0,"lng":116.475631,"roomNo":"2101","roomCode":"C8-二单元-21层-2101","housekeeper":null,"familyMembers":[{"realName":"1","headImg":null,"isOwner":1,"identityId":1,"identity":"业主","mId":"999390458008309760","mid":999390458008309760,"cId":"999390433379581952","relation":null,"cid":999390433379581952},{"realName":"张志华","headImg":"","isOwner":1,"identityId":1,"identity":"业主","mId":"1107466061856604160","mid":1107466061856604160,"cId":"1107468065299558400","relation":null,"cid":1107468065299558400}],"roomId":1644,"authRecord":null,"familyName":"相亲相爱一家人5","newMembers":[],"shareClubCards":[],"communityName":"缦合北京","id":20,"communityId":153,"roomCodeSimple":"1-2-21-2101","lat":39.964353},{"image":"https://kf-img-oss.manmanstyle.com/roomtype/5BA6BDB53F664B0B.jpg","otherMembers":null,"awaitAuthRecords":null,"authState":1,"lng":116.40062,"roomNo":"201","roomCode":"11号楼-1单元-2层-201","housekeeper":null,"familyMembers":null,"roomId":391,"authRecord":{"idType":"身份证","headImg":"","idCard":"952***********2960","mobile":"159****6989","mId":"1107466061856604160","updateTime":1667984995000,"identityCode":"DRIVER","roomId":391,"roomName":"11号楼-1单元-2层-201","auditState":0,"recordId":"1107843618905108480","realName":"*试","progressRecords":null,"createTime":1667984996000,"isOwner":0,"identity":"司机","communityName":"A区","validTime":1668649771000,"id":6,"communityId":153,"rejectCause":null},"familyName":"相亲相爱一家人","newMembers":null,"shareClubCards":null,"communityName":"珠江帝景","id":11,"communityId":147,"roomCodeSimple":"11号楼-1-2-201","lat":39.910206}],"success":true}'
# json='{"msg":"验证码输入错误","traceId":"471b328bec6f28d3","code":222,"data":null,"success":false}'
# json='{"msg":"成功","traceId":"799da77e9ae174fc","code":200,"data":{"imageAndTxtSlideToMh":null,"lineTitle":null,"commodityFalls":null,"slideshowToMh":null,"commoditySlide":null},"success":true}'
#数组的
# json='{"msg":"成功","traceId":"799da77e9ae174fc","code":200,"data":[{"imageAndTxtSlideToMh":null,"lineTitle":null,"commodityFalls":null,"slideshowToMh":null,"commoditySlide":null},{"imageAndTxtSlideToMh":null,"lineTitle":null,"commodityFalls":null,"slideshowToMh":null,"commoditySlide":null}],"success":true}'
#字典的
json1='{"msg":"成功","traceId":"799da77e9ae174fc","code":200,"data":{"imageAndTxtSlideToMh":null,"lineTitle":null,"commodityFalls":null,"slideshowToMh":null,"commoditySlide":null},"success":true}'
# echo $document
# echo $beanName
# echo $json

# https://www.json.cn//

# cd $document
# rm -rf $beanName.dart
# touch $beanName.dart

# echo $json | jq -r .
# echo $json | jq 'values'
# echo $json | jq -r .msg

parseJson() {
  echo '第一个参数: '$1
  echo '第二个参数: '$2
  echo '第三个参数: '$3
  if [[ $1 == 1 ]]; then
    echo '是json一级解析'
    json=$3
  else
    echo 'json下的map遍历'
  fi
  className=$2

  echo
  echo '要解析的json: '$json
  one_keys=$(echo $json | jq -r keys[])
  echo
  echo '一级的keys: '$one_keys
  echo

  echo "class $className {" >>bean.dart
  for item in $one_keys; do
    one_value=$(echo $json | jq -r .$item)
    if [[ $one_value =~ ^[0-9]+$ ]]; then
      echo $one_value"是数字"
      echo "  int? $item;" >>bean.dart
    elif [[ $one_value =~ [0-9]*(\.[0-9]*|[eE][+-][0-9]*)$ ]]; then
      echo $one_value"是浮点型"
      echo "  double? $item;" >>bean.dart
    elif [[ $one_value == true || $one_value == false ]]; then
      echo $one_value"是布尔值"
      echo "  bool? $item;" >>bean.dart
    elif [[ $one_value == null ]]; then
      echo $one_value"是null"
      echo "  dynamic $item;" >>bean.dart
    elif [[ $one_value =~ ^\{.* ]]; then
      echo "是字典-- $one_value"

      item2=$(echo ${item:0:1} | tr '[a-z]' '[A-Z]')${item:1}
      subClassName=$className$item2
      echo "  $subClassName? $item;" >>bean.dart

      #递归解析在后边

    elif [[ $one_value =~ ^\[.* ]]; then
      echo "是数组-- $one_value"

      for ((i = 0; i <= 10; i = i + 1)); do #默认取n个解析
        two_value=$(echo $json | jq -r .$item[$i])
        echo $i
        if [[ $two_value != null ]]; then #排除返回的数组没有这么多
          echo
          # json=$two_value
          # parseJson $json #递归解析
        fi
      done

    elif [[ $one_value =~ ^[a-zA-Z0-9] ]]; then
      echo $one_value"是字符串"
      echo "  String? $item;" >>bean.dart
    else
      echo $one_value"是未知"
      echo "  String? $item;" >>bean.dart
    fi
  done

  # 构造方法
  echo "" >>bean.dart
  echo "  $className({" >>bean.dart
  for item in $one_keys; do
    echo "    this.$item," >>bean.dart
  done
  echo "  });" >>bean.dart

  # fromJson
  echo "" >>bean.dart
  echo "  $className.fromJson(Map<String, dynamic> json) {" >>bean.dart
  for item in $one_keys; do
    echo "    $item = json[\"$item\"];" >>bean.dart
    # msg = json["msg"];
  done
  echo "  }" >>bean.dart

  # toJson
  echo "" >>bean.dart
  echo "  Map<String, dynamic> toJson() {" >>bean.dart
  echo "    final Map<String, dynamic> _data = <String, dynamic>{};" >>bean.dart
  for item in $one_keys; do
    echo "    _data[\"$item\"] = $item;" >>bean.dart
  done
  echo "    return _data;" >>bean.dart
  echo "  }" >>bean.dart
  echo "}" >>bean.dart

  echo
  for item in $one_keys; do
    one_value=$(echo $json | jq -r .$item)
    if [[ $one_value =~ ^\{.* ]]; then
      json=$one_value #递归解析
      parseJson 0 $subClassName $one_value
    fi
  done
}

rm -rf bean.dart
touch bean.dart

parseJson 1 UserBean $json1
open bean.dart
