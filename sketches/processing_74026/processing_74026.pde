
void setup(){

size(500,500);
frameRate(4);
background(#FCFF58);
//noStroke();
}

int x;

void draw(){  
for(int x=25;x<=495;x+=40){
for(int y=25;y<=495;y+=40){
  float r=random(20);
  ellipse(x+r,y+r,15,15);
  if(random (100)<=15){
    fill(#FF0000);
  }else{
    fill(#FFFFFF);
  }
  }
}
}
