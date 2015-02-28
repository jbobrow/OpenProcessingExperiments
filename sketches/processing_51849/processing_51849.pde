
int r;
int p;
float rectsize = 50;
//float randx = random(1200); for random x positions
//float randy = random(400); for random y positions
//float randr = random(100); //random red color
//float randb = random(100); //random blue color
//float randg = random(100); //random green color
float o = 50;

void setup()
{
  size( 1200, 600 );
  background(255);
  smooth();
  frameRate(999);
  colorMode(RGB, 100);
  noStroke();
  r=0;
  p=0;
}

void draw() {
   
  
  
  //fill( 255, 255, 255, 0);  //for when you want to use your cursor as the generation point instead of a fixed point
  noStroke();
  
    fill(random(255),0,random(255), o);
    
    if ( key == '1' ){
    fill(random(255), 0, 0, 50);
    }
    
        if ( key == '2' ){
    fill(random(255), random(255), 0, 50);
    }
    
    if ( key == '3' ){
    fill( 0, random(255), 0, 50);
    }
        if ( key == '4' ){
    fill( 0, random(255), random(255), 50);
    }
    
    if ( key == '5' ){
    fill( 0, 0, random(255), 50);
    }
    
     if ( key == '6' ){
    fill( random(255), 0, random(255), 50);
    }
    
  translate(width/2, height/2);
  rotate(r);
  rect(p, p, rectsize, rectsize);
  
  //rect(40, 40, rectsize, rectsize);

 r++;

//box position stuff
 p++;
 if (p > 0) {
   rectsize = 50;
   //randr=255; randg=255; randb=0;
 }
  if (p > 100) {
   rectsize = 40;
 }
  if (p > 200) {
   rectsize = 30;
 }
  if (p > 300) {
   rectsize = 20;
 }
 if (p > 400) {
   rectsize = 10;
 }
 if (p > 500) {
 p=0;
  }
  
  if (mousePressed && key == 'w') {
    fill(255, 255, 255);
    rect(mouseX-width/2, mouseY-height/2, rectsize, rectsize);
  } 
  
  if (mousePressed && key == 'o') {
    fill(255, 255, 255, o);
    rect(mouseX-width/2, mouseY-height/2, rectsize, rectsize);
  } 
  
  if (mousePressed && key == 'k') {
    fill(random(10), random(10), random(10), o);
    rect(mouseX-width/2, mouseY-height/2, rectsize, rectsize);
  } 
  
  if (mousePressed && key == 'r') {
    fill(random(255), 0, 0, o);
    rect(mouseX-width/2, mouseY-height/2, rectsize, rectsize);
  } 
  
  if (mousePressed && key == 'y') {
    fill(random(255), random(255), 0, o);
    rect(mouseX-width/2, mouseY-height/2, rectsize, rectsize);
  } 
  
  if (mousePressed && key == 'g') {
    fill(0, random(255), 0, o);
    rect(mouseX-width/2, mouseY-height/2, rectsize, rectsize);
  } 
  
  if (mousePressed && key == 'b') {
    fill(0, 0, random(255), o);
    rect(mouseX-width/2, mouseY-height/2, rectsize, rectsize);
  } 
  
  if (mousePressed && key == 'v') {
    fill(random(255), 0, random(255), o);
    rect(mouseX-width/2, mouseY-height/2, rectsize, rectsize);
  } 
  
    
  
}

