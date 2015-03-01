
color[] water = {
  #6D79A6, #094649, #160535, #051035, #455388, #0c4594, #122052, #051035
};
color[] palette = water;
int counter = 0;

void setup() {
  size(800, 600);
  frameRate(.8);
  
}

void draw() { 
      background(#29376E);
      fill(#f4ec95);
      bezier(200, 310, 325, 300, 325, 300, 200, 290);
      bezier(400, 310, 275, 300, 275, 300, 400, 290);
 
      bezier(310, 200, 300, 325, 300, 325, 290, 200);
      bezier(310, 400, 300, 275, 300, 275, 290, 400);
 
      fill(#c9a358);
      bezier(360, 265, 290, 315, 290, 315, 340, 250);
      bezier(260, 360, 315, 275, 315, 275, 240, 350);
 
      bezier(260, 250, 315, 315, 315, 315, 240, 265);
      bezier(360, 350, 285, 285, 285, 285, 340, 360);
 
      ellipse(300, 300, 50, 50);

      while (counter < 10) {
        fill(palette[int(random(0, 6))]);
        bezier(-100, height, random(-100, 300), random(450, 600), random(400, 700), random(300, 800), width+100, height);
        int randColor = int(random(0, 6));
        fill(palette[int(random(0, 6))]);
        bezier(-100, height, random(-100, 300), random(450, 600), random(400, 700), random(300, 800), width+100, height);
        counter++;
      }   
      counter=0;
}

