
PImage boy;
int y_speed, x_speed;
int boy_speed;
int bw, bh;
int bow, boh;
int x1,x2,y1, y2;
int t1x;
String a = "obligation";
String b = "expectation";
String c = "achievement";
String d = "responsiblity";
String e = "workload";
int tx;
int ty;
float count;
int trans1=0;
int trans2=0;
int trans3 = 0;
int trandomx;
PFont myFont;
int rspeed,uspeed;
PImage peace;




void setup(){
  size(700,350);
  //background(255);
  y_speed = 1;
  x_speed = 1;
  string1 = new Line(0,0, width,0,y_speed,x_speed);
  string2 = new Line(0,height,width,height,y_speed,x_speed);
  string3 = new Line(0,0,0,height,y_speed,x_speed);
  string4 = new Line(width,0,width,height,y_speed,x_speed);
  
  bw =60;
  bh = 120;
  boy_speed = 0;
  boy1 = new Boy(width/2,height/2,bw,bh,boy_speed);
  boy = loadImage("boy.png");
  
  rspeed=1;
  uspeed=2;
  bow = 6;
  boh = 122;
  
  box1 = new Box(width/2+24, height/2-61,bow,boh,rspeed,0);
  box2 = new Box(width/2-24, height/2-61,bow,boh,-rspeed,0);
  box3 = new Box(width/2-26, height/2+61,52,boh,0,uspeed);
  box4 = new Box(width/2-26, height/2-61,52,boh,0,-uspeed);
  peace =loadImage("peace.png");
 
  //font
  myFont = createFont("Herculanum", 18);
  textFont(myFont);
  
  textAlign(CENTER);
  
  
  
  
  
 
}

