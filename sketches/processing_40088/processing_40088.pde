
PImage picture;

int num = 10;// how many cirlces

//Set up the array 
float [] y = new float [num];

void setup() { //load picture
  size(300, 300);
  picture = loadImage("color.jpg");

  // seed the arrays 
  for (int k=0; k < y.length; k++) {
    y[k] = random(height);
  }
}
void draw() {
  background(225);

  if (mousePressed) { //run cirlces that move from top to bottom

    for (int k=0; k< num; k++) {  //run array 

      int w = int(random(0, picture.width));    //take random coordinates
      int h = int(random(0, picture.height)); 
      color newcolor = picture.get(w, h); // use coordinates for new color
      fill(newcolor);
      noStroke();
      ellipseMode(CENTER);
      ellipse ((width/y.length) * k, y[k], 60, 60);
      y[k] = y[k]+1.5;
      if (y[k] > height) y[k] = 0;
    }
  }
else {
  background (0);
  for (int k=0; k< num; k++) {  //run array 
    int w = int(random(0, picture.width));    
    int h = int(random(0, picture.height)); 
    color myColor = picture.get(w, h);
    fill(myColor);
    noStroke();
    rect((width/y.length) * k, y[k], 60, 60);

    y[k] = y[k]+1.5;
    if (y[k] > height) y[k] = 0;
  }
}
  }// note- circle array code is modified from previous assignment


