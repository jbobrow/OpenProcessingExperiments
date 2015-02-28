
PFont font;

int M = 5; 
void setup (){
  
  background (255);
  
  size (700,600);
  
  font = loadFont ("OCRAbyBT-Regular-48.vlw"); 
  textFont (font, 40);
  

  
  /*Rect del fondo*/
 noStroke();
 fill(255);
 rect(0,0,100,600);
 
 noStroke();
 fill(250,255,0,100);
 rect (100,0,100,600);

 noStroke(); 
 fill(0,255,232,100);
 rect (200,0,100,600);
 
 noStroke(); 
 fill (0,180,31,100);
 rect (300,0,100,600);

 noStroke();  
 fill(255,0,183,100);
 rect (400,0,100,600);
 
 noStroke(); 
 fill(255,0,0,100);
 rect (500,0,100,600);
 
 noStroke(); 
 fill(0,0,255,100);
 rect (600,0,100,600);
 
 
 
 
  for (int j = 0; j < height / M; j++) {
    for (int i = 0; i < width / M; i++) {
 
    fill (random (0,200),70);
      noStroke();
      
      rect(M / 10 + i * M, M / 600 + j * M, M, M);
    }
  }
  fill(0, 75);
  text ("No Signal",450,570);
}

