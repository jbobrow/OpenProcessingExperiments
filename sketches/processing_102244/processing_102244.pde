
/**
A simple app that randomly generates coloured circles.

Click and drag to change the carnival music. 
When you let go the circles will try to get where you've been before everything fades away.
*/

// STILL TO DO
// If mousePressed() while sting is playing fade it out quickly
// JAVASCRIPT??

Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;

float pVar = 1;         //position variation (range of random movement)
float d;                //diameter
float dVar = 0.25;      //diameter variance - random() multiplier
float x;                //x coordinate for drawing circles
float y;                //y coordinate for drawing circles
float easing = 0.005;   //when mouseClicked ease towards cursor
float xClick;           //holds mouseX value when mouseReleased()
float yClick;           //holds mouseY value when mouseReleased()
float easeTime = 0;     //time that easing effects draw position (default val)
float p1v;              //player1 volume set by mouseX
float p2v;              //player2 volume set by mouseX
boolean fade = false;   //trigger to fade everything when mouseReleased()
float fadeTime = 0.0025;//audioPlayer.volume fade time
float alphaFade;        //allows fading previously drawn circles
                        //default starting value is in mousePressed()
float reduceB;          //factor by which brightness is scaled
float brightness;       //allows scaling brightness to 0 to fade out new circles


void setup()
{
  size(480, 240);  //ADJUST LARGER FOR FINAL VERSION (OR WIDTH/HEIGHT FOR MOBILE)
  background(0);
  smooth();
  colorMode(HSB, 360, 360, 360);

  //start in the centre
  x = width/2;    
  y = height/2;
  
  //set diameter of the circles based on the screen size
  if(height > width)
  {
    d = width/5;
  } else
  { 
    d = height/5;
  }
  
  maxim = new Maxim(this);
  player1 = maxim.loadFile("Trumpet.wav");
  player2 = maxim.loadFile("Band.wav");
  player3 = maxim.loadFile("ringSting.wav");
  player3.setLooping(false);
  player3.volume(0.5);
}

void draw()
{
  // draw random coloured circles
  // circle brightness is reduced (using constrain) when fade == true by using reduceB val
  noFill();
  strokeWeight(random(0.15, 5)); // my preference for stroke range (arbitrary)
  brightness = constrain(random(50, 360), 50 - reduceB, 360 - reduceB);
  stroke(random(0, 360), random(10, 360), brightness);
  
  // vary the centre point of new circles
  x += random(-pVar, pVar);
  y += random(-pVar, pVar);
  // keep the centre point within the drawing area
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
  // vary the diameter of new circles
  d += d * random(-dVar, dVar);
  d = constrain(d, 10, height/2.0);
  
  // moves the centre point for new circles closer & closer to 
  // the mouse position stored when mouseReleased()
  if (easeTime != 0 && fade)
  {
    x += (xClick - x) * easing;
    y += (yClick - y) * easing;
    easeTime -= 1;
  } 
  
  ellipse(x, y, d, d);
  
//  println(fade); //TEST - REMOVE FOR FINAL
//  println(alphaFade); //TEST - REMOVE FOR FINAL
  
  //When fade == true
  //1. fade in a black rectangle the size of the draw area to fade out the previous drawing
  //2. continuously reduce the brightness of any new circles until they are black (invisible)
  //3. fade out audio playe1 & player2 
  if (fade)
  {
    alphaFade += 0.05;
    noStroke();
    fill(0, alphaFade);
    rect(0.0, 0.0, width, height);
    
    reduceB += 1.0;
    
    p1v = constrain(p1v - fadeTime, 0, 1); //fade to 0.0
    p2v = constrain(p2v - fadeTime, 0, 1); //fade to 0.0
    
  } else
  {
    reduceB = 0.0; //no reduction to brightness
  }
  
  player1.volume(p1v);
  player2.volume(p2v);  
}

void mousePressed()
{
  if (fade)
  { 
    fade = false;
    // assign a new start point for new circles based on mouse position
    x = mouseX;
    y = mouseY;
    
    //reset diameter of the circles to the start point
    if(height > width)
    {
      d = width/5;
    } else
    { 
      d = height/5;
    }    
  }
  
  alphaFade = 0.0; //reset so that next fade on mouseReleased() starts from 0.0
  
  audioSpeed(); // user defined function (see below)
  
  // resets player1 looping, start point and volume then plays
  player1.setLooping(true);
  player1.cue(0);
  p1v = map(mouseX, 0, width, 1.0, 0.0); //volume set by mouseX
  player1.play();
  // resets player2
  player2.setLooping(true);
  player2.cue(0);
  p2v = map(mouseX, 0, width, 0.0, 1.0); //volume set by mouseX - opposite of player1
  player2.play();
}
 
void mouseDragged()
{
  p1v = map(mouseX, 0, width, 1.0, 0.0); //volume varied by mouseX
  p2v = map(mouseX, 0, width, 0.0, 1.0); //volume varied by mouseX - opposite of player1
  
  audioSpeed();
}

void mouseReleased()
{
  //play audio to show circle movement toward cursor
  player3.cue(0);
  player3.play();
  
  // capture mouseX & mouseY values
  xClick = mouseX;
  yClick = mouseY;
  
  easeTime = 300; //5sec @ 60fps
  
  player1.setLooping(false);
  player2.setLooping(false);
  fade = true;
}

// user defined function for audio playback speed 
// splits the draw area into 3 horizontally
// middle third plays both audio files at default speed
// top third speeds up audio -from default speed at middle third to double speed at top
// bottom third slows down audio - from default speed at middle third to stopped at bottom
void audioSpeed()
{
  if (mouseY < height/3)
  {
    player1.speed(map(mouseY, 0, height/3, 2.0, 1.0));
    player2.speed(map(mouseY, 0, height/3, 2.0, 1.0));
  } else if (mouseY > height-(height/3))
  {
    player1.speed(map(mouseY, height-(height/3), height, 1.0, 0.0));
    player2.speed(map(mouseY, height-(height/3), height, 1.0, 0.0));
  } else
  {
    player1.speed(1.0);
    player2.speed(1.0);
  }
}




