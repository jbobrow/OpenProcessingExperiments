
PImage img;
PImage img2;
PImage meat;
PImage img3;

void setup(){
size(512,512);
img = loadImage("7.jpg");
img2 = loadImage("1.jpg");
img3= loadImage("1.png");
meat= loadImage("meat.png");
}

void draw(){
// background(0);

  background(0);
  
   int prop = (mouseX + mouseY)%255;
 tint(#FA8258,prop);
  loadPixels();
  meat.loadPixels();
  
  for(int y =0 ;y<height; y++){
    for(int x =0;x<width; x++){
    int loc =x + y * width;
    
    float r = red(meat.pixels[loc]);
    float g = green(meat.pixels[loc]);
    float b = blue(meat.pixels[loc]);
    
    pixels[loc] = color(r,g,b);
    }
  }
  
    for(int y =0 ;y<height; y++){
    for(int x =0;x<mouseX; x++){
    int loc =x + y * width;
    
    float r = red(img2.pixels[loc]);
    float g = green(img2.pixels[loc]);
    float b = blue(img2.pixels[loc]);
    
    pixels[loc] = color(r,g,b);
    }
  }
  updatePixels();
 
   for(int y =0 ;y<mouseY; y++){
    for(int x =0;x<width; x++){
    int loc =x + y * width;
    
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    
    pixels[loc] = color(r,g,b);
    }
  } 
  updatePixels();
     for(int y =0 ;y<mouseY; y++){
    for(int x =0;x<mouseX; x++){
    int loc =x + y * width;
    
    float r = red(img3.pixels[loc]);
    float g = green(img3.pixels[loc]);
    float b = blue(img3.pixels[loc]);
    
    pixels[loc] = color(r,g,b);
    }
  } 
  
updatePixels();


/*imageMode(CENTER);
image(img2,mouseX,mouseY,prop,prop); 
image(img2,mouseX+random(-20,20),mouseY+random(-20,20),prop,prop); 
image(img2,mouseX+random(-300,30),mouseY+random(-20,200),prop,prop); image(img2,mouseX+random(-200,200),mouseY+random(-200,500),prop,prop); image(img2,mouseX+random(-500,200),mouseY+random(-20,200),prop,prop); image(img2,mouseX+random(-400,20),mouseY+random(-20,20),prop,prop); image(img2,mouseX+random(-20,20),mouseY+random(-20,20),prop,prop); 
*/
}
