
PImage waterfall;
PImage tree;

void setup(){
  size(300,300);
  waterfall = loadImage("harperscreek.JPG");
    tree = loadImage("tree.jpg");
  noStroke();
  smooth();
}

int sqre = 5; 

void draw(){
  background(0);
  
  
  for(int y=sqre; y <= 299; y+=sqre){    
    for(int x=sqre; x <= 299; x+=sqre){

// gets color from tree pic
color treeoverlay = color(tree.pixels[x + (y * 300)]);
      fill(treeoverlay);

    // sets square sizes
    float sqresize = sqre*(brightness(waterfall.pixels[x + (y * 300)]) / 255);
      rect(x,y,sqresize,sqresize);
    }}}

