
PVector pos, spd, curveball;
int goo=-1;
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
  spd = new PVector(random(-24, 24), random(-24, 24), -16);
  curveball = new PVector(0,0);
}
  
void mouseClicked() {
  if (goo==-1) {
    goo*=-1;
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
  vertex(mouseX-16, mouseY-16, 0);
  vertex(mouseX+16, mouseY-16, 0);
  vertex(mouseX+16, mouseY+16, 0);
  vertex(mouseX-16, mouseY+16, 0);
  vertex(mouseX-16, mouseY-16, 0);
  endShape();
   
  int bullshit=round(random(1,4));
  if(bullshit==4){
    if(goo==1){
      pos.set(random(0,512),random(0,512),pos.z);
    }
  }
   
  if (pos.z>-64) {
    if (pos.x>mouseX-32 && pos.y>mouseY-32 && pos.x<mouseX+32 && pos.y<mouseY+32) {
      spd.z*=3;
      score+=1;
      if(score>highscore){
        highscore=score;
      }
    }
    else {
      pos.set(256, 256, -64);
      spd.set(random(-16, 16), random(-16, 16), -16);
      curveball.set(0,0);
      goo*=-1;
      score=0;
    }
  }
  if (pos.z<-1024) {
    spd.z*=-1;
    curveball.set(random(-4,4),random(-4,4));
  }
  if (pos.x<0||pos.x>512) {
    spd.x*=-1;
  }
  if (pos.y<0||pos.y>512) {
    spd.y*=-1;
  }
  if (goo==1) {
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
