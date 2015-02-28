
//Copyright Christopher Henley 2014

/* As the orbs move randomly around the space
the connecting vertex can be moved with the mouse.
pressing any button grows the orbs and clicking the
left mouse button changes the bacground color at
random*/

//initialize x/y centerpoint location for orbs
float orb1x,orb1y;
float orb2x,orb2y;
float orb3x,orb3y;
float orb4x,orb4y;
//initialize random trajectories for orbs
float a=-1;
float b=4;
float c=-4;
float d=1;
float e=2;
float f=-3;
float g=3;
float h=2;
//initialize random color generation for connecting triangles
float clr1,clr2,clr3;
float clr4,clr5,clr6;
//initialize random background color
float bgclr1,bgclr2,bgclr3;
//initialize orb size
float diam;

void setup(){
  size(400,400);
  background(0,0,0);
  noCursor();
}

void draw(){
  rectMode(CENTER);
  fill(bgclr1,bgclr2,bgclr3);
  rect(width/2,height/2,width,height);
  fill(255,255,255);
  noStroke();
  //Orb No.1
  ellipse(orb1x+a,orb1y+b,50+diam,50+diam);
  orb1x=orb1x+a;
  orb1y=orb1y+b;
  if (orb1x>=width){
    a=random(-4,-1);
    clr1=random(255);
  }
  if (orb1y>=height){
    b=random(-4,-1);
  }
  if (orb1x<=0){
    a=random(1,4);
  }
  if (orb1y<=0){
    b=random(1,4);
    clr4=random(255);
  }
  //Orb No.2
  ellipse(orb2x+c,orb2y+d,20+diam,20+diam);
  orb2x=orb2x+c;
  orb2y=orb2y+d;
  if (orb2x>=width){
    c=random(-1,-4);
  }
  if (orb2y>=height){
    d=random(-1,-4);
    clr5=random(255);
  }
  if (orb2x<=0){
    c=random(1,4);
  }
  if (orb2y<=-0){
    d=random(1,4);
    clr2=random(255);
  }
  //Orb No.3
  ellipse(orb3x+e,orb3y+f,80+diam,80+diam);
  orb3x=orb3x+e;
  orb3y=orb3y+f;
  if (orb3x>=width){
    e=random(-2,-3);
  }
  if (orb3y>=height){
    f=random(-2,-3);
    clr1=random(255);
  }
  if (orb3x<=-0){
    e=random(2,3);
    clr5=random(255);
  }
  if (orb3y<=-0){
    f=random(2,3);
  }
  //Orb No.4
   ellipse(orb4x+g,orb4y+h,30+diam,30+diam);
  orb4x=orb4x+g;
  orb4y=orb4y+h;
  if (orb4x>=width){
    g=random(-2,-3);
    clr6=random(255);
  }
  if (orb4y>=height){
    h=random(-2,-3);
  }
  if (orb4x<=-0){
    g=random(2,3);
    clr3=random(255);
  }
  if (orb4y<=0){
    h=random(2,3);
  }
  //Change bg color when left mouse button is pressed
  if (mousePressed && (mouseButton==LEFT)){
    bgclr1=random(255);
    bgclr2=random(255);
    bgclr3=random(255);
  }
  //Change the diameter of the orbs while a key is presseds
  if (keyPressed==true){
    diam++;
  }
  else{
    diam=0;
  }
  //triangles change colors at regular intervals
  fill(clr1,clr2,clr3,75);
  triangle(mouseX,mouseY,orb1x+a,orb1y+b,orb4x+g,orb4y+h);
  fill(clr4,clr5,clr6,75);
  triangle(mouseX,mouseY,orb2x+c,orb2y+d,orb3x+e,orb3y+f);
  fill(clr1,clr2,clr3,75);
  triangle(mouseX,mouseY,orb1x+a,orb1y+b,orb3x+e,orb3y+f);
  fill(clr4,clr5,clr6,75);
  triangle(mouseX,mouseY,orb4x+g,orb4y+h,orb2x+c,orb2y+d);
  
 
}


