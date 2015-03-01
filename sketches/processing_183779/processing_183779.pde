
int r = 12;
int pr = r;
boolean swirl = false;
int freq = 1;
float chance = 0.5;
int u = 0;
void generate(){
  r = pr;
  noStroke();
  if(height<width){
    u = height/r/2;
  }else{
    u = width/r/2;
  }
  r = r - 1;
  for(int x = 0; x<r; x++){
    for(int y = 0; y<r; y++){
      pushMatrix();
      translate(width/2, height/2);
      if(random(0,1)>chance){
        fill(255,255,255);
      }else{
        fill(0, 0, 0);
      }
      if(x+1 == r||y+1 == r){
        fill(128,128,128);
      }
      if(x>y-1 || swirl){
        for(int j = 0; j<4; j++){
          rotate(TWO_PI/4);
          rect(x*u,y*u,(x+1)*u,(y+1)*u);
          if(!swirl){
            rect(-x*u,y*u,-(x+1)*u,(y+1)*u);
          }
        }
      }
      popMatrix();
    }
  }
}
void setup(){
  size( 650, 650 );
  frameRate(15);
  generate();
}
void mouseClicked(){
  generate();
}
void keyPressed(){
  generate();
}



