
int speed=10;
int x=0;
void setup(){
  size(400,400);
  smooth();
  fill(255);
  strokeWeight(5);
}
//setup
  
void draw(){
  float g=random(200);
  float d=random(200);
  background(139,0,139);
  fill(255);
  noStroke();
ellipse(125,75,110,110);
fill(139,0,139);
ellipse(155,75,100,100);
fill(0);
rect(250,70,10,400);
rect(200,100,110,10);
stroke(0);
strokeWeight(3);
line(290,103,253,150);
line(219,103,253,145);
//electric pole
line(150,350,150,260);
line(115,260,185,260);
line(125,250,120,270);
line(135,250,130,270);
line(145,250,140,270);
line(160,250,155,270);
line(170,250,165,270);
line(180,250,175,270);
//antenna
rect(0,350,400,400);
triangle(100,275,10,350,190,350);
//bottom
  frameRate(20);
  noStroke();
  fill(225,30);
  ellipse(x+10,90,120,120);
  fill(g/2,d/2,d/2);
 ellipse(x,80,50,50);
 ellipse(x+10,60,30,30);
 ellipse(x+20,80,50,50);
ellipse(x+10,100,50,50);
ellipse(x-10,100,50,50);
ellipse(x+30,100,50,50);
String s = "Good night, Listeners";
fill(0);
textSize(20);
text(s,50,175,150,150); 
  x=x+speed;
if ((x<0)||(x>=400)){
  speed=speed*-1;
}
}
