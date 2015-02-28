
int x=120;
int y=60;
int radio=80;

void setup(){
  size(240,120);
}

void draw(){
  background(200);
  noStroke();
  if(dist(mouseX,mouseY,x,y)<radio/2){
    fill(0);
  }else{fill(255);}
    
  ellipse(x,y,radio,radio);

}
