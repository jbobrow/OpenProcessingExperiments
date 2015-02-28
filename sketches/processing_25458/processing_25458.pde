
/************************************
Program : Hearts make Love
Name : Park Jin Hee
Student No. : 2010020619
************************************/
PImage heartimage;
PImage smallimage;
Heart heart;

void setup() {
  size(640,430);
  heartimage = loadImage("heart.JPG");
  smallimage = loadImage("small.jpg");
  background(247,167,229);
  smooth();
}

void draw() {
      image(smallimage,480,310);
// heart location random search and drawing.
 
      int x = int(random(heartimage.width));
      int y = int(random(heartimage.height));
      int loc = x + y*heartimage.width;
  
      // Look up the RGB color in the source image
      
      //heart color randomize.
      loadPixels();
      float r = red(heartimage.pixels[loc]);
      float g = green(heartimage.pixels[loc]);
      float b = blue(heartimage.pixels[loc]);
      
      if(x<480 || y<350)
      {
      heart = new Heart(r,g,b,x,y);
      }
}

// making a heart shape.
class Heart {
  Heart(float r, float g, float b,int x,int y){
    smooth();
    noStroke();
//make start shape
    beginShape();
    fill(r,g,b);
    vertex(x, y-45); 
    bezierVertex(x, y-55, x+10, y-49, x, y-40); 
    vertex(x, y-45); 
    bezierVertex(x, y-55, x-10, y-49, x, y-40); 
    endShape();
  }
}



