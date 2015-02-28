
PFont times;
PFont lucida;
PFont arial;
float myscale=1;
float rad=0;
float timer=0;
float x=250;
float x1=250;
float x2=250;
float x3=250;
float s=1;


PImage internet;

void setup()
{
  size(500,500);
  
  times = createFont("Times New Roman",32);
  lucida = createFont("Lucida Sans Unicode",32);
  arial = createFont("Arial",32);
  internet = requestImage("internet.jpg");
}

void draw()
{
  rad=rad+0.06;
  timer=timer+(1.0/30.0);
  
  
  println(timer);
  background(255);
  image(internet,0,0,width,height);
  fill(0);
  textFont(times);
  text("The Internet",250,0);
  
  fill(255,0,0);
  pushMatrix();
  translate(250,300);
  rotate(rad);
  scale(s);
  textFont(lucida);
  textSize(14);
  textAlign(CENTER,TOP);
  text("A CHAOTIC, CRAZY STREAM OF USELESS INFORMATION",0,0,200,200);
  popMatrix();
  
  fill(0,0,255);
  textFont(times);
  textSize(28);
  text("The foundation of modern society",250,70);
  text("The foundation of modern society",250,470);
  
  pushMatrix();
  fill(0,0,255);
  translate(80,280);
  rotate(1.58);
  textFont(times);
  textSize(28);
  text("The foundation of modern society",0,0);
  popMatrix();
  
  pushMatrix();
  fill(0,0,255);
  translate(460,280);
  rotate(1.58);
  textFont(times);
  textSize(28);
  text("The foundation of modern society",0,0);
  popMatrix();

if(timer>4){
  pushMatrix();
  fill(0);
  textFont(arial);
  textSize(20);
  text("A great place to be...",x,50);
  popMatrix();}
  
  if(timer>6){
    x=x+10;}
    
    if(timer>8){
     
      fill(0);
      textFont(arial);
      textSize(20);
      text("However...",x1,50);
    }
    if(timer>10){
      x1=x1+10;}
      if(timer>12){
        fill(0);
        textFont(arial);
        textSize(20);
        text("Sometimes Trolls feed the chaos",x2,50);}
        if(timer>14){
          x2=x2+10;}
     if(timer>16){
       s=s+0.002;
     }
     if(timer>26){
       
       fill(0);
       text("But the chaos dies down over time",x3,50);}
      if(timer>28){
        s=s-0.04;
      x3=x3+10;
    }
    if(timer>29){
      s=1;}
  
  
    
}


