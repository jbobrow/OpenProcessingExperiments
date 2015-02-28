
// Assignment #2
// Name: Emelie Curl
// E-mail: ecurl@brynmwr.edu
// Date: 09/15/10
float z, y, w, h;
int x = 260;
int speed = 3;
void setup() {
  size(520,520);
  smooth();
  background(127,255,212);
  z = 180;
  y = 200;
  w = 160;
  h = 100;
	

}
void draw() {
   x = x + speed;
if ((x > width/2) || (x < 250)){
  speed = speed * -1;
}
   ellipse(x,220,40,40);// bell thingy
   
// bell
  fill(255,215,0);
  beginShape();
  strokeWeight(1);
 curveVertex(z,y);
 curveVertex(z,y);
 curveVertex(y,z); //top curve
 curveVertex(y+30,h-10);
 curveVertex(y+90,h-10); //left side
 curveVertex(2*w,z);
 curveVertex((2*w)+20,y); //right curve 
 curveVertex(z,y);
 endShape(CLOSE);
  
  //rest of the bell
  stroke(255,215,0);
  rectMode(CENTER);
  fill(255,215,0);
  rect(x,y+5,10,15);//clapper holder
  ellipseMode(CENTER);
  ellipse(x,y+20,40,40);// clapper
  stroke(0);
  
  
  
  stroke(255,215,0);
  noFill();
  strokeWeight(1);
  curve(y+30,h,y+30,h-10,x,h-40,z+100,h-40);
  curve(y+90,h,y+90,h-10,x,h-40,y+40,h-40);
  stroke(0);
  
 //point(z,180);
 //point(230,y);
 //point(290,y);
 //point(320,180);
 //point(180,z);
 //point(340,z);
 strokeWeight(5);
 line(415,210, 415,160);//2nd note on the right
 fill(138,43,226);
 strokeWeight(1);
 ellipse(430,210,30,10);

 fill(154,205,50);// 2nd note on left
 ellipse(60,260,30,10);
 fill(46,139,87);
 ellipse(100,270,30,10);
 strokeWeight(5);
 line(75,260,75,220);
 
 line(115,270,115,230);//third note on right
 line(75,220,115,230);
 stroke(0);
fill(255,127,80);
 line(415,300,415,340);
 line(455,310,455,350);
 strokeWeight(1);
 ellipse(400,340,30,10);
fill(100,149,237);
ellipse(440,350,30,10);
strokeWeight(5);
line(415,300,455,310);
strokeWeight(5);

line(175,300,175,335);//third note on left
fill(139, 0, 0);
strokeWeight(1);
ellipse(160,335,30,10);

fill(34,139, 34);// note almost in the center
ellipse(290,320,30,10);
strokeWeight(5);
line(275,320,275,285);
 fill(176,48,96);
 strokeWeight(1);

 ellipse(80,120,30,10); // note on the left
 strokeWeight(5);
 line(95,120,95,80);
 fill(107,142,35);
strokeWeight(1);

 ellipse(400,100,30,10);//note on the right
 fill(188,143,143);
ellipse(440,110,30,10);
 strokeWeight(5);
 line(415,100,415,60);
 line(455,110,455,70);
 line(415,60,455,70);
 //strokeWeight(1);
 //point(415,190);
 //point(415,z);
 //line(415,210, 415, 190);
 


}
void mousePressed() {
  float r = 127;
  float b = 255;
  float g = 212;
  background(r,g,b);
  if (mouseX > width/2){
    r = r +1;
  }else {
    r = r -1;
}
if (mouseY > height/2){
  b = b + 1;
}else{
  b = b - 1;
}
if (mousePressed) {
  g = g + 1;
}else{
  g = g - 1;
}
r = constrain (r,0,255);
b = constrain (g,0,255);
g = constrain (b,0,255);
}


