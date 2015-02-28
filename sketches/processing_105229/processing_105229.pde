
PImage img;
int smallPoint, largePoint;
float pointSize = 10;

float sizeSlideX=80;
float sidesSlideX=310;

void setup() {
  size(600, 600);
  img = loadImage("image.jpg");
  imageMode(CENTER);
  noStroke();
  background(0);
}

void draw() { 
  
  //Slider and button logic
  if (mousePressed) {
    if (mouseY > 0 && mouseY < 50) {
      
       if(mouseX>=80 && mouseX<=200){
         sizeSlideX = mouseX;
       } else if(mouseX>=310 && mouseX<=430){
         sidesSlideX = mouseX;
       } else if (mouseX > 500) {
         background(0);
       }
    
    }
  }
  
  //Paint at random point
  noStroke();
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 50);
  pointSize = map(sizeSlideX, 80, 200, 0, 30);
  float nsides = map(sidesSlideX, 310, 430, 3, 10);
  //make particle
  polygon(int(nsides), x, y, pointSize);
  polygon(int(nsides), x, y, 2*pointSize/3);
  polygon(int(nsides), x, y, pointSize/3);
  
  //draw Gui
  fill(0,10);
  rect(0,0,width,50);
  fill(255,50);
  text("Size", 20, 25);
  text("Sides", 250, 25);
  text("Clear", 550, 25);
  stroke(50);
  strokeWeight(15);
  line(80,20,200,20);
  line(310,20,430,20);
  
  
  noStroke();
  fill(255,200);
  ellipse(sizeSlideX,20,13,13);
  ellipse(sidesSlideX,20,13,13);
  //
}

//make polygon
void polygon(int n, float cx, float cy, float r)
{
  float angle = 360.0 / n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)),
      cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}


