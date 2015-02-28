
color [] palette; 
int selector =0;
PImage base; 
PShape blosangeles; 
PShape blala;
PShape bwings;
PShape bhead;
PShape bfucklife;
PShape blovelife;
float easing = 0.6;
int angle = 215;
boolean mousePressedNow = false;
int xlala = 488;
int ylala = 258;
int always = 100;
int xlosangeles = 264;
int ylosangeles = 284;
int xwing = 264;
int ywing = 462;

boolean button = false;



void setup() { 
size(765,976); 
background(255); 
shapeMode(CENTER);
// load images // 
base = loadImage("back.png");
// load shapes // 
blosangeles = loadShape("b_losangeles.svg");
blala = loadShape("b_lala.svg");
bwings = loadShape("b_wings.svg");
bhead = loadShape("b_head.svg");
bfucklife = loadShape("b_fucklife.svg");
blovelife = loadShape("b_lovelife.svg");
palette = new color[5]; 
 palette[0]  = #F00777; // pink
 palette[2]  = #291F41; // navy
 palette[1]  = #EFCC09; // yellow
 palette[3]  = #F93E27; // orange
 palette[4]  = #212121; // matte blk
 



}


void draw () {  
// background // 
image(base, 0,0); 
fucklife(); 

lovelife();// los angeles fade 
blosangeles.disableStyle(); 
fill(0,95);  
noStroke();
shape(blosangeles, 264,282); 
// overlay los angeles 
blosangeles.enableStyle(); 
// overlay los angeles mouse EVENT // wiggle
 if ( dist(xlosangeles, ylosangeles, mouseX, mouseY) < always ) {
      noCursor();
 
   angle += 1;
    float val = cos(radians(angle)) * 2.0;
    for (int a = 220; a < 560; a += 975) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
        blosangeles.disableStyle(); 
        selector = int(random(2));
  fill(palette[selector]); 
      shape(blosangeles, 380 + yoff,500 +xoff, 1200,1200);  
      blosangeles.enableStyle();
shape(blosangeles, mouseX + xoff, mouseY + yoff, 300,300); }
} else 
 shape(blosangeles, 258,283);


// laLA fade 
blala.disableStyle(); 
fill(0,95);  
noStroke();
shape(blala, 484,282); 
// overlay laLA
blala.enableStyle();  
 if ( dist(xlala, ylala, mouseX, mouseY) < always ) {
    angle += 4;
    float val = cos(radians(angle)) * 5.0;
    for (int a = 202; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
     shape(blala, 380+xoff, 500+yoff, 2000, 2000);}
} else 
shape(blala, 488,278); 

// wings fade 
bwings.disableStyle(); 
fill(0,95);  
noStroke();
shape(bwings, 264,462); 
// overlay wings
bwings.enableStyle();  
 if ( dist(xwing, ywing, mouseX, mouseY) < always ) {
    angle += 4;
    float val = cos(radians(angle)) * 5.0;
    for (int a = 202; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
     shape(bwings, xwing+100, ywing+50, 800, 800);
   bwings.disableStyle(); 
 shape(bwings, xwing + xoff, ywing + yoff, 500, 500);   }
} else 
shape(bwings, 258,468); 

// head fade 
bhead.disableStyle(); 
fill(0,95);  
noStroke();
shape(bhead, 504,462); 
// overlay head
bhead.enableStyle();  
shape(bhead, 508,468); 
// fucklife fade 
bfucklife.disableStyle(); 
fill(0,95);  
noStroke();
shape(bfucklife, 264,643); 
// overlay fucklife
bfucklife.enableStyle();  
shape(bfucklife, 258,648); 
blovelife.disableStyle(); 
fill(0,95);  
noStroke();
shape(blovelife, 494,648); 
// overlay lovelife
blovelife.enableStyle();  
shape(blovelife, 498,652);

}

void fucklife () {
// fucklife fade  
// overlay fucklife
bfucklife.enableStyle();  
shape(bfucklife, 258,648); 
if (mousePressed){
    
      for(int i=0; i<1; i++)
      {
        bfucklife.disableStyle(); 
        selector = int(random(5));
  fill(palette[selector]); 
        shape(bfucklife, xwing+116, ywing+45, 2400, 2400); 
      }
}
}
  
void lovelife () {  
// lovelife fade  
if (keyPressed){
    
      for(int i=0; i<1; i++)
      {fill(palette[1]); 
   angle += 4;
    float val = cos(radians(angle)) * 5.0;
    for (int a = 202; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      blovelife.disableStyle();  
        shape(blovelife, xwing+116, ywing+45, 2400, 2400); 
      
     
}
}
}
}

 void mousePressed(){
  if (mousePressed = true);
image(base, 0,0); 
}


