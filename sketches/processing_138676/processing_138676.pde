

int i = 0; 
boolean dir = true; 
heartShape heart = new heartShape(); 

void setup() {  

  size(800, 800); 
  colorMode(HSB); 
  smooth(); 
  noStroke(); 
  background(0);
} 





void draw() { 

  fill(0, 5); 
  rect(0, 0, width, height); 
  float x = 0.25 * (-pow(i, 2) + 40*i + 1200)*sin((PI*i)/180); 
  float y = -0.25 * (-pow(i, 2) + 40*i + 1200)*cos((PI*i)/180); 
  if (dir) { 

    heart.move(int(x) + 350, int(y) + 500); 
    i++; 
    if ( i >= 60) {  

      dir = !dir;
    }
  }  
  else { 

    i--; 
    heart.move(int(-x) + 350, int(y) + 500);  
    if ( i <= 0) dir = !dir;
  }
} 

class heartShape { 

  int col; 

  void move(int x, int y) { 

    fill(col, 255, 255); 
    pushMatrix(); 
    translate(x, y); 
    beginShape(); 
    vertex(50, 15);  
    bezierVertex(50, -5, 90, 5, 50, 40);  
    vertex(50, 15);  
    bezierVertex(50, -5, 10, 5, 50, 40);  
    endShape(); 
    popMatrix(); 
    col++; 
    if (col >= 255) { 

      col = 0;
    }
  }
} 

