
PImage starconstellation;
PImage shootingstar;

void setup(){
    size(500,500);
    starconstellation = loadImage("1image001_fs.jpg");
    shootingstar = loadImage("bukiki-shooting-star.jpg");
}

void draw(){
  tint(mouseX,mouseY,172,100);
  image(starconstellation,80,80,350,350);
  tint(mouseX,mouseY,172,30);
  image(shootingstar,mouseX,mouseY,150,150);
  

}

