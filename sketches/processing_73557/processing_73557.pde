
PFont font;
 
int Time;
int timeStoring;
int timer;
 
void setup(){
   

  size(500,300);
  smooth();
   
  Time = 0;
   
  font = loadFont("Helvetica-48.vlw");
   
   clock();
   
}
 void clock(){

   
   textAlign(RIGHT);
text((Time-timeStoring)/1000,480,25);

   
}
   
void draw(){
     
 background(255);
 
      noStroke();
 
Time = millis();   
     
println(Time - timeStoring);
   
drawRectangle();
  
clock(); 
   
}
 
void drawRectangle(){
   
  timer = 1000;
 
   
  int rectangle = (Time - timeStoring)/100;
 
  if(millis() > timer){  
fill(255,0,0);
    rect(0,0,20,rectangle/2);
 
 
 
 
  
  
  if(millis() > timer*2){
 fill(255,255,0);
    rect(40,0,20,rectangle/2);

 
   
  }
     
 
    if(millis() > timer*3){
 fill(0,0,255);
    rect(80,0,20,rectangle/2);

      
     
  }
 
   
      if(millis() > timer*4){
 fill(0,255,0);
    rect(120,0,20,rectangle/2);

     
  }
   
  if(millis() > timer*5){
 fill(237,69,226);
    rect(160,0,20,rectangle/2);

  }
   
    if(millis() > timer*6){
 fill(69,237,222);
    rect(200,0,20,rectangle/4);

  }
   
      if(millis() > timer*7){
 fill(255,95,3);
    rect(240,0,20,rectangle/4);

  }
   
        if(millis() > timer*8){
 fill(121,202,255);
    rect(280,0,20,rectangle/4);

  }
   
          if(millis() > timer*9){
 fill(255,121,202);
    rect(320,0,20,rectangle/4);

  }
  
            if(millis() > timer*10){
 fill(30,134,46);
    rect(360,0,20,rectangle/4);

  }
   

   
 
    
  if(mousePressed){
       
      timeStoring = Time;
       
  }
      }
 
} 


