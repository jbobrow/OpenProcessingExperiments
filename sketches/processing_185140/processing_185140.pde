
PImage img;
PFont mono;
int x=0;
int xspeed=60;
int y=0;
int yspeed=40;
int z=0;
int zspeed=3;
int w=0;
int wspeed=10;


void setup(){
  size(600,400);
  smooth();
  noStroke();
  img = loadImage("Tree-01.png");
  mono = loadFont("MuseoSans-100-48.vlw");
}

void spring(){
  fill(137,242,154);//spring
  rect(0,0,300,200);
  textFont(mono);
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("SPRING",150,50);
}

void summer(){
  fill(242,231,137);//summer
  rect(300,0,300,200);
  textFont(mono);
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("SUMMER",450,50);
}

void fall(){
  fill(232,149,62);//fall
  rect(0,200,300,200);
  textFont(mono);
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("FALL",150,250);
}

void winter(){
  fill(90,212,232);//winter
  rect(300,200,300,200);
  textFont(mono);
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("WINTER",450,250);
}

void leaves (int a,int b,int c,int d,int e,int f, int g,int h){
  fill(a,b,c,h);
  ellipse(260,190+g,30,30);
   fill(d,e,f,h);
  ellipse(240,170+g,20,20);
  fill(a,b,c,h);
  ellipse(220,155+g,15,15);
   fill(d,e,f,h);
  ellipse(210,125+g,20,20);
   fill(a,b,c,h);
  ellipse(250,140+g,15,15);
   fill(d,e,f,h);
  ellipse(227,110+g,15,15);
  fill(a,b,c);
  ellipse(227,110+g,15,15);
   fill(d,e,f,h);
  ellipse(227,110+g,15,15);
   fill(a,b,c,h);
  ellipse(265,105+g,35,35);
  fill(d,e,f,h);
  ellipse(240,80+g,20,20);
   fill(a,b,c,h);
  ellipse(302,80+g,20,20);
  ellipse(320,123+g,37,37);
  fill(a,b,c,h);
  ellipse(330,90+g,20,20);
   fill(d,e,f,h);
  ellipse(350,102+g,15,15);
  ellipse(320,170+g,25,25);
  fill(a,b,c,h);
  ellipse(355,160+g,35,35);
  ellipse(365,130+g,20,20);
}
  

void draw(){
  x=x+xspeed;
  y=y+yspeed;
  w=w+wspeed;
  spring();
  summer();
  fall();
  winter();
  
  if ((mouseX<300)&&(mouseY<200)){//spring
    if(mousePressed==true){
    fill(137,242,154);
    ellipse(0,0,x,y);
    leaves(76,227,86,128,227,162,0,w);
  }
  else {
    x=0;
    y=0;
    w=0;
  }
  }
  if ((mouseX>300)&&(mouseY<200)){//summer
    if(mousePressed==true){
    fill(242,231,137);
    ellipse(600,0,x,y);
    leaves(175,227,83,204,227,52,0,w);
  }
  else {
    x=0;
    y=0;
    w=0;
  }
  }
  if ((mouseX<300)&&(mouseY>200)){//fall
    if(mousePressed==true){
    fill(232,149,62);
    ellipse(0,400,x,y);
    leaves(227,87,64,176,94,32,0,w);
  }
  else {
    x=0;
    y=0;
    w=0;
  }
  }
  if ((mouseX>300)&&(mouseY>200)){//winter
    if(mousePressed==true){
      z=z+zspeed;
    fill(90,212,232);
    ellipse(600,400,x,y);
    leaves(125,102,85,51,42,35,z,w);
  }
  else {
    x=0;
    y=0;
    w=0;
    z=0;
  }
  }
  
  pushMatrix();
  scale(0.1);
  image(img,1500,400);
  popMatrix();
  
}


