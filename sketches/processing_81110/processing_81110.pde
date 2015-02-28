
void setup(){
  size(600,600);
}
void draw(){
  float x=mouseX;
  float y=mouseY;
  float xx=600-x;
  float yy=600-y;
  noStroke();
  if (mousePressed){
  ellipse(x,y,20,20);
  ellipse(xx,yy,20,20);
  }
  if(keyPressed){
    if (key =='a'){
      fill (random(255),random(255),random(255));
    }
    if(key =='s'){
      background(random(255),random(255),random(255));
    }
    if (key =='d'){
      if (mousePressed){
      rect (x+50,y+50,20,20);
      rect (xx+50,yy+50,20,20);
      }
    }
  }
}


