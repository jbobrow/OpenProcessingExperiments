
float R = 20;
float counter = 0;
   
color[] palette = { #ff226a, #bfba3a, #f6852c, #ffa31a, #cbbf57, #5fc7af, #6d6689, #f98090, #f5e0ad };
   
PImage pic1;
PImage pic2;
PImage pic3;
PImage pic4;
PImage pic5;
PImage pic6;
PImage pic7;
PImage pic8;
PImage pic9;
PImage pic10;

 
/* @pjs preload="move1.jpg"; */
/* @pjs preload="move2.jpg"; */
/* @pjs preload="move3.jpg"; */
/* @pjs preload="photo1.JPG"; */
/* @pjs preload="pic5.JPG"; */
/* @pjs preload="pic6.JPG"; */
/* @pjs preload="pic7.JPG"; */
/* @pjs preload="pic8.JPG"; */
/* @pjs preload="pic9.JPG"; */
/* @pjs preload="pic10.JPG"; */

void setup() {
    size(600, 600);
    //ellipseMode(RADIUS);
    pic1=loadImage ("move1.jpg");
    pic2=loadImage ("move2.jpg");
    pic3=loadImage ("move3.jpg");
    pic4=loadImage ("photo1.JPG");
    pic5=loadImage ("pic5.JPG");
    pic6=loadImage ("pic6.JPG");
    pic7=loadImage ("pic7.JPG");
    pic8=loadImage ("pic8.JPG");
    pic9=loadImage ("pic9.JPG");
    pic10=loadImage ("pic10.JPG");
    frameRate(3);
    
   // size(500,500);
}
   
void draw() {
    float t = millis() * 1e-3;
    //int k = floor((t + 1) / 2);
    boolean isEven =  (t % 2 < 1);
    noStroke();
    translate(0.3 * width, 0.1 * width);
   
    int index = (int) random(1,11);
    
    if (index == 1) {
       //rect (30,10,100,200);
       image(pic1,130,50,300,300);
       tint(#ffb312);
 
    } else if (index == 2) {
       //rect (40,0,50,50);
       image(pic2,-150,-40,200,200);
       tint(#4cc3ac);
    } else if (index == 3) {
       //rect (40,0,50,50);
       image(pic3,-180,10);
       tint(#4cc3ac);
    } else if (index == 4) {
       //rect (40,0,50,50);
       image(pic4,220,290,180,240);
       tint(#4cc3ac);
    }else if (index == 5) {
       //rect (40,0,50,50);
       image(pic5,180,80,100,100);
       tint(#4cc3ac);
    }else if (index == 6) {
       //rect (40,0,50,50);
       image(pic6,-150,290,100,100);
       tint(#ffb312);
    }else if (index == 7) {
       //rect (40,0,50,50);
       image(pic7,-10,-40,80,70);
       tint(#ffb312);
    }else if (index == 8) {
       //rect (40,0,50,50);
       image(pic8,-180,-60,600,600);
       tint(#ffb312);
    }else if (index == 9) {
       //rect (40,0,50,50);
       image(pic9,-180,-60,600,600);
       tint(#ffb312);
    }else if (index == 10) {
       //rect (40,0,50,50);
       image(pic10,-180,-60,600,600);
       tint(#ffb312);
    }
    
    //for(int i = 0; i < 300000000; i++);
  }
  



