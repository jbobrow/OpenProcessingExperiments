
//Danielle Gorodenzik
//Final Creative Computing
//May 14

PImage israelMap, caliMap, newyorkMap;

PImage airplane;
PImage brooklynbridge;
PImage goldengatebridge;
PImage goldstar;
PImage jerusalem;
PImage monit;
PImage azri;
PImage empire;
PImage subway;
PImage martini;
PImage malibu;
PImage mercedez;
PImage disney;



PImage[] israel = new PImage[4];
PImage[] cali = new PImage[4];
PImage[] newyork = new PImage[4];

boolean mouseoff = false;
PImage currentIsrael, currentNewyork, currentCali;

void setup () {
  size (600, 600);
  
  israelMap = loadImage("israel.png");
  caliMap = loadImage("cali.png");
  newyorkMap = loadImage("newyork.png");
  brooklynbridge = loadImage("brooklynbridge.png");
  goldengatebridge = loadImage("goldengatebridge.png");

  israel[0] = loadImage("goldstar.png");
  israel[1] = loadImage("jerusalem.png");
  israel[2] = loadImage("azri.png");
  israel[3] = loadImage("monit.png");
  
  newyork[0] = loadImage("empire.png");
  newyork[1] = loadImage("martini.png");
  newyork[2] = loadImage("subway.png");
  newyork[3] = loadImage("brooklynbridge.png");
  
  cali[0] = loadImage("goldengatebridge.png");
  cali[1] = loadImage("malibu.png");
  cali[2] = loadImage("mercedez.png");
  cali[3] = loadImage("disney.png");
  
  airplane = loadImage("airplane.png");
  
}

void draw () {
  background(255);

  //maps and airplane
  image(israelMap, 50, 20);
  image(caliMap, 450, 20);
  image(newyorkMap, 280, 400);
  image(airplane, mouseX, mouseY);
  
  // Three Corners
  
  
  if ((mouseX>0)&&(mouseX<75)&&(mouseY>0)&&(mouseY<75)) { //Israel
      if (mouseoff == true) {
         currentIsrael = israel[int(random(israel.length))];
         mouseoff = false;
      }
      image(currentIsrael, 0,0);
      
  } else if ((mouseX>400)&&(mouseX<600)&&(mouseY>0)&&(mouseY<400)) { //California 
     if (mouseoff == true) {
         currentCali = cali[int(random(cali.length))];
         mouseoff = false;
      }
      image(currentCali, 0,0);
    
    
  } else if ((mouseX>200)&&(mouseX<300)&&(mouseY>400)&&(mouseY<600)) { //New York
    if (mouseoff == true) {
         currentNewyork = newyork[int(random(newyork.length))];
         mouseoff = false;
      }
      image(currentNewyork, 0,0);
      
  } else { //Nothing
    mouseoff = true;
  }
  
}
