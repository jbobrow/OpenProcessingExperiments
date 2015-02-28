
void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw(){
}

void mousePressed() {
  float l = floor(random(20,35));          //random horizontal spacing for each gridded piece
  for (float i = l; i<=width; i+=l) {      //setting up the gridded horizontal division
    float k = floor(random(20,35));        //random vertical spacing device for each gridded piece
    for (float j = k; j<=height; j+=k) {   //setting up the gridded vertical division
      if (random(0,100) > 80) {            //determining a probability for how many to draw from the grid (only draws within 10 percent of available opportunities)
        fill(0,255,90,10);                 //creating the green color for the ellipses to be drawn
        stroke(0,255,90,75);               //the transparency that overlaps within the ellipses
        trees(i, j, 10);                   //calls upon the function set for drawing ellipses
      }
    }
  }
}

void keyPressed(){
  if (key == 'c' || key == 'C'){
    background(0);
  }
}

