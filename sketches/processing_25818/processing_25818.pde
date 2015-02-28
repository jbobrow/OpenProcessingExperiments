
int vc = 0;
int vu = 0;


float qw=0;
float qe=0;
char [] soviet_letters = new char [13];
char [] USA_letters = new char [13];
import ddf.minim.*;
Minim minim;
boolean gameOn = false;
boolean musicOn = false;
AudioSample redanthem;
AudioSample USA;
PFont font;

void setup() {
  size (640,480);
  noStroke ();

  font = loadFont ("FONT.vlw");

  minim = new Minim(this);
  redanthem = minim.loadSample("redanthem.mp3");
  USA = minim.loadSample("USA.mp3");
}

void draw () {
  background (0);
  fill (255);
//  for (int i = 0; i <100; i = i+5) {
//    ellipse (random (0,640),random (0,480),2,2);
//  }



  //MOON
  noStroke();
  fill(255, 244, 192);
  ellipse(325, -60, 870, 275);
  fill(255, 252, 215);
  ellipse(330, -64, 845, 263);
  fill(255, 244, 192);
  ellipse (103, -20, 82, 82);
  ellipse(247, 0, 85, 85);
  ellipse (435, -3, 85, 85);
  ellipse (575, -11, 67, 67);
  fill(255, 252, 215);
  ellipse (112, -30, 76, 76);
  ellipse(246, -15, 80,80);
  ellipse (445, -11, 80, 80);
  ellipse (567, -11, 62, 62);
  //END MOON


 
    


  //array for letter generator; needs to be in draw because we have to match
  //the key entry with whatever character the array generates
  fill (255);
  soviet_letters [0] = 'q';
  soviet_letters [1] = 'e';
  soviet_letters [2] = 't';
  soviet_letters [3] = 'u';
  soviet_letters [4] = 'o';
  soviet_letters [5] = 'a';
  soviet_letters [6] = 'd';
  soviet_letters [7] = 'g';
  soviet_letters [8] = 'j';
  soviet_letters [9] = 'l';
  soviet_letters [10] = 'x';
  soviet_letters [11] = 'v';
  soviet_letters [12] = 'n';
  USA_letters [0] = 'w';
  USA_letters [1] = 'r';
  USA_letters [2] = 'y';
  USA_letters [3] = 'i';
  USA_letters [4] = 'p';
  USA_letters [5] = 's';
  USA_letters [6] = 'f';
  USA_letters [7] = 'h';
  USA_letters [8] = 'w';
  USA_letters [9] = 'z';
  USA_letters [10] = 'c';
  USA_letters [11] = 'b';
  USA_letters [12] = 'm';
  //END ARRAY

  //generate random type
  Letter();
  int w = int(qw);
  int e = int(qe);

  textAlign(CENTER);
  //soviet code
  textFont (font,32);
  text (soviet_letters[w],160,465);
  //USA code
  textFont (font,32);
  text (USA_letters[e],480,465);

  textFont (font,20);
  fill (255,255,0);
  text (": LAUNCH CODES :",width/2,465);
  fill (255);
  //END GENERATOR


  //key and code matchup=move ship up one unit
  if (keyPressed) {
    if (key == soviet_letters[w]) {
      vc+=40;
      updateLetter();
      fill (255,0,0);
      rect (153, 390-vc,20,40);
      fill (255,255,0);
      rect (153, 390-vc,10,30);
    }
  }  

  if (keyPressed) {
    if (key == USA_letters[e]) {
      vu+=40;
      updateLetter();
      fill (255,0,0);
      rect (480, 440-vu,20,40);
      fill (255,255,0);
      rect (480, 440-vu,10,30);
    }
  }
  //END MATCHUP EVENT

  //soviet_ship
  noStroke();
  fill(150);
  ellipse (153, 377-vc, 23, 23);
  strokeWeight(1);
  stroke(150);
  line (145,380-vc, 123, 428-vc);
  line (148, 377-vc, 132, 430-vc);
  line (159, 379-vc, 175, 430-vc);
  line (163, 377-vc, 183, 425-vc);

  //US_ship
  rectMode(CENTER);
  rect (480,405-vu,16, 46);
  triangle(480, 365-vu, 488, 381-vu, 472, 381-vu);



  //end game
  if (vc>300) {


    if (musicOn == false) {
      redanthem.trigger();
      musicOn = true;
    }


    fill (255,0,0);
    rect (width/2,height/2,640,480);
    fill(255,255,0);

    textAlign (CENTER);
    textFont (font,40);
    text ("GREAT VICTORY FOR",width/2,height/2-40);
    textFont (font,50);
    text ("MOTHER RUSSIA",width/2,height/2+40);
    textFont (font,18);
    text ("Click mouse to defeat capitalist pigs once more!",width/2,height/2+100);   
    
  }
  if (vu>300) {


    if (musicOn == false) {
      USA.trigger();
      musicOn = true;
    }



    fill (0,0,255);
    rect (width/2,height/2,640,480);
    fill(255,0,0);

    textFont (font,56);
    textAlign (CENTER);
    text ("GOD BLESS",width/2,(height/2)-20);
    fill (255);
    text ("AMERICA",width/2, (height/2)+58);
    textFont (font,18);
    text ("Click mouse for another all-American beatdown!",width/2,height/2+100);
  }

  if (gameOn == false) {
    fill (0);
    rect (width/2,height/2,640,480);
    fill (0,0,255);

    fill(255);
    textFont (font,48);
    textAlign (CENTER); 
    text ("-- SPACE RACE --",320,60);
    text ("MISSION BRIEF:", width/2,120);
    textFont (font, 14); 
    textAlign (LEFT);  
    fill (255,255,0);
    text ("Comrade,\n We must prove the people's \n superiority to the West.\nType in the launch codes \n to beat American scum in \n race to moon!", 40, 270);
    fill (10,80,255);
    text ("Captain,\n It is of utmost importance \n that we beat the reds. \n Type in the launch codes \n to reach the moon first. \n Our very way of life depends on it.", 320, 270);    
    textFont (font,36);
    textAlign (CENTER);
    fill (255);
    text ("CLICK TO START", width/2,450);
    
    
       
  }
}




void Letter() {
  if(frameCount % 120 == 0) {
    qw = random (0,13);
    qe = random (0,13);
  }
}

void updateLetter() {

  qw = random (0,13);
  qe = random (0,13);
}

void stop() {
  redanthem.close();
  USA.close();
  minim.stop();


  super.stop();
}

//restart game
void mousePressed() {



  if (gameOn == false) {
    gameOn = true;
  } 
  else if (vc > 300 || vu > 300) {
    gameOn = false;
    musicOn = false;

    vc = 0; 
    vu = 0;

    redanthem.stop();
    USA.stop();
  }
}





