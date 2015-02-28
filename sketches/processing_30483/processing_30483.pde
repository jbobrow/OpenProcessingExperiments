
int x;
int y;

void setup(){
  x = 200;
  y = 200;
  size(400,400);
  background(255);
}

void draw(){
  rect(x,y,10,10);
  if(keyPressed){
    if(key == 'w'||key == 'W'){
      y -= 1;
    }
    if(key == 'a'||key == 'A'){
      x -= 1;
    }
    if(key == 's'||key == 'S'){
      y += 1;
    }
    if(key == 'd'||key == 'D'){
      x += 1;
    }
  }
}
    

