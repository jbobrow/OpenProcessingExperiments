
int xPos; 
int yPos; 
int valueX; 
int valueY; 

int rColor; 
int gColor; 
int bColor;  

PFont font;



void setup () {
size(500,500);

xPos= width/2; 
yPos= height/2; 


font = loadFont("Clearface-HeavyItalic-48.vlw");
  textFont(font);
  textSize(15);

}


void draw(){

background(0); 

// text (string, x,y)
fill(255,255,255); 
text ("Dragg the mouse!", xPos -20 ,20); 

fill(255,255,255);
ellipse(xPos, yPos, 50, 50);
 
fill(rColor); 
ellipse(valueX, valueY, 50,50);


  
  
  
}

void mouseDragged() {
  
  valueX= int (random(1, 500)); 
    
  valueY= int (random(1,500)); 
  
  rColor = int (random(0,255)); 
  gColor = int (random(0,255));
  bColor = int (random(0,255));
  
  
}





