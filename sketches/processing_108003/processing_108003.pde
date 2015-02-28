
/*
dumb first sketch in Processing
lots of things to fix later
original code was revised to fit JavaScript
Melanie Kim
*/

Molecule[] molecules = new Molecule[500];
Triangular player = new Triangular(250,250);
boolean start;
boolean resonatefactor;
PFont myFont;
int resonantcount;
int sfxcount;
float h;

void setup()
{
  
  size(500,500);
  colorMode(HSB,360,100,100);
  h = 190;
  
  frameRate(70);
  smooth();
  noStroke();
  start = false;
  resonatefactor = false;
  resonantcount = 0;
  
  for(int i=0; i<molecules.length;i++){
    molecules[i] = new Molecule(random(1,490),random(10,490),1);
  }
}

void draw()
{
  
  if(start == false){
    
    background(360);
    myFont = createFont("8BIT WONDER Nominal",50, true);
    textFont(myFont);
    fill(190,50,100);
    text("RESONANCE", 30+random(-1,1),250+random(-1,1));
    
    myFont = createFont("8BIT WONDER Nominal",13, true);
    textFont(myFont);
    fill(100);
    text("click to play", 170,270);
    
    myFont = createFont("8BIT WONDER Nominal",13,true);
    textFont(myFont);
    fill(100);
    text("press on to resonate", 120,285);
    
  }
    
  if(start == true){
       
    background(0);
    
    if(resonatefactor==false){
      for(int i=0; i<molecules.length;i++){
        molecules[i].update();
        molecules[i].drawMolecule();
      }
     molecules = new Molecule[500];
      
      for(int k=0; k<molecules.length; k++){
        molecules[k] = new Molecule(random(1,490),random(10,490),1);
      }
      for(int j=0; j<molecules.length;j++){
        molecules[j].update();
        molecules[j].drawMolecule();
      }
      player.update();
      player.drawme();
    }
   if(resonatefactor==true){
     background(360);
     //vibrating molecules
     for(int i=0; i<molecules.length; i++){
       molecules[i].vibrate();
       molecules[i].changecolor();
     }
     player.update();
     player.drawmeresonant(360);
   }

  }
  
}

void mouseClicked(){
  if(start == false){
    start = true;
    
  }
}

void mousePressed(){
  if(start == true){
    resonatefactor = true;   
    resonantcount++;
  }
}

void mouseReleased(){
  if(start == true){
    resonatefactor = false;
    resonantcount = 0;
    h = random(0,360);
  }
}


  

class Triangular{
  float x;
  float y;
  float rotationangle;
  float rotationspeed;
  //float distance;
  int opacity;

  Triangular(float xpos, float ypos){
    x = xpos;
    y = ypos;  
    rotationangle = 0;
    rotationspeed = 0;
    opacity = 255;
  }
  void update(){
    x = mouseX;
    y = mouseY;
  }
  
  void drawme(){
    fill(h,50,100);
    triangle(x,y-20, x-20,y+20, x+20,y+20);
  }
  void drawmeresonant(int c){    
    pushMatrix();
    translate(width/2, height/2);
    rotationangle+=radians(45);
    rotate(rotationangle);
    fill(h,50,100);
    
    if(x<=250 && y<=250){//second quadrant
      triangle(x,y-20,x-20,y+20,x+20,y+20);
    }
    else if(x<=250 && y>=250){//third quadrant
      triangle(x,500-y-20, x-20,500-y+20, x+20,500-y+20);
    }
    else if(x>=250 && y<=250){//first quadrant
      triangle(500-x,y-20, 500-x-20,y+20, 500-x+20,y+20);
    }
    else{//fourth quadrant
      triangle(500-x,500-y-20, 500-x-20,500-y+20, 500-x+20,500-y+20);
    }
    
    popMatrix();

  }
}

class Molecule{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float moleculeSize;
  int c1;
  int c2;
  int c3;
  
  Molecule(float xpos, float ypos, float msize){
    x = xpos;
    y = ypos;
    moleculeSize = msize;
    
    xSpeed = 0.2;
    xSpeed = 0.2;
    
    c1 = 255;
    c2 = 255;
    c3 = 255;
    
  }
  void update(){
    moleculeSize--;
    x+=xSpeed;
    y+=ySpeed;
  }
  void drawMolecule(){
    fill(255);
    ellipse(x,y,moleculeSize,moleculeSize);
  }
  void vibrate(){
    x+=random(-1,1);
    y+=random(-1,1);
    moleculeSize+=0.01;
  }
  void changecolor(){
    if(moleculeSize==0.01) moleculeSize=1;
    ellipseMode(RADIUS);
    for(int r = int(moleculeSize); r>0; --r){
      fill(h,50,100);
      ellipse(x,y,r,r);
    }
  }
}




