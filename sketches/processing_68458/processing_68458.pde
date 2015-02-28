
int radius = 300;  //What is the difference between an int and a float?
int circle1, circle2;

float [] xPos = new float [36];  //What are these called and what do they do?
float [] yPos = new float [36];


void setup() {        //Describe what "setup" does:
  size(800,800);      //What does this do?
  smooth();           //What does this do?
  background(0);    //What does this do?
  stroke (255);
  
  //Describe what's happening here:
  for (int i = 0; i < 36; i++) {
    int deg = i * 10;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }
  
}

void draw() {      //Describe what "draw" does generally:

  //Describe what's happening here:
  translate(width/2, height/2);
  
  //Describe what's happening here:
  if (mousePressed == true) {
    fill(random(0, 255), random(0, 255), random(0, 255));
  } else {
    fill(255);
  }

  //Describe what's happening here:
  for (int i = 0; i < 36; i++) {
    circle1 = int (random(36));
    circle2 = int (random(36));
    
    line(xPos[circle1], yPos[circle1], xPos[circle2], yPos[circle2]);    
  }
  
  delay (200);

}
//Describe what this sketch does:

