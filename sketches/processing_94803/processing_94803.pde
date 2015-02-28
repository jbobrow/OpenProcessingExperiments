
int x = 0;
int y = 0;
int v = 0;
PImage b;
int i;

  void setup() {
    size(720, 555);
    smooth();
    ellipseMode(RADIUS);
    background(255);
    noStroke();

}

  void draw() {
    background(62, 53, 53);  //to set it so that it can be seen
      if (random(0,10) < 0.7){  //first color of the strokes
        stroke(255);  //white
      } else {
        stroke(66, 129, 227);  //baby blue
      }
    for(i=0; i< 99; i++) {  //a batch of 99
        line(350, 100, random(1, 800), random(1, 800));
    }
    noStroke();
    x = (x+1)%400;
    y = (y+1)%50;
    v = (v+1)%35;
    b = loadImage("moon.gif");
      image(b, 60, 0);
    
    //head 
      fill(247, 241, 50);  //yellow
      rect(100+x-v, 250, 10, 30);  //first, from left
      rect(110+x-v, 240, 10, 40);  //second from left
      rect(120+x-v, 240, 10, 40);  //third from left
      rect(130+x-v, 240, 10, 60);  //fourth from left
      rect(140+x-v, 240, 10, 25);  //fifth from left 
      
    //lips
      fill(237, 134, 186);  //pink
      rect(140+x-v, 265, 10, 35);  //sixth from left
      rect(150+x-v, 265, 20, 10);  //seventh from left
      rect(140+x-v, 290, 30, 10);  //eighth from left
      rect(160+x-v, 270, 10, 20);  //ninth from left
      
    //eyes
      fill(0);  //black
      rect(130+x-v, 255, 10, 10);  //left eye
      rect(150+x-v, 255, 10, 10);  //right eye
      rect(150+x-v, 275, 10, 15);  //inside of mouth
      
    //body aka stem
      fill(147, 123, 85);  //brown
      rect(90+x, 280, 10, 30);  //first top part of the body - going down
      rect(100+x, 310, 20, 10);  //second top part of the body
      rect(120+x, 320, 10, 40);  //third top part of the body
      rect(110+x, 360, 10, 10);  //fourth part of the body - block
      rect(130+x, 360, 10, 10);  //fifth body part of the body - block
      rect(100+x, 370, 10, 40);  //left leg
      rect(140+x, 370, 10, 40);  //right leg
      
    //leaves
      fill(132, 203, 70);  //green
      rect(60+x, 310-y+v, 30, 10);  //leaf from left
      rect(60+x, 320-y+v, 50, 10);  //leaf from left
      rect(70+x, 330-y+v, 40, 10);  //leaf from left
      rect(150+x, 310+y-v, 30, 10);  //leaf from right
      rect(130+x, 320+y-v, 50, 10);  //leaf from right
      rect(130+x, 330+y-v, 40, 10);  //leaf from right
    
 }


