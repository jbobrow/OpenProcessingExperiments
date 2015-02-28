
PImage img;
int c;
int xspeed = 10;
int x = 0;

void setup(){
img = loadImage("apple.png");
size(450,450);
frameRate(30);
c = 0;
}

/*applelogo*/
void draw() {
  background(100); 
  
  tint(c, c, c);
  image(img, 70, 40, 300, 350);
      tint(c, c, 0);
  image(img, 170, 180, 100, 120);

  
  /*mouseapple*/
      tint(c,0,0);
  image(img, mouseX, mouseY, 50, 60);
  
  /*text*/
  fill(100);
  textSize(80);
  text("APLLE", 110, 340);
}


/*iro*/
void mouseMoved(){
  c++;
  if(c>255){
    c =0;
  } 
}

/*click apple*/ 
void mouseDragged(){
  for(int i=0; i<450; i+=50) {
    
  image(img, x, i, 50, 60);
  x = x + xspeed;
  if(x > width || x < 0) {
    xspeed = -xspeed; 
}}
}


