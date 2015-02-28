
float angle = radians(270);
float angle2 = radians(0);
float angle3 = radians(0);
float angle4 = radians(0);
float angle5 = radians(270);
PFont font;
int x=0;
String txt1 = "TIME IS MONEY";

void setup(){
  size(400,400,P2D);
  noStroke();
  smooth(4);
  font = loadFont("ChaletComprimeCologneEighty48.vlw");
  
}
  
void draw(){
  fill(0);
  background(0);
  
  
  strokeWeight(2);
  fill(255);
  noStroke();
  ellipse(width/2, height/2,10,10);
  stroke(255);
  noFill();
  ellipse(width/2, height/2, 220,220);
  stroke(255);

  //pushMatrix();
  translate(width/2, height/2);
   
  //minutes
  rotate(angle);
  fill(0);
  stroke(255);
  strokeWeight(4);
  line(0,0,50,0);
  angle += radians(0.06);
   
  //seconds
  rotate(angle2);
  fill(0);
  stroke(255);
  strokeWeight(2);
  line(0,0,100,0);
  angle2 += radians(0.1);
  
  
  //text
  rotate(angle3);  
  fill(255);
  textFont(font,20);
  text(txt1,115,0);
  
  angle3 += radians(0.2);
  
  rotate(angle4);
  fill(255);
  noStroke();
  ellipse(0, 125, 20,20);
  angle4 += radians(0.7);
  
  rotate(angle5);
  fill(255);
  noStroke();
  ellipse(0, 120, 10,10);
  angle5 += radians(1.3);
  //popMatrix();

}
  



