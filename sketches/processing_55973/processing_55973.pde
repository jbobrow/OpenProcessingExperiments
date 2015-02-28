
int s = 10;
int i = 1;
void setup() {
  size(700, 700);
  colorMode(HSB);
  background(0);
}

void draw() {

  fill(0, 80);
  rect(0, 0, width, height);

  for ( int k = 1; k < 10; k ++) {
    for ( int i = 0; i < width; i += width/6) {
      for ( int j = 0; j < height; j += height/6) {    
            //  line(i,j,i+s,j); 
            //  line(i,j,i,j+s); 
            //  line(i+s,j,i+s,j+s); 
            //  line(i,j+s,i+s,j+s);   
            stroke(100+j%100, 200, 200);        
            line(i, j, i+s/k, j); 

            stroke(80+j%100, 200, 200);        
            line(i, j, i, j+s/k); 

            stroke(60+i%100, 200, 200);
            line(i+s/k, j, i+s/k, j+s/k); 

            stroke(20+i%100, 200, 200);
            line(i, j+s/k, i+s/k, j+s/k);
          }
        }
      }

      s += i*5;
      if ( s >= width || s <= -width) {
        i *= -1;
      }
    }


