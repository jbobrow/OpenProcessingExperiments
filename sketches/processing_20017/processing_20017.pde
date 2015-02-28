
void setup() {
  size(500,700);
  background(255);
}

int LineNo = 0;
int Loop = 0;

void draw() {

  //draw ellipse on a grid
  for(int x = 0; x< width/50; x++) {
    for(int y = 0; y< height/50; y++) {
      noStroke();
      fill(random(100,180),random(50,100));
      ellipse(25+(x*50),25+(y*50),50,50);
    }

    Loop++;
    if (Loop>1) {
      noLoop();
    }
  }

  //draw blue lines 
  for (int z = width/4; LineNo < random(100,150); z += random(0,15)) {
    strokeWeight(random(0,2));
    stroke(10,40,random(100,200));
    line(z,height,z+150,0);
    LineNo ++;
  }
}


