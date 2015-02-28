
//Based on "basicRotationWithSin" "PlotAveragePowerDesktop" Mick Grierson, Matthew Yee-King, Marco Gillies
//and "Hexagons" by rupert russell http://openprocessing.org/visuals/?visualID=26607
//The MIT License (MIT) - See Licence.txt for details
//by Mark Wilcox for Coursera digital media

Maxim maxim;
AudioPlayer player;
boolean playit;
PImage img;

float magnify = 300; // This is how big we want the rose to be.
float rotation = 0; // rotation : this is basically how far round the circle we are going to go
float radius = 0; // radius : this is basically how far from the origin we are.
int elements = 64;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 

float x_c;
float y_c;
float side;
float x_v1;
float y_v1;
float x_v2;
float y_v2;
float x_v3;
float y_v3;
float x_v4;
float y_v4;
float x_v5;
float y_v5;
float x_v6;
float y_v6;


void setup()
{
  size(1024, 1024);
  rectMode(CENTER);
  colorMode(RGB);
  frameRate(120);
  maxim = new Maxim(this);
  player = maxim.loadFile("bocloop.wav");
  player.setAnalysing(true);
  player.setLooping(true);
  playit = false;
  img = loadImage("gradient.png");
}

void draw()
{
  if(playit){
    image(img, 0, 0);
    
    player.play();
    
    float pow = player.getAveragePower();
    
    powmapped = map(2*pow, 0, 1, 0, 255);
    radius = map((pow*256), 0, width, 0, 30);
    rotation = map(mouseX, mouseY, height, 5, 10);
    float spacing = TWO_PI/elements; // this is how far apart each 'node' will be - study it. 
    
    translate(width*0.5,height*0.5);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.
    
    float side = powmapped;
    float x_c = 5;
    float y_c = 5;
    
    x_v1 = x_c - (side /4) * 3;
    y_v1 = y_c;
     
    x_v2 = x_c - (side * 0.375);
    y_v2 = y_c + (side * 0.65);
     
    x_v3 = x_c + (side * 0.375);
    y_v3 = y_c + (side * 0.65);
     
    x_v4 = x_c + (side /4) * 3;
    y_v4 = y_c;
     
    x_v5 = x_c + (side * 0.375);
    y_v5 = y_c - side * 0.65;
     
    x_v6 = x_c - (side * 0.375);
    y_v6 = y_c - side * 0.65;

    
    for (int i = 0; i < elements;i++) {
        fill(0,powmapped/2,powmapped,100);
        noStroke();
        pushMatrix();
        rotate(spacing*i*rotation);
        translate(sin(spacing*i*radius)*magnify, 0);
        beginShape();
        vertex(x_v1, y_v1);
        vertex(x_v2, y_v2);
        vertex(x_v3, y_v3);
        vertex(x_v4, y_v4);
        vertex(x_v5, y_v5);
        vertex(x_v6, y_v6);
        endShape(CLOSE);

        popMatrix();
    }
  }
  else{
    text("Click to play", width/2, height/2);
  }

}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}

void mousePressed()
{
  playit = !playit;
  
  if (playit){
    player.play();
  }
  else {
    player.stop();
  }
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}

