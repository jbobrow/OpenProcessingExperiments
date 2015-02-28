
//this is the dynamic tangelo

//Adam Anzivino

void setup() {
  size(500, 500);
  background(27, 190, 247);
}

void draw() {
}


//xw width yh height creates rectangle drawn from bottom center
void myRect (float x, float y, float xw, float yh) { 
  rect(x+(xw/2), (y+yh), xw, yh);
}
void mousePressed() {
  background(27, 190, 247);

//background setup
  //setup first grid underlay
  for (int x=0; x<width; x+=20) {  //sets x
    for (int y=0; y<height; y+=60) {  //sets y

      stroke(255, 255, 255);

      strokeWeight(.8);

      line(x, 0, x, width);
      line(0, y, height, y);
    }

    //setup second grid underlay
    for (int xx=30; xx<width; xx+=50) {
      for (int yy=30; yy<height; yy+=60) {

        stroke(120);

        strokeWeight(.2);

        line(xx, 0, xx, width);
        line(0, yy, height, yy);
      }
    }
    
    
    
//dynamic sketch setup

    for (float pencilX =110; pencilX <=500; pencilX +=random(40,230)) {
      for (float pencilY =110; pencilY <=500; pencilY +=random(40,230)) {
        stroke(255,255,0);
        fill(247, 123, 27, 70);
        rectMode(CENTER);
        ellipse(250, 250, pencilX, pencilY);
      }
    }
  }
}




/*       //bottom tier rectangles     w=width h= height
 for (float w=200;w<width;w= random(200,400)) {
 stroke(255);
 strokeWeight(0);
 noFill();
 
 myRect(width/2, 500, w, 50);
 
for (float widge=0; widge<500;widge+= random(-40,40)){
  fill(255,255,255,140);
  rect(widge,height,widge,height);
}
 failed design components (4+ hours of trial and error ending in error)

*/

