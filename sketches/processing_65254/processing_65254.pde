
void setup(){
size(500,500);
}

void draw(){
background(255);
shape();
}

void shape(){
  for(int y=20;y<height;y+=50){
    for(int x=20;x<width;x+=50){
    float r= random(30);
    noStroke();
    smooth();
    fill(0);
ellipse(x,y,r,r);
  }
}
}
