
int s = 15;
int i = 1;
int k = 0;

void setup() {
  size(700, 700);
  colorMode(HSB);
  background(0);
}

void draw() {

  fill(0, 10);
  rect(0, 0, width, height);  
      
    for ( int i = s/2; i < width-s; i += 2*s) {
      for ( int j = s/2; j < height-s; j += 2*s) {    

        stroke(50+k+j%100, 200, 200);        
        line(i, j, i+s, j); 

        stroke(k+j%100, 200, 200);        
        line(i, j, i, j+s); 

        stroke(k+50+i%100, 200, 200);
        line(i+s, j, i+s, j+s); 

        stroke(k-i%100, 200, 200);
        line(i+s, j+s, i+2*s, j+s);
      }
    }
    
      k += i*5;
//      s += -i*1;
      if ( k >= 255 || k <= 0) {
        i *= -1;
      }
}


