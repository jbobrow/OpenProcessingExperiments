
//lava lamp; 

int x = 35;
groovy [] ball= new groovy[x];
PFont font;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  frameRate(30);
  font = loadFont("Kalinga-Bold-15.vlw");
  textFont(font);
  for (int i = 0; i < ball.length; i++) {
    ball[i] = new groovy();
  }
}

void draw() {
  background(255,112,3);
  fill(255,255,255);//instructions
  String s = "Make the lava lamp your own!  Change bubble size: Press 1 = S, 2 = M, 3 = L Change bubble color: Press o = orange, p = purple, g = green";
  text(s, 10, 440, width, height);
 
    
  for (int i = 0; i < ball.length; i++) {
    ball[i].move();
    ball[i].display();
  }
}

class groovy {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float blobsize;

  //variables
  groovy () {
    c = color(119,126,248,80);//default color purple
    xpos = random(500);
    ypos = random(500);
    xspeed = random(1,5);
    yspeed = random(1,5);
    blobsize = random(20,200);
  }
  //movement
  void move() {
    if (xpos+(blobsize/3) > 500 || xpos-(blobsize/3) < 0) {
      xspeed = xspeed * (-1);
    }
    if(keyPressed) {
      if(key == '1') {
        blobsize = random(20,100);//change bubble size small
      }
    }
    if(keyPressed) {
      if(key == '2') {
        blobsize = random(20,200);//change bubble size medium
      }
    }
    if(keyPressed) {
      if(key == '3') {
        blobsize = random(20,250);//change bubble size large
      }
    }
    if (ypos+(blobsize/3) > 500 || ypos-(blobsize/3) < 0) {
      yspeed = yspeed * (-1);
    }
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
  }
  //bubbles
  void display() {
    fill(c);
    ellipse(xpos, ypos, blobsize, blobsize);
    if(keyPressed) {
      if(key == 'g') {
        c = color(12,243,53,50);//change color neon green
      }
    }
    if(keyPressed) {
      if(key == 'o'){
        c = color(247,66,0,75);//change color orange
      }
    }
    if(keyPressed){
      if(key == 'p'){
        c = color(119,126,248,80);//change color purple (default)
      }
    }
  }
  }





                
                                
