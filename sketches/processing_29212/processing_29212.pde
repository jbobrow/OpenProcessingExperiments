
void setup(){
  size(400,400);
  background(255);
}

int r_x;
int r_y;

void draw(){  
  if(keyPressed){
    if(key == 'w'){
      r_y--;
    }
    if(key == 'z'){
      r_y++;
    }
    if(key == 'a'){
      r_x--;
    }
    if(key == 's'){
      r_x++;
    }
  }
  stroke(0,200,255);
  fill(255);
  ellipse(r_x,r_y,30,30);
}

