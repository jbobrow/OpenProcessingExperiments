
int numCircles = 100; //100 slot array for circleX and circleY
int[]circleX = new int[numCircles];
int[]circleY = new int[numCircles];

int[]mirrorX = new int[numCircles];

int diam = 50;
int time = 0;

boolean mode = true;

void setup() {
  size(1000, 700);
  smooth();
  frameRate(20);
  for (int i=0; i < numCircles; i++) { //all slot values start at 0 when sketch initiates
    circleX[i]=0;
    circleY[i]=0;
  }
   background(random(20, 150), random(45, 60), 255); //inital background color is a random 
   //shade of pink or blue or purple
}

void draw() {

  for (int i = 0; i < numCircles-1; i++) {
    circleX[i] = circleX[i+1];
    circleY[i] = circleY[i+1];
  }

  circleX[numCircles-1]=mouseX;
  circleY[numCircles-1]=mouseY;

  for (int i = 0; i < numCircles; i++) {
    fill(map(i, 0, numCircles, 20, 150), map(i, 0, numCircles, 45, 60), map(i, 0, numCircles, 0, 255));
    noStroke();
    time = int(millis()*0.01) + 1;
    diam = int(50*(1+sin(time*PI/frameRate))); //changes diameter according to 1+sin(time*PI/frameRate)
    ellipse(circleX[i], circleY[i], diam, diam);
  }
  
  if(mode==true){
    
    for (int i = 0; i < numCircles; i++){
    mirrorX[i] = width-circleX[i];
    }
    
    for (int i = 0; i < numCircles; i++) {
    fill(map(i, 0, numCircles, 20, 150), map(i, 0, numCircles, 45, 60), map(i, 0, numCircles, 0, 255));
    noStroke();
    time = int(millis()*0.01) + 1;
    diam = int(50*(1+sin(time*PI/frameRate))); //changes diameter according to 1+sin(time*PI/frameRate)
    ellipse(mirrorX[i], circleY[i], diam, diam);
    }
  }
}

void mousePressed(){
  background(random(20, 150), random(45, 60), 255); //randomly changes background color
}


