
boolean boton1 = false;
boolean boton2 = false;
boolean boton3 = false;
 
//boton1
 
int x1=0;
int y1=0;
int q1=100;
int w1=80;
 
//boton 2
 
 
int x2= 320;
int y2=0;
int q2=100;
int w2=80; 
 
//boton 3
 
int x3=620;
int y3=0;
int q3=100;
int w3=80;
 
 
 
 
 
 
void setup(){
  size(720,700);
  background(152,209,255);
  smooth();
}
 
 
 
 
 
 
 
//set the function for right click
void mousePressed(){
   
  if (mouseButton==RIGHT){
   
    if (mouseX > x1 && mouseX < x1+ q1 && mouseY > y1){
      boton1=!boton1;
      boton2=false;
      boton3=false;
    }
   
   
    if (mouseX > x2 && mouseX < x2+ q2 && mouseY > y2){
      boton2=!boton2;
      boton1=false;
      boton3=false;
    }
     
     
      if (mouseX > x3 && mouseX < x3+ q3 && mouseY > y3){
      boton3=!boton3;
      boton2=false;
      boton1=false;
    }
     
  }
   
}
  void draw(){
     
     
     
     
     
     
    //give a function to the buttons
    if(boton1){
    stroke(28,57,5,random (90,10));
     noFill();
    if(mousePressed&&mouseButton == LEFT){ 
      rect(pmouseX,pmouseY,70,70,120,120);
    }
    }
     
          if(boton2){
    stroke(156,110,237,random (90,10));
     noFill();
    if(mousePressed&&mouseButton == LEFT){ 
      rect(pmouseX,pmouseY,70,70,120,120);
    }
    }
    
    
       
                 if(boton3){
    stroke(229,16,16,random (90,10));
     noFill();
    if(mousePressed&&mouseButton == LEFT){ 
      rect(pmouseX,pmouseY,70,70,120,120);
    }
    }
       
       
       
      noStroke();
      //draw buttons
       
      fill(28,57,5);
      rect(x1,y1,q1,w1);
       
       
       fill(156,110,237);;
      rect(x2,y2,q2,w2);
       
       
       fill(229,16,16);
      rect(x3,y3,q3,w3);
       
         }
          
          
          
          
         void keyPressed(){
           if(key == 'b'){
             fill(random(255),random(255),random(255));
             rect(0,0,width,height);
           }    
             //original background
              if(key == 'o'){
             fill(152,209,255);
             rect(0,0,width,height);
           }
           //erraser
               if(key == 'e'){
     fill(152,209,255);
      ellipse(pmouseX,pmouseY,100,100);
           }
         
         }


