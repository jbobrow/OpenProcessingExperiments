
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
AudioSample beep1;
AudioSample beep2;
PFont font;

void setup() {
  size (640,480);
  noStroke ();

  font = loadFont ("FONT.vlw");

  minim = new Minim(this);
  redanthem = minim.loadSample("redanthem.mp3");
  USA = minim.loadSample("USA.mp3");
  beep1 = minim.loadSample("beep-21.mp3"); 
  beep2 = minim.loadSample("beep-22.mp3"); 
}


void draw () {
  background (0);
  fill (255);



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


   //SOVIET FLAG
     pushMatrix();
     translate(20, 110);

     noStroke();

     fill(255, 0, 0);
     rect(39, 292, 90, 55);
 
     fill(246, 236, 27);
     pushMatrix();
     translate(-45, -27);
     
     beginShape();
     vertex(56.5, 301.5);
     bezierVertex(60.12, 302.42, 62.5, 306, 62.13, 310);
     bezierVertex(61.92, 312.17, 61.42, 313.74, 60.34, 314.75);
     vertex(60.34, 314.75);
     vertex(63.58, 317.42);
     vertex(62.54, 318.82);
     bezierVertex(58, 315.95, 57.15, 316.09, 56.13, 316.13);
     bezierVertex(54.13, 316.13, 52.13, 315.63, 51.36, 314.38);
     bezierVertex(51.25, 314.36, 50.9, 314.49, 50.83, 314.79);
     bezierVertex(50.81, 315.49, 50.75, 316.08, 49.71, 316.13);
     bezierVertex(49.29, 316.95, 46.9, 319.36, 46.29, 318.67);
     bezierVertex(45.63, 317.92, 48.66, 315.63, 49.12, 315.54);
     bezierVertex(48.88, 314.75, 49.33, 313.88, 50.25, 314.25);
     bezierVertex(50.37, 314.04, 50.874, 313.709, 51.29, 313.709);
     bezierVertex(53.938, 315.219, 56.79, 314.42, 56.708, 314.209);
     vertex(52.42, 310.67);
     vertex(50.43, 312.65);
     vertex(48.54, 310.88);
     vertex(52.67, 306.71);
     vertex(54.79, 306.46);
     vertex(55.76, 307.32);
     vertex(53.71, 309.42);
     vertex(58.37, 313.38);
     bezierVertex(58.58, 313.23, 60.42, 311.48, 60.37, 308.63);
     bezierVertex(60.312, 305.84, 58.87, 303.08, 56.54, 301.5);
     endShape();
 
     noFill();
     stroke(246, 236, 27);
     strokeWeight(.75);
 
     beginShape();
     vertex(56.11, 295.58);
     vertex(56.89, 297.21);
     vertex(58.67, 297.49);
     vertex(57.36, 298.74);
     vertex(57.65, 300.52);
     vertex(56.06, 299.66);
     vertex(54.45, 300.48);
     vertex(54.77, 298.71);
     vertex(53.5, 297.43);
     vertex(55.2, 297.19);
     endShape();

     popMatrix();
  
    popMatrix();    
    //Flag End
    
       //US FLAG
       pushMatrix ();
        translate(100,200);
         
      pushMatrix();
      noStroke();
      rectMode (CORNER);
      fill (255,0,0);
      rect (420,167,100,65);
      fill(255);
      rect (420,172,99.8,5);
      rect (420,182,99.8,5);
      rect (420,192,99.8,5);
      rect (420,202,99.8,5);
      rect (420,212,99.8,5);
      rect (420,222,99.8,5);
      
     
      fill(0,0,255);
      rect (420,167,45,31);
      fill (255);
      for (int i = 422; i < 465; i = i+5) {
        for (int j = 169; j < 198; j = j+5) {
        ellipse (i, j,1.5,1.5);}}
      popMatrix();
      popMatrix();
    


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
      rectMode(CENTER);
      rect (153, 390-vc,20,40);
      fill (255,255,0);
      
      rect (153, 390-vc,10,30);
      beep1.trigger();
    }
   
  }  

  if (keyPressed) {
    if (key == USA_letters[e]) {
      vu+=40;
      updateLetter();
      rectMode(CENTER);
      fill (255,0,0);
      rect (480, 440-vu,20,40);
      fill (255,255,0);
      
      rect (480, 440-vu,10,30);
      beep2.trigger();
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
    text ("Captain,\n It is of utmost importance that \n we beat the reds. Type in the \n launch codes to reach the moon \n first. Our very way of life depends \n on it.", 340, 270);    
    textFont (font,36);
    textAlign (CENTER);
    fill (255);
    text ("CLICK TO START", width/2,450);
    

    
    
    //SOVIET FLAG
     pushMatrix();
     translate(80, -90);

     noStroke();

     fill(255, 0, 0);
     rect(39, 292, 100, 62);
 
     fill(246, 236, 27);
     pushMatrix();
     translate(-50, -30);
     
     beginShape();
     vertex(56.5, 301.5);
     bezierVertex(60.12, 302.42, 62.5, 306, 62.13, 310);
     bezierVertex(61.92, 312.17, 61.42, 313.74, 60.34, 314.75);
     vertex(60.34, 314.75);
     vertex(63.58, 317.42);
     vertex(62.54, 318.82);
     bezierVertex(58, 315.95, 57.15, 316.09, 56.13, 316.13);
     bezierVertex(54.13, 316.13, 52.13, 315.63, 51.36, 314.38);
     bezierVertex(51.25, 314.36, 50.9, 314.49, 50.83, 314.79);
     bezierVertex(50.81, 315.49, 50.75, 316.08, 49.71, 316.13);
     bezierVertex(49.29, 316.95, 46.9, 319.36, 46.29, 318.67);
     bezierVertex(45.63, 317.92, 48.66, 315.63, 49.12, 315.54);
     bezierVertex(48.88, 314.75, 49.33, 313.88, 50.25, 314.25);
     bezierVertex(50.37, 314.04, 50.874, 313.709, 51.29, 313.709);
     bezierVertex(53.938, 315.219, 56.79, 314.42, 56.708, 314.209);
     vertex(52.42, 310.67);
     vertex(50.43, 312.65);
     vertex(48.54, 310.88);
     vertex(52.67, 306.71);
     vertex(54.79, 306.46);
     vertex(55.76, 307.32);
     vertex(53.71, 309.42);
     vertex(58.37, 313.38);
     bezierVertex(58.58, 313.23, 60.42, 311.48, 60.37, 308.63);
     bezierVertex(60.312, 305.84, 58.87, 303.08, 56.54, 301.5);
     endShape();
 
     noFill();
     stroke(246, 236, 27);
     strokeWeight(.75);
 
     beginShape();
     vertex(56.11, 295.58);
     vertex(56.89, 297.21);
     vertex(58.67, 297.49);
     vertex(57.36, 298.74);
     vertex(57.65, 300.52);
     vertex(56.06, 299.66);
     vertex(54.45, 300.48);
     vertex(54.77, 298.71);
     vertex(53.5, 297.43);
     vertex(55.2, 297.19);
     endShape();

     popMatrix(); 
     
     popMatrix();    
    
       //US FLAG
      pushMatrix();
      noStroke();
      rectMode (CORNER);
      fill (255,0,0);
      rect (420,167,100,65);
      fill(255);
      rect (420,172,99.8,5);
      rect (420,182,99.8,5);
      rect (420,192,99.8,5);
      rect (420,202,99.8,5);
      rect (420,212,99.8,5);
      rect (420,222,99.8,5);
      
     
      fill(0,0,255);
      rect (420,167,45,31);
      fill (255);
      for (int i = 422; i < 465; i = i+5) {
        for (int j = 169; j < 198; j = j+5) {
        ellipse (i, j,1.5,1.5);}}
      popMatrix();
    
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
  beep1.close();
  beep2.close();
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
  }}

