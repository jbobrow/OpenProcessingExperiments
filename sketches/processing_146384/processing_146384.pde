
color brush;
int weight = 1;
int bsize = 1;
PImage colors;

 
void setup(){
  size(800,650);
  background(255);
  smooth();

  colors = requestImage("Palette.PNG");

}
 
void draw(){
 
float size = 50;
image(colors,100,600,600,50);
  if(mousePressed == true){
    if (mouseButton == LEFT){
    stroke(0);
      fill(brush);
    ellipse(mouseX, mouseY, (30 * bsize/4), (30 * bsize/4));
  }
}
    
  
// color selection //
if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {brush = get(mouseX,mouseY);}
    
    if (mouseButton == CENTER)
    {}
  }
  if(keyPressed){
// Erase //
      if (key == '0') {
        background(255);
      }

// INVERT //
      if (key == '1') {
        filter(INVERT);
      }
// Erode //
      if (key == '2') {
        filter(ERODE);
      }
// Dilate //
      if (key == '3') {
        filter(DILATE);
      }
// Blur //
      if (key == '4') {
        filter(BLUR, 1);
      }
// POSTERIZE //
      if (key == '5') {
        filter(POSTERIZE, 3);
      }
// Randomize Color //
     if (key == '~') {
       noStroke();
       fill(random(255),random(255),random(255));
       ellipse(mouseX, mouseY, (30 * bsize/4), (30 * bsize/4));
      }
// Circle No Stroke Brush //      
      if (key == '6') {
       noStroke();
      fill(brush);
      ellipse(mouseX, mouseY, (30 * bsize/4), (30 * bsize/4));
      }
// Square Brush // 
    if (key == '7'){
      stroke(0);
      fill(brush);
      rect(mouseX,mouseY,(20 * bsize/2), (20 * bsize/2));
      }
// Square Brush No Stroke //     
       if (key == '8') {
       noStroke();
      fill(brush);
      rect(mouseX,mouseY,(20 * bsize/2), (20 * bsize/2));
      }
 // Line Brush //     
     if (key == '9')
    {  stroke(brush);
    line(mouseX, mouseY, pmouseX, pmouseY);
    } 
  // Increase Stroke //  
      if (key == '+') {
       strokeWeight(weight++);
    }
    // Decrease Stroke //
    if (weight == 0) {
       weight = 0;}
   else if (key == '-'){
      strokeWeight(weight--);
    }
    // Change Brush Size //
   if (key == CODED){
     if (keyCode == UP)
     {
       bsize++;
     } 
    if (bsize == 0) 
    { bsize += 1;}
   else if (key == CODED){
      if(keyCode == DOWN ){
        bsize--;
      }
    } 
   } 
  }
}



