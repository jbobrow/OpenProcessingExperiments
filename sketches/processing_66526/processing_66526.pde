
PFont ninjasound;
boolean po;
boolean slap;
boolean whap;
boolean crack;
PImage p;
PImage s;
PImage w;
PImage c;

void setup() {

  size (721, 1000);

  PImage ninja2 = loadImage ("ninja2.jpg");
  imageMode (CENTER);
  image (ninja2, width/2, height/2);
  
  p = loadImage ("pow.jpg");
  s = loadImage ("slap.jpg");    
  w = loadImage ("whap.jpg");  
  c = loadImage ("crack.jpg");
  po = false;
  slap = false;
  whap = false;
  crack = false;
}


void mousePressed () {
  
  //pow
  if (po ==false && slap == false && whap == false && crack ==false) { 
    
    po = true;
    imageMode (CORNER);
    image (p, width/2, height/2);
  }
  
  //slap
  else if (po == true && slap == false && whap == false && crack == false) {

    slap = true;
    
    imageMode (CORNER);
    image (s, 100, 100);
  }
  
  //whap
  else if (po == true && slap == true && whap == false && crack == false) {
    
    whap = true;
    
    imageMode (CORNER);
    image (w, 20, 400);
  }
  
  //crack
  else if (po == true && slap == true && whap == true && crack == false){
    
    crack = true;
    
    imageMode (CENTER);
    image (c, width/2, height/2);
  }
  
  //ninja beaten
  else if (po == true && slap == true && whap == true && crack == true){
    PImage ninja2 = loadImage ("ninja1.jpg");
    imageMode (CENTER);
    image (ninja2, width/2, height/2); 
  }
}

void draw () {

  
  if (mouseX< width && mouseY < height && po == false && slap ==false&&whap==false&&crack==false) {
    ninjasound = loadFont ("Gotham-Medium-60.vlw");
    textFont (ninjasound);
    text("wuah!", 250, 100);
  }
  
  if (po == true && slap == true && whap == true && crack == true){
    
   fill (mouseX, mouseY, -mouseY);
    noStroke ();
    ellipse(350, 150, 10, 10);
    noStroke ();
    ellipse(300, 130, 15, 15);
    noStroke ();
    ellipse(360, 180, 10, 10);
    noStroke ();
    ellipse(350, 100, 30, 30);
    noStroke ();
    ellipse(310, 70, 10, 10);
    noStroke ();
    ellipse(280, 150, 15, 15);
    noStroke ();
    ellipse(400, 125, 10, 10);
    noStroke ();
   ellipse(335, 60, 20, 20);
    noStroke ();
    ellipse(390, 80, 10, 10);
    noStroke ();
    ellipse(330, 110, 15, 15);
    noStroke ();
    ellipse(350, 100, 5, 5);
    
 
  }
    
}







