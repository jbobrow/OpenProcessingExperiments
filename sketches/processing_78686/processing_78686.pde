
 PImage bg;
float h,s,b,h1,s1,b1;

void setup(){
  noStroke();
  size(849,564);
  bg = loadImage("bg.jpeg");
  colorMode(HSB,360,100,100,100);
  frameRate(8);
}

void draw(){
  //GET ---------------------------------------------------
  image(bg,0,0);
  color cp1 = get(mouseX, mouseY);
  h1 = red(cp1);
  s1 = green(cp1);
  b1 = blue(cp1);
 //println(b1);
 
//MOUSE HOOVER ---------------------------------------------
  fill(h1,s1,b1);
  ellipse(mouseX,mouseY, 150,150);
  
  
//MousePressed to Tint -------------------------------------
  if(mousePressed){
    PTint();
  }
  
  
  
//FITLER+Reset base on area---------------------------------
 /*
  if(mouseX > 0 && mouseX < 849 && mouseY > 0 && mouseY < 100){
     if(mousePressed){
       image(bg,0,0);
       println("top");
      }
    }

  if(mouseX > 0 && mouseX < 849 && mouseY > 100 && mouseY < 564){
    if(mousePressed){
      PTint();
      println("Bottom");
    }
  }
*/  


//FITLER+Reset base on Black colors------------------------
/*
  for(int i = 0; i < 10000; i++){
    int x = int(random(width));
    int y = int(random(height));
    color cp = bg.get(x,y);
//  float b2 = brightness(cp);
    if(mousePressed){
      if(b1 < 4){
        image(bg,0,0);
      } else if (b1 > 4){  
        PTint();  
        }
      }
    }
*/
}
  
//Filter----------------------------------------------------
void PTint(){ 
  bg.loadPixels(); // without bg, will load screen
  int bgSize = bg.width * bg.height; // # of pixels
  for(int i = 0; i < bgSize; i ++){
    color cp = bg.pixels[i]; 
   // h = h1;
    h = hue(cp);
    s = saturation(cp);
    b = brightness(cp);
    bg.pixels[i] = color (h1,s,b);
  }
  bg.updatePixels();
}

