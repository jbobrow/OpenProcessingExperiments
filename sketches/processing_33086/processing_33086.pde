




//
//
//
float circleY;
float circleX;
float vel =2;
float vel2 =20;

//float circleY2;
//float circleX2;
//float vel3 =2;
//float vel4 =20;




//float speed =0;



void setup(){
  size(500,500);
  smooth();
  frameRate(60);
  background(180,5,5);
}

void draw() {

  
PImage mar1;
mar1 = loadImage("march1.png");

PImage mar2;
mar2 = loadImage("march2.png");



  
  fill(255, 217, 0);
  noStroke();
  
  circleY=circleY+vel;
  circleX=circleX+vel2;
//  circleY2=circleY2+vel3;
//  circleX2=circleX2+vel4;
  



 image(mar1, circleX, circleY);
  
  
  if((circleY<-100)||(circleY>height)) {
    vel=vel*-1;
    
    
    
    
  }

   if((circleX<-100)||(circleX>width-20)) {
    vel2=vel2*-1;
    
    
    
  }





// image(mar2, circleX2, circleY2);
//  
//  
//  if((circleY2<-100)||(circleY2>height)) {
//    vel3=vel3*-1;
//    
//    
//    
//    
//  }
//
//   if((circleX2<-100)||(circleX2>width-20)) {
//    vel4=vel4*-1;
//    
//    
//    
//  }

}








  

