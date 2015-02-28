
//sketch-homework6 malvear


PImage roca;

float mango;
float ala;
float ala2;
float pelo;
float mar;
float arena;

void setup(){
  size(800,800);
  smooth();
  background(0);
  roca =loadImage("roca.gif");


  mango=3;
  
 
}

void draw(){
     


  //background(random(255));
  float ala = pelo* cos(radians(mango));
  float  ala2= pelo* sin(radians(mango))*cos(radians(mango/10))*sin(radians(500-mango));
  
   drawquad(mango, pelo);
    image(roca,pelo+100,pelo+0);
 drawline(mango,pelo);



drawline(mango,pelo);

stroke(random(255),random(300));

ellipse(ala+100,ala2+500,2,2);
  point(ala+700,ala2+100);

  mango+=5;
  ala+=100;
  ala2+=.2;
  pelo+=.1;

  

  
  mar+=.4;
  arena+=3;
}


void drawline(float mango, float pelo){
  
  stroke(random(255),random(300),random(90));
  line(mango+100,ala2*100,0,0);
  
}
   void drawquad(float mango, float pelo){
     quad(ala+200,ala2=width/2,pelo+200,pelo+500,200,580,800,600);

   }
   

   
   
   

