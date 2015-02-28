
import java.awt.*;

final static int BUTTON1=1;
final static int BUTTON2=2;
final static int BUTTON3=3;

int state=BUTTON3;

Rectangle bt1=new Rectangle(220,585,100,30);
Rectangle bt2=new Rectangle(350,585,100,30);
Rectangle bt3=new Rectangle(480,585,100,30);

float rgbR;
float rgbB;
float rgbG;
int step=20;
PFont butFont;
PFont helpFont;

void setup() {
  size(600,650); 
  frameRate(20);
  smooth();
  rectMode(CENTER);
  //stroke(255);
  
}

void draw() {
  
  background(255);
  
  //Buttons
  button(bt1,BUTTON1);
  button(bt2,BUTTON2);
  button(bt3,BUTTON3);
  fill(100);
  switch(state){
    case  BUTTON1: //Hier Status 1
    status1();
    break;
    case  BUTTON2: //Hier Status 2
    status2();
    break;
    case  BUTTON3: //Hier Status 3
    status3();
    break;
  }
  
  //Text
  butFont = createFont("FFScala", 16);
  textFont(butFont);
  fill(0);
  text("Selected Input: "+state,30,590);
  fill(255);
  text("1: Mouse",185,590);
  text("2: Keyboard",307,590);
  text("3: Random",440,590);
    
  // Rectangles  
  fill(rgbR,rgbG,rgbB);
  rect(50,30,45,45);
  rect(100,30,45,45);
  rect(150,30,45,45);
  rect(200,30,45,45);
  rect(250,30,45,45);
  rect(300,30,45,45);
  rect(350,30,45,45);
  rect(400,30,45,45);
  rect(450,30,45,45);
  rect(500,30,45,45);
  rect(550,30,45,45);
  
  fill(rgbR+step,rgbG,rgbB+step);
  rect(50,80,45,45);
  rect(100,80,45,45);
  rect(150,80,45,45);
  rect(200,80,45,45);
  rect(250,80,45,45);
  rect(300,80,45,45);
  rect(350,80,45,45);
  rect(400,80,45,45);
  rect(450,80,45,45);
  rect(500,80,45,45);
  rect(550,80,45,45);
  
  
  fill(rgbR+2*step,rgbG,rgbB+2*step);
  rect(50,130,45,45);
  rect(100,130,45,45);
  rect(150,130,45,45);
  rect(200,130,45,45);
  rect(250,130,45,45);
  rect(300,130,45,45);
  rect(350,130,45,45);
  rect(400,130,45,45);
  rect(450,130,45,45);
  rect(500,130,45,45);
  rect(550,130,45,45);
  
  fill(rgbR+3*step,rgbG,rgbB+3*step);
  rect(50,180,45,45);
  rect(100,180,45,45);
  rect(150,180,45,45);
  rect(200,180,45,45);
  rect(250,180,45,45);
  rect(300,180,45,45);
  rect(350,180,45,45);
  rect(400,180,45,45);
  rect(450,180,45,45);
  rect(500,180,45,45);
  rect(550,180,45,45);
  
  fill(rgbR+4*step,rgbG,rgbB+4*step);
  rect(50,230,45,45);
  rect(100,230,45,45);
  rect(150,230,45,45);
  rect(200,230,45,45);
  rect(250,230,45,45);
  rect(300,230,45,45);
  rect(350,230,45,45);
  rect(400,230,45,45);
  rect(450,230,45,45);
  rect(500,230,45,45);
  rect(550,230,45,45);
  
  fill(rgbR+5*step,rgbG,rgbB+5*step);
  rect(50,280,45,45);
  rect(100,280,45,45);
  rect(150,280,45,45);
  rect(200,280,45,45);
  rect(250,280,45,45);
  rect(300,280,45,45);
  rect(350,280,45,45);
  rect(400,280,45,45);
  rect(450,280,45,45);
  rect(500,280,45,45);
  rect(550,280,45,45);
  
  fill(rgbR+6*step,rgbG,rgbB+6*step);
  rect(50,330,45,45);
  rect(100,330,45,45);
  rect(150,330,45,45);
  rect(200,330,45,45);
  rect(250,330,45,45);
  rect(300,330,45,45);
  rect(350,330,45,45);
  rect(400,330,45,45);
  rect(450,330,45,45);
  rect(500,330,45,45);
  rect(550,330,45,45);
  
  fill(rgbR+7*step,rgbG,rgbB+7*step);
  rect(50,380,45,45);
  rect(100,380,45,45);
  rect(150,380,45,45);
  rect(200,380,45,45);
  rect(250,380,45,45);
  rect(300,380,45,45);
  rect(350,380,45,45);
  rect(400,380,45,45);
  rect(450,380,45,45);
  rect(500,380,45,45);
  rect(550,380,45,45);
  
  fill(rgbR+8*step,rgbG,rgbB+8*step);
  rect(50,430,45,45);
  rect(100,430,45,45);
  rect(150,430,45,45);
  rect(200,430,45,45);
  rect(250,430,45,45);
  rect(300,430,45,45);
  rect(350,430,45,45);
  rect(400,430,45,45);
  rect(450,430,45,45);
  rect(500,430,45,45);
  rect(550,430,45,45);
  
  fill(rgbR+9*step,rgbG,rgbB+9*step);
  rect(50,480,45,45);
  rect(100,480,45,45);
  rect(150,480,45,45);
  rect(200,480,45,45);
  rect(250,480,45,45);
  rect(300,480,45,45);
  rect(350,480,45,45);
  rect(400,480,45,45);
  rect(450,480,45,45);
  rect(500,480,45,45);
  rect(550,480,45,45);
  
  fill(rgbR+10*step,rgbG,rgbB+10*step);
  rect(50,530,45,45);
  rect(100,530,45,45);
  rect(150,530,45,45);
  rect(200,530,45,45);
  rect(250,530,45,45);
  rect(300,530,45,45);
  rect(350,530,45,45);
  rect(400,530,45,45);
  rect(450,530,45,45);
  rect(500,530,45,45);
  rect(550,530,45,45);
}

void button(Rectangle btt,int num){
  if (btt.contains(mouseX,mouseY)) {
    if (mousePressed) {
      fill (255,0,0);
      state=num;
    } else {
      fill (255,0,255);
    }
  } else {
      fill(50*num);
  }
  rect(btt.x,btt.y,btt.width,btt.height);
}
  
  

