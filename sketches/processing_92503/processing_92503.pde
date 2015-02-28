
void setup() {  //setup function called initially, only once
  size(300, 300);
  smooth();
  strokeWeight(8);
  colorMode(HSB,360,100,100);

}

void draw() {
  frameRate(12);
  line(mouseX,mouseY,pmouseX,pmouseY);
  //float normX= mouseY/100;
  //background(0);
  //fill(20,100,100,200);
  //ellipse(mouseX, 16, 33, 33);
  //ellipse(mouseX,50, pow(normX,4)*width, pow(normX,4)*width);
  //ellipse(mouseX,84, pow(normX,8)*width, pow(normX,8)*width);
  //println(normX + " " + pow(normX,4)*width);
}
