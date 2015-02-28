
void setup(){
size(1000,500);
}

void draw(){
background(255);
shape();
}

void shape(){
  for(int y=20;y<height;y+=50){
    for(int x=20;x<width;x+=50){
    float r =22;
    noStroke();
    smooth();
    fill(abs(mouseX-x),abs(mouseY-y),random(255));
ellipse(x,y,random(r),random(r));
  }
}
}
