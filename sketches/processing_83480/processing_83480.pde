
//Cari Hume 
//Creative Computing Fall 2012 
//Final: Michigan Presidential Votes 


PFont f;
int circle_x;
int circle_y;
int circle_diameter = 100;
boolean overCircle = false;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  background(255);
  ellipseMode(RADIUS);
  noStroke();  
  fill(224, 26, 39);  
  ellipse(200, 200, 100, 100);  
  fill(68, 156, 202);
  float degree = map(54.3, 0, 100, 0, 360);
  arc(200, 200, 100, 100, radians(0), radians(degree));

  ellipseMode(CENTER);  
  fill(255);  
  ellipse(200, 200, 100, 100);

  textAlign(CENTER, TOP);
  fill(68, 156, 202);
  textSize(16);
  text("MICHIGAN PRESIDENTIAL VOTERS DATA", 200, 6); 

  if (mouseX >80 && mouseX < 280 && mouseY > 80 && mouseY <280) {


    color underMouse = get(mouseX, mouseY); //get the color of the pixel where the mouse is
    //get() is a function that gives you a color that is stored for later use. 

    if ((red(underMouse) == 68) && (green(underMouse) == 156) && (blue(underMouse) == 202)) {
      fill(68, 156, 202);
      textSize(12);
      text("Obama: 54.3%", 50, 250);
    }



    if ((red(underMouse) == 224) && (green(underMouse) == 26) && (blue(underMouse) == 39)) {
      fill(224, 26, 39); 
      textSize(12); 
      text("Romney: 44.8%", 310, 100);
    }
  }
  
  if (overCircle) {
  
    fill(68, 156, 202);
    textSize(55);
    textAlign(CENTER);
    text("I KNOW WHO", 200, 170);
    fill(224, 26, 39);
    textSize(47);
    text("YOU VOTED FOR", 200, 240);
    fill(224, 26, 39);
    textSize(70);
    text("!!!!!", 200, 300);
    fill(68, 156, 202);
    textSize(70);
    text("!!!!!", 200, 360);
  }
}

void mousePressed() {
  if ( dist(200, 200, mouseX, mouseY) < circle_diameter ) {
    //if the distance from the mouse to the center of the circle < [is less than] the radius [half diameter] of that circle
    //then the mouse is inside of the circle so
    overCircle = true; //change overCircle to true. We can use overCircle in other parts of the sketch to do cool stuff
  }else {
    //the distance from the center of the circle to the mouse is more than the radius of the circle
    //so the mouse is outside of the circle
    overCircle=false;
  }
}
