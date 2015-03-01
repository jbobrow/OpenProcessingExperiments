
PImage index;

void setup() {
  size(600, 600);
  String url = "http://www.extravaganzi.com/wp-content/uploads/2012/10/2013-Jaguar-F-Type-2";

  index = loadImage(url,"jpg");
    imageMode(CENTER);
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  background(255,0,0,120);

  tint(map(mouseX,0,600,250,260), 255, 255, 100);
  image(index, width/2-(sqrt(mouseX)), height/2);
  
  tint(map(mouseY,0,600,0,10), 255, 255, 100);
  image(index, width/2, height/2+(sqrt(mouseY)));

  tint(map(mouseY,0,600,330,360), 255, 255, 50);
  image(index, width/2, height/2+(sqrt(mouseX)));

}
