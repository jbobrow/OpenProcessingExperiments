
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: Park Hyebin 
 // ID: 201420081 
 
float angle;  
float xW = 10;
float direction = 5;

void setup()  
{  
  size(600, 600);  
  smooth();
// setupAudio();
  background(600, 0, 600);
}  
// noLoop();
void draw()  
{  
 //getVolume();
 float X = map(volume, 0, 200, 2, 10);
  background(#325A7D);  
  // rotation angle  
  angle += 0.001*X;  
  strokeWeight(23);  
  stroke(200, 0, 600);  
  fill(255);    
  translate(width, height);    

  for (int i=0; i<90; i++) {  
    rotate(angle);  
    scale(0.95);  

    rectMode(RIGHT);
    rectMode(LEFT);  
    fill(0, 500, 200);
    random(75);
    rect(0, 0, 700, 700);
  }
  
  int i = 0; 
 while (i < 50){
 line(20, i, 40, i);
 i = i + 15; 
 } 
} 

