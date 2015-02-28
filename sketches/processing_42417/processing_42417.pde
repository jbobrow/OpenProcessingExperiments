
PFont font;
float angle = radians(270);
float angle2 = radians(0);
 
void setup(){
size(400,400);
noStroke();
smooth();
font = loadFont("Futura-Book-20.vlw");
textFont(font);
}
 
void draw(){
  fill(0,5);
  rect(0,0,width,height);
  pushMatrix();
  translate(200, 200);
  
  //minutes
  rotate(angle);
  fill(200);
  textSize(20);
  text("            MINUTES", 0,0);
  angle += radians(0.01);
  
  //seconds
  rotate(angle2);
  fill(180);
  textSize(18);
  text("seconds", 0,0);
  angle2 += radians(0.1);
  popMatrix();
  
}
   
