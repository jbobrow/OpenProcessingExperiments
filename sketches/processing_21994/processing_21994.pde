
PImage or1;
PImage or4;
PImage or2;

void setup(){
  size(700,600);
  colorMode(HSB, 360, 100, 100);
  
  or2 = loadImage("photo-39.JPG");
  for(int x = 0; x < 900; x +=140){
    image(or2, x, 0);
  }
  
  or4 = loadImage("orange4.png");
  for(int y = 0; y <900; y +=140){
    image(or4, y, 122);
  }
  
  or2 = loadImage("photo-39.JPG");
  for(int x = 0; x < 900; x +=140){
    image(or2, x, 244);
  }
  
  or4 = loadImage("orange4.png");
  for(int y = 0; y <900; y +=140){
    image(or4, y, 366);
  }
  
  or2 = loadImage("photo-39.JPG");
  for(int x = 0; x < 900; x +=140){
    image(or2, x, 488);
  }
  
  or1 = loadImage("orange1.png");
  imageMode(CENTER);
  image(or1, width/2, height/2+7);
  
  photoFilter();
}

void draw(){
}

void photoFilter(){
  
  loadPixels();
  for(int i = 0; i < pixels.length; i++){
    color cp = pixels[i];
    float h = hue(cp);
    float s = saturation(cp);
    float b = brightness(cp);
    if(b < 15){      //if bright, add brightness
      b += 10;
    }
    if(h > 25 && h < 40){  //if hue between(green), change to (blue)
      h = 200;
    }
     if(h > 40 && h < 50){  //if hue between(green), change to (blue)
      h = 300;
    }
  pixels[i] = color(h,s,b);
  }
updatePixels(); 

}

