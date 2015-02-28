
//magic box

void setup() {
  size(300, 300);
  colorMode(HSB, 100);
  smooth();
}

int x = 0;

void draw() {
  background(40, 50, 50);
  fill(80);
  rect(0, 0, width, height/2);
  strokeWeight(1);
  fill(60, 50, 20);
  quad(width*1/8, height*3/8, width*1/8, height*6/8, width*4/8, height*6/8, width*4/8, height*2/8);
  fill(60, 50, 50);
  quad(width*4/8, height*2/8, width*4/8, height*5/8, width*5/8, height*6/8, width*5/8, height*3/8);
  fill(60, 50, 90);
  quad(width*2/8, height*7/8, width*5/8, height*6/8, width*5/8, height*3/8, width*2/8, height*4/8);
  fill(60, 50, 70);
  quad(width*2/8, height*4/8-x, width*5/8, height*3/8-x, width*4/8, height*2/8-x, width*1/8, height*3/8-x);
  fill(60, 50, 50);
  quad(width*1/8, height*3/8, width*2/8, height*4/8, width*2/8, height*7/8, width*1/8, height*6/8);
}
//a box is created by utilizing quads with shading
void mouseDragged() {
  x++;
  if (mouseY>150) {
    x--; //this line is to undo the code that raises the lid
    x--; //this line allows you to lower the lid
  }
}

//operation:  drag the mouse around in the gray region to raise the lid.
//            drag the mouse around in the green region to lower the lid.
//CAUTION:    lowering the lid too far will destroy the illusion.



