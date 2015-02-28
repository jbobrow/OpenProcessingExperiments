
//Michael Kinard
//rectangles of similar color

void setup() {
  size(400, 400);
  noStroke();
}


int f = 500; //number of rectangles

void draw() {
  
  background(255);
  for(int i = 0; i < f; i++) { // creates a loop of rectangles number "f"
  rndfill();
  float rectsize = random(110); //defines the size of the rectangles up to 110
  rect(random(0, width), random(0, height), rectsize, rectsize); // placement and size of rectangle

}
noLoop(); //stops the loop with the "for" statement is activated. 
}





void rndfill() { //this is the "fill" function


  int rectsize = floor(random(110)); //color is dependent on the rectangles size

  if (rectsize > 55) { //the inequality statements define the colors based on the size.
    fill(random(10, 51), random(58, 160), random(75, 175));
  }
  if (rectsize <= 55) {
    fill(random(51, 208), random(166, 230), random(55, 170));
  }
}


