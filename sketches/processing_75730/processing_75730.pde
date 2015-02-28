
//Move and Bounce
//by Dongzhi
int x = 30;
int y = 30;
float []bgColor = {255,255,255};

void setup() {
  size(480, 480);
  background(bgColor[0],bgColor[1],bgColor[2]);
}

void draw() {
  fill(0);
  rect(x, y, 50, 50);

  if (keyPressed) {
    if (key == 'd') {
      //Incrase the X value
      background(bgColor[0],bgColor[1],bgColor[2]);
      if(x < 430){
        x++;
      }else{
        x = 430;
        bounce();
        changeBack();
      }
      rect(x, y, 50, 50);
    }

    else if (key == 'a') {
      background(bgColor[0],bgColor[1],bgColor[2]);
      if(x > 0){
        x--;
      }else{
        x = 0;
        bounce();
        changeBack();
      }
      rect(x, y, 50, 50);
    }
    
    else if(key == 'w'){
      background(bgColor[0],bgColor[1],bgColor[2]);
      if(y > 0){
        y--;
      }else{
        y = 0;
        bounce();
        changeBack();
      }
      rect(x,y,50,50);
    }
    
    else if(key == 's'){
      background(bgColor[0],bgColor[1],bgColor[2]);
      if(y < 430){
        y++;
      }else{
        y = 430;
        bounce();
        changeBack();
      }
      rect(x,y,50,50);
    }
  }
}


void changeBack(){
   bgColor[0]= random(255);
   bgColor[1]= random(255);
   bgColor[2]= random(255);
   background(bgColor[0],bgColor[1],bgColor[2]);
}


void bounce(){
    if(x == 0){
      for(int i=0;i<10;i++){
        background(bgColor[0],bgColor[1],bgColor[2]);
        x++;
      }
    }
    else if(x == 430){
      for(int i=0;i<10;i++){
        background(bgColor[0],bgColor[1],bgColor[2]);
        x--;
      }
    }
    else if(y == 0){
      for(int i=0;i<10;i++){
        background(bgColor[0],bgColor[1],bgColor[2]);
        y++;
      }
    }
    else if(y == 430){
      for(int i=0;i<10;i++){
        background(bgColor[0],bgColor[1],bgColor[2]);
        y--;
      }
    }
}



