
//variables 
float x= 0;
float y = 0;
float r = 32;
float moveSpeedX= 2.2;
float moveSpeedY = 2.5;
 

void setup (){
 size (1024, 768);
 smooth();
}

void draw (){
  move();
  goBack();
  background (255,88,233);
  ellipseMode(CENTER);
  rectMode(CENTER);
//draw robot's head
  //rect (x,y, w,h)
  strokeWeight(8);
  stroke (237,115,186);
  fill (253,152,255);
  
  //head
  rect (x, 200, 250, 150);
  //rect(305, 200, 250, 150);
   //neck
  rect(x, 300, 50, 50);
  
  //torso 
  rect(x, 400, 155, 200, 13, 16, 112, 118);
  
  //arms
  rect (x,380, 40,100);
  rect (x,380, 40,100);
 
  //hands
   rect(x, 450, 60, 50);
   rect(x, 450, 60, 50);
 
 //eyes
   rect (x, 390, 30, 70);
   rect (x, 390, 30, 70);
   
   //mouth
   rect (x, 400, 100, 20);
   
   //ears
   rect (x, 200, 25, 70);
   rect (x, 200, 25, 70);
   
   //tiny bot 
   fill (230,170,247);
   stroke(210,115,237);
     ellipse(x,y,r,r);
     
}

void move(){

 x = x + moveSpeedX;
 y= y + moveSpeedY;
 
}
  void goBack() {
  if ((x > width)||(x<0)){
  moveSpeedX = moveSpeedX * -1;
  r= 64;
 }
 if ((y>height) ||(y<0)){
  moveSpeedY = moveSpeedY * -1;
  r=64;
  
 }

if(y > height-100){
 y= height - 100;
 moveSpeedY = moveSpeedY * -0.9; 
}

//else if (y <= 0){
 //moveSpeedY = -moveSpeedY;
}

