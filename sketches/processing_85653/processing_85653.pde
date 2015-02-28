
PVector pos, spd, curveball;
int go=-1;
int score=0;
int highscore=0;

void setup() {
  colorMode(RGB);
  size(512, 512, P3D);
  background(0, 0, 0);
  frameRate(30);
  noStroke();
  smooth();
  pos = new PVector(256, 256, -128);
  spd = new PVector(random(-16, 16), random(-16, 16), -16);
  curveball = new PVector(0,0);
}

void mouseClicked() {
  if (go==-1) {
    go*=-1;
  }
}

void draw() {
  background(128, 128, 128);

  noFill();
  stroke();
  for(int i=0; i<9; i++){
    beginShape();
    vertex(-64, -64, -128*i);
    vertex(-64, 576, -128*i);
    vertex(576, 576, -128*i);
    vertex(576, -64, -128*i);
    vertex(-64, -64, -128*i);
    endShape();
  } 
  
  stroke(#00ff00);
  beginShape();
  vertex(-63, -63, pos.z); 
  vertex(-63, 575, pos.z);
  vertex(575, 575, pos.z);
  vertex(575, -63, pos.z);
  vertex(-63, -63, pos.z);
  endShape(); 
  
  noStroke();
  translate(pos.x, pos.y, pos.z);
  fill(256, 256, 256);
  sphere(64);

  translate(-pos.x, -pos.y, -pos.z);
  fill(192, 192, 192, 128);
  beginShape();
  vertex(mouseX-32, mouseY-32, 0);
  vertex(mouseX+32, mouseY-32, 0);
  vertex(mouseX+32, mouseY+32, 0);
  vertex(mouseX-32, mouseY+32, 0);
  vertex(mouseX-32, mouseY-32, 0);
  endShape();


  if (pos.z>-64) {
    if (pos.x>mouseX-64 && pos.y>mouseY-64 && pos.x<mouseX+64 && pos.y<mouseY+64) {
      spd.z*=-1.5;
      score+=1;
      if(score>highscore){
        highscore=score;
      }
    }
    else {
      pos.set(256, 256, -64);
      spd.set(random(-16, 16), random(-16, 16), -16);
      curveball.set(0,0);
      go*=-1;
      score=0;
    }
  }  
  if (pos.z<-1024) {
    spd.z*=-1;
    curveball.set(random(-3,3),random(-3,3));
  }  
  if (pos.x<0||pos.x>512) {
    spd.x*=-1.2;
  }  
  if (pos.y<0||pos.y>512) {
    spd.y*=-1.2;
  }
  if (go==1) {
    pos.x+=spd.x;
    pos.y+=spd.y;
    pos.z+=spd.z;
    spd.x+=curveball.x;
    spd.y+=curveball.y;
  }

  textSize(32);
  fill(0, 102, 153);
  text("High Score: "+highscore, 256, 64);
  text("Score: "+score, 64, 64);
}



