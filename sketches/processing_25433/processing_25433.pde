
//pendulum

//variables
int pendX = 0;
int pendY = mouseY;
float easing = 0.2;

float angle = 0.6; //base angle value
float angleX;
float angleSpeed;

PFont perpetua;



void setup () {
  size (500, 500);
  smooth ();

  //font setup
  perpetua = loadFont ("Perpetua-30.vlw");
  textFont (perpetua);
}



void draw () {

//  println(pendX + " " + pendY);

  //let mouse y-value determine length of string
  pendY += (mouseY-pendY)*easing;
  
  background(200);
  translate (width/2, 0);

  text ("I'm a pendulum.", -80, height*3/4);

  //calculate modified angle based on speed of pendulum
  angleSpeed = angle*cos(angleX);

  //rotate by modified angle
  rotate(angleSpeed);

  //draw string
  stroke (1);
  line (0, 0, pendX, pendY);

  //draw pendulum
  noStroke ();
  ellipse (pendX, pendY, 50, 50);

  //increment based on length of string
  angleX += map(pendY, 0, height, 0.1, 0.02);
}


