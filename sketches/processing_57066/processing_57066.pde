
PImage redshift;

float r;
float x=225; //starting position
float speed = 2.5;
int direction = 1;
int a=0;

void setup(){
  size(520,500); 
  smooth(); 
  background(180);
  redshift=loadImage("redshift.jpeg");
}

void draw(){
  redshift();
  r=random(50,150);
  rollercircle(); 
  antenna();
  lightbulb();
  neck();
  bodyrect();
  head();
  face();
  eyes();
}

void redshift(){
  image(redshift,-180,-240);
  if(mousePressed==true){
    tint(250,200,200,25);
  }else{
    tint(200,150,250,50);
  }
}
  
void rollercircle(){
  noStroke();
  if((mouseX>230)&&(mouseX<230+50)&&(mouseY>365)&&(mouseY<365+50)){
    fill(55*r,118,163-r);
  }else{
    fill(72,173,181);
  }
  ellipse(255, 269+120, 50, 50);
}
  
void antenna(){
  strokeWeight(3);
  stroke(242,135,183);
  line(265,145,300,100);
}
  
void lightbulb(){
  noStroke();
  fill(100-r,200,150,r);
  ellipse(300,100,20,20);
  fill(200,100,150);
  ellipse(300,100,10,10);
}

void neck(){
  fill(211,64,173);
  rect(225+30-7.5,269-29,15,28);
}

void bodyrect(){
  fill(100);
  rect(225, 269, 60, 120); 
  fill(236,123,61);
  rect(225,280,60,6);
}

void head(){
  fill(72,173,181); 
  ellipse(255,219-25,100,100);
}
  
void face(){
  fill(150); 
  ellipse(247,202,70,70); 
}

/*void facemove(){
  if(mouseX>260)&&(mouseX<520)&&(mouseY>0)&&(mouseY<250)*/
    

void eyes(){
  if ((mouseX>255)&&(mouseX<255+18)&&(mouseY>208)&&(mouseY<208+18)){
    fill(254,242,102);
  }else{
    fill (150);
  }
  ellipse(255,208,18,18);
  fill(254,242,102); 
  ellipse(230,200,12,12);
  fill(254,242,102); 
  ellipse(255,208,12,12);
  
}


