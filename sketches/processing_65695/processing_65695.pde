




void setup(){
size(500,500);


}
void draw(){

  String time="Current time:  " + year()+"."+month()+"."+day()+"."+hour()+"."+minute()+"."+second()+"."+millis();
  background(0);
  textSize(20);
  text(time,0,150);
  
}

