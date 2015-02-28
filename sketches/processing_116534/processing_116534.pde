
int radius;
PImage b;

void setup() {
size (800,800); 
radius = width/2
quad(200,750,250,750,250,800,200,800);
quad(600,750,550,750,550,800,600,800);
triangle(200, 750, 400, 500, 600, 750);
ellipse (400, 300, 600,600);

}

void draw() {  
   background(128);
   quad(200,750,250,750,250,800,200,800);
   quad(600,750,550,750,550,800,600,800);
   triangle(200, 750, 400, 500, 600, 750);
   ellipse (400, 300, 600,600);
    b = loadImage("turkey.png");
    image(b, 400, 400);
}
