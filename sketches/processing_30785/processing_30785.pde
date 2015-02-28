
PImage image1;
void setup(){
  size(800,800);
  background(0);
  image1=loadImage("einstein.jpg");
  image1.resize(height,width);
  text("Click mouse and press 'e'.",300,150);
}
void draw(){
for(int i=0;i<=800;i+=10){
  ellipse(i,i,10,10);
  ellipse(i,800-i,10,10);
  ellipse(400,400,i,10);
}
  ellipse(200,200,40,40);
  fill(200,10,10);
  ellipse(600,400,40,40);
  fill(10,200,10);
  ellipse(200,600,40,40);
  fill(10,10,200);
  if(mousePressed){
    background(image1);
    if(key == 'e'){
      text("Imagination is more important than knowledge.",180,150);
      textSize(20);
    }
}
}


