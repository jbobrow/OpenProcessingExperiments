
//import processing.pdf.*;

float x,y;
float angle = 0;
float r = 280;
float d = 1;



void setup(){

size(600,600);
//beginRecord(PDF, "song.pdf"); 
background(#111EA5);



}

void draw(){
  x=r*sin(angle);
  y=r*cos(angle);
 
  stroke(255,25);//color,opacity
  noFill();
  translate(width/2, height/2);
  
 
  line(0,0,x,y);
  ellipse(0,0,x,y);
  rect(0,0,x,y);
   angle += 3;
 
   r = r - d ;
   if(r == 0 | r == 500){
     d = d * -1;
   }
   
   
  println(x + "  :  " +y);
}

//void keyPressed(){
  //if(key == 'q'){
  //endRecord();
  //exit(); 