void draw(){
  background(255);
  
 // noStroke();
 // rect(0,0,width,height);
  
  count+=0.015;
  
  
  string1.move();
  string1.draw();
  
  string2.move();
  string2.draw();
  
  
  string3.move();
  string3.draw();
 

  string4.move();
  string4.draw();
  

  
   
   
   
  //text drawn//
   tx = 0;
   ty = height;
  if (count>=3){
    trans1++;
    pushMatrix();
  translate(-150,height/2);
  rotate(radians(-90));
  fill(trans1);
  //textSize(30);
  text(a,tx,ty+205);
  popMatrix();
pushMatrix();
  translate(width,height/2);
  rotate(radians(90));
  fill(trans1);
  //textSize(30);
  text(b,tx,ty+55);
  popMatrix();
noFill();}


if (count>=6){
    trans2++;
    pushMatrix();
  translate(-150,height/2);
  rotate(radians(-90));
  fill(trans2);
  //textSize(30);
  text(d,tx,ty+230);
  popMatrix();
pushMatrix();
  translate(width,height/2);
  rotate(radians(90));
  fill(trans2);
  //textSize(30);
  text(c,tx,ty+80);
  popMatrix();
  noFill();
}
  
if (count>=8&& count<18){
    //trans3++;
    pushMatrix();
  translate(-150,height/2);
  rotate(radians(-90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+260);
  popMatrix();
pushMatrix();
  translate(width,height/2);
  rotate(radians(90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+110);
  popMatrix();
  noFill();
}
if (count>=9&& count<18){
    //trans3++;
    pushMatrix();
  translate(-150,height/2);
  rotate(radians(-90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+290);
  popMatrix();
pushMatrix();
  translate(width,height/2);
  rotate(radians(90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+140);
  popMatrix();
  noFill();
}

if (count>=10&& count<18){
    //trans3++;
    pushMatrix();
  translate(-150,height/2);
  rotate(radians(-90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+320);
  popMatrix();
pushMatrix();
  translate(width,height/2);
  rotate(radians(90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+180);
  popMatrix();
  noFill();
}

if (count>=10.5&& count<18){
    //trans3++;
    pushMatrix();
  translate(-150,height/2);
  rotate(radians(-90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+360);
  popMatrix();
pushMatrix();
  translate(width,height/2);
  rotate(radians(90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+220);
  popMatrix();
  noFill();
}

if (count>=11&& count<18){
    //trans3++;
    pushMatrix();
  translate(-150,height/2);
  rotate(radians(-90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+400);
  popMatrix();
pushMatrix();
  translate(width,height/2);
  rotate(radians(90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+260);
  popMatrix();
  noFill();
}

if (count>=12&& count<18){
    //trans3++;
    pushMatrix();
  translate(-150,height/2);
  rotate(radians(-90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+440);
  popMatrix();
pushMatrix();
  translate(width,height/2);
  rotate(radians(90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+300);
  popMatrix();
  noFill();
}

if (count>=13 && count<18){
    //trans3++;
    pushMatrix();
  translate(-150,height/2);
  rotate(radians(-90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+480);
  popMatrix();
pushMatrix();
  translate(width,height/2);
  rotate(radians(90));
  fill(trans3);
  //textSize(30);
  text(e,tx,ty+340);
  popMatrix();
  noFill();
}


 if(count>13)
   {box1.move();
   box1.draw();
 box2.move();
 box2.draw();
 box3.move();
 box3.draw();
 box4.move();
 box4.draw();}
 if (count>=18 && count<20.5){
 fill(trans3);
 textSize(67);
 text("YOLO",width/2,height/2);}
 
      boy1.move();
     boy1.draw();
   if (count>20.5){image(peace,width/2,height/2,100,180);}
}



  
class Line{
 
float x1,y1,x2,y2;
int y_speed=1;
int x_speed=1;
  Line (float X1, float Y1, float X2, float Y2, int Y_speed, int X_speed){
    x1 = X1;
    y1 = Y1;
    x2 = X2;
    y2 = Y2;
    y_speed = Y_speed;
    x_speed = X_speed;
  }
  
  void draw(){
    strokeWeight(6);
  line (x1,y1,x2,y2);}
  
  void move(){
//vertical curtains
    if(x1==0 &&x2==width && y1<=height/2-65
    ){
      stroke(0);
      y2+=y_speed;
      y1+=y_speed;
    
  /*if(y1==height/2-65){
    count++;
    if(count>=10){y2-=y_speed;y1-=y_speed;}
  }*/}
    if(y1<=height && y1>=height/2+65){
    y1-=y_speed;
    y2-=y_speed;}
//horizontal curtains
     if(y1==0&& y2==height && x1<=width/2-30){
          x1+=x_speed*2.9;
          x2+=x_speed*2.9;}
     if(x1>=width/2+30 &&y1==0){
     x1-=x_speed*2.9;
     x2-=x_speed*2.9;}   
    /* expanding you scope
    if(x1 >= 0){x1+=y_speed*3;}
    */
}


}




class Boy {
  float timer;
  int bw, bh;
  float x,y;
  float boy_speed;
  boolean hey;
    Boy(int bx, int by,float BW, float BH, float Boy_speed ){
      bw = BW;
      bh = BH;
      x = bx;
      y = by;
      boy_speed = Boy_speed;
    }
      
      void draw(){

        
        
        imageMode(CENTER);
        
        //noStroke();
        image(boy , x, y,bw,bh,boy_speed);
        
       
      }   
      
      void move(){
        if(count>=10 && count<12){
          x=random(width/2-7,width/2+7);
      }
        if (count>16.5 && count<18){
          x+=3;
    
  }
      if(count>=19){x-=30;}
}
}
class Box{
  
  float x,y;
  int bow, boh;
  float rspeed,uspeed;
    Box(int X, int Y, float BX, float BY, float Rspeed, float Uspeed){
      x=X; y=Y; bow=BX; boh=BY; rspeed=Rspeed;uspeed=Uspeed;}
      void draw(){
        rectMode(CORNER);
        fill(255);
        noStroke();
        rect(x,y,bow,boh);
        stroke(0);}
        
        
      void move(){
      bow+=rspeed*2;
      boh+=uspeed*2;
      }  
}


