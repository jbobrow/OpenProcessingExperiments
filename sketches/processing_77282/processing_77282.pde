
//Nick Lally 
//Midterm- Maria Nunez
//This is my drawing program using different elements of programming. 
//In the button(bubbles) i use class, objects, color
//in the button ants i use trigonometry, for loops, images
// In the button square I use color, rotation, modes.
//In the button circles I use for loops,shapes, mouseX, mouseY
//in the button background I use background, color
//In the button Clear I use Color, background
//The program uses variables,classes, mode, functions. 

//The button circles doesn't work after you press the button bubbles. I don't understand why. But it works if you run the program and press it before you've pressed bubbles.

Ant[] ants;
Circle[]circles;
boolean circle;
int id;
int id2;
float angle;
float zoo;
boolean button1;
float big;
boolean buuble;
boolean anta;
boolean vortex;
boolean squares;
int bigo;

PImage anti;

void setup(){
  background(255);
 size(600,600);
 smooth(); 
 anti= loadImage("ant.gif");
 circle=false;
 angle=0;
 zoo=0;
 button1=true;
 buuble=false;
 anta=false;
 vortex=false;
 squares=false;
 
 
 ants= new Ant[1000];
 for(int i=0;i<ants.length;i++){
  ants[i]= new Ant(0,0,i);
 }
  circles= new Circle[1000];
for(int i=0;i<circles.length;i++){
  circles[i]= new Circle(random(200),random(200),i);
 }
}

void draw(){
 // println(mouseX);
 //Set of buttons-always front 
  if (button1){
    buttons();
  }
  
 //Antpen
 if(anta){
    for(int i=0; i<ants.length;i++){
  ants[i].moveC();
 ants[i].display();   
    }
  }
  
//Draw circles
   if (mousePressed){
    if(vortex){
      vortexo();
      }
     }
  //spiral ants
  if((circle==true)&& (mousePressed)){
     for(int i=0; i<ants.length;i++){    
   ants[i].moveD();
  }
 }
 //bubbles
  if (buuble){
    circle=false;
   for(int i=0; i<circles.length;i++){
     big=300;
     circles[i].moveC();
     circles[i].display(); 
    if (mousePressed){
      noStroke();
   circles[i].moveD();
 circles[i].moveG();
      }
  }
 }
 
//squares
 if(mousePressed && (squares)){
  squareT();
 }
}


void mousePressed(){
  //button buuble
  if ((mouseX>=10)&&(mouseY>=540)&&(mouseX<=30)&&(mouseY<=560)){
    println(buuble);
    anta=false;
    vortex=false;
  }
  //button ants
  if ((mouseX>=90)&&(mouseY>=540)&&(mouseX<=110)&&(mouseY<=560)){
    if (!anta){
      anta=true;
    }
    if (anta){
      anta=false;
    }
    if (anta==false){
      circle=true; 
    big+=1;
    }
  }
 
 //button squares
 if ((mouseX>=160)&&(mouseY>=540)&&(mouseX<=180)&&(mouseY<=560)){
    vortex=false;
    circle=false;
    buuble=false;
    anta=false;
  }
  
 //button circles
 if ((mouseX>=240)&&(mouseY>=540)&&(mouseX<=260)&&(mouseY<=560)){
    circle=false;
    buuble=false;
    anta=false;
    squares=false;
    }
 
 //button background
 if ((mouseX>=300)&&(mouseY>=540)&&(mouseX<=3200)&&(mouseY<=560)){
   circle=false;
   buuble=false;
   anta=false;
   squares=false;
   vortex=false;
  }
  
  //button clear
  
  if ((mouseX>=380)&&(mouseY>=540)&&(mouseX<=460)&&(mouseY<=560)){
    circle=false;
    buuble=false;
    anta=false;
    squares=false;
    vortex=false;
    }
  }
  
void mouseReleased(){
 big=1;
 bigo=1;

//button buuble
if ((mouseX>=10)&&(mouseY>=540)&&(mouseX<=30)&&(mouseY<=560)){
   squares=false;
   if(buuble==true){
     buuble=false;
   }
   if(!buuble){
     buuble=true;
   }
 }
  
//button ants
if ((mouseX>=90)&&(mouseY>=540)&&(mouseX<=110)&&(mouseY<=560)){
  buuble=false;
   squares=false;
  if(anta){
    anta=false;
     }
  if(!anta){
    anta=true;
     }
   }
  if ((mouseX>=160)&&(mouseY>=540)&&(mouseX<=180)&&(mouseY<=560)){
   // println(squares);
    if (!squares){
      squares=true;
  }
  }
   
   if ((mouseX>=240)&&(mouseY>=540)&&(mouseX<=260)&&(mouseY<=560)){
     squares=false;
   println(vortex);
     anta=false;
     circle=false;
     if(vortex==false){
       vortex=true;
     }
     //Couldn't get this boleean to be true if I left this part of the code
     //if(vortex){
       //vortex=false;
     }
   if ((mouseX>=320)&&(mouseY>=540)&&(mouseX<=340)&&(mouseY<=560)){
     background(random(255),random(255),random(255));
     vortex=false;
     squares=false;
  }
  if ((mouseX>=380)&&(mouseY>=540)&&(mouseX<=460)&&(mouseY<=560)){
    background(255);
    vortex=false;
    squares=false;
   }
  }

