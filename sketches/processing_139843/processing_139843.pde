
float bodyR;
float bodyG;
float bodyB;

float eyeR;
float eyeG;
float eyeB;

int x;
int y;


void setup(){
  size(800,600);
  background(0);
  smooth();
}

void draw(){
  
 /* //triangle points go left to right to top 
  noStroke();
  fill(116,82,147);
  ellipse(10,80,40,40); // head
  triangle(110,80,180,70,140,50);// main right wing
  triangle(20,70,90,80,60,50);// main left wing
  triangle(110,80,140,90,140,70); //sub right wing A
  triangle(135,70,160,90,160,70); //sub right wing B
  triangle(155,70,180,80,180,70); //sub right wing C
  triangle(20,70,20,80,45,70); // sub left wing A
  triangle(40,70,40,90,65,70); // sub left wing B
  triangle(60,70,60,90,90,80); // sub left wing C
  triangle(85,65,85,50,95,65); // left ear
  triangle(105,65,115,50,115,65); // right ear
  
  fill(250,181,71);
  ellipse(90,80,10,20); // left eye
  ellipse(110,80,10,20); // right eye
  
  
  */
 
}

void mouseClicked(){
  mrBat()+speed;
 
}

void mrBat(){
 ellipseMode(CENTER); 
 x=mouseX;
 y=mouseY;
 bodyR=116;
 bodyG=82;
 bodyB=147;
 eyeR=250;
 eyeG=181;
 eyeB=71;
 
  noStroke();
  fill(bodyR,bodyG,bodyB);
  
  ellipse(x,y,40,40);
  triangle(x+10,y,x+50,y-30,x+90,y-10);// main right wing
  triangle(x-90,y-10,x-10,y,x-50,y-30);// main left wing
  triangle(x+90,y-10,x+90,y,x+60,y-10); //sub right wing A
  triangle(x+65,y-10,x+65,y+10,x+40,y-10); //sub right wing B
  triangle(x+45,y-10,x+45,y+10,x+15,y); //sub right wing C
  triangle(x-90,y-10,x-90,y,x-60,y-10); // sub left wing A
  triangle(x-65,y-10,x-65,y+10,x-40,y-10); // sub left wing B
  triangle(x-45,y-10,x-45,y+10,x-15,y); // sub left wing C
  triangle(x-20,y-5,x-20,y-30,x-10,y-15); // left ear
  triangle(x+10,y-15,x+20,y-30,x+20,y-5); // right ear
  
  fill(eyeR,eyeG,eyeB);
  ellipse(x-10,y,10,20); // left eye
  ellipse(x+10,y,10,20); // right eye
  
 }   
 
 
