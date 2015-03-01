
void setup() {  

size(600,600);
background(255,255,255);
}

void draw() {  //draw function loops 
    fill(0,0,0);
    
    noStroke();
    translate(-425,18);
    rectMode(CENTER);
    
    for (int j=23, k=23, l=40; j+k > 0; j -= 2, k -= 2) {
      
      for (int i=50; i < 1200; i = i + 80) {
          rect(i, 0, j, 37);
          rect(i-40, 0, 37, k);
        }
    
        translate(l,40);
    
    }
}



