
float x,y,x2,y2;
boolean hits;

void setup(){
  size(500,500);
  y2=200;
  hits=false;
}

void draw(){
  background(255);
  
  rect(x,y,40,40);
  
  if(x2<=500){
    x2++;
  } else {
    x2=0;
    y2=random(500);
  }
  
  if((x2+35)<=x && (x2+35)>=x && y2>=y && (y2+35)<=(y+40)) {
   hits=true; 
  }
  
  if (hits==false){
    rect(x2,y2,35,35);
  }
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == DOWN){
      y+=5;
    } else if (keyCode == UP) {
      y-=5;
    } else if (keyCode == LEFT) {
      x-=5;
    } else if (keyCode == RIGHT) {
      x+=5;
    }
  }
}


