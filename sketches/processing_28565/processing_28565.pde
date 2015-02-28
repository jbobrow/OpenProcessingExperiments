
PImage level;
PImage [] robo;
PImage [] car;

float x = 0;
float y = 250;
float x2 = 75;
float y2= 300;
float x3 = 50;
float y3 = 100;
float x4 = 0;
float y4 = 15;
float x5 = 10;
float y5 = 65;
float x6 = 0;
float y6 = 400;


int frame = 0;
int frame2 = 1;
int frame3 = 2;
int frame4 =3;
int frame5 = 1;
int frame6 = 0;

float b = 1;
float a = 1;
int counter = 0;
float destinX, destinY;
float destinX2, destinY2;
float destinX3, destinY3;
float destinX4, destinY4;
float destinX5, destinY5;
float rot=0;
float desiredRot = 0;
float seeMe= 0;


void setup(){
  size (500,500);
 
  robo = new PImage[3];
  for(int i = 0; i< robo.length; i ++) {
  robo[i]= loadImage("robotsuit" + (i+1) + ".png");  
  }
  
  car = new PImage[3];
  for(int i = 0; i< car.length; i ++) {
  car[i]= loadImage("car" + (i+1) + ".png");  
  }
  
  
  level= loadImage("mariolevel.jpeg");

  
}



void draw(){
  
 if(frame > 2) frame = 0;
 image(level, 0,0, 500, 500);
  
 if(counter%20 ==0) {
   destinX= int(random(-20,520));
 }
 
 x+= (destinX-x) *.01;
 
  if(counter%20 ==0) {
   destinY= int(random(-20,520));
 }
 
 y+= (destinY-y) *.01;
 
 a=map(y,0,500,0,2);
 
 
 
 
 
 //this is robot 1
  pushMatrix();
  translate(x,y);
  
  scale(a,b);
  

  image(robo[frame], -50,-50, 75,100);
    

  
  
  popMatrix();
  
  //x+=x2;
  if(counter%10 == 0){
  frame2++;
}

  //this is robo 2  pushMatrix();
  
   if(counter%20 ==0) {
   destinX2= int(random(-20,520));
 }
 
 x2+= (destinX2-x2) *.01;
 
  if(counter%20 ==0) {
   destinY2= int(random(-20,520));
 }
 
 y2+= (destinY2-y2) *.01;
  
  
   if(frame2 > 2) frame2 = 0; 
  pushMatrix();
  translate(x2,y2);
  
  scale(a,b);
  

      image(robo[frame2], -50,-50, 75,100);
 
  
  
  popMatrix();
  
  
  
  if(counter%3 == 0){
  frame++;
}

//this is robo 3

 if(counter%20 ==0) {
   destinX3= int(random(-20,520));
 }
 
 x3+= (destinX3-y3) *.01;
 
  if(counter%20 ==0) {
   destinY3= int(random(-20,520));
 }
 
 y3+= (destinX3-y3) *.01;
  
  
   if(frame3 > 2) frame3 = 0; 
  pushMatrix();
  translate(x3,y3);
  
  scale(a,b);
  

      image(robo[frame3], -50,-50, 75,100);
 
  
  
  popMatrix();
  
  
  
  if(counter%10 == 0){
  frame3++;
}
  
//this is robo 4

 if(counter%20 ==0) {
   destinX4= int(random(-20,520));
 }
 
 x4+= (destinX4-x4) *.01;
 
  if(counter%20 ==0) {
   destinY4= int(random(-20,520));
 }
 
 y4+= (destinY4-y4) *.01;
  
  
   if(frame4 > 2) frame4 = 0; 
  pushMatrix();
  translate(x4,y4);
  
  scale(a,b);
  

      image(robo[frame4], -50,-50, 75,100);
 
  
  
  popMatrix();
  
  
  
  if(counter%35 == 0){
  frame4++;
}
  
//this is robo 5

 if(counter%20 ==0) {
   destinX5= int(random(-20,520));
 }
 
 x5+= (destinX5-x5) *.01;
 
  if(counter%20 ==0) {
   destinY5= int(random(-20,520));
 }
 
 y5+= (destinY5-y5) *.01;
  
  
   if(frame5 > 2) frame5 = 0; 
  pushMatrix();
  translate(x5,y5);
  
  scale(a,b);
  

      image(robo[frame5], -50,-50, 75,100);
 
  
  
  popMatrix();
  
  
  
  if(counter%3 == 0){
  frame5++;
}
  
  
  
// if(counter%25 == 0){
  // y+=10;
//}
 
 // y+=y2;
 
// if (x>=500 || x<=0)
  // {
    //x2*=-1;
    //a*=-1;
    
// }
// else if(mousePressed){
 // a+=.01;
  //b+=.01;
    
 //}
 counter++;
 
 
 //this is car
 
 if(frame > 2) frame = 0;
  //easing the rotation
  rot += (desiredRot-rot)*.1;
 
  
  
  
  
  pushMatrix();
  translate(x6,y6);
  rotate(rot);
  image(car[frame], -38,-30, 75,100);
  popMatrix();
  
 if(counter%3 == 0){
  frame6++;
}
counter++;

}

 


void keyPressed() {
 if(key == CODED) {
  if(keyCode == RIGHT){
    x6+=5;
    desiredRot = 0;
    frame++;
    //stomp.trigger();
    
  }else if(keyCode == LEFT){
    x6-=5;
    desiredRot= PI;
    frame++;
    //stomp.trigger();
    
  }


 }
}







//void keyPressed() {
 //if(key == CODED) {
  //if(keyCode == RIGHT){
    //x+=5;
    //desiredRot = 1.5*PI;
    //frame ++;
    
    
  //}else if(keyCode == LEFT){
    //x-=5;
    //desiredRot= .5*PI;
    //frame ++;
   
    
  //}else if(keyCode == UP){
    //y-=5 ; 
    //desiredRot= PI;
    //frame ++;
   
    
  //}else if(keyCode == DOWN){
    //y+=5;
    //desiredRot=0;
    //frame ++;
    
    
  //}  
  
  
 //}
 
//} 

