

int mouseStartX;
int mouseStartY;
int width = 280;
int height = 600;
PImage clearImage;
PImage axisImage;
PImage fadeImage;
PImage simpleBrushImage;
PImage mathematicDrawImage;
boolean isSimpleBrush = false;

void setup()
{
  size(width + 40, height );
  clearImage = loadImage("./data/Sketch-Book-icon.png");
  axisImage = loadImage("Triangle-icon.png");
  fadeImage = loadImage("Pixel-Art-icon.png");
  simpleBrushImage = loadImage("Brush-icon.png");
  mathematicDrawImage = loadImage("Vector-icon.png");
  background(0);
  rectMode(CENTER);
  drawButtons();
}

void draw()
{
  
}

void drawButtons()
{

  stroke(0);
  fill(0);
  rect(width+20, height/2, 40, height);
  stroke(255);  
  
  int place = 3;
  image(clearImage,width + 3, place);
  place += 40;
  
  image(axisImage,width + 3, place);
  place += 40;
  
  image(fadeImage, width + 3, place);
  place += 40;
  
  if(isSimpleBrush){
   image(simpleBrushImage, width + 3, place);
  }
  else
  {
    image(mathematicDrawImage, width + 3, place);
  }
  
  
}


void mouseDragged()
{
   if(mouseX > width || mouseY > height)
     return;
  
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
  
  line(pmouseX, pmouseY,mouseX, mouseY);

  if(!isSimpleBrush){
 
    PVector currentPosition = new PVector(mouseX,mouseY);
    PVector previousPosition = new PVector(pmouseX, pmouseY);
    PVector psiblingPoint = getSiblingPoint(previousPosition);
    PVector siblingPoint = getSiblingPoint(currentPosition);
  
    line(psiblingPoint.x,psiblingPoint.y,siblingPoint.x,siblingPoint.y);
   
    strokeWeight(1);
    line(mouseX,mouseY,siblingPoint.x,siblingPoint.y);
  }

}
PVector getSiblingPoint(PVector point){
  if(point.x < width/2 && point.y < height / 2) {
    return new PVector(width - map(point.y, 0, height/2, 0, width/2),height / 2 -  map(point.x, 0, width/2, 0, height/2));
  }
  if(point.x > width/2 && point.y < height / 2) {
    return new PVector(map(point.y, 0, height/2, width/2, width),map(point.x,width/2, width, height/2, height));
  }
  if(point.x > width/2 && point.y > height / 2){
    return new PVector(width/2 - map(point.y, height/2, height, 0, width / 2), height- map(point.x, width/2, width, 0, height / 2));
  }
  if(point.x < width/2 && point.y > height / 2){

    return new PVector( map(point.y, height/2, height, 0, width / 2), map(point.x, 0, width/2, 0, height/2));
  }
  
  return point;
}

void mouseClicked()
{
  if(mouseX <= width)
    return;
    
  if(mouseY < 40)
    clear();
   
  if(mouseY > 40 && mouseY < 80){
    clear();
    drawAxis();
  }
  
  if(mouseY > 80 && mouseY < 120){
    fade(30);
  }
  if(mouseY > 120 && mouseY < 160){
    isSimpleBrush = !isSimpleBrush;
  }
  drawButtons();
}

void drawAxis(){
  strokeWeight(1);
  stroke(127);
  strokeWeight(1);
  line(0, height/2, width,  height/2);
  line(width/2, 0, width/2, height);
}

void clear(){
  background(0);
  
}
void mouseReleased()
{
  if(mouseX <= width)  {
    fade(20);
  }
  
        
}
void fade(float alpha){
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
}



