
void setup(){
  size(800,600);
  noStroke();
  smooth();
  frameRate(10);
}
float x;
float y;
void draw(){
  background(0);
x= float(mouseX)/5;
y= float(mouseY);
  for(int i=0; i<120; i+=5){
    for(int j=0; j<100; j+=5){
    ellipse(i*8, j*8, x,random(0,100));
    }
 }
 stroke(0,0,255);
 line(pmouseX, pmouseY, mouseX, mouseY);
}

