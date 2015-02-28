
PImage eyes1;
PImage eyebrows;
PImage eyesmad;
PImage eyessick;
PImage eyebrows2;



void setup(){
  
  size(600,300);
  background(206,115,69);
  smooth();
  
  
  eyes1 = loadImage("Eyes_1.png");
  eyebrows = loadImage("Eyebrows.png");
  eyesmad = loadImage("Eyes_mad.png");
  eyessick = loadImage("Eyes_sick.png");
  eyebrows2 = loadImage("Eyebrows2.png");
  
}

void draw(){
  
   image(eyebrows, 0,0);
   image(eyes1, 0,0);
   fill(206,115,69);
   noStroke();
//   ellipse(150,100, 10, 10);
//   ellipse(454,100, 10, 10);
}
      
  void mouseMoved(){
  noStroke ();
  ellipse(150,100, 10, 10);
  ellipse(454,100, 10, 10);
  
  }


  void keyPressed(){
    if(key=='m' || key=='M'){
      image(eyesmad, 0, 0);
  }

    if(key=='s' || key=='S'){
      image(eyessick, 0, 0);
  }
  
//  if(key=='r' || key=='R'){
//    image(eyes1, 0, 0);
//  }
}

void mouseReleased(){
      image(eyebrows2, 0, 0);
  }

