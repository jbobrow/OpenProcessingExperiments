
/* @pjs preload= "Crowd.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 4;

void setup () {
 size(600, 512);
 img = loadImage("Crowd.jpg");
 img.resize(602, 514);
 imageMode(CENTER);
 noStroke();
}

void draw() {
  image(img,width/2,height/2,602,514);
  imageMode(CENTER);
  for (y = 0; y < 512; y+=3) {
    for (x = 0; x < 370; x+=3) {
      pix = img.get(x, y);
      if (pix != color(0,0,0)) {
        noStroke();
        fill(pix);
        
        if (dist(mouseX, mouseY, x, y) <=1.9) {
          pointillize=75;
        }
        else {
          pointillize=4;
        }
       ellipse (x, y, pointillize, pointillize);
      }
    }
  }
   for( y = 0; y < 512; y+=3) {
     for (x = 370; x < 602; x+=3) {
       pix = img.get(x,y);
       if (pix != color(0,0,0)) {
         noStroke();
         fill(pix);
         
         if(dist(mouseX, mouseY, x, y) <=1.9) {
           pointillize=184;
         }
         else{pointillize=4;
         }
         ellipse(pointillize, pointillize, pointillize, pointillize);
       }
     }
   }
}



