
/* "Pollock Painting Program" by Nicolas Campbell 3097667

Inspired by the work of the artist Jackson Pollock and his painting style.
Now create your own Pollock ripoffs in the comfort of your own home!

Left click and hold to use Pollock's predominant colours
Right click and hold to use Pollock's supplementary colours
Spacebar to clear if you really want to.

Otherwise just paint over it,go crazy with the layers!*/

PImage splatter1;
PImage splatter2;

//factor that reduces size over time to reflect paint dripping less
float shrink = 1.0;
float shrinkRate = random(0.04,0.06);

//color array
color[] palette= {
  color(255,98,4), color(255,229,7), color(0),};
  
color[] palette2= { color (138,163,185), color (92,123,95), color(255),};  

void setup(){

  //load image
  splatter1 = loadImage("splatter1plain.png");
  splatter2 = loadImage("splatter2.png");

  size(600,400);
  smooth();
  stroke(0);
  background(255,253,240);
}

void draw(){
  //draw when mouse pressed
  if (mousePressed == true){

  if (mouseButton == LEFT){   
    image(splatter1,mouseX-10,mouseY-10,(splatter1.width/shrink),(splatter1.height/shrink));
  }
    else if (mouseButton == RIGHT){   
    image(splatter2,mouseX-10,mouseY-10,(splatter2.width/shrink),(splatter2.height/shrink));
  }
  }

}

void mousePressed(){
  
  if (mouseButton == LEFT){
  //cyle randomly through palette array of set colours
  tint(palette[(int) random(palette.length)]);
}
else if (mouseButton == RIGHT){
  tint(palette2[(int) random(palette2.length)]);
}

}

void mouseDragged(){

  if (mousePressed) {   
    shrink = shrink + shrinkRate;
  }
}

void mouseReleased() {
  shrink = 1;
}


void keyPressed() { 
  if (key == ' ') { 
   background(255,253,240);
} 
}






