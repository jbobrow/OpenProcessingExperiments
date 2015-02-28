
import ddf.minim.*;

color[] palette_tech = { #B21100, #D4FF19, #FF1900, #1465CC, #0953B2};
color[] palette_alt = { #7F705F, #FFBD71, #A68E5E, #7F6547, #CCB497};
color[] palette = {#487F3F, #D2FFCB, #91FF7E, #297F1B, #74CC65};
Minim minim;
AudioPlayer player, player2, player3, player4;
PFont font;


void setup() {
    size(800, 800);
    background(#FFC9ED);
    minim = new Minim(this);
    player = minim.loadFile("happy.mp3"); 
    player2 = minim.loadFile("worm.wav");  
    player3 = minim.loadFile("techno.aif");  
    player4 = minim.loadFile("bloop.wav");  
    font = loadFont("gujarati.vlw");
    textFont(font, 32);
    rectMode(CENTER);
    background(random(128,255), 128, 128); 
    textAlign(CENTER, BOTTOM);
    String s = "Press 1 For Caterpillar, 2 for Worm, 3 for Space, then hold and click to start drawing!";
    String s2 = "Press delete to reset";
    fill(50);
    text(s, width/2, height-280, 500, 200);
    text(s2, width/2, height-300, width/2, height/2);
    fill(#000000);
    ellipse(width/2-50, height/2-100, 50, 50);
    ellipse(width/2+50, height/2-100, 50, 50);
    arc(width/2, height/2-50, 120, 120, 0, PI); 
}

void draw() {
    noStroke();
    smooth();
}

void mouseDragged() {
    float random_colour = random(0, 5);
   
    if (key == '1') {
      fill(palette[int(random_colour)]);
      ellipse(mouseX, mouseY, 50-abs(mouseX-pmouseX), 50-abs(mouseY-pmouseY));
      ellipse(pmouseX, pmouseY, 50, 50);
      fill(#000000);
      ellipse(mouseX-7, mouseY-5, 5, 5);
      ellipse(mouseX+7, mouseY-5, 5, 5);
      arc(mouseX, mouseY+3, 30, 30, 0, PI);
    }
    
    if (key == '2') {
        fill(palette_alt[int(random_colour)]);   
        ellipse(mouseX, mouseY, 50-abs(mouseX-pmouseX), 50-abs(mouseY-pmouseY));
        ellipse(pmouseX, pmouseY, 50, 50);
        fill(#000000);
        ellipse(mouseX-7, mouseY-5, 5, 5);
        ellipse(mouseX+7, mouseY-5, 5, 5);
        arc(mouseX, mouseY+3, 30, 30, 0, PI);
    }
    
      if (key == '3') {
        fill(palette_tech[int(random_colour)]);  
        ellipse(mouseX, mouseY, 50-abs(mouseX-pmouseX), 50-abs(mouseY-pmouseY));
        ellipse(pmouseX, pmouseY, 50, 50);
        fill(#000000);
        ellipse(mouseX-7, mouseY-5, 5, 5);
        ellipse(mouseX+7, mouseY-5, 5, 5);
        arc(mouseX, mouseY+3, 30, 30, 0, PI); 
    }
}

void mousePressed(){
    if (key == '1') {
      player.shiftGain(-20, 5, 1000); 
      player.cue(0);
      player.play();
      player.loop();
    }

    if (key == '2') {
      player.pause(); 
      player3.pause(); 
      player2.shiftGain(-20, 5, 1000); 
      player2.cue(0);
      player2.play();
      player2.loop();
    }
    if (key == '3') { 
      player.pause(); 
      player2.pause(); 
      player3.shiftGain(-20, 5, 1000); 
      player3.cue(0);
      player3.play();
      player3.loop();
    }
}

void mouseReleased() {
      player.pause(); 
      player2.pause(); 
      player3.pause(); 
}

void keyPressed() {
  if (key == '1' || key == '2' || key == '3' || key == DELETE || key == BACKSPACE) { 
    player4.cue(0);
    player4.play();
  }
 
    if (key == '1') background(#FFC9ED);
    if (key == '2') background(#6F4D32);
    if (key == '3') background(#000000);
    if (key == DELETE || key == BACKSPACE) { 
       background(random(128,255), random(128,255), random(128,255)); 
      textAlign(CENTER, BOTTOM);
      String s = "Press 1 For Caterpillar, 2 for Worm, 3 for Space, then click, hold, and drag to start drawing!";
      String s2 = "Press delete to reset";
      fill(50);
      text(s, width/2, height-280, 500, 200);
      text(s2, width/2, height-300, width/2, height/2);
      fill(#000000);
      ellipse(width/2-50, height/2-100, 50, 50);
      ellipse(width/2+50, height/2-100, 50, 50);
      arc(width/2, height/2-50, 120, 120, 0, PI); 
    }
    if (key == 's' || key == 'S') saveFrame("screenshot.png");  
}

