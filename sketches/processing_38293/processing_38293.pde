
import processing.pdf.*; 

int x1 = 30; 
int y1 = 30; 
int spacing = 130; 
int spacing2 = 70; 


void setup () { 
  size (1070, 1070, PDF, "wallpaper.pdf"); 
  smooth(); 
  noStroke ();
  background (#FFB624);
} 

void draw () { 
  fill (#2460FF); 
  for (int j = 0; j <= 1000; j = j + spacing) {
    for (int i = 0; i <= 1000; i = i + spacing) {  
      rect (x1 + i, y1 + j, 100, 100);
    }
  }

  fill (#163486); 
  for (int j = 0; j <= 1000; j = j + spacing*2) {
    for (int i = 0; i <= 1000; i = i + spacing*2) {  
      rect (x1 + i, y1 + j, 100, 100);
    }
  }

  fill (#FFB624); 
  for (int j = 0; j <= 1000; j = j + spacing + 40) {
    for (int i = 0; i <= 1000; i = i + spacing + 40) {  
      rect (x1 + i, y1 + j, 80, 80);
    }
  }
    fill (#FFB624); 
  for (int j = 0; j <= 1000; j = j + spacing + 60) {
    for (int i = 0; i <= 1000; i = i + spacing + 60) {  
      rect (x1 + i, y1 + j, 30, 60);
    }
  }
  exit(); 

}


                
