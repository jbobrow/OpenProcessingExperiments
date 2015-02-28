
float bSize = 40;
float margin = 120;
float depth = 600;

void setup() {
  size(600, 350, P3D);
  noStroke();
}

void draw() {
  background(color(abs(65),abs(25),abs(0)));
  
  translate(width/2, height/2, -550);
  rotateX(frameCount*0);
  rotateY(frameCount * 0.03);
  buildGrid();
  
}
color colorFill;
void buildGrid() {
  
  for (float i =- depth/2+margin; i <= depth/2-margin; i += bSize){
    pushMatrix();
    for (float j =- height+margin; j <= height-margin; j += bSize){
      pushMatrix();
      for (float k =- width+margin; k <= width-margin; k += bSize){
        pushMatrix();
        translate(k,j,j);
        fill(color(abs(random(255)), abs(j+100), abs(0), 100));
        box(bSize*.5, bSize-200, bSize*.5);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
}