class  Circle{
  float x,y,speedx,speedy;
  //constructor
  Circle(float _x, float _y,int _id){
    x=_x;
    y=_y;
    id=_id;
    speedx=random(5);
    speedy=random(3);
  }
  //methods
  void moveC(){ 
    if ((x<600)&&(y<500)){
    x+=speedx;
    y+=speedy;
    }
  }
  void moveD(){
    if((x>width/2)||(y>height/2)){
      fill(random(255),random(255),random(255));
   speedx=-random(10);
   speedy=-random(10);
   big+=300;
   x=random(600);
    y=random(500);
    }
  }
  void moveG(){
  if((x<width/2)||(y<height/2)){
    fill(random(255),random(255),random(255));
    speedx=random(10);
    speedy=random(10);
    big+=100;
    x=random(600);
    y=random(500);
    
    } 
  }

  void display(){
    fill(random(255),random(255),random(255),random(100));
    ellipse(x,y,big/100,big/100);
    if (big<300){
      big+=100;
     }
    }
  }

class Ant{
  float x,y,speedx,speedy;
  //constructor
 Ant(float _x, float _y,int _id){
   x=_x;
   y=_y;
   id=_id;
   speedx=random(5);
   speedy=random(3);
 }
//methods
void moveC(){
  x+=speedx;
  y+=speedy;
}

void moveD(){

    zoo++;
    x++;
    y++;
    x=5*cos(radians(angle));
    y=5*sin(radians(angle));
    fill(255,50);
    angle+=50;
    image(anti,(x*6+width/2)-x,(y*6+height/2)-y);
   image(anti,x*12+width/2,y*12+height/2);
   image(anti,x*18+width/2,y*18+height/2);
   image(anti,x*24+width/2,y*24+height/2);
   image(anti,x*30+width/2,y*30+height/2);
   image(anti,x*36+width/2,y*36+height/2);
   image(anti,x*36+width/2,y*36+height/2);
   image(anti,x*42+width/2,y*42+height/2);
   image(anti,x*48+width/2,y*48+height/2);
   image(anti,x*54+width/2,y*54+height/2);
   image(anti,x*60+width/2,y*60+height/2);
   image(anti,x*66+width/2,y*66+height/2);
   image(anti,x*73+width/2,y*73+height/2);
   image(anti,x*79+width/2,y*79+height/2);
   image(anti,x*85+width/2,y*85+height/2);
  
}
  void display(){
    fill(random(255),random(255),random(255),random(10));
    image(anti,mouseX,mouseY);
  }
}

void squareT(){
  if (mouseX%2<=0){
     for(int mix=0;mix<600;mix++){
       for(int mex=0;mex<600;mex++){
      fill(random(255),random(255),random(255));
      mix+=3;
      mex+=3;
      rect(mix+random(500),mex+random(500),10,10);
       }
     }
   }
   else if((mouseX%2>0)){
     for(int mix=0;mix<600;mix++){
       for(int mex=0;mex<600;mex++){
         mix+=1;
         mex+=1;
     fill(random(255),random(30));
     translate((10),0);
     rotate(radians(20));
     rect(mix+mouseX,mex+(random(600)),10,10);
    }
  }
 }
}
void vortexo(){
  for(float s=0;s<30;s++){
      if(vortex==true){
        buuble=false;
     noFill();
     strokeWeight(.05);
     bigo+=1;
     ellipse(mouseX,mouseY,s+bigo,s+bigo); 
      }
  }
}

void buttons(){
 fill(255);
   rect(0,500,600,100); 
   fill(0);
   rect(10,540,20,20);
   rect(90,540,20,20);
   rect(160,540,20,20);
   rect(240,540,20,20);
   rect(320,540,20,20);
   rect(400,540,20,20);
   text("Bubbles",31,539);
   text("Ants",111,539);
   text("Squares",181,539);
   text("Circles",261,539);
   text("Backg.",341,539);
   text("Clear",421,539);
}

