
float v;
float c;
PImage img;
PImage imgFlash;
PImage b;
int imageCount = 0;
int[] xpos = new int[300]; 
int[] ypos = new int[300];

void setup() {
  
  size(625,469);
  img=loadImage("park.jpg");
  imgFlash=loadImage("park flash.jpg");

b = loadImage("park flash.jpg");
  
  smooth();
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
}
void draw() {
    v=random(0,100);
    c=random(50,100);

  if (mousePressed) {
      background(b);
    image(imgFlash,0,0);
  
    
  } else {
    image(img,0,0);
    }
  for (int i = 0; i < xpos.length-1; i ++ ) {
   //stop after 2nd circle
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
//update at last mouse location
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
  
  for (int i = 0; i < xpos.length; i ++ ) { //array
    stroke(255,0,0,100);
    strokeWeight(1.5);
    fill(255,255,0);
    ellipse(xpos[i],ypos[i], random(1,13), random (1,13)); //sparkling
    frameRate (20);
}
}
void mousePressed () {
  save("flash_"+imageCount+".jpg");
  imageCount++;
}


