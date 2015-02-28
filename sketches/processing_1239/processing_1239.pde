
float x;
float y;
void setup(){
  size(500, 500);
}
void draw(){
   
  float r = random(0, 255);
  float g = random(0, 255);
  float b =random(0, 255);

  x = random(0, 500);
  y = random(0, 500);
  
  stroke(10, 100);
//strokeWeight(5);
  frameRate(30);
  fill(--r,--g, --b, 100);
  rect(mouseX-2, mouseY-5, mouseX/2-(x/2), mouseY/3-(y/3));
  if(x-mouseX==0 || mouseX<=0)
    mouseX *= -1;
  if(y-mouseY ==0 || mouseY <=0)
    mouseY *= -1;

}


