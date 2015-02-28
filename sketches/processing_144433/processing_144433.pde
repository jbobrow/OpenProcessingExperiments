
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM SungUk
// ID: 201420068

float x,y;
void draw(){
  background(0);
  drawClock();
  println(mouseX + " : " + mouseY);
}

void setup(){
 size(600,600);
  smooth();
  strokeWeight(2);
  textSize(30);
  x = width/2;
  y = height/2; 
}
void drawClock(){
  noFill();
  rect(0, 0, 100, 100);  
  translate(30, 20);     
  rect(0, 0, 100, 100);  
  translate(50,50);     
                               
  rect(0,0,100,100);     
  translate(-80,-70);   
  
  pushMatrix();           
                             
  translate(30, 20); 
  fill(0);  
  rect(0, 0, 50, 50);      
  popMatrix(); 

  fill(#5284FF);  
  rect(15, 10, 50, 50, -10, -50-5*second(), -10, -50-5*second());  
                              
  
  fill(255);
  drawNumber();
  
  float m_angle = map(minute(),0,59,0,TWO_PI);
  pushMatrix();

  rotate(m_angle);
  strokeWeight(15);
  stroke(255);
  line(0,0,0,-550);
  popMatrix();
   
  float h_angle = map(hour(),0,11,0,TWO_PI);
  pushMatrix();
  rotate(h_angle);
  strokeWeight(20);
  stroke(#FF0004);
  line(0,0,0,-400);
  popMatrix();
    strokeWeight(3);
    stroke(#5DD5FF);
}
void drawNumber(){
  float r = 250;
  float inc = TWO_PI/12;
  for (int i=1; i<=12; i++){
    float xn = x+cos(i*inc - HALF_PI)* r;
    float yn = y+sin(i*inc - HALF_PI)* r;
    fill(#00FFBD);
    text(i,xn,yn);
 }

 strokeWeight(5);
 noFill();
 

  translate(width/2, height/2);  
  rect(-26, -26, 52, 52);    
  fill(255);   
    

  fill(255);
  scale(0.5);  
  rect(200, 200, 50, 50);                                
  scale(0.5,0.7);                        
  rect(200, 200, 50, 50); 
//

  }
