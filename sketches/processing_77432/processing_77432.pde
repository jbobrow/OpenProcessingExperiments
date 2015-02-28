

int x=1;
int inc=0;

void setup() {
  size(400, 400);
  background(0);
  //fill(247,168,7);
  frameRate(12);
}

void draw() {
  background(0);

  PFont miLetra;
  miLetra=loadFont("FrutigerLTStd-Cn-48.vlw");
  textFont(miLetra);
  fill(250, 210, 5);
  text("M", 0, 50);
  text("A", x+inc*2, 50);
  text("R", x+inc*4, 50);
  inc=inc+5;
  
 if(x+inc*4>=380){
  noLoop();
  background(0);
  text("M", random(width),random(height));
  text("A", random(width),random(height));
  text("R", random(width),random(height));
  }
  

}


