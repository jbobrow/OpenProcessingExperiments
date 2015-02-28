
void setup() {
  size(400, 400);
  colorMode(RGB, 100,200,250);
  background(0);
}
 
void draw() { //SETS UP THE GRID FOR RECTANGLES
  for (int x = 50; x<= width-50; x +=30) {
    for (int y = 50; y<= width-50; y +=30) {
      rectangles (x,y);
    }
  }
   
noLoop();
}

void rectangles (float x, float y) { //CREATES GRID OF RECTANGLES
  pushMatrix();
  translate (0,0); //STARTS GRID HERE
  fill(0, random(250), random(250), random(250)); //SETS THE FILL OF THE RECTANGLES TO A RANDOM OPACITY, AND RANGE IN THE 250S
  strokeWeight(1);
  rect (x,y,25,5); //RECTANGLES WILL FOLLOW LOOP WITH SIZE OF HEIGHT 5, WIDTH 25, MAKING BARS
  popMatrix();
}
    


