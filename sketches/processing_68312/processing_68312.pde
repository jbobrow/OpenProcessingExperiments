
int radius = 300;  //What is the difference between an int and a float?



float [] xPos = new float [360];  //What are these called and what do they do?
float [] yPos = new float [360];


void setup() {        //Describe what "setup" does:
  size(800,800);      //What does this do?
  smooth();           //What does this do?
  background(0);    //What does this do?
  
  
  //Describe what's happening here:
  for (int i = 0; i < 360; i++) {
    int deg = i * 1;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }
  
}

void draw() {      //Describe what "draw" does generally:
int a = (int) random(0,359);
int b= (int) random(0,359);
  //Describe what's happening here:
  translate(width/2, height/2);

  
//  //Describe what's happening here:
//  if (mousePressed == true) {
//  } else {
//    fill(255);
//  }

  //Describe what's happening here:
  for (int i = 0; i < 360; i++) {
      stroke(random(0, 255), random(0, 255), random(0, 255));

    line(xPos[a], yPos[a], xPos[b], yPos[b]);
  }



}










