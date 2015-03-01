
// Processing sketch by Erim Kocatepe // 
// www.erimkocatepe.com //

int count;

void setup() {
  background(255);
  size(500, 500,OPENGL);
  smooth(8);
  count=width/2;
}

void draw() {
  background(255);
  noStroke();
  randomSeed(1);
  //paper(35);
  
  //WAVES
  for (int i = 0; i < 20; i++) {
      int waveH = 0;
      waveH = waveH + i*50;
      fill(20,sin(i*0.33)*110+40,100);
      beginShape();
      vertex(width, height); 
      vertex(0,height); 
        for (int y = 0; y < count; y++) {
          vertex(map(y,0,count,0,width), waveH + sin((y*0.2)+frameCount*0.09)*4); 
        }
      endShape();
    }
  
  /// ELLIPSE FRAME
  stroke(255);
  strokeWeight(155);
  noFill();
  ellipse(width/2, height/2, width*1.1, height*1.1);
  
  //paper(15);
}

//PAPER
void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), in_val);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(60, 170), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}


