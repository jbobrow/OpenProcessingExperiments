
PImage Hintergrund;
PImage Vogel;


void setup(){
  size(1350,800);
  Hintergrund = loadImage("_MG_6936.JPG");
  Vogel = loadImage("Vogel.png");
  

}

void draw(){
  image(Hintergrund,0,0);
  if(mousePressed){
    pushMatrix();                          
    translate(mouseX, mouseY);
    imageMode(CENTER);
    image(Vogel, 0, 0);
    imageMode(CORNER);
    popMatrix();
  }
{
}  
}


