
float a =0;
float b=0;
float c=0;
float d=0;
float e= .01;
float f= .05;

void setup(){ 
  size(700, 700);
  stroke(60, 60);
  background(52,209,255);
  frameRate(50);
  fill(255);}
  
void draw() {
  strokeWeight(10);
  a+=(mouseX-a)*e;
  b+=(mouseY-b)*e; 
  c+=(mouseX-c)*f;
  d+=(mouseY-d)*f;
  line(a, b, c, d);

}
void keyPressed() {
 
  if (key=='s') {
    saveImage();
  }
  if (key=='i') {
    filter(INVERT);
  }
}
void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0,0,width,height);
  imageSave.save(fileName);
}

