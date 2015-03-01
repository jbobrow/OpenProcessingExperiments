
void setup(){
  size (500,500);
}

int value1 = 164;
int value2 = 198;
int value3 = 57;

float x=250, x1=200, x2=300, x3=125, x4=160, x5=295, x6=185, x7=320, x8=50, x9=75, x10=75, x11=400, x12=425, x13=425, x14=125, x15=375,x16=170, x17=330;
float y=150, y1=100 ,y2=100, y3=170, y4=370, y5=370, y6=445, y7=445, y8=220, y9=220, y10=320, y11=220, y12=220, y13=320, y14=30, y15=30,y16=100, y17=100;


void draw(){
  

  background(0,0,0);
  //cara
  strokeWeight(1);
  stroke(value1,value2,value3);
  fill(value1,value2,value3);
  //arc(250,150,250,mouseY/250,PI,TWO_PI);
  arc(x,y,250,250,PI,TWO_PI);
  stroke(255,255,255);
  fill(255,255,255);
  ellipse(x1,y1,20,mouseY/20);
  ellipse(x2,y2,20,mouseY/20);
  //cuerpo
  stroke(value1,value2,value3);
  fill(value1,value2,value3);
  //rect(125,170,250,mouseY/1);
  rect(x3,y3,250,200);
   //piernas
  rect(x4,y4,50,75);
  rect(x5,y5,50,75);
  arc(x6,y6,50,50,0,PI);//arcos de las puntas
  arc(x7,y7,50,50,0,PI);
  //manos
    //mano izquierda
  //rect(50,220,50,mouseY/1);
  rect(x8,y8,50,100);
  arc(x9,y9,50,50,PI,TWO_PI);
  arc(x10,y10,50,50,0,PI);  
      //mano derecha  
  //rect(400,220,50,mouseY/1);
  rect(x11,y11,50,100);
  arc(x12,y12,50,50,PI,TWO_PI);
  arc(x13,y13,50,50,0,PI);  
  //antenes
  strokeWeight(10);
  line(x14,y14,x16,y17);
  line(x15,y15,x17,y16);
  fill(255,255,255);
  text("ME ROMPO AL CLIK",190,250);
}

void mousePressed() {
 value1 = 255;
 value2 = 0;
 value3 = 0;
 // move the ball somewhere else!
  x = random(500);
  y = random(500);
  x1=random(500);
  y1=random(500);
  x2=random(500);
  y2=random(500);
   x3=random(500);
y3=random(500);
x4=random(500);
y4=random(500);
x5=random(500);
y5=random(500);
x6=random(500);
y6=random(500);
x7=random(500);
y7=random(500);
x8=random(500);
y8=random(500);
x9=random(500);
y9=random(500);
x10=random(500);
y10=random(500);
x11=random(500);
y11=random(500);
x12=random(500);
y12=random(500);
x13=random(500);
y13=random(500);
x14=random(500);
y14=random(500);
x15=random(500);
y15=random(500);
x16=random(500);
y16=random(500);
x17=random(500);
y17=random(500);
}
void mouseReleased(){
  value1 = 164;
  value2 = 198;
  value3 = 57;
 x=250;
 x1=200;
 x2=300;
 x3=125;
 x4=160;
 x5=295;
x6=185;
x7=320;
x8=50;
x9=75;
x10=75;
x11=400;
x12=425;
x13=425;
x14=125;
x15=375;
x16=170;
x17=330;
y=150;
y1=100;
y2=100;
y3=170;
y4=370;
y5=370;
y6=445;
y7=445;
y8=220;
y9=220;
y10=320;
y11=220;
y12=220;
y13=320;
y14=30; 
y15=30;
y16=100;
y17=100;
  
}


