
/**
*Pick colours from a picture.<br />
*If you can't see an applet, please set the applet runtime option to: '-Xmx500m'<br />
*2010 © peter bosshard schneider
*/

// pick colours from a picture
PFont schrift;
PImage bild;
PImage stats;
int messy;
float cpx = 0;
float cpy = 0;
String txt = "click on the image to get colour information and mouse position.";
float sum = 0;
color bright = color(255);
color dark = color(0);
color displaycolor = dark;

void setup() {
  size(600, 600);
  background(204);
  schrift = loadFont("SansSerif-11.vlw");
  textFont(schrift);
  textMode(SCREEN);
  bild = loadImage("mountain.jpg");
  stats = new PImage(600,200);
  messy  = 0;
  ellipseMode(CENTER);
}

void draw() {
  background(204);
  image(bild,0,0);
  image(stats,0,400);

  // show text and graphics brighter or darker than the background
  if(sum<127){
    displaycolor = bright;
  }
  else{
    displaycolor = dark;
  }


  if((cpx>0)&&(cpy>0)){
    // show picked point and lines
    stroke(255,0,0,255);
    strokeWeight(1);
    noFill();
    ellipse(cpx,cpy,4,4);
    line(0,cpy,cpx-2,cpy);
    line(cpx+2,cpy,width,cpy);
    line(cpx,0,cpx,cpy-2);
    line(cpx,cpy+2,cpx,height-30);  

    // show rgb values of horizontal line picked
    bild.loadPixels();
    for(int i= int(cpy*bild.width)+1;i<int(cpy+1)*bild.width;i++){
      color c = bild.pixels[i];
      float r = red(c); // Get the red value
      float g = green(c);
      float b = blue(c);
      stroke(displaycolor);
      strokeWeight(1);
      line(i%bild.width,height-30,i%bild.width,height-30-(b/255*50));
      line(i%bild.width,height-90,i%bild.width,height-90-(g/255*50));
      line(i%bild.width,height-150,i%bild.width,height-150-(r/255*50));
    }
    bild.updatePixels();
 }
  noStroke();
  
  fill(102,102,102,153);
  rect(0,height-90,30,12);
  rect(0,height-150,30,12);
  rect(0,height-200,30,12);
  
  fill(0,102,255,255);
  text("Blue",2,height-80);
  fill(0,255,0,255);
  text("Green",2,height-140);
  fill(255,0,0,255);
  text("Red",2,height-190);
  
  fill(displaycolor);
  text(txt,20,height-10);
}

void mouseReleased(){
  cpx = mouseX;
  messy  = constrain(mouseY, 0, 400);
  int my = 0;
  if(messy >= 400){
    my = 0;
  }
  else{
    my = messy;
  }
  cpy = my;
  bild.loadPixels();
  stats.loadPixels();
  color c = bild.pixels[my*width + mouseX];
  float r = red(c); // Get the red value
  float g = green(c);
  float b = blue(c);
  for(int j = 0; j <stats.pixels.length-1;j++){
    stats.pixels[j] = color(r,g,b,255);
  } 
  sum = r+g+b/3;
  stats.updatePixels();
  bild.updatePixels();
  txt = ("X: " + cpx + " Y:" + cpy + " | COLOUR R: " + int(r) + " G: " + int(g) + " B: " + int(b) + " HEX #" + hex(int(r),2) + hex(int(g),2) + hex(int(b),2));
}





