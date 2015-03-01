

/////////////////////// Processing

PFont font;

PImage logo;
int x = 550;
int y = 300;
void setup() {
  colorMode(RGB, 255);
  logo = loadImage("logo.png");
 size(650,550);
  background(100,255,255);
//println("available serial ports:");
//println(Serial.list());
//myPort = new Serial(this, Serial.list()[0],9600);
}

void draw(){
  
//if (myPort.available() > 0) {
  //bgsize = myPort.read();
  //println(bgsize);
 
//}
//size(logo.width*bgcolor,logo.height*bgcolor);
//rect(0,0,width,height);
x = mouseX; 
y = mouseY;
//background(100,255,255);
fill(y,x,0);

noStroke();
ellipse(x,100,x-100,x-100);

//float logo = map(bgsize,0 ,255, 255,0); //faire la même chose mais avec int //
imageMode(CORNER);
  image(logo, 40, 60, x, y);

 if(mousePressed){
    
background(100,255,255);
font = loadFont("CooperBlackStd-48.vlw");
textFont(font, 55);
fill(255,0,255);

text("PASSION ZEBRE", 75, 500);

imageMode(CORNER);
  image(logo, random(550), random(550), 50, 50);
  imageMode(CORNER);
  image(logo, random(550), random(550), 30, 30);
  imageMode(CORNER);
  image(logo, random(550), random(550), 100, 100);
  imageMode(CORNER);
  image(logo, random(550), random(550), 10, 10);
 
  
}
  }






