
void setup(){
  size(400,400);
  smooth();
  noStroke();
}
int dragX, dragY, relX, relY;
void draw() {
  checker();
  if (mousePressed==true){
    piece1(dragX,dragY);
  }
  if (mousePressed==false){
    piece1(relX,relY);
  }
}

void checker(){
   background(0);
  for (int i=25; i<400; i=i+100){
    for (int j=25; j<400; j=j+100){
      rectMode(CENTER);
      fill(209,52,43);
      rect(i,j,50,50);
    }
  }
   for (int k=75; k<400; k=k+100){
     for (int l=75; l<400; l=l+100){
      rectMode(CENTER);
      fill(209,52,43);
      rect(k,l,50,50);
    }
  }
}

void piece1(int x, int y){
  fill(112,28,23);
  ellipse(x,y,30,30);
}

void piece2(int a, int b){
  fill(112,28,23);
  ellipse(a,b,30,30);
}

void mouseDragged(){
  dragX=mouseX;
  dragY=mouseY;
}

void mouseReleased(){
  relX=mouseX;
  relY=mouseY;
}
