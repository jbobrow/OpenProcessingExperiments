
// TAYLOR SAVVY
// N LALLY PROCESSING CLASS
// MAKE YOUR OWN MALEVICH


PImage paper; // paper texture
float x;
float y;
void setup(){
  x=random(800);
  y=random(800);
  
  paper = loadImage("paper.png");
  size(800,800);
  smooth();
  noStroke();
  background(255);
        image(paper,0,0,800,800);

        
           tint(255,255,255,15);
   image(paper,0,0,800,800);

}
  
  void draw(){
                       fill(0);
        rect(x,y,300,300);
  }
void mouseClicked(){
setup();
}
   

