
/* @pjs preload="image1.jpg"; */
/* @pjs preload="image2.jpg"; */
/* @pjs preload="image3.jpg"; */
/* @pjs preload="image4.jpg"; */
/* @pjs preload="image5.jpg"; */
/* @pjs preload="ameba.png"; */
/* @pjs preload="fish.png"; */
/* @pjs preload="turtle.png"; */
/* @pjs preload="monkey.png"; */
/* @pjs preload="man.png"; */



PImage ameba;
PImage fish;
PImage turtle;
PImage monkey;
PImage man;
PImage image1;
PImage image2;
PImage image3;
PImage image4;
PImage image5;

float counter;

int i = 1;

void setup(){
   size (800,600);
   frameRate(50);
ameba=loadImage("ameba.png");
fish=loadImage("fish.png");
turtle=loadImage("turtle.png");
monkey=loadImage("monkey.png");
man=loadImage("man.png");
image1=loadImage("image1.jpg");
image2=loadImage("image2.jpg");
image3=loadImage("image3.jpg");
image4=loadImage("image4.jpg");
image5=loadImage("image5.jpg");
}
  void draw(){
  
  counter = millis()/200;
   
   //ameba below 
    i = i + 1;
    if (i==5){
    background(image1);
    }
    if (counter>=5 && counter <=14){
      ameba.resize(300,200);
      image(ameba, 0+(counter*5),250);
    }
    //fish below
     if (i==120){
     background(image2);
     }
    if (counter>=16 && counter<=32){
       image(fish,25+(counter*5),200);
   }
   //turtle below
   if (i==330){
     background(image3);
   }
   if (counter>=38 && counter <= 46){
     turtle.resize(300, 150);
     image(turtle, 5 +(counter*5), 350);
   }
  //monkey below
  if (i==450){
    background(image4);
  }
  if (counter>=51 && counter<=58){
    monkey.resize(200, 150);
    image(monkey, 80+(counter*5), 350);
  }
  //man below
  if (i==550){
    background(image5);
    man.resize(200,200);
    image(man, 300, 400);
  }
  if (i==570){
    textSize(100);
    fill(#2344E5);
    text("GEICO", 300, 100);
    
 }
 if (i==620){
   textSize(15);
   fill(#2344E5);
   text("15 Minutes Can Save You 15% or More on Car Insurance", 275,150);
  }
  }


