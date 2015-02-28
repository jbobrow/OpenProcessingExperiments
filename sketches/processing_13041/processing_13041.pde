
int s=600;
int x=200;
int y=200;
//float r=random(20,70);
float easing=.1;

void setup(){
  background(255,200,180);
  size(s,s);
  smooth();
  frameRate(15);
}

void draw(){
  float r=random(20,50);
  float targetX=mouseX;
  float targetY=mouseY;
  float i=.05;
  x+= (targetX-x)*easing;
  y+= (targetY-y)*easing;
  colorMode(RGB,255);
  fill(245,245,245,200);
  stroke(150);
  strokeWeight(r*i);
  if (mousePressed==true){
    if (mouseButton==LEFT){
      r=random(100,200);
    }
    else{
      r=random(2,10);
    }
  }
  if (keyPressed){
    if (key=='y'){
      colorMode(HSB,255);
      fill(random(20,40),random(200,300),1000,100);
    }
    if (key=='r'){
      colorMode(HSB,255);
      fill(random(1000,1500),random(300,500),100,100);
    }
    if (key=='b'){
      colorMode(HSB,255);
      fill(random(130,170),random(200,300),255,100);
    }
    if (key=='g'){
      colorMode(HSB,255);
      fill(random(50,100),random(90,150),120,100);
    }
    if (key=='p'){
      colorMode(HSB,255);
      fill(random(200,250),random(100,150),150,100);
    }
    if (key=='t'){
      colorMode(HSB,255);
      fill(random(120,150),random(200,300),150,100);
    }
  }
  ellipse(x,y,r,r);
  if (keyPressed){
    if (key==' '){
      background(255,200,180);
    }
    if (key=='q'){
      background(0);
    }
    if (key=='w'){
      background(255);
    }
    if (key=='e'){
      background(100);
    }
  }
}
   

