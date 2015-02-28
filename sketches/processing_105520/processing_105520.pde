
//Joselyn McDonald
//GUI example 
PImage background;
PImage beach; 
PImage mountains; 
PImage panda;
PImage lotus; 
PImage beer;
PImage eagle;
PImage yoga;

int screenRt; 
int screenTp;
int screenLt;
int screenBt;

float bsize;

float xPos;
float yPos; 

float xVel; 
float yVel; 

float velSwitch;

PFont introFont;

boolean backgroundState;


void setup(){
  
  size (1000, 1000); 
  background = loadImage("oldcomputer.jpg");
  mountains = loadImage("rocky_mountain_tours.jpg");
  panda = loadImage("Face-Baby-Panda.jpg");
  lotus = loadImage("lotus.jpg");
  beer = loadImage("beer_toast.jpg");
  eagle = loadImage("eagle.jpg");
  yoga = loadImage("relaxation_with_yoga_by_efoja.jpg");
  
screenRt = 720;
screenTp = 120;
screenLt = 260; 
screenBt = 485; 

velSwitch = -1;

  bsize = 100;
  xPos = width/2;
  yPos = width/2 - 200;
  
  xVel = 5;
  yVel = 5;
  
  introFont = loadFont("Consolas-Bold-20.vlw");
} 
  

void draw(){
  image (background, 0, 0);
  
  fill(0);
  
  String[] text = new String[7];
  text[0] = "Click ";
  text[1] = "ball ";
  text[2] = "if ";
  text[3] = "you're ";
  text[4] = "in ";
  text[5] = "DTBootcamp ";
  text[6] = "2013!";
  int textPos = 0;
  textFont(introFont);


  
  for (int i = 0; i < 7; i = i+1) {
     fill(i * 15, i * 35, i * 35);
     text(text[i], 240 + textPos, 79);
     textPos = textPos + (12*(text[i].length()));
  }
     stroke(239, 18, 205);
     strokeWeight(10);
     for (int i = 0; i < bsize; i+=30) {
     fill(0, 154 , 255);
    ellipse(xPos, yPos, bsize, bsize);
  }

    //ellipse(xPos, yPos, bsize, bsize);
    
  
//  noStroke();
//  fill(0, 240, 255); 
//  smooth();
//  ellipse(xPos, yPos, bsize, bsize); 
//  
  
  xPos = xPos + xVel;
  if(xPos > (screenRt - bsize/2) || xPos < screenLt + bsize/2) {
    xVel = xVel*-1;
  }
  
   yPos = yPos + yVel;
  if(yPos > (screenBt - bsize/2) || yPos < screenTp + bsize/2) {
    yVel = yVel*-1;
  }
  
  PImage[] words = {beer, panda, lotus, mountains, eagle, yoga};
  
  
    
    if (backgroundState == true){
     int index = int(random(words.length));
     image(words[index], 0, 0); 
    } 
 }
   
    // if(dist(mouseX, mouseY, xPos, yPos) < bsize/2){
    


void mouseClicked(){
  backgroundState = !backgroundState;

    
}
