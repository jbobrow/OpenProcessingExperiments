
PImage rm1;
PImage rm2;
PImage rm3;
 
PImage model1;
PImage model2;
PImage model2b;
PImage model3;
PImage model4;
PImage couch;
PImage rug;
PImage wa1;
PImage wa2;
PImage wa3;
PImage hookah;
PImage dancers1;
PImage dancers2;
PImage light1;
PImage light2;
PImage light3;
PImage light4;
PImage mushroom;
PImage birds;
PImage bottle;
PImage chandelier;
PImage elephant;
PImage rain;
PImage disco;
 
void setup() {
  size(900,600);
  smooth();
   
  rm1 = loadImage("room1.png");
  rm2 = loadImage("room2.png");
  rm3 = loadImage("room3.png");
   
  model1 = loadImage("model1.png");
  model2 = loadImage("model2.png");
  model2b = loadImage("model2b.png");
  model3 = loadImage("model3.png");
  model4 = loadImage("model4.png");
  couch = loadImage("couch.png");
  rug = loadImage("rug.png");
  wa1 = loadImage("wallart1.png");
  wa2 = loadImage("wallart2.png");
  wa3 = loadImage("wallart3.png");
  hookah = loadImage("hookah.png");
  dancers1 = loadImage("dancers1.png");
  dancers2 = loadImage("dancers2.png");
  light1 = loadImage("light1.png");
  light2 = loadImage("light2.png");
  light3 = loadImage("light3.png");
  light4 = loadImage("light4.png");
  mushroom = loadImage("mushroom.png");
  birds = loadImage("birds.png");
  bottle = loadImage("bottle.png");
  chandelier = loadImage("chandelier.png");
  elephant = loadImage("elephant.png");
  rain = loadImage("rain.png");
  disco = loadImage("disco.png");
  
  noLoop();   
}
 
void draw(){
    background(255);

  float r = random(0, 12);
  if (r < 2) {
    image(rm1, 0, 0);
    image(rug, 213, 425);
    image(couch, 300, 300);
    image(model3, 380, 248);
    image(model2, 72, 370);
    image(hookah, 545, 390);
    image(model1, 620, 210);
    image(wa1, 0, 0);
    image(rain, 0, 0);
  }else if (r < 4){
    image(rm1, 0, 0);
    image(rug, 213, 425);
    image(couch, 300, 300);
    image(wa2, 0, 0);
    image(model3, 390, 248);
     pushMatrix();
       scale(.72);
       rotate(radians(15));
       image(hookah, 640, 210);
     popMatrix();
     image(model2b, 100, 375);
     pushMatrix();
       image(mushroom, -10, 425);
       scale(.8);
       image(mushroom, 650, 410);
     popMatrix();
     pushMatrix();
       scale(.5);
       image(mushroom, 1220, 800);
       scale(.8);
       image(mushroom, 1450, 1150);
     popMatrix();
     pushMatrix();
       scale(1.15);
       image(model1, 570, 240);
     popMatrix();
     pushMatrix();
       scale(1.5);
       image(model1, 450, 190);
     popMatrix();
  }else if (r < 6){
    image(rm2, 0, 0);
    image(rug, 213, 425);
    image(birds, 0, 0);
    image(wa3, 0, 0);
    image(model4, 500, 290);
      pushMatrix();
        scale(.7);
        rotate(radians(5));
        image(bottle, 870, 245);
      popMatrix();
    image(chandelier, 0, 0);
    image(elephant, -180, 280);
  }else if (r < 8){
    image(rm2, 0, 0);
    image(rug, 213, 425);
    image(wa3, 0, 0);
      pushMatrix();
        scale(.7);
        image(elephant, 490, 300);
      popMatrix();
    image(chandelier, 0, 0);
    image(model4, 470, 310);
      pushMatrix();
        scale(.9);
        rotate(radians(15));
        image(model4, 480, 250);;
        scale(.85);
        rotate(radians(15));
        image(model4,  500, 180);
        scale(.8);
        rotate(radians(20));
        image(model4, 590, 50);
      popMatrix();
      image(chandelier, 0, 0);
  }else if (r < 10){
    image(rm3, 0, 0);
    image(rug, 213, 425);
    image(disco, 0, 0);
    image(light2, 0, 0);
    image(dancers1, 0, 0);
    image(light3, 0, 0);
  }else{
    image(rm3, 0, 0);
    image(rug, 213, 425);
    image(light4, 0, 0);
    image(rain, 0, 0);
    image(birds, -30, -100);
    image(dancers2, 0, 0);
    image(light1, 0, 0);
  }
}
 
void mousePressed(){
 redraw();
}

