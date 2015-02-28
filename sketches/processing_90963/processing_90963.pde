
Snake[] array;
int dir = 1;
int chain = 11;
int dead = 0;
int growx = int(random(32));
int growy = int(random(32));


void setup(){
  size(512,512);
  colorMode(HSB);
  smooth();
  noStroke();
  frameRate(4);
  background(0);
  array = new Snake[1024];
  for (int i = 0; i < chain; i++){
    array[i] = new Snake(i,i);
  }
}

void draw(){
  background(0);
  fill(0);
  rect(0,0,512,512);
  fill(0,255,255);
  rect(16*growx,16*growy,16,16);
  if(dead==0){
    for (int i = chain-1; i > 1; i-=1){
      array[i].slither(array[i-1].x, array[i-1].y, i-1);
      if(array[i-1].x%(32)==growx&& array[i-1].y%(32)==growy){
        growth();
      }
    }
    for (int i = chain-1; i > 1; i-=1){
      for (int j = i-1; j > 1; j-=1){
        collide(array[i].x, array[i].y, array[j].x, array[j].y);
      }
    }
  }
  else{
    text("YOU DIED!",256,256);
  }
}

void keyPressed() {
  if(dead == 0){
    if (key == CODED) {
      if (keyCode == LEFT&&dir!=1) {
        dir = 3;
        for (int i = chain-1; i > 1; i-=1){
          array[i].slither(array[i-1].x, array[i-1].y, i-1);
        }
      }
      if (keyCode == RIGHT&&dir!=3) {
        dir = 1;
        for (int i = chain-1; i > 1; i-=1){
          array[i].slither(array[i-1].x, array[i-1].y, i-1);
        }
      }
      if (keyCode == UP&&dir!=-1) {
        dir = -3;
        for (int i = chain-1; i > 1; i-=1){
          array[i].slither(array[i-1].x, array[i-1].y, i-1);
        }
      }
      if (keyCode == DOWN&&dir!=-3) {
        dir = -1;
        for (int i = chain-1; i > 1; i-=1){
          array[i].slither(array[i-1].x, array[i-1].y, i-1);
        }
      }
    }
    for (int i = chain-1; i > 1; i-=1){
      for (int j = i-1; j > 1; j-=1){
        collide(array[i].x, array[i].y, array[j].x, array[j].y);
      }
    }
  }
}

void growth(){
  
  array[chain] = new Snake(-1,-1);
  chain++;
  growx = int(random(32));
  growy = int(random(32));
}

void collide(int x1,int y1,int x2,int y2){
  if(x1%(32)==x2%(32)&&y1%(32)==y2%(32)){
    dead = 1;
  }
}

class Snake{
  int x;
  int y;
  
  Snake(int tempx, int tempy){
    x = tempx;
    y = tempy;
  }
  
  void slither(int prevx, int prevy, int prev){
    fill(255,256-prev*(256/chain));
    if(x<0){
      x+=32;
    }
    if(y<0){
      y+=32;
    }
    rect(16*x%(512),16*y%(512),16,16);
    
    if(prev != 1){
      x = prevx;
      y = prevy;
    }
    if(prev == 1){
      if(dir > 0 ){
        if(dir == 1 ){ x +=1;}
        else{ x-=1;}
      }
      else{
        if(dir == -1 ){ y +=1;}
        else{ y-=1;}
      }
    }
  }  
    
    

}


