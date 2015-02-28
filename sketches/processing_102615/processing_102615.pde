
int n = 222;

float x, y = .05;
float nY;


size(900, 500, P2D);
smooth();


void draw() {

    background(0);

    noStroke();
    fill(#FF473F);
    
    for(int i = 1; i<n; i++){
    
      y += .05;
      x = i*(width/n);
      
      nY += ((noise(y)*height)-nY)/10;
      
      ellipse(x, nY, 4, 4);
  
    }
  
    
}
