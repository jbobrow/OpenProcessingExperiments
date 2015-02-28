
//SET VARIABLES 

int xPos[] = new int [100];
int yPos[] = new int [100];
int clicks = 0;


//SET STAGE 

void setup() {
  size(700, 700);
  background(27, 28, 29);
}

//DRAW CIRCLE TO STAGE

void draw() {
  for (int i =0; i< 100 && i < clicks; i++) {
    smooth();
    fill(255, 245, 255);
    noStroke();
    ellipse(xPos[i], yPos[i], 15, 15);

//DRAW LINE TO STAGE

    if(i > 0){
    fill(255, 255, 255);
    stroke(5);
    line(xPos[i-1], yPos[i-1], xPos[i], yPos[i]);
 
      }
   } 
}

//OBTAIN MOUSE CLICK DATA AND INSERT INTO VARIABLE 

void mouseClicked() {
  xPos[clicks] = mouseX;
  yPos [clicks] = mouseY;
  clicks++;
}


