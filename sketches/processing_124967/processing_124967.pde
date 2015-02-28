
import ddf.minim.*;

Minim minim;
AudioPlayer soundtrack;

// colours patterns
color[] blues = {#518BD1, #6338E8, #8AE8E1, #1ADEC3, #835ADE};
color[] reds = {#DE624E, #D65322, #E7E8E1, #E83316, #DE2753};
color[] yellows = {#FFFA9F, #D6C52D, #FF8E0F, #ABE821, #DE9927};
color[][] colours = {blues, reds, yellows};
 
// picking random color pattern. Within draw() this will be used
color[] currentColours = colours[int(random(3))];
color bgColor = currentColours[int(random(0,5))];

// PImage
PImage image;
String[] files = {"Assignment-5.png", 
  "Assignment-6-partA.png", 
  "Assignment-6-partB.png",
  "Assignment-7.png",
  "project_1.png"};
int time;  // a counter for time triggering events
int wait = 5000;
float imageWidth, imageHeight;

void setup() {
  size(800, 600);
  time = millis();//store the current time
  minim = new Minim(this);
  soundtrack = minim.loadFile("assignment_11.mp3");
  soundtrack.play();
  soundtrack.loop();  
  background(#131313);
  //noLoop();
}

void draw(){

  stroke(currentColours[int(random(0,5))], 4);
  strokeWeight(2);
  for(int i = 0; i < soundtrack.bufferSize() - 1; i++)
  {
    line(i, 200 + soundtrack.left.get(i)*850, i+1, 200 + soundtrack.left.get(i+1)*850);
    line(i, 400 + soundtrack.right.get(i)*850, i+1, 400 + soundtrack.right.get(i+1)*850);
  }
  
  
  fill(#2C2C2C);
  noStroke();
  rect(-1, -1, width+2, 40);
  rect(-1, height-19, width+2, 20);
  fill(#B9B9B9);
  textSize(17);
  textAlign(CENTER, CENTER);
  text("click and move the mouse around, type to pop the letters, DELETE restart and ENTER saves", 400, 20);
  
  // loop
  //check the difference between now and the previously 
  // stored time is greater than the wait interval
  if(millis() - time >= wait){
    background(bgColor);
    image = null;
    //println(time/1000);//if it is, do something
    time = millis();//also update the stored time
    image = loadImage(files[int(random(0,5))]);
    //println(image.width+" - "+image.height+" - "+ imageWidth);
    image(image, (800-image.width)/2, 0);
    redraw();
  }

  if (time/1000>30 && time/1000<90) {
  }   
}

 
void mouseMoved()
{ 
    stroke(currentColours[int(random(0,5))], random(50,40));
    strokeWeight(int(random(21)));
    //noStroke();
    line(mouseX, mouseY,
             int(random(-width/2, width*1.2)), int(random(-height/2, height*1.2)));
     
  float circleSize = random(10,300);
  //fill(currentColours[int(random(0,5))], random(0,10));
  noFill();
  stroke(currentColours[int(random(0,5))], random(10,60));
  ellipse(mouseX, mouseY, circleSize, circleSize);
}
 
void mousePressed()
{
  currentColours = colours[int(random(3))];
  bgColor = currentColours[int(random(0,5))];
  redraw();
}
 
void keyReleased()
{
  if (key == DELETE || key == BACKSPACE) {
    background(bgColor);
  }
  else if (key == ENTER) {
    saveFrame("screenshot.png");
  }
  else {
    fill(currentColours[int(random(0,5))], random(90,100));
    textSize(int(random(100, 200)));
    textAlign(CENTER, CENTER);
    text(key, int(random(width)), int(random(height))); 
  }
}

