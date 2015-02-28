
PImage rock;//Picture of the rock.
final int nucleusSize = 120; //diameter of nucleus
final int electronSize = 20; //diameter of electrons
float offset, offsetindexed, increment; //initialization of things explained below
final color bg = color(255); //White
final color grn = color(76, 222, 11);

void setup() {
  size(500, 500);
  // Create the font
  noStroke(); // Stokes are lame
  rock = loadImage("http://www.pyramydair.com/blog/images/04-09-10-round-ball.jpg");
}

void draw() {
  background(bg);
  nucleus();
  cloud();
  greenGuy();
}

void nucleus() {
  fill(#2255FF);
  //ellipse(width/2, height/2, nucleusSize, nucleusSize); //Centered circle
  imageMode(CENTER);
  image(rock, width/2+11, height/2);
  fill(bg);
  textFont(createFont("Helvetica", 50));
  text("Cs", width/2-22, height/2); //Label
  textFont(createFont("Helvetica", 20));
  text("Caesium", width/2-28, height/2+28); //Label
  textFont(createFont("Helvetica", 10));
  fill(0);
  text("Slowed 9,192,631,770 times for clarity.", 15, height-15); //Label
}

void  cloud() { ///// This function accounts for the regular electrons. They travel noisily throgh polar space. They are like polar bears in this sense.

  offset = offset + 0.0022 ;//this increments the offset with which the noisey line is read

  for (int i=1; i< 54; i++) {//Oh Boy. This was fun to write. I want 54 electrons drawn.
    fill(flow(0, 50, 1, i+75)); //This varies the fill of each subtlely to imply depth
    //these bits cause smooth noise-based movement about the center, while staying away from thr center most of the time.
    float xx = width/2+flow(nucleusSize/4, width/2-nucleusSize/3, 1, i) *  sin(flow(0, 2*TWO_PI, 2, i+50));
    float yy =  height/2+flow(nucleusSize/4, height/2-nucleusSize/3, 1, i) *  cos(flow(0, 2*TWO_PI, 2, i+50)) ;
    ellipse(xx, yy, electronSize, electronSize);//At last, we draw the electrons. Fixed size, fancy locations
  }
}

void greenGuy() {//this is for our special second deliniating electron.
  fill(grn);//paint it green
  //these bits are much like the above, but with seconds for theta.
  float xx = width/2+flow(nucleusSize/3, width/2-nucleusSize/3, 5, 0) *  sin(flow(0.9, 1.01, 1, 1)*map(millis(), 0, 1000, 0, TWO_PI));
  float yy =  height/2+flow(nucleusSize/3, height/2-nucleusSize/3, 5, 0) *  cos(flow(0.9, 1.01, 1, 1)*map(millis(), 0, 1000, 0, TWO_PI)) ;
  ellipse(xx, yy, electronSize, electronSize);
}

float flow(  /////// Function to return noise'd values in a manner kinda like random ///////
float low, //Minimum value to return
float high, //Maxiumum value to return
float increment, // Velocity to crawl across the noise feild
int index  //This is an arbitrary ingeger which is to be applied to each discrete call to flow. It prevents things from moving together.
) {  
  offsetindexed = offset+index*PI*PI ; //This offsets the offset by an arbitrary amount so the noise calls aren't related
  noiseDetail(5);//4 is defailt. Higher is more finely grained. More sparatic.
  return map(noise(offsetindexed), .2, .6, low, high);//This scales the noise value to match its application and spits out a neatly packaged float for you. Still warm.
}


//References:
//http://www.learningprocessing.com/examples/chapter-13/example-13-5-polar-to-cartesian/

