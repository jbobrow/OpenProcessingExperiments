
float k;
int s;


void setup() {
  background(0);
  size(900, 700);  
  fill(255);
  smooth();
  noStroke();
  k = 1.3;
  s = 0;
}

void draw() {


  if(s == 1){
    fill(0);
    rect(0, 0, width, height);

    if (k > TWO_PI)
      k = 0;
    for (int i = 100; i < 800; i+=30) {
      for (int j = 100; j < 600; j+=30) {
        
        fill(255); 
        
        float constant = 200;
        arc(j, i, 20, 20, PI+k+(i/constant)+(j/constant), TWO_PI+k+(i/constant)+(j/constant));
        fill(0);
        arc(j, i, 20, 20, 0+k+(i/constant)+(j/constant), PI+k+(i/constant)+(j/constant));
      }
    }
    s=0;
    k += 0.131;

  }
  s++;

}


