
/*
Made by Roko Medancic
December, 2014.

Detail description on:
https://opensuny.digication.com/r0k0_introduction_to_computational_arts/ICA_Final_Project/

Short instructions

Objects:

G or g – Gift
B or b – Ball
L or l – Lamp
S or s – Star
W or w – Snowflake

Colors:

1 – Red
2 – Dark green
3 – Blue
4 – Yellow
5 – Magenta
6 – Orange

Note: Only gifts can have tape color.
Gift tape for wrapping:

7 – Dark red
8 – Green
9 – Cyan
0 – Dark yellow

To start typing text press - up arrow key

To make smaller text press - left arrow key
To make bigger text press - right arrow key
To delete character press – backspace or enter or return

To apply text click - left mouse button on the place where you want to put it

To change objects other then text press - down arrow key

To apply drawing click - left mouse button on the place where you want to put it 


*/
import ddf.minim.*;

Minim minim;
AudioPlayer sound;

PImage pozadina;//Background image

Boolean up1 = false;//Turn on text
Boolean down1 = true;//Turn off text

Boolean gift = true;//If is down1 true and gift true, draw gift
Boolean ball = false;//If is down1 true and ball true, draw ball
Boolean star = false;//If is down1 true and star true, draw star
Boolean lamp = false;//If is down1 true and lamp true, draw lamp
Boolean snowflake = false;//Draw snowflake

//Default colors
int r = 255;//Red color
int g = 0;
int b = 0;

int r1 = 255;//Dark yellow color of gift tape for wrapping
int g1 = 203;
int b1 = 13;

int w = 255;//White color

int rb2 = 255;//50% saturation of red color for ball and lamp
int gb2 = 126;
int bb2 = 126;

int count = 1;//counter for screenshots

String string1 = "";//When is mouse pressed draw text on canvas

int brojac = 0;//Temp. variable for deleting text
int minus = 0;//Temp. variable for deleting text

PFont ks100;

int ts = 50;//Text size

void setup(){
size(1000,700);//Canvas size
pozadina = loadImage("bor1.png");
minim = new Minim(this);
sound = minim.loadFile("We wish you.wav");
sound.play();
ks100 = loadFont("ks100.vlw");
image(pozadina,0,0);
colorMode(RGB,255,255,255);
}


