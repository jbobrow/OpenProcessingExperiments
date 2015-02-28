
PImage p = loadImage("breakfast.jpg");
int counter;

void setup(){
  size(600,400);
  image(p, 0, 0);
  counter = 2;
  noStroke();
  frameRate(4);
}

void draw(){
  if (mousePressed){
    for(int k=0; k<200; k++){
      for(int j=0; j<200; j++){
        if(j==0 && k!=0){ k+=(counter-1); }
        if(sqrt(sq(k-100) + sq(j-100)) < 75){
          int r = 0;
          int g = 0;
          int b = 0;
          for(int i=0; i<counter; i++){
            for(int h=0; h<counter; h++){
              color c = get(mouseX + (k-100) + (i-(counter/2)), mouseY + (j-100) + (h-(counter/2)));
              r += red(c);
              g += green(c);
              b += blue(c);
            }
          }
          r = int(r/sq(counter));
          g = int(g/sq(counter));
          b = int(b/sq(counter));
          fill(r, g, b);
          rect(mouseX+(k-100), mouseY+(j-100), counter, counter);
          j+=counter;
        }
      }
    }
    counter++;
  }
}

void mouseReleased(){
  counter = 1;
}


