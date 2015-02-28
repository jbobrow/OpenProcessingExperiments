
int maxLife=80;
String name1="Mary";
String name2="John";
String name3="Ann";
String name4="Peter";
void setup(){
  int age1 = randomAge(maxLife);
  int age2 = randomAge(maxLife);
  println(buildMessage(age1,age2,name1,name2));
  println(buildMessage(randomAge(maxLife),randomAge(maxLife), name3,name4));
  background(randomColor());
  theEnd();
}
//if you have "return" in your function, you need to specify what tipe of value is returned
int randomAge(int maxAge){
  int age=int(random(maxAge));
  return age;
}
String buildMessage(int a1, int a2, String n1, String n2){
  String myMessage=n1+" is "+a1+" and "+n2+" is "+a2;
  return myMessage;
}
float randomColor(){
  float grey=random(255);
  return grey;
}
void theEnd(){
  println("The end");
}


