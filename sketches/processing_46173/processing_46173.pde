
PImage CrystalClearWater;
PImage lolo;
void setup(){
  size(1000,1000);
CrystalClearWater = loadImage("Crystal Clear Water.jpg");
lolo = loadImage("lolo.jpg");
}

void draw(){
  tint(random(0-200),100,100,200);
  image(CrystalClearWater,400,200,100,100);
  
  line(random(0-1000),random(0-1000),700,500);
  
  tint(random(0-1000),150,200);
  image(lolo,300,300);
  
  line(random(0-1000),(0-1000),800,500);
}


