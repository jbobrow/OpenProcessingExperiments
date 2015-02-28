
void setup(){
  size(300,500);
  background(82, 191, 73);
}

void draw(){
  
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  noFill();
  //arc(100, 100, 100, 100, radians(270), radians(270 + second()*6));
  arc(100, 100, 100, 100, radians(180), radians(180 + second()*3));
  //rect(20, 20, second()*2, 20);
  //println(millis()/1000);
  //println(second());
}

