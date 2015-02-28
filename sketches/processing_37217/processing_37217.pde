
int x=0;

void setup(){
 size(400,400);

}

void draw(){
  background(255,255,255);
  noStroke();
  if(x == 1){
  fill(180);
  }else fill(0);
  ellipse(200,200,mouseX,mouseY);

}

void keyPressed(){
  if(key == 'a'){
  x=1;
  }
  if(key=='b'){
    x=0;
  }
}


