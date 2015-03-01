
PImage img; 

void setup (){
  size (640,625);
  mouseY=1;
  img= loadImage ("a1.png");
}

void draw() {
  float n1=mouseY;
  float n2=mouseY;
  float n3=mouseX;
  float n4=mouseX;
  
  tint(n1,n2,n3,n4);  
  image(img, 0, 0);
}


