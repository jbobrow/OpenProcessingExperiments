
// constants
int Y_AXIS = 1;
int X_AXIS = 2;
float max_distance;

void setup() {
  size(620, 280);
  smooth();
  frameRate(20);
  noStroke();
  max_distance = dist(0, 0, width, height);
  rectMode(CENTER);
}

void draw() 
{
  background(0);
  // background
   
 color b1 = color(125, 2, 140);
 color b2 = color(25, 255, 200);

 //setGradient(0, 0, width, height, b1, b2, Y_AXIS);

  
  for(int i = 0; i <= width; i += 33) {
    for(int j = 0; j <= width; j += 33) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 66;
      ellipse(i, j, size, size);
    }
  }
}


void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);

  // choose axis
  if(axis == Y_AXIS){
    /*nested for loops set pixels
     in a basic table structure */
    // column
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }  
  }  
  else if(axis == X_AXIS){
    // column 
    for (int i=y; i<=(y+h); i++){
      // row
      for (int j = x; j<=(x+w); j++){
        color c = color(
        (red(c1)+(j-x)*(deltaR/h)),
        (green(c1)+(j-x)*(deltaG/h)),
        (blue(c1)+(j-x)*(deltaB/h)) 
          );
        set(j, i, c);
      }
    }  
  }
}

