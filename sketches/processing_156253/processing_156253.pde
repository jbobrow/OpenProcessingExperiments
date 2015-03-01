
PFont myFont1; 
PFont myFont2;
PShape luv;
PShape broken;
PImage luvbg;
float diameter; 
float angle = 0;

void setup() {
  size(640, 480);
  diameter = height - 80;
  fill(255, 0, 0);
  
  myFont1 = createFont ("Arial Black", 32);
  myFont2 = createFont ("Arial Black", 48);
  
  luv = loadShape("Love_Heart_SVG.svg"); 
  broken = loadShape("Broken_heart.svg");
  luvbg = loadImage("bg.gif");
}

void draw() { 
  //load background image
  image(luvbg,0,0, width, height);
  
  float dia = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  
  if (mousePressed) {
    shapeMode(CENTER);
    shape(broken, width/2 +70, height/2 +50, 600,500);
    
    fill(0);
    textAlign(CENTER);
    textFont(myFont2);
    text("HAHA JUST KIDDING", width/2, height/2 + 100);
  
  } else {
    fill(0);
    textAlign(CENTER);
    textFont(myFont1);
    text("I LOVE YOU!", width/2, dia/2);
    text("Click the heart to see my surprise", width/2, height - 50);
    
    shapeMode(CENTER);
    shape(luv, width/2, height/2, dia, dia);
  }
  
  angle += 0.04;
 
}



