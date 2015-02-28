
//picture to ascii generator by Chris Webb
//do whatever you want with this. im sure you can improve it heaps :D

char[] chars ={'█','█','▓','▒','░','#','≡','%','$','@','&'};
String loadPath = "MonaLisa.png";
PImage picture;
int devisions = 10; // pixels
PFont font;
float xDiv;
float yDiv;

void setup(){
  picture = loadImage(loadPath);
  size(337,500);
  font = loadFont("ArialMT-10.vlw"); 
  xDiv = picture.width/devisions;
  yDiv = picture.height/devisions;
  println(xDiv);
}

void draw(){
  background(255);
  textFont(font,devisions+3);
  for(int i = 0; i < height; i+= devisions){
    for(int j = 0; j < width; j+= devisions){
      color filler = picture.get(int(j),int(i));
      fill(filler);
      textAlign(CENTER);
      //gets char depending on brightness
      float value = brightness(filler);
      char charac = chars[int(value/25.5)];
      text(charac,(j),(i));
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      devisions++;
    } else if (keyCode == DOWN) {
      devisions--;
    } 
  }
  constrain(devisions,1,99);
}

