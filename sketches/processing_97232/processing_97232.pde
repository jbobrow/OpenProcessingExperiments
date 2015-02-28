
/*HW 11.2
NAFIS SABIR
PROF CALLI HIGGINS*/
PImage Naruto1, Naruto2;
MyNinja [] narutos = new MyNinja[200];



void setup() {

  size(800, 800);
  Naruto1 = loadImage("naruto 1.jpg");
  Naruto2 = loadImage("naruto2.jpg");
  if (mouseX <= width/2){
  for (int i = 0; i < narutos.length; i = i+6) {
    narutos[i] = new MyNinja(Naruto2, width/2, i+50);
  }

  noStroke();
  background(255);
}}

void draw() {
  frameRate(constrain(width, 3, 7));
  background(0);
  for (int i = 0; i < narutos.length; i = i+6) {
    narutos[i].ninjaMove();
    narutos[i].display();
  }
}

class MyNinja {
  PImage NinjaImage;
  int smallNinja, largeNinja, ninjaX, ninjaY;
 

  MyNinja(PImage tempImage, int tempX, int tempY) {
    NinjaImage = tempImage;
    smallNinja = 40;
    largeNinja = width/2;
    ninjaX = tempX;
    ninjaY = tempY;
     
   
  }

  void display() {
     ninjaX = int(random(NinjaImage.width));
  ninjaY = int(random(NinjaImage.height));
    image(NinjaImage, ninjaX, ninjaY, 100, 100);
  }
  
  void ninjaMove(){
    float jutsu = map(mouseY, 0, height, smallNinja, largeNinja);
  ninjaX = int(random(NinjaImage.width));
  ninjaY = int(random(NinjaImage.height));

  image (NinjaImage, ninjaX, ninjaY, jutsu, jutsu);
}
}


