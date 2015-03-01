
//when you click mouse, it become faster; when you click space, it become slower
// this is the the sounds we need to play sound
import ddf.minim.*;
Minim minim; // audio engine
AudioPlayer thesound;
float x = 100;
float y = 100;
float xspeed = 10;
float yspeed = 10;
color ballColor;

void setup() {
  size(640,480);
  background(255);
  colorMode(HSB);
  ballColor = color(34,100,250);
  minim = new Minim(this);//sound valuable 
  thesound = minim.loadFile("data/bomb.mp3");}

void draw() {
  background(255);
  //Move the ball according to its speed.
  x = x + xspeed;
  y = y + yspeed;

  //Check for bouncing.
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
        playSound(); 

  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
    ballColor = color(int(random(255)), int(random(255)), 200);
        playSound(); 

  }

  noStroke();
  fill(ballColor);
  // Display the ball at the location (x,y).
  ellipse(x,y,50,50);
}

//function to call when mouse is clicked
void mouseClicked(){
  //x = mouseX; //assign x the value of our mouseX position
  //y = mouseY; //assign y the value of our mouseY position
  if(x >= width/2){
    xspeed  = abs(xspeed/2) * -1.0; //make sure xspeed is negative
  }
  else{
    xspeed = abs(xspeed/2); //otherwise xspeed is positive
 
  }
  yspeed = abs(yspeed/2); //make sure yspeed is always positive
}
void keyPressed(){
  //x = mouseX; //assign x the value of our mouseX position
  //y = mouseY; //assign y the value of our mouseY position
  if(x >= width/2){
    xspeed  = abs(xspeed*2) * -1.0; //make sure xspeed is negative
  }
  else{
    xspeed = abs(xspeed*2); //otherwise xspeed is positive
  }
  yspeed = abs(yspeed*2); //make sure yspeed is always positive
}
void playSound()//It is the function to play sound
{
  thesound.cue(0);
  thesound.play();
}


