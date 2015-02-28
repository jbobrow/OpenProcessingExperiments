
//Declare variables for spiral
float radians = 0;
float z = 0;
int time;

//Declare objects of the snow class using an array
Snow[] mySnow = new Snow[200];

void setup(){
//Set canvas size to 600 by 600
size(600,600);

//Initialise objects using loop, setting x and y positions
for (int i = 0; i < 200; i++){
mySnow[i] = new Snow(random(600), random(600));
}

}
void draw(){
  
  //Reresh animation
  if (millis()>time){
  time = millis() + 10000;
  background(255);
  z=0;
  radians=0;

  }
  
  
  //Creates the angle for the spiral
  float xPos = radians * cos(z);
  float yPos = radians * sin(z);
  
  //Set no border
  noStroke();
  
  //Set colour of spiral (circles) to random
  fill(random(255), random(30), random(30));
  
  //Create the circles, with the centre being the original position
  ellipse(xPos+width/2, yPos+height/2, 30, 30);
  
  //Set colour of spiral (circles) to random
  fill(random(30), random(250), random(30));
  rect(xPos+width/2, yPos+height/2, 30, 30);
  
  //Clockwise movement, outwards of the spiral
  z-=2.5;
  radians = radians - .25;
  
  //Movement of snow, call display and move methods for each object
  for (int i = 0; i < 200; i++){
  mySnow[i].move();
  mySnow[i].display();
}
}

class Snow{
  
  //Declare variables for the snow
  float xPos;
  float yPos;
  
  //Set the positions as temp
  Snow(float temp_xPos, float temp_yPos) {
    xPos = temp_xPos;
    yPos = temp_yPos;
  }
  
void display(){
  
  //Set i to random
  float i = random(40);
  
  //With border
  stroke(0);
  
  //Set snow's colour
  fill(255,0,0,10);
  
  //Create snow with equal dimensions 
  ellipse(xPos,yPos,i,i);

}

void move(){
 
   //Alter coords of positions
   xPos = xPos + 30;
   yPos += 2 * 3; 
  
  //If snow reaches right hand side of screen, go to left
  if (xPos > width) {
  xPos = 0;
  }
  
  //If snow reaches bottom, go to top
  if (yPos > height) {
    yPos = 0;
  
}
}


 
}





