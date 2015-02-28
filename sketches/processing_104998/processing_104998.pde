
float xPos;
float yPos;
float xSpeed;
float ySpeed;
float startSpeed = 2;

void setup () {
  size(500,400);
  background(150);
  
  //defines innitial position of ellipse
  xPos = width/2;
  yPos = height/2;
  
  strokeWeight(5);
  
  //defines the inital speed of the ellipse
  xSpeed = startSpeed;
  ySpeed = startSpeed;
}


void draw () {
  
  //adds faded background
  //creates ghosting effect
  noStroke();
  fill(150,150,150,100);
  rect(0,0,width,height);
  
  //checks if ellipse is within width and height
  //reverses speed direction on collision
  if (xPos > (width-26) || xPos < 26) {xSpeed*=-1;}
  if (yPos > (height-26) || yPos < 26) {ySpeed*=-1;}
  
  //applies speed to ellipse
  xPos+=xSpeed;
  yPos+=ySpeed;
  
  //draws ellipse 
  noFill();
  stroke(255);
  ellipse(xPos,yPos,50,50);
  
}


