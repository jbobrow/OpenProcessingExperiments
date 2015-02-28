
Cube[] array;
int yangle=0;
int anglevel;
int pos=0;
int bgsat=0;
int vel=4;
int xspd=0;
int play=0;
float highscore=0;

void setup () {
  size(512, 512, P3D);
  colorMode(HSB);
  smooth();
  frameRate(30);
  
  array = new Cube[16];
  for (int i=0;i<16;i++) {
    array[i]=new Cube(random(-256, 256),random(-256, 256));
  }
}
 
void draw() {
  background(100,0,256);
  fill(100,bgsat,256);
  
  camera(256, 640, 24, 256, 0, 0, 0, 1, 0);
  
  translate(256,0);
  
  yangle+=anglevel;
  yangle*=0.9;
  bgsat*=0.8;
  rotateY(radians(yangle));
  pos+=xspd;
  
  beginShape();
  vertex(400,0,0);
  vertex(400,800,0);
  vertex(-400,800,0);
  vertex(-400,0,0);
  vertex(400,0,0);
  endShape();
  
  if(play==1){
    beginShape();
    vertex(0,560,0);
    vertex(1,592,0);
    vertex(-1,592,0);
    vertex(0,560,0);
    endShape();
  }
  
  for (int i=0;i<16;i++) {
    array[i].move();
  }
  if(play==1){
    vel+=0.02;
  
    if(vel*100-400>highscore){
      highscore=vel*100-400;
    }
  }
  rotateY(-radians(yangle));
  camera(256, 256, 256, 256, 256, 0, 0, 1, 0);
  
  textSize(16);
  fill(0, 0, 0);
  text("HIGH SCORE: "+int(highscore), 256, 128);
  text("SCORE: "+int(vel*100-400), 128, 128);
  
  if(play==0){
    text("Left and Right to move",180,160);
    text("Avoid the cubes",200,192);
    text("Space to start!",204,224);
    //text("Hello Andrew...",204,224);
  }
  
  if(highscore>3000&&(play)==1){
  //if(highscore>3000&&play; ==1){
    text("OMGWTFBBQ STOP",204,224);
  }
  
  if((vel-4)%(10)>8){
    text("FASTER!",204,192);
  }
}

void keyPressed() {
  if(play==1){
    if (key == CODED) {
      if (keyCode == LEFT) {
        anglevel=4;
        xspd=6;
      } 
      else if (keyCode == RIGHT) {
        anglevel=-4;
        xspd=-6;
      }
    }
  }
  if(play==0){
    if(key==' '){
      for (int i=0;i<16;i++) {
        array[i].reset();
      }
      play=1;
    }
  }    
}

void keyReleased(){
  if (key == CODED) {
    if (keyCode == LEFT) {
      anglevel=0;
      xspd=0;
    } 
    else if (keyCode == RIGHT) {
      anglevel=0;
      xspd=0;
    }
  }
}
 
class Cube {
  float x, y;
 
  Cube(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
  
  void reset(){
    x=random(-256-pos,256-pos);
    y=random(-256, 256);
  }
 
  void move() {
    beginShape();
    vertex(x-16+pos,y,0);
    vertex(x+16+pos,y,0);
    vertex(x+16+pos,y,32);
    vertex(x-16+pos,y,32);
    vertex(x-16+pos,y,0);
    endShape();
    
    beginShape();
    vertex(x-16+pos,y,0);
    vertex(x-16+pos,y-32,0);
    vertex(x-16+pos,y-32,32);
    vertex(x-16+pos,y,32);
    endShape();
    
    beginShape();
    vertex(x+16+pos,y,0);
    vertex(x+16+pos,y-32,0);
    vertex(x+16+pos,y-32,32);
    vertex(x+16+pos,y,32);
    endShape();
    
    if(play==1){
      if(y>600&&x+16+pos>0&&x-16+pos<0){
        bgsat=256;
        vel=4;
        play=0;
      }
    }
    
    
    y+=vel;
    if(y>640){
      if((vel-4)%(10)>8){
        if(random(2)>1){
          x=random(-144-pos,-112-pos);
        }
        else{
          x=random(112-pos,144-pos);
        }
      }
      else{
        x=random(-256-pos,256-pos);
      }
      y=random(-32,32);
    }
  }
}
