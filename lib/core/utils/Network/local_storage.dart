 import 'package:hive/hive.dart';

class Applocal{


  static String IMAGE_key= 'IMAGE';
  static String NAME_key= 'NAME';
  static String ISUPLOAD_key= 'ISUPLOAD';

 static casheDate(String key,value){


    var box= Hive.box('user');
    box.put(key, value);
  }
 static dynamic getcashedDate(String key){

    var box= Hive.box('user');
   return box.get(key);

  }




}