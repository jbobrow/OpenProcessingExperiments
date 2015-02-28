
void setup() 
{  ellipseMode(CENTER);
 int largeur = screen.width;
 int hauteur = screen.height;
  colorMode(HSB, 100);
  size(900,450);
  background(100);
  smooth();
}
void draw()
{frameRate(12);
  fill(100,3);
  rect(0, 0, width, height);
  noStroke();
  float ird = random(100);
  int i = floor(ird);
  float jrd = random(100);
  int j = floor(jrd);
  for( i = width/9; i < 850; i=i+width/9){
    for( j = height/5 ; j < 400; j=j+height/5){
      float x2 = random(90);
      fill(random(-5,15), 100, 100,random(40));
      ellipse(i,j,x2,x2);
    }
  }
PImage b;
b = loadImage("bronzeuses.png");
image(b, 440, 300);
}






