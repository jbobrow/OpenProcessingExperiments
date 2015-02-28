
int radius = 300;  //What is the difference between an int and a float?

float [] xPos = new float [360];  //What are these called and what do they do?
float [] yPos = new float [360];


void setup() {        //Describe what "setup" does:
  size(800, 800);      //What does this do?
  smooth();           //What does this do?
  background(255);    //What does this do?

  //Describe what's happening here:
  for (int i = 0; i < 360; i++) {
    int deg = i;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }
}

void draw() {      //Describe what "draw" does generally:
//  background(255);    //What does this do?

  //Describe what's happening here:
  translate(width/2, height/2);

  //Describe what's happening here:
  if (mousePressed == true) {
    stroke(random(0, 255), random(0, 255), random(0, 255));
  } 
  else {
    stroke(0);
  }

  //Describe what's happening here:
//  for (int i = 0; i < 360; i++) {
        stroke(random(0, 255), random(0, 255), random(0, 255));

//    println(xPos[i]);
    int r1 = (int)random(359);
    int r2 = (int)random(359);
    println(r1 + " " + r2);

    line(xPos[r1], yPos[r1], xPos[r2], yPos[r2]);
//  }
}

//Describe what this sketch does:


