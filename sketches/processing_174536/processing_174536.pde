
int  eSize, x, y;

void setup() {
  size(500, 500);
  background(255);
  smooth();
  noStroke();
}

void draw() {
}

void mouseDragged() { 
  ellipse(mouseX, mouseY, 10, 10);
}


  void keyPressed () {
    switch(key) {
    case 'r':   ///赤色
      fill(255, 0, 0);
     break;

    case 's':   ///肌色
      fill(242,216,164);
      break;
     
     case 'b':  ///黒色
       fill(0);
       break;

     case 'w':  ///白色(消しゴム)
       fill(255);
       break;      

     case 'W':  ///リセット
     fill(255);
     rect(0,0,500,500);
       
       
       
    }
  }


