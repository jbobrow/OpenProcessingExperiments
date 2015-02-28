
int x=250, y=250;
int a;
int b;
int k;
PImage c;
void setup(){
  size(500,500);
  c = loadImage("Image.jpg");
  background(10,50,150);
 
}
void draw(){
  image(c,a,b,20,20);
}

void mousePressed(){
    a=x+(int)random(-35,35);
    b=y+(int)random(-35,35);
    if(a<0 & a>200 & b<0 & b>200){
  }
  else{
    stroke(0,255,255);
    strokeWeight(3);
    line(x, y, a, b);
    x = a;
    y = b;
  }
}


