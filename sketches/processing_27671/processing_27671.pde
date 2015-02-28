
int mode = 0;


PFont font;
void setup() {

  size(640, 480);
  smooth();
  textAlign(CENTER);
  font = loadFont("Helvetica-Bold-400.vlw");
  textFont(font);
}

void draw() {

  scale(1.6);
  float h = hour();
  float m = minute();
  float s = second();

  if (h > 12) {
    h -=12;
  }

if (mode == 1){
  background(61, 77, 137);
  noStroke();
                  translate(10, 10);
  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  scale(zoom);

  fill(0, 60);
  ellipse(120, 70, 150, 150);
  ellipse(260, 270, 150, 150);
  fill(230, 250, 255);
  ellipse(155,70, 150, 150);
  ellipse(295, 270, 150, 150);
  

}

if (mode == 0){




  
      fill(56, 127, 102);
      rect(0, 0, 400, 300);
          translate(10, 10);
  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  scale(zoom);
  
      fill(0, 60);
      rotate(-.6);
      String time = nf(int(h),2);
      textSize(400);
    text(time, 60, 360);

      
      fill(214, 252, 238);
 text(time, 85, 380);


  }

  if(mode == 2){
      fill(196, 154, 108);
      rect(0, 0, 400, 300);
                translate(10, 10);
  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  scale(zoom);
      
      fill(0, 45);
      rotate(-.6);
      String time = nf(int(m), 2);
      text(time, 60, 360);
      fill(249, 233, 205);
      textSize(400);
      text(time, 85, 380);

  }

  if(mode == 3){

      fill(242, 62, 20);
      rect(0, 0, 400, 300);
                translate(10, 10);
  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  scale(zoom);
      fill(0, 60);
      rotate(-.6);
      String time = nf(int(s), 2);
      text(time, 60, 360);
      fill(249, 196, 185);

      textSize(400);
      text(time, 85, 380);

  }
}
void mousePressed(){
  mode = mode+1;
  if (mode == 4){
    mode = 0;
    save("screen.jpg");
  }
} 


