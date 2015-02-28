
boolean boton1 = false;
boolean boton2 = false; 
boolean boton3 = false; 

//boton1

int x1=0;
int y1=650;
int q1=240;
int w1=50; 

//boton 2


int x2= 240;
int y2=650;
int q2=240;
int w2=50;  

//boton 3 

int x3=480;
int y3=650;
int q3=240;
int w3=50;






void setup(){
  size(720,700);
  background(60);
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
    
    //white brush
    
    stroke(255);
    fill(255,20);
   
    if(mousePressed&&mouseButton == LEFT) {
      rect(pmouseX,pmouseY,50,50);
    } 
    
    
    
    
    
    //give a function to the buttons
    if(boton1){
      fill(214,0,117);
       if(mousePressed&&mouseButton == LEFT){
      rect(pmouseX,pmouseY,50,50);
    } 
    }
    
       if(boton2){
      fill(17,239,186);
       if(mousePressed&&mouseButton == LEFT){
      rect(pmouseX,pmouseY,50,50);
    } 
       }
      
         if(boton3){
      fill(208,255,13);
       if(mousePressed&&mouseButton == LEFT){
      rect(pmouseX,pmouseY,50,50);
    } 
        } 
      
      
      
      noStroke();
      //draw buttons
      
      fill(214,0,117);
      rect(x1,y1,q1,w1);
      
      
       fill(17,239,186);;
      rect(x2,y2,q2,w2);
      
      
       fill(208,255,13);
      rect(x3,y3,q3,w3);
      
         }
         
         
         
         
         void keyPressed(){
           if(key == 'e'){
             fill(60);
             rect(0,0,width,height);
           }
      
         }
      

