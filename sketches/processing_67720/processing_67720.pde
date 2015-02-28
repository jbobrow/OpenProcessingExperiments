


// x and y positions
int [] xpos = new int [100];
int [] ypos = new int [100];

boolean button = false;
PFont font;
//character example
char letter;
float c1 = 0;
float c2 = 255;

float c1dir =10;
float c2dir = -10;

/*float x = 0;
float y = 0;
float xspeed = 2;
float yspeed = 3;*/

int y = 0;
int speed = 1;

void setup () {
size (1000,800);
smooth();
font = loadFont ("BebasNeue-100.vlw");
textFont (font,200);
textMode (SCREEN);
textAlign(CENTER);



// Initialise
for (int i = 0; i < xpos.length; i ++) {
xpos [i] = 0;
ypos [i] = 0;
}
}

void draw () {
  background (24,24,24,80); // bg dark grey
  
  text("H", 100,height/2);
  text("E", 175,height/2);
  text("L", 250,height/2);
  text("L", 325,height/2);
  text("O", 400,height/2);
  
  y = y + speed;
  
  if ((y > height) || (y < 0)) {
    speed = speed * -1;
  }
  
  c1 = c1 + c1dir;
  c2 = c2 + c2dir;
  
  if (c1 < 0 || c1 > 255) {
    c1dir *= -1;
  }
  
  if (c2 <0 || c2 > 255) {
    c2dir *= - 1;
  }
 
  
  /*if (mouseX<width && mouseY > 250); {
  xspeed = xspeed *-1;
  }
  
  if (mouseX < width && mouseY >250); {
    yspeed = yspeed *-1;
  }*/
  
  
  // draw letter to center of screen
    //int x = 10;
  //for (int i = 0; i <message.length(); i ++) {
    //text(message.charAt (i),x,height/2;
    fill(c1+24,24,c2+225,80);
   // fill(c2-24,-24,c2-225,10);
  text(letter,width/5,y);
  text(letter,width/5+75,y);
  text(letter,width/5+150,y);
  text(letter,width/5+225,y);
  text(letter,width/5+300,y);

  
  
 if (mouseX < 250 && mouseY < 250) {
   fill (mouseX,0,mouseY,80);
 } else if (mouseX > 250 && mouseY < 250) {
   fill (mouseX,mouseY,0,80);
 } else if (mouseX < 250 && mouseY > 250) {
   fill (0,mouseX,mouseY,80);
 } else if (mouseX > 250 && mouseY > 250) {
   fill(mouseX, mouseY,0,80);
  
 
 }
}


void keyPressed () {
  // Variable "key" contains the value of the most recent key
  // AND The image is then shifted to the corresponding value of that key
  if (key > 'A' && key < 'z') {
    letter = key;
    println(key);
  }
  if (key == CODED) {
  if (keyCode == UP) {
    fill(255);
     text("H", 100,height/2);
     text("E", 175,height/2);
  text("L", 250,height/2);
  text("L", 325,height/2);
  text("O", 400,height/2);
  }
  }
}
    

void mousePressed () {
//background (255);
 // float zoom = map (mouseX, 0, width, 1,4);
 // scale(zoom);
  textFont (font);
  // Shift array values 
  for (int i = 0; i < xpos.length - 1; i ++) {
    xpos [i] = xpos [i+1];
    ypos [i] = ypos [i+1];
  }
  
  // New location 
  xpos [xpos.length - 1] = mouseX;
  ypos [ypos.length - 1] = mouseY;
  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++) {
    noStroke ();
    text("A",xpos [i],ypos[i]);
  }
}
   
    
    

