
//Caitlyn Lane, Assessment 2011

//DECLARATIONS
PImage b;
PImage ted;
PImage cloud1;
PImage smoke;
PImage tedf;
int xted = 360;
int yted = 490;

int xtophat = 500;

int ytophat = 200;

int xmove = 30;

int ymove = 15;

int xmoveneg = -800;

int ymoveneg = -15;

int xboundaryhigh = 800;

int xboundarylow = 0;

int yboundaryhigh = 758;

int yboundarylow = 0;

int i = 1;
PFont gorry;


int redVal = 38;
int greenVal = 200;
int blueVal = 237;




//INITIAL SETTINGS
void setup() {
  background(109, 210, 240);
    
  smooth();
  size(800, 754);
  frameRate(10);
  
  b = loadImage("backg.png");
  ted = loadImage("ted1.png");
  cloud1 = loadImage("cloud1.png");
  smoke = loadImage("smoke.png");
  
  
  
}


//REPETITION
void draw() {
  //ted's text////////////////////////
      {  gorry = loadFont("AdamGorry-Lights-30.vlw");
  {background(109, 210, 240);

if (keyPressed == true) {
  fill(0);
}else {
  fill(109, 210, 240);
}
textFont(gorry, 30);
  text("THIS IS TED", 50, 100);    
  text("THIS IS HIS MAGIC FLYING BALL", 50, 125);
  text("DON'T LET IT GET TOO CLOSE TO THE SUN!", 50, 150);
  
  }   
  
  
 image(b, -8, 210);
  image(ted, 360, 490);
image(smoke, 566, 150);
image(cloud1,100, 200);
  
//magic sun////////////////////
 
if(mouseX < width/1){
  fill(random(255),random(255),random(255),random(255));;
  stroke(247, 236, 2);
  ellipse(690, 80, 80, 80);
}else if(mouseX < 2* width/1){
  fill(random(255),random(255),random(255),random(255));
  ellipse(690, 80, 80, 80);
}
  

//magic circle//////////////////

ellipse(mouseX, mouseY, 20, 20);
   stroke(12,130,150);
   fill(random(255),random(255),random(255),random(255));
   redraw();
  }
   {
     
   }
   
   while (i < 1) {

    i = i + 1;

  }

  if((key == 'p') || (key == 'P')) {
   exit();
 

}

  {
    if (mouseX < width/20){
   fill(0);
  image(cloud1, 100, 200);
   }else if(mouseX < 2* width/2.5){
    fill(153);
    image(cloud1, 100, 200);
   }
   else{
     background(random(255),random(255),random(255),random(255));
      
     
}
  

  }
}

