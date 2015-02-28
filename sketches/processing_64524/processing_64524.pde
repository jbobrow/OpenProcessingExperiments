
PImage s;
PShape logo;
PImage lit;

float x;
float x2;
float y;
float xpos, ypos;
//int op;


void setup(){
  size(960,540);
  s = loadImage("bkgd.jpg"); 
  logo = loadShape("LOGO2.svg");
  //lit = loadImage("LOGO3.png");
  xpos = width/2;
  ypos = height/2;
  smooth();
  shapeMode(CENTER);

}

void draw(){


//imageMode(CENTER);

float angle = frameCount/2.0;  //keep the point so it forces float mode!
float x=map(sin(angle),-1, 1, 113,202);
float x2 = map (sin(angle),-1, 1,-111, -202); 
float y=map(sin(angle),-1,1, 71,125);
//float op= map(dd,0,width, 0, 255);

image(s, 0, 0, width, height);

float ang = atan2(mouseY-ypos, mouseX-xpos);
translate(xpos,ypos);
rotate (ang);
shape(logo,0, 0, 400,400);
//image(lit, width/2,height/3-15,266,150,mouseX);

beginShape();
fill(51,51,51);
noStroke();
vertex(63,-1);
vertex(162,-59);
vertex(x,y);
vertex(25,177);
vertex(25, 75);
endShape();

beginShape();
vertex(-63,-1);
vertex(-162,-59);
vertex(x2,y);
vertex(-25,177);
vertex(-25, 75);
endShape();
}


