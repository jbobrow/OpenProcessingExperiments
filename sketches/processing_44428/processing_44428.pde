
void setup() {
  size(500, 500);
  smooth();
  background(255);
  noStroke();
  fill(random(40, 180), random(20, 120), random(10, 220), random(100, 170));
  PFont font;
  font = loadFont("CamilleBD-120.vlw");
  textFont(font);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  rotate(mouseX/float(width) * TWO_PI );
  for (int i=-200;i<width*2;i=i+50) {
    for (int j=-200; j<height*2; j=j+50) {
       
      letters (i, j);
      //translate(width/2, height/2);
      //rotate(mouseX/float(width) * TWO_PI ); 
      //for (int a=0;a<width;a=a+20) {
        //for (int b=0; b<height; b=b+60) {
          //letterstwo (a, b);
        }
        
      }
        popMatrix();

    }


void mousePressed() {
  fill(random(40, 180), random(20, 120), random(10, 220), random(100, 170));
}




void letters (float x, float y) {

  text("f", x-250, y-200);
 // text("f", x+200, y);//
}

/*void letterstwo (float x, float y) {

  text("g", x, y);
}*/


