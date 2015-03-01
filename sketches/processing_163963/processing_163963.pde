
PImage space, nyanCat, majoraMoon, starGate, tron, coolCat, water, sword;
int m = millis(), s = second(), a = 0, da = 2.2, b = 0, c = 0;
float d = 0.0, e= 0.0;

void setup(){
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  ellipseMode(RADIUS);
  frameRate(10);
//images
  space = loadImage("Star_Wars_Space_Battle_by_LordDoomhammer.jpg");
  nyanCat = loadImage("Nyan-cat_zps4adb5b0e.png");
  majoraMoon = loadImage("Majora__s_Mask_Moon_by_mrespman.png");
  starGate = loadImage("Stargate-color.png");
  tron = loadImage("Tron.jpeg");
  coolCat = loadImage("Nyan_Cat2.png");
  water = loadImage("MPj04000150000.jpg");
  sword = loadImage("haloreach_energy_sword_profile_by_toraiinxamikaze-d3jksoa.png");
  
}

void draw(){
  counter = millis()/1000;
  
//Phase 1
  
//space background image
  space.resize(500, 500);
  
  image(space, 0, 0);
  
  
//starGate
  starGate.resize(180, 180);
  image(starGate, 315, 200);
  
//starGate Portal
  if(counter>7.5){
    if(counter<16){
      for (int a = 60; a > 1; a = a-5){
        float h = random(0, 360);
        fill(h, 90, 90);
        noStroke();
        ellipse(405, 290, a, a);
        h = (h+1) % 360;
      }
    }
  }
  
//Text

//Chevron 6, enocoded
  if(counter>1){
    if(counter<5){
      textSize(50);
      text("Chevron 6, encoded!", 20, 40);
    }
  }
//Chevron 7, locked
  if(counter>6){
    if(counter<13){
      fill(0, 0, 99);
      textSize(50);
      text("Chevron 7, locked!", 50, 40); 
    }
  }
  
  
//nyanCat
  nyanCat.resize(130,80);
    if(b<300){
      image(nyanCat, b, 250);
      b+=da;
    }
     
//PHASE2

//tron background
if(counter>17){
  tron.resize(500,600);
  image(tron, 0, 0);
 
//Random lines
if(counter>=17){
  strokeWeight(4);
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  stroke(random(255), random(255), random(255));
  line(random(500), random(500), random(500), random(500));
  
//majoraMoon
  majoraMoon.resize(180,180);
  image(majoraMoon, 315, 200);
}
  
//coolCat
  coolCat.resize(110,80);
  if(counter>=18){
  if(c<300){
    image(coolCat, c, 250);
    c+=da;
  }
  }
  }

//PHASE 3
//water background
if(counter>=30){
  water.resize(500,500);
  image(water, 0, 0);
  pushMatrix();
  filter(INVERT);
  popMatrix();
  
//Catch the sword
      fill(0, 0, 99);
      textSize(27);
      text("Would you kindly catch the ghost sword", 5, 40);

//sword

  d = d + 0.04;
  e = cos(d)*2;
  translate(mouseX, mouseY);
  scale(e);
  rotate(radians(-90));
  sword.resize(100, 50);
  image(sword, mouseX-300, mouseY-300);
}

println(frameCount);

}


