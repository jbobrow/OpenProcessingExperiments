
import org.philhosoft.p8g.svg.*;


color[] pallete = {
  #D1595E, #80111C, #647D22, #5C8E72, #A8E0E2, #BF3726, #006299, #E9CACE, #EC5758, #BD3413, #0051A3, #F5A278, 
  #001915, #698889, #E5B149, #374E66, #B1DBBB, #98A433, #E8BAA0, #996A61, #E6CDD5, #E883B1, #A1B826, #519FCE, 
  #27393E, #007640, #E8EAE3, #EACC4B, #313153, #23C7B0, #C9DDE3, #838FA0, #0087CC, #88A2CD
};


void setup() {
  size (800, 800);
  smooth(4);
  frameRate(20);
  background(255);
  noStroke();

  PFont font;
  font = loadFont("PTSans-Regular-20.vlw");
  textFont(font, 32);
  textSize(15);
  fill(80, 80, 80, 100);
  text("Hold LMB to generate art and press RMB to clear canvas. To save image press DOWN.", 150, 400);
}

void draw () {

  

  if (mouseButton == LEFT & mousePressed == true) {


    float x = random(width);
    float y = random(height);
    float x2 = random(width);
    float y2 = random(height);
    float x3 = random(width);
    float y3 = random(height);
    float x4 = random(width);
    float y4 = random(height);
    
   
    

    rotate(random(360));

    rect(x, y, x2, y2);
    rect(x3, y3, x4*0.4, y4*0.1);
 

    fill(pallete[int(random(1, 28))]);
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    clear();
    background(255);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      saveFrame();
      
    }
  }
}