void draw(){
  if (mousePressed)
  {
  if (down1 == true){
    //Draw gift
    if (gift == true){
    pushMatrix();
    translate(mouseX,mouseY);
    
    strokeWeight(1);
    
    //Draw box of gift
    
    fill(r,g,b);
    stroke(255,255,255);
    
    beginShape();
    vertex(-56.1175,-3.5406);
    vertex(-6.2729,-32.4776);
    vertex(56.2281,3.5476);
    vertex(6.2131,32.1681);
    endShape(CLOSE);
    
    beginShape();
    vertex(-56.1175,-3.5406);
    vertex(6.2131,32.1681);
    vertex(6.2587,61.1731);
    vertex(-56.1175,25.1571);
    endShape(CLOSE);
    
    beginShape();
    vertex(6.2131,32.1681);
    vertex(56.2281,3.5476);
    vertex(56.2281,32.2269);
    vertex(6.2587,61.1731);
    endShape(CLOSE);
    
    //Draw gift tape for wrapping
    
    fill(r1,g1,b1);
    stroke(r1,g1,b1);
    
    beginShape();
    vertex(-37.2037,-14.1351);
    vertex(-12.5234,0.0550);
    vertex(-30.8926,10.9106);
    vertex(-18.5853,17.9613);
    vertex(0.1513,7.0281);
    vertex(24.7661,21.5513);
    vertex(37.2792,14.3909);
    vertex(12.6976,0.1943);
    vertex(31.0823,-10.7041);
    vertex(18.7585,-17.9697);
    vertex(0.1718,-7.2731);
    vertex(-24.6779,-21.4007);
    endShape(CLOSE);
    
    beginShape();
    vertex(-30.8926,10.9106);
    vertex(-18.5853,17.9613);
    vertex(-18.5853,46.8282);
    vertex(-30.8926,39.7220);
    endShape(CLOSE);
    
    beginShape();
    vertex(24.7661,21.5513);
    vertex(37.2792,14.3909);
    vertex(37.2792,43.2036);
    vertex(24.7923,50.4370);
    endShape(CLOSE);
    
    popMatrix();
    
    }
    //Draw ball
    else if (ball == true){
      pushMatrix();
      translate(mouseX,mouseY);
    
      strokeWeight(1);
    
      fill(r,g,b);
      stroke(r,g,b);
      
      ellipse(0, 0, 20, 20);
      noStroke();
      fill(rb2,gb2,bb2);
      ellipse(-3.75, -3.75, 6.6066, 6.6066);
      noStroke();
      fill(w,w,w);
      ellipse(-3.75, -3.75, 2.6066, 2.6066);

      popMatrix();
    }
    //Draw star
    else if (star == true){
      pushMatrix();
      translate(mouseX,mouseY);
    
      strokeWeight(1);
    
      fill(255,168,6);
      stroke(255,168,6);
      
      beginShape();
      vertex(-7.7662,-10.7184);
      vertex(0,-34.0169);
      vertex(0,0);
      endShape(CLOSE);
      
      fill(217,143,5);
      stroke(217,143,5);
      
      beginShape();
      vertex(0,0);
      vertex(0,-34.0169);
      vertex(7.7662,-10.7184);
      endShape(CLOSE);
      
      fill(255,168,6);
      stroke(255,168,6);
      
      beginShape();
      vertex(7.7662,-10.7184);
      vertex(30.8096,-10.7184);
      vertex(0,0);
      endShape(CLOSE);
      
      fill(217,143,5);
      stroke(217,143,5);
      
      beginShape();
      vertex(0,0);
      vertex(30.8096,-10.7184);
      vertex(11.1625,4.0169);
      endShape(CLOSE);
      
      fill(255,168,6);
      stroke(255,168,6);
      
      beginShape();
      vertex(11.1625,4.0169);
      vertex(22.1455,25.9831);
      vertex(0,0);
      endShape(CLOSE);
      
      fill(217,143,5);
      stroke(217,143,5);
      
      beginShape();
      vertex(0,0);
      vertex(22.1455,25.9831);
      vertex(0,15);
      endShape(CLOSE);
      
      fill(255,168,6);
      stroke(255,168,6);
      
      beginShape();
      vertex(0,15);
      vertex(-21.7867,25.9831);
      vertex(0,0);
      endShape(CLOSE);
      
      fill(217,143,5);
      stroke(217,143,5);
      
      beginShape();
      vertex(0,0);
      vertex(-21.7867,25.9831);
      vertex(-10.8036,4.0169);
      endShape(CLOSE);
      
      fill(255,168,6);
      stroke(255,168,6);
      
      beginShape();
      vertex(-10.8036,4.0169);
      vertex(-30.4507,-10.7184);
      vertex(0,0);
      endShape(CLOSE);
      
      fill(217,143,5);
      stroke(217,143,5);
      
      beginShape();
      vertex(0,0);
      vertex(-30.4507,-10.7184);
      vertex(-7.7662,-10.7184);
      endShape(CLOSE);

      popMatrix();
    }
    //Draw lamp
    else if (lamp == true){
      pushMatrix();
      translate(mouseX,mouseY);
    
      strokeWeight(1);
    
      fill(r,g,b);
      stroke(r,g,b);
      
      ellipse(0,0,3,3);
      noStroke();
      fill(rb2,gb2,bb2);
      ellipse(0,0,2,2);
      noStroke();
      fill(w,w,w);
      ellipse(0,0,1,1);

      popMatrix();
    }
    //Draw Snowflake
    else if (snowflake == true){
    pushMatrix();
      translate(mouseX,mouseY);
    
      strokeWeight(1);
    
      fill(w,w,w);
      noStroke();
      smooth();
      
      beginShape();
      vertex(-0.6383,-10.0009);
      vertex(0.6951,-9.9990);
      vertex(0.6921,-7.9235);
      vertex(3.5812,-9.5861);
      vertex(4.2462,-8.4304);
      vertex(0.6899,-6.3839);
      vertex(0.6825,-1.1537);
      vertex(5.2157,-3.7624);
      vertex(5.2215,-7.8655);
      vertex(6.5548,-7.8636);
      vertex(6.5501,-4.5303);
      vertex(8.3490,-5.5655);
      vertex(9.0140,-4.4099);
      vertex(7.2151,-3.3747);
      vertex(10.0995,-1.7039);
      vertex(9.4312,-0.5501);
      vertex(5.8807,-2.6068);
      vertex(1.3508,0);
      vertex(5.8733,2.6234);
      vertex(9.4296,0.5769);
      vertex(10.0946,1.7326);
      vertex(7.2055,3.3951);
      vertex(9.0015,4.4354);
      vertex(8.3332,5.5892);
      vertex(6.5372,4.5489);
      vertex(6.5325,7.8822);
      vertex(5.1992,7.8803);
      vertex(5.2050,3.7772);
      vertex(0.6792,1.1557);
      vertex(0.6718,6.3859);
      vertex(4.2223,8.4425);
      vertex(3.5540,9.5962);
      vertex(0.6696,7.9255);
      vertex(0.6667,10.0009);
      vertex(-0.6667,9.9991);
      vertex(-0.6637,7.9236);
      vertex(-3.5528,9.5861);
      vertex(-4.2179,8.4305);
      vertex(-0.6615,6.3840);
      vertex(-0.6541,1.1538);
      vertex(-5.1873,3.7624);
      vertex(-5.1931,7.8656);
      vertex(-6.5265,7.8637);
      vertex(-6.5217,4.5303);
      vertex(-8.3206,5.5655);
      vertex(-8.9857,4.4099);
      vertex(-7.1867,3.3747);
      vertex(-10.0711,1.7039);
      vertex(-9.4028,0.5502);
      vertex(-5.8523,2.6068);
      vertex(-1.3224,0);
      vertex(-5.8449,-2.6234);
      vertex(-9.4012,-0.5769);
      vertex(-10.0663,-1.7325);
      vertex(-7.1771,-3.3951);
      vertex(-8.9731,-4.4354);
      vertex(-8.3048,-5.5891);
      vertex(-6.5088,-4.5488);
      vertex(-6.5041,-7.8822);
      vertex(-5.1708,-7.8803);
      vertex(-5.1766,-3.7771);
      vertex(-0.6508,-1.1556);
      vertex(-0.6434,-6.3858);
      vertex(-4.1939,-8.4424);
      vertex(-3.5256,-9.5962);
      vertex(-0.6412,-7.9254);
      endShape(CLOSE);
      
    popMatrix();
    }
  }
    else if (up1 == true){//If is up arrow key true draw text
           
      textFont(ks100);
      textSize(ts);
      
      fill(255,168,6);
      noStroke();
      smooth();
      text(string1, mouseX, mouseY);
      string1 = "";
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      cursor(TEXT);
      up1 = true;
      down1 = false;
    }
    else if (keyCode == DOWN) {
      cursor(ARROW);
      down1 = true;
      up1 = false;
    }
    if (up1 == true){
      if (keyCode == RIGHT){
        ts = 100;
      }
      else if (keyCode == LEFT){
        ts = 50;
      }
    }
  }
    else if (keyPressed)
    {
    if (down1 == true)
    {
      if (key == 'g' || key == 'G') {//Turn on gift
      gift = true;
      ball = false;
      star = false;
      lamp = false;
      snowflake = false;
      }
      
      else if (key == 'b' || key == 'B') {//Turn on ball
      ball = true;
      gift = false;
      star = false;
      lamp = false;
      snowflake = false;
      }
      
      else if (key == 's' || key == 'S') {//Turn on star
      star = true;
      lamp = false;
      ball = false;
      gift = false;
      snowflake = false;
      }
      else if (key == 'l' || key == 'L') {//Turn on lamp
      lamp = true;
      star = false;
      ball = false;
      gift = false;
      snowflake = false;
      }
      //Turn on Snowflake
      else if (key == 'w' || key == 'W') {//Turn on snowflake
      snowflake = true;
      lamp = false;
      star = false;
      ball = false;
      gift = false;
      }
      //Not work with applet
      else if (key == 'p' || key == 'P') {//Save screenshot
      saveFrame("screenshot"+count+".png");//After every time you press p or P key
      count++;                             //will save image with different name.
      }

      //Colors
      else if (key == '1') {//Default Red
        r = 255;
        g = 0;
        b = 0;
        
        rb2 = 255;
        gb2 = 126;
        bb2 = 126;
      }
      else if (key == '2') {//Dark Green
        r = 0;
        g = 210;
        b = 0;
        
        rb2 = 104;
        gb2 = 209;
        bb2 = 103;
      }
      else if (key == '3') {//Blue
        r = 0;
        g = 0;
        b = 255;
        
        rb2 = 126;
        gb2 = 127;
        bb2 = 255;
      }
      else if (key == '4') {//Yellow
        r = 255;
        g = 255;
        b = 0;
        
        rb2 = 255;
        gb2 = 253;
        bb2 = 126;
      }
      else if (key == '5') {//Magenta
        r = 255;
        g = 0;
        b = 255;
        
        rb2 = 255;
        gb2 = 126;
        bb2 = 255;
      }
      else if (key == '6') {//Orange
        r = 255;
        g = 120;
        b = 0;
        
        rb2 = 255;
        gb2 = 186;
        bb2 = 126;
      }
    //Draw gift tape for wrapping
      else if (key == '7') {//Dark Red
        r1 = 232;
        g1 = 44;
        b1 = 44;
      }
      else if (key == '8') {//Green
        r1 = 0;
        g1 = 255;
        b1 = 0;
      }
      else if (key == '9') {//Cyan
        r1 = 0;
        g1 = 255;
        b1 = 255;
      }
      else if (key == '0') {//Default Dark Yellow
        r1 = 255;
        g1 = 203;
        b1 = 13;
      }
    }
    
    else if (up1 == true){
      
      if (key == BACKSPACE || key == ENTER || key == RETURN){//Delete text
        brojac = string1.length();

        if (brojac == 0){
        }

        else {
          minus = brojac - 1;
          string1 = string1.substring(0, minus);
        }
      }
      // A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
      else if (key == 'A') {
        string1 = string1 + "A";
      }
      else if (key == 'B') {
        string1 = string1 + "B";
      }
      else if (key == 'C') {
        string1 = string1 + "C";
      }
      else if (key == 'D') {
        string1 = string1 + "D";
      }
      else if (key == 'E') {
        string1 = string1 + "E";
      }
      else if (key == 'F') {
        string1 = string1 + "F";
      }
      else if (key == 'G') {
        string1 = string1 + "G";
      }
      else if (key == 'H') {
        string1 = string1 + "H";
      }
      else if (key == 'I') {
        string1 = string1 + "I";
      }
      else if (key == 'J') {
        string1 = string1 + "J";
      }
      else if (key == 'K') {
        string1 = string1 + "K";
      }
      else if (key == 'L') {
        string1 = string1 + "L";
      }
      else if (key == 'M') {
        string1 = string1 + "M";
      }
      else if (key == 'N') {
        string1 = string1 + "N";
      }
      else if (key == 'O') {
        string1 = string1 + "O";
      }
      else if (key == 'P') {
        string1 = string1 + "P";
      }
      else if (key == 'Q') {
        string1 = string1 + "Q";
      }
      else if (key == 'R') {
        string1 = string1 + "R";
      }
      else if (key == 'S') {
        string1 = string1 + "S";
      }
      else if (key == 'T') {
        string1 = string1 + "T";
      }
      else if (key == 'U') {
        string1 = string1 + "U";
      }
      else if (key == 'V') {
        string1 = string1 + "V";
      }
      else if (key == 'W') {
        string1 = string1 + "W";
      }
      else if (key == 'X') {
        string1 = string1 + "X";
      }
      else if (key == 'Y') {
        string1 = string1 + "Y";
      }
      else if (key == 'Z') {
        string1 = string1 + "Z";
      }
      // a b c d e f g h i j k l m n o p q r s t u v w x y z
      else if (key == 'a') {
        string1 = string1 + "a";
      }
      else if (key == 'b') {
        string1 = string1 + "b";
      }
      else if (key == 'c') {
        string1 = string1 + "c";
      }
      else if (key == 'd') {
        string1 = string1 + "d";
      }
      else if (key == 'e') {
        string1 = string1 + "e";
      }
      else if (key == 'f') {
        string1 = string1 + "f";
      }
      else if (key == 'g') {
        string1 = string1 + "g";
      }
      else if (key == 'h') {
        string1 = string1 + "h";
      }
      else if (key == 'i') {
        string1 = string1 + "i";
      }
      else if (key == 'j') {
        string1 = string1 + "j";
      }
      else if (key == 'k') {
        string1 = string1 + "k";
      }
      else if (key == 'l') {
        string1 = string1 + "l";
      }
      else if (key == 'm') {
        string1 = string1 + "m";
      }
      else if (key == 'n') {
        string1 = string1 + "n";
      }
      else if (key == 'o') {
        string1 = string1 + "o";
      }
      else if (key == 'p') {
        string1 = string1 + "p";
      }
      else if (key == 'q') {
        string1 = string1 + "q";
      }
      else if (key == 'r') {
        string1 = string1 + "r";
      }
      else if (key == 's') {
        string1 = string1 + "s";
      }
      else if (key == 't') {
        string1 = string1 + "t";
      }
      else if (key == 'u') {
        string1 = string1 + "u";
      }
      else if (key == 'v') {
        string1 = string1 + "v";
      }
      else if (key == 'w') {
        string1 = string1 + "w";
      }
      else if (key == 'x') {
        string1 = string1 + "x";
      }
      else if (key == 'y') {
        string1 = string1 + "y";
      }
      else if (key == 'z') {
        string1 = string1 + "z";
      }
      // 0 1 2 3 4 5 6 7 8 9
      else if (key == '0') {
        string1 = string1 + "0";
      }
      else if (key == '1') {
        string1 = string1 + "1";
      }
      else if (key == '2') {
        string1 = string1 + "2";
      }
      else if (key == '3') {
        string1 = string1 + "3";
      }
      else if (key == '4') {
        string1 = string1 + "4";
      }
      else if (key == '5') {
        string1 = string1 + "5";
      }
      else if (key == '6') {
        string1 = string1 + "6";
      }
      else if (key == '7') {
        string1 = string1 + "7";
      }
      else if (key == '8') {
        string1 = string1 + "8";
      }
      else if (key == '9') {
        string1 = string1 + "9";
      }
      else if (key == 32) {
        string1 = string1 + " ";
      }
      else if (key == 33) {
        string1 = string1 + "!";
      }
      else if (key == 34) {
        string1 = string1 + "\"";
      }
      else if (key == 46) {
        string1 = string1 + ".";
      }
    }
  } 
}

