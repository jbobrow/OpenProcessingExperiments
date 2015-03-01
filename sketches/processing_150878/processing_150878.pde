
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hyebin PARK
// ID: 201420081
import ddf.minim.*;

Minim minim;
AudioPlayer song;
//AudioRecorder recorder;

boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

float xoff;
float d;

void setup() {
  size(1280, 720);
 // size(displayWidth, displayHeight);
  smooth();
  background(255);
  minim = new Minim (this);
  song = minim.loadFile ("Discount_Fireworks_-_01_-_Flourish_1.mp3");
  song.play();
  //recorder = minim.createRecorder(song, "aaa.wav", true);
}

void draw() {
  saveFrame("frames/######.jpg");
  if (backGround) background(#eeeeee);
  if (!backGround) background(0);
   if (switchStroke) stroke(0);
  if (!switchStroke) stroke(255);

  float dia = song.mix.level() * 300;
  d = d*0.8 + dia*0.9;

  xoff = xoff +0.005;
  float nx = noise(xoff)*40;

  for (int i=50; i<=width; i+=50) {         
    strokeCap(SQUARE);
    strokeWeight(5);  

    line(0, i-50, width, i-50);
  }

  for (int x = 200; x<=width; x+=100) {
    for (int y =200; y<=height; y+=100) {
      fill(0);  
      ellipseMode(CENTER);
      ellipse(x-100+nx*4, y-100+nx*3, d/4, d/4);
    
    }
  }
  
  for (int x = 200; x<=width; x+=100) {
    for (int y =200; y<=height; y+=100) {
      fill(255);
      ellipse(x-100-nx*4, y-100-nx*3, d/3, d/3);
   
    }
  }

  for (int i=50; i<=width; i+=50) {         
    strokeCap(SQUARE);
    strokeWeight(5);  
    line(0, i-50, width, i-50);
  }


  title();
}
//--------------------------------------------------------------
void title() {
  fill(127);
  textAlign(RIGHT);
  text("PARK HYEBIN, Untitled, SOS-Design Dynamic media, 2014", width-50, height-20);
  textAlign(LEFT);
  text("TAB background", 50, height-20);
}
//--------------------------------------------------------------
void keyPressed() {
if (key=='s') saveFrame("Images/####.jpg");



  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

  if (keyCode=='1') switchStroke = !switchStroke;

  /* 
   // Variable xPos and yPos in the code above required.
   if (keyCode==UP) yPos += 0.1;
   if (keyCode==DOWN) yPos -= 0.1;
   if (keyCode==LEFT) xPos += 0.1;
   if (keyCode==RIGHT) xPos -= 0.1;
   */
  if (keyCode==TAB) backGround = !backGround;
}
