

void setup() {
  size(400,400);
  background(255);
  noStroke();
  generatePattern();
}

void draw() {
}

void generatePattern() {
  background(255);
  int col, alpha;
  int horDens = int(random(0,10));
  int verDens = int(random(0,10));
  for(int i = 0; i < width/2; i++) {
    col = int(random(0,255));
    if(horDens > random(0,10)) {
      alpha = 255;
    } else {
      alpha = 0;
    }
    //println(fill
    fill(col,alpha);
    rect(i*2,0,2,height);
  }
  
  for(int i = 0; i < height/2; i++) {
    //acciones horizontales
     col = int(random(0,255));
    if(horDens > random(0,10)) {
      alpha = 255;
    } else {
      alpha = 0;
    }
    if (col >= 128) {
      alpha = 0;
    } else {
      col = 0;
    }
    //println(fill
    fill(col,alpha);
    rect(0,i*2,width,2);
  }
}

void keyPressed() {
  generatePattern();
}


