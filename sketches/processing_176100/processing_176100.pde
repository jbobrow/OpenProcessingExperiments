
/*Project 3 
This sketch has intended to be my project 3, but I saw in the Showoff
thread someone made something very similar, so I created something
else. I share this just for fun. 
You can create a Christmas card: add falling snow by pressing
the mouse, ornaments by pressing the keys 's'/'S' (star) and 
'b'/'B' (balls), gifts by pressing 'g'/'G', and a text by pressing
't'/'T'. 
Sound is included, press 'm'/'M' for christmas bells. 
Save a picture of your card by pressing 'p'/'P'.
Merry Christmas! :)
*/

//Importing minim
import ddf.minim.*;

//Color
color [] balls = {#5D91FF, #F03336, #50AA4A, #FFEF36, #3E0050};

//Variables
Minim minim;
AudioSample bells;
PImage pine;
PFont chiller;
float counter = 1;

//Setup
void setup() {
  size (1000, 700);
  background (#0B1334);
  minim = new Minim (this);
  bells = minim.loadSample ("bells.mp3");
    
  //Pine
  pine = loadImage ("pine.png");
  image (pine, width/2-180, height/2-300);
  
  //Snowy ground 
  stroke (#FFFFFF);
  fill (#FFFFFF);
  ellipse (0, 700, 1000, 300);
  ellipse (600, 700, 1000, 420);
  ellipse (900, 700, 500, 350);
}

//Draw
void draw() {
  
}
  
//Input
void keyPressed () {
   
  if (key == 'p' || key == 'P') saveFrame ("pic_###.png");
    
  //Star
  if (key == 's' || key == 'S') {
    stroke (#FCE363, 60);
    strokeWeight (3);
    fill (#FFD70D);
    beginShape ();
    vertex (495, 40);
    vertex (499, 53);
    vertex (510, 53);
    vertex (500, 59);
    vertex (504, 73);
    vertex (495, 62);
    vertex (485, 73);
    vertex (488, 59);
    vertex (479, 53);
    vertex (491, 53);
    vertex (495, 40);
    endShape ();
  }
  
  //Balls
  if (key == 'b' || key == 'B') {
    stroke (#E5D3D3, 60);
    strokeWeight (2);
    fill (balls [int (random (5))]); 
    ellipse (500, 350, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (480, 85, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (505, 105, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (470, 140, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (490, 180, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (450, 190, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (540, 210, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (470, 240, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (420, 280, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (470, 240, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (560, 270, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (590, 330, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (450, 320, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (440, 390, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (360, 400, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (530, 410, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (630, 390, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (420, 460, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (480, 440, 20, 20);
    fill (balls [int (random (5))]);
    ellipse (580, 470, 20, 20);
  }
  
  //Gifts
  if (key == 'g' || key == 'G') {
    stroke (#244D17);
    strokeWeight (1);
    fill (#244D17);
    rect (380, 490, 50, 50); 
    quad (380, 490, 390, 480, 439, 479, 430, 490);
    quad (430, 490, 439, 479, 440, 530, 430, 540);
    strokeWeight (4);
    stroke (#9B1010);
    line (405, 490, 405, 540);
    line (380, 515, 430, 515);
    line (405, 490, 415, 480);
    line (430, 515, 440, 505);
    strokeWeight (3);
    stroke (#393633, 98);
    fill (#393633, 98); 
    line (385, 541, 431, 541);
    line (431, 541, 440, 531);
    
    translate (260, -30);
    stroke (#B2A000);
    strokeWeight (1);
    fill (#B2A000);
    rect (380, 490, 50, 50); 
    quad (380, 490, 390, 480, 440, 479, 430, 490);
    quad (430, 490, 440, 479, 440, 530, 430, 540);
    strokeWeight (4);
    stroke (#9B1010);
    line (405, 490, 405, 540);
    line (380, 515, 430, 515);
    line (405, 490, 415, 480);
    line (430, 515, 440, 505);
    strokeWeight (3);
    stroke (#393633, 98);
    fill (#393633, 98); 
    line (385, 541, 431, 541);
    line (431, 541, 440, 531);
    
    translate (-140, 80);
    stroke (#153971);
    strokeWeight (1);
    fill (#153971);
    rect (380, 490, 50, 50); 
    quad (380, 490, 390, 480, 439, 479, 430, 490);
    quad (430, 490, 439, 479, 440, 530, 430, 540);
    strokeWeight (4);
    stroke (#9B1010);
    line (405, 490, 405, 540);
    line (380, 515, 430, 515);
    line (405, 490, 415, 480);
    line (430, 515, 440, 505);
    strokeWeight (3);
    stroke (#393633, 98);
    fill (#393633, 98); 
    line (385, 541, 431, 541);
    line (431, 541, 440, 531);
  }
  
  //Merry Christmas!
  if (key == 't' || key == 'T') { 
    chiller = loadFont ("Chiller.vlw"); 
    textAlign (CENTER);
    textFont (chiller);
    fill (#A25100);
    text ("Merry Christmas!", width/2, 660);
  }
  
  //Palying bells
  if (key == 'm' || key == 'M') bells.trigger ();
    
}

void mousePressed () {
    while (counter < 151) {
    stroke (#BFE7FF);
    strokeWeight (3);
    fill (#FFFFFF);
    ellipse (random (width), random (height), 5, 5);
    counter++;
 } 
}

