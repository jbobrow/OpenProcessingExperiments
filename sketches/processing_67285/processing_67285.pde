
PFont font; 
 
float hour;
float minute;
float second;
//float hourafternoon;
void setup() {
  size(200, 400);
  font=loadFont("EuphemiaUCAS-48.vlw");
  //hourafternoon=hour - 12;
  smooth();
}
//second();
//minute();
//hour();
void draw() {
  background(0);
  textFont(font);
  textSize(43);
   fill(250, 20, 235);
  text((hour() + ":" + minute() + ":" + second()), 10, 40);
  
  //if(hour==12){
//hourafternoon(hour);
//}
  
  //hourx= map(hour(),

  fill(234, 43, 71);
  ellipse(90, 240, hour(), hour());

  fill(34, 20, 250);
  ellipse(50, 280, minute(), minute());

  fill(245,239,74);
  ellipse(150, 300, second(), second());
 

}



