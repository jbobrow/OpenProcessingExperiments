

import processing.video.*; //import video
int value = 0; //for rectangle
Movie imagineJustice; //call video

void setup() {
//--------------------------------------------
//Setup for Imagine video
//--------------------------------------------
  size(500,500);
  imagineJustice = new Movie(this, "imaginemp4.mp4");
  imagineJustice.loop(); 
  frameRate(100);
}

//void movieEvent(Movie imagineJustice) {
//  imagineJustice.read();
//}


//--------------------------------------------
//Setup for TV static
//--------------------------------------------
int a=500; //sketch size
float s=5; //length of line
float x, y; //start of line
int j = 0; //first "wipe"
int k = -250; //second "wipe"

void draw() {  
//--------------------------------------------
//Draw for Imagine video
//--------------------------------------------
  if (imagineJustice.available()) {
    imagineJustice.read();
  }  
  background(0);
  imageMode(CENTER);
  image(imagineJustice, width/2, height/2, 720,480);

//--------------------------------------------
//TV static code adapted from openproccesing.org sketch#99451 by Anna the Crow
//--------------------------------------------
  for (int i=0;i<=0.5*a;i++) {
      stroke(random(0,255));
      x = random(0,a);
      y = random(0,a);
      line(x,y,x+random(0,s),y);
  }
  stroke(100,100);
  line(0,j,a,j);
  j++;
  if (j>a) {
    j=0;
  }
  stroke(100,100);
  line(0,k,a,k);
  k++;
  if (k>a) {
    k=0;
  }


//--------------------------------------------
//Text
//--------------------------------------------
   if (mousePressed) {
    println(mouseX);
    textSize(32);
    fill (255);
    text("HISTORY REPEATS ITSELF", 80, mouseY);
 
   }
}



