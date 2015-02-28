
Bar[] bar = new Bar [50];

color shade;

void setup() {
  size(200, 200);
  colorMode(HSB, 100);
  
  for (int k=0; k < bar.length;k++) {  // initialize the object
    shade = color(int(random(100)),225,100);  // smear color
    bar[k] = new Bar(shade, random(height), k*8, random(1)); //random smears
  }
}

void draw() {
   for(int k=0; k < bar.length; k++){
  bar[k].move();  //place the functions so we can use the object
  bar[k].display();
}
}

class Bar { // 
  color c;
  float xplace;
  float yplace;
  float fast;

//define the constructor with arguments for color, x,y, and how fast it will go
  Bar (color c_, float xplace_, float yplace_, float fast_) {

    c = c_;
    xplace = xplace_;
    yplace = yplace_;
    fast = fast_;
  }
  void display () {
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(xplace, yplace, 40, 20);
  }
  void move() {
    xplace = xplace + fast;
    if (xplace > width ) {
      xplace = 0;
    }
  }
}

//adapted from CarsDemo which was adapted from D. Shiffman, Learning Processing, p. 155


