
PImage catepillar;
PImage city;
PImage leaf;
PImage spider;
PImage screenshot;
PImage screenshot1;
PImage screenshot2;

void setup(){
  size(700,1000);
  catepillar = loadImage("PaddleCaterpillarFromAbove.jpg");
  city = loadImage("city.jpg");
  leaf = loadImage("leaf.jpg");
  spider = loadImage("spider.png"); 
  screenshot = loadImage("Screenshot.png");
  screenshot1 = loadImage("Screenshot1.png");
  screenshot2 = loadImage("Screenshot2.png");
 }

void draw(){
  tint(255,192,90,60);
 image(leaf,0,250,700,500);
 tint(101,136,169,100);
 image(catepillar,0,0,700,500);
 tint(255,7,4,70);
 image(city,0,0,700,500);
  tint(255,205,42,10);
 image(catepillar,0,500,700,500);
 tint(255,192,90,20);
 image(leaf,0,750,700,500);
}

