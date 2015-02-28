
//Alison Mini Project 
//Project Title: Shopping
//Interactive game

//Using my own painting to be the place setting 
// this sketch works on: ITERATION (loops), FUNCTIONS (with arguments), MOUSE & KEYBOARD INTERACTION.
//pressing your mouse to choose items to buy
//click keyboard "space-bar" to go to next page and to see the
//blacken words clear
//click "b" to turn back 

String[] headlines = {  //adding headlines
  "WElcome!",
  "Human Shopping Market!",
 
  };
 
PFont f;  // Global font variable
float w;  // horizontal location : headline
int index = 0;
 


import ddf.minim.*; // import sound and background music
 
Minim minim;

AudioSample effect1;
AudioPlayer bgsound; 

 PImage img1, img2; //import 2 images that I painted
 
 int[] ex = new int[0], ey = new int[0];



void setup() {
   f = createFont("Jokerman",52,true); 
  // Initialize headline offscreen to the right
  w = width;

  //add sound effect
 
  minim = new Minim(this);
 effect1 = minim.loadSample("wewill.mp3");
  
  bgsound = minim.loadFile("supermarket.mp3");
  bgsound.loop(); //loop the background sound
 

 
  
  size(700,558); // set the size of images
  img1=loadImage("shopping.jpg");
  img2=loadImage("shopping2.jpg");
  
  background(img1); //set background image
  smooth();
  noStroke();//not using stroke
}


//referring to the class exercise: rolling eyes


void draw() {

 fill(4); //set the color of text be black
  
  textFont(f,30);       
  textAlign(LEFT);
  text(headlines[index],w,80);
 
  // Decrement x
  w= w - 3;
 
  // once w less than the negative width,it is off the screen
  float k = textWidth(headlines[index]);
  if (w < -k) {
    w = width;
    index = (index + 1) % headlines.length;
  }



  for (int i=0; i<ex.length; i++) {
    redcircle(ex[i],ey[i]);
  }
}

void mousePressed() {
  ex = append(ex,mouseX);
  ey = append(ey,mouseY);
  println(ex.length+" ("+ex[ex.length-1]+","+ey[ey.length-1]+")");

  effect1.trigger();
}

//referring to the example on http://processing.org/examples/ :star
//applying user-defined function to draw stars and red circles on stars
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void redcircle(int x, int y) {
  
  float dx = map(mouseX-x,0,width,0,10);
  float dy = map(mouseY-y,0,height,0,10);
  
 fill(255);
   star(x+dx,y+dy,30,  70, 5); 
  //ellipse(x+dx, y+dy, 30, 30);
  
   fill(255,0,0); //set the color of circles be red
 ellipse(x, y, 50, 50); //draw circles
  
  

}

void keyPressed() {//the key function triggers once everytime when a key is pressed
  if (key == ' ') {//if users press the "keyboard space bar"
    background(img2);// the background will change to img2 when the space bar is pressed.
    noStroke(); // no Stroke
  }
   if (key == 'b') {//if the key is 'b'
    background(img1);// the background will reuturn to img1
    noStroke(); // no Stroke
 }
   
}





