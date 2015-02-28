
// This project is an imitation of the famous mini game "Flappy flight".
// I believe, this mini game is possible to make with what we saw in the course "Introduction to computational art".
// To build this game, I had to use images as a moving background (to create a quite realistic motion), different shapes to draw the bird and the tubes (the obstacles)
// I used matrix transformation to help building the obstacle. I also used arrays to permanently generate the obstacles.
// Text was used too to begin playing and to display the score.
// Last but not least, the most important thing for a game is the interaction. Player can use the mouse to make the bird gain some altitude.


//**** initializing variables ****
int[] tubesX = {
  1000, 1300, 1600, 1900 // the initial position of the four tubes (used to create continious obstacle generation) 
};
int[] tubePos = {
  0, 0, 0, 0 // the gaps positions (the origin corresponds to the upper left corner of the lower part of the obstacle
};
int pic = 1; //saved Picture number
int score = 0;
boolean playing = false;
PFont font;
PImage sky1, sky2; // I used the same image twice, added near to each other to create the continious sky background when sliding
PImage city1, city2; // the same thing with the buildings picture
float t = 0; // this variable will simulate the time (for the bird's motion)
float y0 = 200; // the initial value of the bird's altitude
float g = 0.4; // the gravity coefficient
float v0 = 0; // the initial speed value of the bird 
int skyX; //the position of the sky picture
int cityX; //the position of the buildings picture
int birdX = 100; //the constant x position of the bird  
float birdY = 200; //the initial value of the bird's altitude
int birdR = 20; //the bird radius (the bird has the shape of a circle)
int currentTube = 0; //whenever the bird passes an obstacle, this counter increment (if it reaches 4, it resets to 0, to keep track of all our four obstacles)

//**** setup block ****
void setup() {
  size(800, 600);
  background(255);
  font = createFont("Arial-Black-48", 48);
  textFont(font);
  textAlign(CENTER);
  fill(0);
  text("Click to play", width/2, height/2); //This will show the first screen before playing
  for (int i=0; i<4;i++) {
    tubePos[i] = int(random(351)+200); // create random gap position
  }
  sky1 = loadImage("sky_bkgnd.jpg"); //source : http://www.thebest3d.com/pdp/tutorials/blender/criss/01_background.jpg
  sky2 = sky1;
  city1 = loadImage("city.png"); //source : http://opengameart.org/sites/default/files/city_2.png
  city2 = city1;
  skyX = 0;
  cityX = 0;
}

//**** draw block ****
void draw() {
  if (playing) {
    image(sky1, skyX, 0); //attch the first sky "instance"
    image(sky2, skyX+sky1.width, 0); //attch the second sky "instance"
    if (cityX%3 == 0) skyX--; //make the sliding speed of the sky background the third of the city's speed
    if (skyX <= -800) skyX = 0; //if the second sky background reaches the end of the canvas, reset the position of the first instance
    image(city1, cityX, 250); //attch the first city "instance"
    image(city2, cityX+city1.width, 250); //attch the second city "instance"
    cityX--; //this will play the role of the city speed
    for (int i=0; i<4;i++) {
      tubesX[i] -= 2; //the tubes are twice as faster as the city (to make more "realistic" motion effect)
      if (tubesX[i] <= 700 && tubesX[(i+1)%4] <= -200) { // for loop is used to reset a tube position at the right of the canvas (with different gap position) whenever it disappears in the left
        tubesX[(i+1)%4] = 1000;
        tubePos[(i+1)%4] = int(random(351)+200);
      }
    }

    for (int i=0;i<4;i++) { //this draws the entire obstacle (composed of the upper and the lower tubes
      drawTube(tubesX[i], tubePos[i], false);
      drawTube(tubesX[i], tubePos[i] - 150, true);
    }
    birdY = birdY(t, v0, y0); //the birds altitudes is refreshed every frame with the call of "birdY" function
    t+=0.75; //time increments
    drawBird(birdX, birdY); //now let's draw the bird in the new positions
    if (tubesX[currentTube]+100 < birdX-birdR) { //If the bird successfully passes the obstcale, the score increments (and we have to make sure that the currentTube value is restored to 0 whenever it reaches 4)
      currentTube = (currentTube+1)%4;
      score++;
    }
    text(score, width/2, 50); //show the score in the play screen
    if (tubesX[currentTube] <= birdX+birdR && tubesX[currentTube]+100 >= birdX-birdR) { //if we are in an obstacle region
      if (birdHit(birdY, tubePos[currentTube])) { //we check if the bird touches the upper of lower bounds of the gap (so it touches a tube
        println("Hit !");
        reset(score); //we call the first screen with the score on it
      }
    }
    if (birdY-birdR<=0 || birdY+birdR>height) reset(score); //also if the bird touches the upper or lowerbounds of the canvas, game over !
  }
}


//**** drawCube function ****
void drawTube(int posX, int posY, boolean reversed) {
  fill(#00B449); //green color for the tubes
  pushMatrix();
  translate(posX, posY);
  if (reversed) { //If we stated "reversed == true", that means that we want to create the upper part of the obstacle
    rotate(radians(180));
    translate(-100, 0);
  }
  rect(0, 0, 100, 40);
  rect(10, 40, 80, 600);
  popMatrix();
}

//**** drawBird function ****
void drawBird(float posX, float posY) {
  noStroke();
  fill(#FF0000); 
  ellipse(posX, posY, int(2*birdR), int(2*birdR)); //the bird's body
  fill(255);
  ellipse(posX+8, posY-8, 8, 8); //the white of the eye
  triangle(posX-birdR-4, posY-4, posX-birdR+2, posY, posX-birdR-4, posY+4); // the tail
  fill(0);
  ellipse(posX+9, posY-7, 5, 5); //the eye's pupil
  fill(#F2DB2A);
  triangle(posX+18, posY, posX+24, posY+4, posX+18, posY+6); //the bird's beak
  fill(255);
  if (t%20 < 10) { //Just to make the wing wave every 20 frames
    quad(posX-4, posY+2, posX+4, posY+2, posX+6, posY+6, posX-6, posY+6);
  }
  else {
    quad(posX-4, posY+2, posX+4, posY+2, posX+6, posY-2, posX-6, posY-2);
  }
  stroke(0);
}

//**** birdHit function to test if the bird touches the gap upper or lower boundaries ****
boolean birdHit(float birdY, int gapY) {
  if (birdY+birdR >= gapY || birdY-birdR <= gapY-150) {
    return true;
  }
  else {
    return false;
  }
}

//**** birdY function for the bird dynamics (vertical motion) ****
float birdY(float t, float v0, float y0) {
  return 0.5*g*(t*t)+v0*t+y0;
}

//**** if we are playing, mouse clicks make the bird jump, otherwise, it starts a new game ****
void mousePressed() {
  if (playing) {
    t=0;
    y0=birdY;
    v0 = -8;
  }
  else {
    playing=true;
  }
}

//**** reset function (to restore the initial state of variables and game scene ****
void reset(int finalScore) {
  background(255);
  fill(0);
  smooth();
  text("Score : "+finalScore+ "\nClick to replay", width/2, height/2);
  for (int i=0;i<4;i++) {
    tubesX[i] = 1000+300*i;
    tubePos[i] = int(random(351)+200);
  }
  score = 0;
  playing=false;
  t=0;
  y0 = 200;
  v0 = 0;
  skyX = 0;
  cityX = 0;
  birdY = 200;
  currentTube = 0;
}

//**** keyPressed function to take some screen shots ****
void keyPressed(){
  if(key == 's' || key == 'S') {
    saveFrame("picture"+pic+".png");
    pic++;
  }
}


