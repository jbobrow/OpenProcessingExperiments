
ArrayList letters;
PFont font;

void setup() { 
  size(600, 300); 
  smooth();
  frameRate(30);

  textFont(loadFont("Futura-CondensedMedium-48.vlw"), 50); 

  letters = new ArrayList();
}

void draw() {
  if(letters.size() == 0){
    showHelp();
  }else{
    showFadedBackground();
    updateLetters();
  }

}

void showHelp(){
  background(0);
  text("try typing...", 300, 250);
  fill(120,120,0);
}

void showFadedBackground(){
  fill(0, 150);
  rect(0, 0, width, height);
  fill(0);
}

void updateLetters(){
  for (int i = letters.size()-1; i >= 0; i--) { 
    Letter letter = (Letter) letters.get(i);
    letter.update();
  }
}


void keyPressed() {
  letters.add(new Letter(key));
}

void mousePressed() {
  letters.clear();
}



/******** Letter *********/

class Letter { 
  float ypos, xpos, xspeed, yspeed, fade;
  int xdir, ydir;
  color textcolor;
  char character;
  
  Letter (char c) {  
    ypos = random(screen.height); 
    xpos = random(screen.width); 
    character = c;
    xspeed = 3 + random(5);
    yspeed = 2 + random(5);
    xdir = (int(random(2)) == 0) ? -1 : 1;
    ydir = (int(random(2)) == 0) ? -1 : 1;
    fade = 255;

    textcolor = color(random(255), random(250), random(100));
  }
  
  void update() { 
    ypos += yspeed * ydir;
    xpos += xspeed * xdir;
    
    reframe();
    avoidMouse();

    text(character, xpos, ypos);
    fill(textcolor, fade-=2);
    
    removeIfFaded();

  }
  
  void reframe() {
      if (ypos > height + 30) { 
        ypos = 0 - 30;
      } 
      if (xpos > width + 30) {
        xpos = 0 - 30;
      }
      if (ypos < 0 - 30) { 
        ypos = height + 30;
      } 
      if (xpos < 0 - 30) {
        xpos = width + 30;
      }
  }
  
  void avoidMouse(){
    if(mouseX >= 100 && mouseX <= width-100 && xpos > 10 && xpos < width-30) {
      xpos = (xpos < mouseX) ? (xpos -= xspeed*1.2) : (xpos += xspeed*1.2);
    }
  }
  
  void removeIfFaded(){
    if(fade <= 2){
      letters.remove(letters.indexOf(this));
    }
  }
  
  
}


