
//Midterm, SpacyFun
//10,23,11
//Nick Lally

PImage pointing;
Circle[] circles;
int mode = 0;
float linex,liney;
float u,v;
float angle = 0;
float q,w;
float gainx = 0;
float gainy = 0;
float expl = 0;


void setup(){
  
  size(600,600,P3D);
  circles = new Circle[100];
  noCursor();
 
  //stars
  background(0);
  for(int i = 0; i < circles.length; i++){
    circles[i] = new Circle(random(width), random(height),random(1,1),random(1,1));
  
}
  
  frameRate(40000);
  
}

 void draw(){
   //welcome text
   fill(247,214,45);
   text ("WELCOME!",300,100);  
   textSize(20); 
 
   switch(mode){
     
     //stars come out again
     case 49:
       for(int i = 0; i < circles.length; i++){
     for(int j = 0; i < circles.length; i++){
     circles[i].move();
     circles[i].move1();
     circles[i].display();
       }
     }
     break;
     
     //negative effect
     case 50:
       filter(INVERT);
       break;
       case 51:
       fill(255);
     break;
     
   //death star!  
   case(0):
    pushMatrix();
      lights();
      translate(400,400,0);
      sphere(20);
    popMatrix();
   break;
   
   //resets everything to black
   case 32:
   fill(0,.01);
   rect(0,0,width,height);
   break;

    //toggle for simplicity
    case 87:
       background(255);
       q = sin(radians(angle)) * gainx + width/2;
       w = cos(radians(angle)) * gainy + height/2;
          frameRate(1000);
          noStroke();
          ellipse(q,(w+5),50,50);
          ellipse((q+5),w,30,60);
        break;
       }       
   
   //these are the stars
     for(int i = 0; i < circles.length; i++){
       for(int j = 0; i < circles.length; i++){
         circles[i].move();
         circles[i].move1();
         circles[i].display();
     
     //Laser!!!
     if(mousePressed == true){
       stroke(0,200,0,10);
       line(400,400,mouseX,mouseY);
     }
     
     angle += 3;
     gainx += 5;
     gainy += 5;
     expl ++;
     
     //when the laser hits the sun all goes red and it explodes!
     if(mousePressed == true && mouseX < 175 && mouseX > 125){
       if(mouseY > 125 && mouseY < 175){
         frameRate(120);
         fill (200,0,0,10);
         ellipse(150,150,expl,expl);
         q = sin(radians(angle)) * 50 + 150;
         w = cos(radians(angle)) * 50 + 150;
        
          fill(247,250,169);
         
            fill(255);
            noStroke();
            fill(247,250,169);
            ellipse(150,150,q,(w+100));
            ellipse(150,150,(q+100),w);
             
             //AHHH
             fill(255,204,45);
             text ("AHHHH!",300,100);  
             textSize(20);  
       }
     }
      
      //sun
      fill(247,250,169);
      ellipse(150,150,50,50);
     }
    }
   }
 




//a lot of this code was taken from class
class Circle{
  float x,y,z,circleSize;
  int directionX = 90;
  int directionY = 90;
  int directionZ = 2;
  
  
  Circle(float xpos,float ypos,float zpos,float cSize){
    x = xpos;
    y = ypos;
    z = zpos;
    circleSize = cSize; 
  }
  
  void display(){
    //these are all the stars
    fill(255);
      ellipse(x,y,(circleSize-3),(circleSize+3));
      ellipse(x,y,(circleSize+3),(circleSize-3));
    fill(random(255));
      ellipse((x/3),y,1,1);
    fill(250,248,204);
      ellipse(x,(y*9),1,1);
      fill(200,0,0);
      ellipse((x/2),(y*9),1,1);
      ellipse((x*2),(y*9),1,1);
   if(x > 10 && x < 50){
   fill(0,0,230);
   }
  }
  
  //the stars are all bouncing balls, these are their conditionals
  void move(){
    x += directionX;
    y += directionY;
    
    if(x>width){
      directionX = directionX -2;
    }
    if(y>height){
     directionY = directionY - 4;
    }
    if(x<0){
      directionX = directionX+3;
    }
    if(y<0){
      directionY = directionY+3;
    }
    if(x == directionY){
      directionX = directionX-3;
    }
    if(y == directionX){
      directionY = directionY-3;
    }
    
    
  }
 void move1(){
    x += directionX;
    y += directionY;
    z += directionZ;
    
    if(x>width){
      directionX = directionX -200;
    }
    if(y>height){
     directionY = directionY - 400;
    }
    if(x<0){
      directionX = directionX+300;
    }
    if(y<0){
      directionY = directionY+300;
    }
    if(x == directionY){
      directionX = directionX-200;
      directionZ = directionZ-300;
    }
    if(y == directionX){
      directionY = directionY-3;
      directionZ = directionZ+3;
    }
    
    
  }
}




     void keyPressed(){
      mode++;
       mode = keyCode;
       println(mode);
      }  
     




  



