
/////////////////////////////
import ddf.minim.*;//imports minim data
Minim minim;
AudioSample laugh;
////////////////////////////
int y=20;//creates y variable
/////////////////////////////////////
PImage img1; //creates variable 1
PImage img2; //creates variable 2
PImage img3; //creates variable 3
PImage img4; //creates variable 4
PImage img5; //creates variable 5
PImage img6; //creates variable 6
PImage img7; //creates variable 7
PFont x; //creates variable x
/////////////////////////////////
void setup() {
  size(800, 600);//sets size of page

////////////////////start with minim with all sound based stuff
minim = new Minim(this);
/////////////////loads sellected sound in data folder with 2048 sample buffer
laugh = minim.loadSample("74261__timbre__tc630-psychotic-laugh-stereotypical-madness-effect.wav", 2048);

////////////////////////loading images
img1 = loadImage("1.png"); //loads image
img2 = loadImage("2.png"); //loads image
img3 = loadImage("3.png"); //loads image
img4 = loadImage("4.png"); //loads image
img5 = loadImage("5.png"); //loads image
img6 = loadImage("6.png"); // loads image
img7 = loadImage("7.png"); // loads image
}
/////////////////////////

void draw(){ 
background(50, 255, 255);//background colour

/////////////////////image size and locaation
image(img7,0,0,800,600); //image positioned and resized
image(img1, 0, 10, 400, 300);  //image positioned and resized 
image(img2, 200, 180, 200, 300); //image positioned and resized 
image(img3, 100, 400, 220, 300); //image positioned and resized 
image(img4, 300, 69, 390, 300); //image positioned and resized 
image(img5, 430, 360, 320, 300); //image positioned and resized
image(img6,500,25,400,300); //image positioned and resized

/////////////text
fill(255);
x = loadFont("ArialNarrow-48.vlw");
textFont(x);//selects font
 textSize(48);
  text("happy face is crazy",y,430);
  y=y+1;//y is y plus 1 so the text will move to the right without stoping
if (y>600){//if y is more than 600(edge of screen) text returns to start
y = -75;
}

   //////////////////face
  fill(255);//eye colour
  fill(45,252,124);
  ellipse(400,200,300,340);//main shape
  fill(255);
  line(350,319,450,319);
  arc(400,320,100,50,radians(0),radians(180));//mouth
  rect(390,250,20,50);//nose 
  
  
  ////////////////eyes
  fill(255);
  ellipse(320, 225, 80, 80); //left eye
  ellipse(480, 225, 80, 80); //right eye
  
  fill(0);
  float pupilX = map(mouseX, 0, width, 313, 333);
  float pupilY = map(mouseY, 0, height, 215, 240);
  float pupilA = map(mouseX, 0, width, 470, 490);
  ellipse(pupilX, pupilY, 20, 20); //left pupil
  ellipse(pupilA, pupilY, 20, 20); //right pupil
}
//////////////////////////////////////////////
void mousePressed ()//when mouse press sound plays
{
laugh.trigger();
}

void stop()
{
// always close Minim audio classes when you are done with them
laugh.close();
minim.stop();
super.stop();
}
//////////////////////////////

