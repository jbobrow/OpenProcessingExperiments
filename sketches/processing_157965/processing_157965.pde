
// Processing sketch by Erim Kocatepe // 
// www.erimkocatepe.com //

int count;
float frame;
void setup() {
  background(255);
  size(600, 600,OPENGL);
  smooth(8);
  count=width/2;
}

void draw() {
  background(255);
  frame = frameCount*0.09;
  randomSeed(1);
  //paper(15);

  //LINES
  int waveH = 0;
  
  stroke(30);
  strokeWeight(15);
  noFill();
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < 10; i++) {
    float rad = 230 * map(i,0,10,0.1,1);
    float shape = PI;  
    beginShape();
    for (int n = 0; n < count; n++) {
       float x= sin(map(n,0,count-1,0,shape)+frame*map(i,0,10,0.1,1))*rad;
         float y= cos(map(n,0,count-1,0,shape)+frame*map(i,0,10,0.1,1))*rad;
        vertex(x,y);   
      }
    endShape();   
    }
  popMatrix();
  //paper(15);
  //saveFrame("line-######.png");
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


