
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/34257*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import ddf.minim.*; //Minim library

Minim minim; //base minim object
AudioSample snd[]; //AudioSamples are "triggered" sounds
AudioSnippet rumble; //AudioSnippets are small sound files don't need any effects
int currSnd; //simple counter

int ballCnt; //number of balls
ball b[]; //ball array

//-----------------------------------------------------------------------------------

void setup() {
  size(600,400);
  background(30,0,00);
  smooth();
  
  //setup impact sounds...
  minim = new Minim(this); //required to use Minim
  snd = new AudioSample[8]; //setup sample array
  for (int i=0; i<8; i++) snd[i] = minim.loadSample(i+".wav"); //load few samples for variety
  currSnd = 0; //initialize the counter
  
  //setup ambient sound...
  rumble = minim.loadSnippet("a.wav"); //load the ambient sound
  rumble.setGain(-5); //turn it down a bit
  rumble.loop(); //play continuously
  
  //setup bouncing balls
  ballCnt = 6;
  b = new ball[ballCnt];
  for (int i=0; i<ballCnt; i++) b[i] = new ball();
}

//-----------------------------------------------------------------------------------

void draw() {
 // background(90,00,00);
  frameRate(30);
  stroke (255,255,255,40);
  
  //rect(0, 0, height, height ); // circles in the background
  
   fill(255);
   for (int i=0; i<ballCnt; i++) b[i].check(); //check each ball
   translate(width/2,height/2);
  
    for(int i=1060; i >= 15 ; i = i/2){  // attempt to make automatic reduction
       rotate(radians(random(1,360))); // keeps it from solidifying 8 lines
        branch(i);
  }
 }

void branch(float h) {

  //h *= 0.25; //touching with no overlap
  h *= random(0.22,0.33); 
  // h *=random(0.2,0.23); // too empty
     int angle = (360/4);
      if (h > 1) {  // All recursive functions must have an exit condition!!!!
     for(int j=0; j < 2; j++){
       rotate(radians(angle+random(-7,7)));
    
      pushMatrix();    // Save the current state
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // move to end
    branch(h);       // recursive
    popMatrix();    
    }
  }




}

//-----------------------------------------------------------------------------------

void stop() {
  //close down sound stuff nicely...
  for (int i=0; i<8; i++) snd[i].close();
  minim.stop(); //...and turn off Minim.
  super.stop();
}

//-----------------------------------------------------------------------------------

class ball {
  PVector pos, spd; //position and speed
  
  ball() {
    pos = new PVector(random(width - 20) + 10, random(height - 20) + 10);  //random starting position
    spd = new PVector(0, 0); //start off stopped
  }
  
  void check() {
    fill(0,0,0);
    
    // update position
    PVector target = new PVector(mouseX, mouseY); //get the mouse position into a vector
    PVector acc = PVector.sub(target, pos); //always accelerate toward mouse
    acc.normalize(); //need a constant acceleration, so we need to normalize...
    acc.div(20); //and reduce it down some
    spd.add(acc); //acceleration is added to speed
    pos.add(spd); //speed is added to position
    
    //check boundries
    if (pos.x < 10.0) _bounceX(20 - pos.x); //left
    if (pos.y < 10) _bounceY(20 - pos.y); //top
    if (pos.x >= width - 10) _bounceX (pos.x - ((pos.x - width + 10)*2 + 1)); //right
    if (pos.y >= height - 10) _bounceY (pos.y - ((pos.y - height + 10)*2 + 1)); //bottom
    
    //draw ball
    line(pos.x, pos.y, pos.x + acc.x * 400, pos.y + acc.y * 400); //show acc as a line for facing...
    ellipse(pos.x, pos.y, 20, 20); //draw the ball...
  }
  
  void _bounceX(float newX) {
    pos.x = newX;
    spd.x *= -0.7;
    _bounce(spd.x);
  }
  
  void _bounceY(float newY) {
    pos.y = newY;
    spd.y *= -0.7;
    _bounce(spd.y);
  }
  
  void _bounce(float speed) {
    snd[currSnd].setGain(abs(speed)/10*65 - 30); //set the gain (volume) based on speed
    snd[currSnd].trigger(); //trigger the sound
    currSnd = (currSnd + 1)%4; //increment the counterso different sound is played next
    fill(255, 100, 100); //fill the ellipse with a flash of red (drawn after boundry checking)
  }
}




