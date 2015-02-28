
float xPos;
float yPos;
float xSpeed;
float ySpeed;
float startSpeed = 2;
int index = 0;

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
  
  //change color mode to Hue, Saturation, Brightness
  colorMode(HSB, 360, 100, 100);
}


void draw () {
  
  //cycles through Hues
  if (index<360){
    index++;
  } else {index =0;}
  
  //adds faded background
  //creates ghosting effect
  noStroke();
  fill(0,0,0,50);
  rect(0,0,width,height);
  
  //checks if ellipse is within width and height
  //reverses speed direction on collision
  if (xPos > (width+56)) {xPos = -56;}
  else if (xPos < -56) {xPos = (width+56);}
  if (yPos > (height-26) || yPos < 26) {ySpeed*=-1;}
  
  //applies speed to ellipse
  xPos+=xSpeed;
  yPos+=ySpeed;
  
  //draw glow effect
  fill(index,100,100,5);
  for(int i=0;i<10;i++){
    ellipse(xPos,yPos,50+(i*5),50+(i*5));
  }
  
  //draws ellipse 
  noStroke();
  fill(index,100,100,100);
  ellipse(xPos,yPos,50,50);
  
}

void mousePressed() {
  if (dist(mouseX,mouseY,xPos,yPos)<26) {xSpeed*=-1;}
}


