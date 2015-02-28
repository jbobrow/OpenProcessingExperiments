
//PImage img;
PFont font;
float angle = 0.0;
float offset = 200;
float speed = 0.001;

void setup() {
  size(1000, 550);
  smooth();
 // img = loadImage("Nyancat.png");
  font = loadFont("SynchroLET-100.vlw");
  textFont(font);
}
void draw() {
  background(0, 20,60);
  strokeWeight(2);
  
  stroke(255,255,255);
  float a = random(1000);
  float b = random(550);
  ellipse(a,b,3,3); 

  for (int i=0; i < 1000;i += 6){
  float x = map(i, 0, 1000, 0, 1);
  float y = offset + sin(angle + x) * 40;
  float y2 = offset + sin(angle +5*x)* 60;
  float y3 = offset + cos(angle + 2*x)* 60;
  float z = map(i,0,1000, 2, 1002);

stroke(255, 0,255);
    line(i, y-10, i,y+120);
    
    stroke(255,255,0);
    line(z, y2+100,z,y2);
    stroke(0,200,255);
    line(z, y3, z, y3+30);
    angle += speed;
    
   textSize(100);
   text("CAT",400,y);
   // image(img, 600,50,400,300);
  }

}


