
void saveImage(){
String fileName =  "MariahB"+timeStamp()+".jpg";

  PImage imageSave = get(0,0,width,height);

  imageSave.save(fileName);

}

String timeStamp() {

  String timestamp = year()+"_"+month()+"_"+day()+"_"+minute();

  return timestamp;

}

