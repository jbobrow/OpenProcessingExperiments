
PImage cat;
PImage shark;

void setup (){
  background(200, 201, 197);
  size(900, 900);
  cat = loadImage("cat.png");
  shark = loadImage("shark.png");
  
}

void draw (){ 
  background(200, 201, 197);
  delay(200);
  image(shark, random(100, 500), 600);
  tint(255, 255, 255, 255);
  image(cat, 300, mouseY);
  
  

}

