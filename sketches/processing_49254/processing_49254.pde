
/* By Natalie Schabowicz */
/*MPM 21*/
/*Influenced by Ken Feingold’s work, Hot & Cold Wars*/

PImage bg;

float startTime;

Hailey1 H1;
Jayden1 J1;

Hailey2 H2;
Jayden2 J2;

Hailey3 H3;
Jayden3 J3;


void setup() {  
  size(200,200); 
   frameRate(10);
   
startTime=millis(); 

H1 = new Hailey1();
J1 = new Jayden1();

H2 = new Hailey2();
J2 = new Jayden2();

H3 = new Hailey3();
J3 = new Jayden3();

}


void draw() {
  
  if (millis()>startTime+1000) 
  
    H1.display();

  if (millis()>startTime+6000) 
  
    J1.display();
    
    if (millis()>startTime+11000) 
  
    H2.display();
    
    if (millis()>startTime+16000) 
  
    J2.display();
    
    if (millis()>startTime+21000) 
  
    H3.display();
    
    if (millis()>startTime+26000) 
  
    J3.display();
    
    if (millis()>startTime+31000)
     updatePixels();
  }

