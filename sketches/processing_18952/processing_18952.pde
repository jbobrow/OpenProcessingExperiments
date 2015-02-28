
void setup(){
size(300,300);
frameRate(15);
smooth();
background(117);
}
int x=0;
void draw(){
  if(x <= 100){
    noStroke();
    fill(0);
    ellipse(25,25,50,50);
      x++;
  }

  if(x >= 101){
    noStroke();
    fill(x-45);
    ellipse(25,25,50,50);
    x++;
  }
  if(x >= 151){
    noStroke();
    fill(x-45);
    ellipse(x-125,x-125,50,50);
    x++;
  }
  if(x >= 301){
    background(117);
    noStroke();
    fill(255);
    ellipse(x-125,x-125,50,50);
  }
  if(x >= 302){
    noLoop();
  }
}



