
PFont font;
float angle = 0.0;
float angle2 = 10.0;
float y = 0.0;
//variables
 
void setup(){
  size(440,330);
  smooth();
  font=loadFont("AdobeArabic-Regular-48.vlw");
  background(255);
  textFont(font);
}
 
void draw(){
  fill(0,0);
  rect(-10,-10,width+30,height+30);
   
y+=0.09;
//y variable increases
angle = angle + 0.05;
//angle rotation rate
 
translate(width/2,height/2);
//translates centre closer to the left
rotate(angle);
fill(random(#FF4400,#FFDC79),100);
stroke(0);
textSize(70);
text(".....",10,10);
//rotating yellow postal code

  //black lines rotating in clockwise direction
   
  rotate(angle2);
  line(y,0,y,10);
  fill(random(#FF4400,#FFDC79),100);
stroke(0);

line(-y,0,-y,20);
fill(random(#FF4400,#FFDC79),100)
//black lines rotating parallel to first set of rotating lines

noStroke();

ellipse(10,10,y,y);
//rotating purple circle under black center
textSize(110);
text("......",y,y);
//rotating purple text
}
                
