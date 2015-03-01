
void setup(){
size(600,600);
colorMode(HSB);
}
void draw(){
for(int i=500;i>0;i=i-20){
  println(i);
  ellipse(300,300,i,i);
  stroke((i/2)+(mouseX/3),255,255);void draw() {
fill(120,100,150,70);
  ellipse(mouseX, mouseY,50,50);
  ellipse(mouseY, mouseX,100, 100);
  ellipse(height-mouseY, width-mouseX,100, 100);
  ellipse(width-mouseX,height-mouseY,50, 50);
  ellipse(height-mouseY, mouseX,100, 100);
  ellipse(mouseX,height-mouseY,50, 50);
  ellipse(mouseY, width-mouseX,100,100);
  ellipse(width-mouseX,mouseY,50,50);  
}
}
