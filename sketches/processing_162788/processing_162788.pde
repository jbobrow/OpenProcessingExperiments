



void setup(){
  size(800,600);
//  for(int i=0; i<width; i += 105){
//    int j = (int)random(-200,100);
//    rect(5 + i, 300+j, 100, 300-j);
//  }
}

void draw(){
  if(mousePressed){
    building(mouseX, mouseY);
  }
}

void window(int x, int y){
  rectMode(CENTER);
  rect(x, y, 40, 40);
  line(x-20, y, x+20, y);
  line(x, y-20, x, y+20);
}

void building(int x, int y){
  rectMode(CORNER);
  rect(x, y, 120, height-y);
  while(y < height-60){
    window(x+30, y+40);
    window(x+90, y+40);
    y+= 60;
  }
}


