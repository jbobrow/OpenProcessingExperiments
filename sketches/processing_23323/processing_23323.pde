
float x;
float y;
float x2;
float y2;
float a,b,c;
float directionX;
float directionY;
PImage s;
PImage sm;
int speed;
boolean drawing= false;
boolean locked = false;



void setup(){
  background(#000000);
  size(600,600);
  x=0;
  y=0;
  directionX= 5;
  directionY=5.5;
  s=loadImage("circle.gif");
  sm=loadImage("small.gif");
}



void draw(){
  
  
  
  
  
 smooth();
 
float mx = constrain(mouseX,250,300);
//rect(0,0,width,height);
x = mouseX;
y = mouseY;
x2 = mouseY - directionX;
y2= mouseY*directionY;
x = constrain(x,210,180);
y = constrain(y,210,180);
x2= constrain(x2,28,44);
y2= constrain(y2,43,50);

 



  

  //taken from sketch " "by Linus Rudolph
  a=sqrt(b*b+c*c);
  b=abs(b-c);
  c=abs(a-c);

   
  
  
  
  
  for (int i =0;i<80; i ++){
    stroke(#b5309a);
    line(b*c,x2,i*5,100);//magenta

 }
  for (int i =0;i<100; i +=10){
    stroke(#4cb4c0);
    line(a*a,y2,i*10,200);//blue
  
   }
  for (int i =0;i<70; i ++){
    stroke(#b5309a);
    line(a*a,x2,i*20,300); //purple
  }
  
   //for (int i =0;i<1000; i +=10){ 
     //stroke(#4cb4c0);
     // stroke(map(i,0,1000,0,255));
      //rect(-1,-1,i,i);
     
     //image(s,0,30);
     //smooth();

fill(#000000);
ellipse(100,100,400,400);

    
  
    for (int i =0;i<100; i ++){
      stroke(#ed0944);
    line(a*a,b*c,i*10,400); //hot pink
  }
  for (int i =0;i<70; i ++){
    stroke(#763da5);
    line(540,0,i*40,500); //purple
  }
  for (int i =0;i<99; i ++){
    stroke(#1826d5);
    line(430,0,i*40,500); //blue
    
  }
}


void mousePressed(){
  if (mouseButton == LEFT){
    for (int i =0;i<99; i ++){ 
  stroke(#4cb4c0);
    line(a*a,y2,i*10,200);
 }

  }
}

void mouseDragged() {
  image(sm,mouseX,mouseY);
 x += directionX;
  y += directionY;
  if(y > height){
    directionY = -1;
  }
  if(y < 0){
    directionY = 1;
  }
  if(x>width){
    directionX = -2;
  }
    if(x <0){
      directionX =2;
  }

 
}
void mouseReleased () {
  image(sm,80,80);
}

