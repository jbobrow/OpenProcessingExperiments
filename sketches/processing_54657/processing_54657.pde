
//*with the help of http://www.learningprocessing.com and processing.org*
//indicating the float in its maximum distance of the screen 
float max_distance;

// we must indicate the size of the screen, smoothness, no stroke and the maximum distance of the screen for mouse interaction to begin
void setup() {
  size(400, 400); 
  smooth();
  noStroke();
  max_distance = dist(width, height,0,0);
}

void draw() 
{
//the inner background colour of the circles are white 
  background(255,255,255);
// allows integer(the whole number) i will start at -20, is less than equals to its width(test) and will update at 20. '{' will update these items 
  for(int i = -20; i <= width; i += 20) {
// allows integer x will equal (start) at -20, is less than equals to its height (test) and will update at 20. '{' will update these items 
    for(int x = -20; x <= height; x += 20) {
//the float size will equal to the distance of the horizontal and vertical coordinate of the mouse and its variables that have been listen above
      float size = dist(mouseX,mouseY, i, x);
//the size will equal to the size of the maximum distance of the circles on screen
      size = size/max_distance * 120;
//calculating the formula for the circles, the variables and their size      
      ellipse(i, x, size, size);
// the outside fill colour gradient for the variables       
         fill(15,x,i,113);
 }
 

    }
  }

