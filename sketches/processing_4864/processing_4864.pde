

import ddf.minim.*;

Minim minim;
AudioPlayer player;
int lastX;
int lastY;

PImage b;

void setup() {
  minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile("thing.mp3", 2048);
  b = loadImage("kitkat.jpg");
  size(911,666);
  smooth();
  frameRate(24);
}

void draw() {
  background(255);
 
  //println("mouseX=" + mouseX + " lastX="+lastX +"   mouseY="+mouseY+"   lastY="+lastY);
  if(mouseX !=lastX || mouseY !=lastY){
   player.play();
   //println("mouse is moving!");
  }else {
   player.pause(); 
   //println("mouse is stopped!");
  }

image(b, 241, 145);

//EVENT HORIZON AT line(0, 231, 911, 231); 


//radiotowerKITKAT
stroke(98,51,16);
strokeWeight(1.005);
line(258,156,258,142);

noStroke();  //buildingLeft of kitkat w/radiotower
fill(98,51,16);
rect(222,182,14,49);
rect(224,177,10,5);
triangle(224,177,234,177,229,167);
stroke(98,51,16);
strokeWeight(1);
line(229,167,229,161);

//building right of right tower
rect(300,182,13,49); 
rect(301,177,12,5);
triangle(303,177,311,177,308,165);

// boxbuildings Left
rect(165,189,24,42);
rect(195,188,15,43);
rect(125,189,24,42);
rect(105,188,15,43);

//buildings right
rect(319,188,11,42);
ellipse(324,188,11,5);
rect(339,207,21,24);
rect(369,207,17,24);
//skinnytower Right
rect(378,182,14,49);
rect(380,177,10,5);
triangle(380,177,390,177,385,167);
rect(394,204,17,27); 

//UFO
stroke(0);
strokeWeight(2);
fill(14,224,0,mouseY);
ellipse(mouseX,mouseY,94,29);
line(mouseX+15,mouseY+15,pmouseX+30,pmouseY+40);
line(mouseX-15,mouseY+15,pmouseX-30,pmouseY+40);

//mousemp3
lastX=mouseX;
lastY=mouseY;

}



