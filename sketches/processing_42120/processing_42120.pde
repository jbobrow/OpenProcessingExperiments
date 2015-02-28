
PImage pillow;
PImage Gnome;
PImage venus;
PImage sheepAM;
PImage sheepPM;
PImage greyhound;
PImage diamond;
PImage lolipop;
PImage swag;
PImage diamondgreen;
PImage bluechair;
PImage goldbars;
PImage diamondpink;
PImage fox;
PImage orangechair;
PImage cowhide;
PImage egg;
PImage yellowfox;
PImage partyhound;


int s = second();
int m = minute();
int h = hour();
int d = day();
int n = month();
int y = year();

void setup(){
  size(2000,1000);
   smooth();
   pillow = loadImage("pillow copy.png");
   Gnome = loadImage("Gnome copy.png");
   venus = loadImage("venuscopy2.png");
   sheepPM = loadImage("sheep3 copy.png");
   sheepAM = loadImage("sheep copy.png");
   greyhound = loadImage("greyhoundparty.png");
   diamond = loadImage("diamond.png");
   lolipop = loadImage("lolipop.png");
   swag = loadImage("swagcopy.png");
   diamondgreen = loadImage("diamondgreen.png");
   bluechair = loadImage("bluechaircopy.png");
   goldbars = loadImage("goldbarscopy.png");
   diamondpink = loadImage("diamondpink.png");
   fox = loadImage("whitefox copy.png");
   orangechair = loadImage("orangechaircopy.png");
   cowhide = loadImage("cowhidecopy.png");
   egg = loadImage("egg.png");
   yellowfox = loadImage("yellowfox.png");
   partyhound = loadImage("greyhoundparty.png");

  s = second();
  m = minute();
  h = hour();
  d = day();
  n = month();
}

void draw(){
  background(255);
  s = second();
  m = minute ();
  h = hour ();

  drawpillows(s/10);
  drawGnomes(m);
  drawvenus(h);
 
  
  if(  h<=12){
    drawsheepPM();
  }
  if (h > 12){
    h = h-12;
    drawsheepAM();
  }
  if(n ==1){
    drawdiamond();
  }
  
  if( n == 2){
    drawlolipop();
  }
  
  if( n == 3){
    drawswag();
  }
  
  if(n == 4){
    drawdiamondgreen();
  }
  
  if(n == 5){
    drawbluechair();
  }
  
  if(n == 6){
    drawgoldbars();
  }
  
  if(n == 7){
    drawdiamondpink();
  }
  
  if(n == 8){
    drawfox();
  }
  
  if(n == 9){
    draworangechair();
  }
  
  if(n== 10){
    drawcowhide();
  }
  
  if(n == 11){
    drawegg();
    
 
  }
     if(n == 12){
    drawyellowfox();
  }
}
  
 


  

  void drawpillows ( int p){
    for ( int i = 0; i < p; i = i+1){ 
      image (pillow, 800+i*(100), 90);
    }
 }
  
  void drawGnomes ( int g){
    for( int i = 0; i < g; i = i+1){
      image(Gnome, 300+i*(30), 240);
    }
  }
  
  void drawvenus (int v){
    for(int i = 0; i < v; i = i+1){
      image(venus, 1900+i*(-75), 450);
      
  
    }
  }
  
  void drawsheepAM (){
    
     image(sheepAM,75,550);
   
  }
  
    void drawsheepPM (){
    
      image(sheepPM,75, 550);
   
  }
  
 
 void drawdiamond(){
   image(diamond, 300, 750);
 }
 
 void drawlolipop(){
   image(lolipop,400,750);
 }
  
  void drawswag(){
    image(swag, 500, 750);
  }
  
  void drawdiamondgreen(){
    image(diamondgreen, 600,750);
  }
  
  void drawbluechair(){
    image(bluechair, 700,750);
  }
  
  void drawgoldbars(){
    image(goldbars, 800, 750);
  }
  
  void drawdiamondpink(){
    image(diamondpink, 900,750);
  }
  
  void drawfox(){
    image(fox, 1000, 750);
  }
  
  void draworangechair(){
    image(orangechair, 1100,750);
  }
  
  void drawcowhide(){
    image(cowhide, 1200,750);
  }
  
  void drawegg(){
    image(egg,1300,750);
  }
  
  void drawyellowfox(){
    image(yellowfox, 1400, 750);
  }
 
 void drawpartyhound(){
   image(partyhound, 1500, 900);
 }



