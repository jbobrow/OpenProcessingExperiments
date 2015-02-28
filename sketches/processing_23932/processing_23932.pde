
float angle;
float jitter;
float a = 0.0;
float s = 0.0;
PImage bg;
PImage ct;
PImage sh;
PShape target;

void setup() {
size(640,480);
smooth();
frameRate(30);
}


void draw() {
  bg= loadImage("background.jpg");
  image(bg,0,0);
 
  // during even-numbered seconds (0, 2, 4, 6...)
  pushMatrix();
  if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);
  float d = sin(angle);
  
  a = a + 0.05;
  s = cos(a)*2;

//cross
//fill(255);
//noStroke();
//rect(270,38,100,400);
//rect(120,185,400,100);
fill(206,124,23);
noStroke();
scale(s); 
beginShape();
vertex(270,38);
vertex(370,38);
vertex(370,185);
vertex(520,185);
vertex(520,285);
vertex(370,285);
vertex(370,438);
vertex(270,438);
vertex(270,285);
vertex(120,285);
vertex(120,185);
vertex(270,185);
endShape();

//stage 4
pushMatrix();
translate(mouseX,mouseY);
rotate(c);
scale(s); 
fill(184,6,69,100);
noStroke();
beginShape();
vertex(-40,-202);
vertex(40,-202);
vertex(50,-55);
vertex(200,-45);
vertex(200,35);
vertex(50,45);
vertex(40,198);
vertex(-40,198);
vertex(-50,45);
vertex(-200,35);
vertex(-200,-45);
vertex(-50,-55);
//vertex(280,38);
//vertex(360,38);
//vertex(370,185);
//vertex(520,195);
//vertex(520,275);
//vertex(370,285);
//vertex(360,438);
//vertex(280,438);
//vertex(270,285);
//vertex(120,275);
//vertex(120,195);
//vertex(270,185);
endShape();

popMatrix();

//stage 3
fill(142,57,115,188);
noStroke();
scale(s); 
beginShape();

vertex(370,185);
vertex(470,205);
vertex(505,240);
vertex(470,265);


vertex(370,285);
vertex(350,390);
vertex(320,425);
vertex(290,390);

vertex(270,285);
vertex(170,265);
vertex(135,240);
vertex(170,205);

vertex(270,185);
vertex(290,90);
vertex(320,55);
vertex(350,90);
endShape();

//stage 2 
pushMatrix();
translate(mouseX,mouseY);
scale(s); 
rotate(d);
fill(0,115,156,200);
noStroke();
beginShape();
vertex(0,-150);//(320,90);
vertex(50,-55);//(370,185);
vertex(150,0);//(470,240);
vertex(50,45);//(370,285);
vertex(200,45);//(520,285);
vertex(50,45);//(370,285);
vertex(0,150);//(320,390);
vertex(-50,45);//(270,285);
vertex(-150,0);//(170,240);
vertex(-50,-55);//(270,185);
endShape();
popMatrix();


//circle
scale(s); 
 float nudgeX= random(100,150);
fill(104,156,37,255);
ellipse(mouseX,mouseY,nudgeX,nudgeX);
 filter(DILATE);
 filter(BLUR);
 popMatrix();
 
  ct= loadImage("creative-target.png");
  image(ct,0,0);

}

  void mousePressed() {
  sh= loadImage("shinning.png");
  image(sh,0,0);
}

  void mouseReleased() {
  target= loadShape("target.svg");
  tint(255,50);
  shape(target,410,180);
  
  }
 

    

