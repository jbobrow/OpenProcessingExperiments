
/* name : AYINUERGULI KADEER
 Email: akadir@sfu.ca
 
 This clock is gradually change color by second, it have fruit by minute. 
 
 PS:I want to grass graw by second and sun move by minutes
 I almost can it, and I still working on this, I think I just need more time and help
 I will upload my revised code soon. Thank you*/




PFont font; //  declare a font class
PImage tree1; // declare a datatype for storing images.
PImage tree2;
PImage grass;
PImage apple;

float mappedS; // declare variable for fading
float myVal=0; // declare a variable to move grass
float cloudV=0; // declare variable to move sun

// declare variables for time
int s;
int m;
int h;


void setup() {   // initialize program
  size (600, 480); // set canvas size
  smooth();
  font = loadFont("Jelly.vlw"); // loads Jelly font
  tree1 = loadImage("tree1.png"); // Loads tree1.png image into tree1 variable
  tree2 = loadImage("tree2.png");//Loads tree2.png image into tree2 variable
  grass = loadImage("grass.png");//Loads grass.png image into grass variable
  apple= loadImage("apple.png");// Loads apple.png image into apple variable, this is actually sun,
  
}

void draw()
{


//Sets the fill value for displaying images. 
//Images can be made transparentby including an alpha value.

  tint(255, 255); // no transparent at the bigining
  image (tree1, 0, 0);// display tree1 image with full color

  s=second(); // s have value from current second
  m=minute(); // m have value from current minute
  h=hour()%24; // h have value from current hour

  float mappedS = map(s, 60, 0, 255, 0); //Re maps number by every second and make alpha chanel.
tint (255, mappedS);// transparent image by alpha value
  image (tree2, 0, 0); // display tree2 image through the alpha chanel

 // this condition make grass graw at the begining
  if (myVal>-100) // condition that if myVal bigger than 100
    myVal=myVal-0.2;// myVal is changing by myVal-0.2
  image(grass, 0, myVal);// reposition grass image

//this condition make sun move at the biging
  if (cloudV<=600)
    cloudV=cloudV+0.2;
  image(apple, cloudV, -150);

  textFont(font);// Sets the current font that will be drawn with the text() function
  fill(250, 50, 50); // fill orange yellow
  text((h + ":" + m + ":" + s), 445, 440);// display current time by text
} // close program

/* I learned a lot by this project, I beenlearning processing for three weeks, 
extremly confused at the bigining, then by time I learned more. to be honest,
I made three clock. first one I does not like it, second one looks "traditional".
I finally made this one. I know this is not as fancy as other students.
but I really learning with my utmost energy.
coz of the time due I upload it. but I will not give up, try to make
it more perfect, upload soon. hope you consider our enthusiasm 
when grading, thank you*/





