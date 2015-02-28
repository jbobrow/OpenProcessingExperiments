
PImage s;
PShape logo;
PShape lit;
float x;
float x2;
float y;


void setup(){
  size(960,540);
   smooth();
  s = loadImage("bkgd.jpg"); 
  logo = loadShape("LOGO2.svg");

}

void draw(){
image(s, 0, 0, width, height);
shapeMode(CENTER);

float x=map(mouseX,0, width, 593,682);
float x2 = map (mouseX, 0, width,369, 278); 
float y=map(mouseX,0, width, 341,395);


shape(logo,width/2, height/2, 400,400);

beginShape();
fill(51,51,51);
noStroke();
vertex(543,269);
vertex(642,211);
vertex(x,y);
vertex(504,447);
vertex(504, 345);
endShape();

beginShape();
vertex(417,269);
vertex(318,211);
vertex(x2,y);
vertex(455,447);
vertex(455, 345);
endShape();
}


