
float r;
float g;
float b;

void setup(){
  size(800,600);
  
}
void draw(){
  stroke(r,g,b,100);
  strokeWeight(1);
  translate(-10,-10);
  r = int(random(256));
  g = int(random(256));
  b = int(random(256)); 
  grid();
 }
void grid(){
  for(int x=0;x<width;x+=random(0,50)){
    for(int y=0;y<height;y+=random(0,50)){
    
      line(x,y,mouseX+x,mouseY+y);
      if (mouseX>=width-100){
        mouseX*=-0.1;
      }
    if (mouseY>=height-100){
        mouseY*=-0.1;
       
    }
     if (keyPressed == true && key=='s') {
    saveFrame("yourName.png");
  }}}}
