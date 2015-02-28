
int r=0;
int g=0;
int b=0;
float rr = 0;
void setup(){
  size(600,600);
}

void draw(){
  fill(0,1);
  rect(0,0,width,height);
  if (mousePressed){
    rr += 0.3;
    r = (r+mouseX) % 255;
    g = (g+mouseY) % 255;
    fill(r,g,b);
    ellipse(mouseX,mouseY,10+rr,10+rr);
  }else{
    rr = 0;
  }

}


