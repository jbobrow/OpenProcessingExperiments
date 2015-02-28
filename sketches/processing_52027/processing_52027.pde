
float color1=0, color2=0, color3=0;

void setup() {
  size(501, 501);
  smooth();
}

void draw() {
  background(255);
  for (int i = 10; i < 500; i = i+20) {
  for (int j = 10; j < 500; j = j+20) {
    noFill();
    ellipse(i, j,20,20);
    color1=mouseX;
    color2=mouseY;
    if (color1>=color2){
      color3=color1-color2;
    }else{
      color3=color2-color1;
    }
    fill(color1,color2,color3);
    ellipse(i,j,8,8);
  }
  }
}
