
int x = 5;
float b = 80;
PFont myfont;

void setup(){
  size(800,500);
  PImage shark = loadImage("Animal-pictures-sharks-wallpapers-hd-photos-shark-wallpaper-12-1-1.jpeg");
  background(shark);


  myfont = loadFont("Helvetica-Bold-80.vlw");
}

void draw(){
 

}


void mousePressed(){
   
      fill(random(255),random(255),random(255));
      textSize(40);
      textFont(myfont);

   text("QUIET HOURS.",mouseX,mouseY);
  b = b-10;
 
  
}

void keyPressed(){
  rect(random(800),random(800),30,30);
  
}


