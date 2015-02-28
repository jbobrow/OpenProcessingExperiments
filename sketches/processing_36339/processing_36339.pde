
void setup() {
  size(300, 300);
  smooth();
}

int bird=30; //integer that controls the width of the bird
int feather=0; //integer that controls color of the bird's featers
int wire=0; //integer that controls the color of the wire
int positionY=135;//integer that controls the position of the bird on the Y-axis
int poo=20; //integer that controls the position of the poo
int light=200; //controls the color of the street lamp
int x=100; //controls the blue quality of the background


void draw() {
  colorMode(RGB);
  background(0, 100, x);

  stroke(0);
  strokeWeight(4);
  line(240, 130, 240, height);//pole of the street lamp
  line(240, 130, 250, 130); //right side of base a top the pole of the street lamp
  line(240, 130, 230, 130); //left side " "
  
  noStroke();
  fill(62,209,19);
  rect(0,230,width,height);

 
  fill(light);
  noStroke();
  quad(230, 130, 220, 110, 260, 110, 250, 130); //street lamp bulb
  fill(0);
  triangle(220, 110, 260, 110, 240, 105); //treet lamp topper

  if (mouseX < 150) { //true
    x++; //then the will change the the amount of blue in the background
    light=255; // then this will change the street lamp from grey to white 
  }

  noStroke();//telephone poles
  fill(180, 165, 131);
  rect(0, 150, 20, 150); //left telephone pole
  rect(280, 150, 20, 150);  //right telephone pole

  noFill();//telephone wire
  stroke(wire);
  strokeWeight(2);
  arc(130, 160, 320, 20, 0, PI/2); //the arc starts 20 pixels down from 130 then extends 320 pixels
  arc(130, 160, 250, 20, PI/2, PI); //the arc starts 20 pixels down from 130 then extends 250 pixels

  fill(feather);
  noStroke();
  ellipseMode(CENTER);
  ellipse(100, mouseX-140, 10, 10); //the mouse-140 stops the bird from going below the wire on the X-axis
  ellipse(100, mouseX-positionY, bird, 20);//the mouse-positionY " "

  if (mousePressed) { //then...
    bird=12; //the width of the bird's body will decrease
    positionY=125;//the birds body on the X-axis will stay with the head and still stop on the wire after the mouse is released
    feather=200; // the birds feathers will turn grey
    fill(200); //the birds wings will open and fly away
    arc(100, mouseX-positionY, 30, 15, PI, TWO_PI-PI/2);//dimensions of the left wing (starts at 30 pixels below 100 & extends 15 pixels)
    arc(100, mouseX-positionY, 30, 15, TWO_PI-PI/2, TWO_PI);//dimensions of the right wing(" ")
    stroke(255);
    strokeWeight(5);
    point(100, poo+130); //while the bird flies away, the bird will poo
    poo++; //this will cause the poo descend to the bottom of the screen
  }
}


