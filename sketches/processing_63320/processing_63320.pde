
float kreis1x = 350;
float kreis1y = 350;
int kreispos1x = 200;
int kreispos1y = 200;

float geschwindigkeitx = random (5);
float geschwindigkeity = random (5);




void setup() {

  size(600,800);
  println("hallo");
  background(10,20,10);
}
void draw() {

  
  
  
  
noStroke();
 
ellipse (kreispos1x,kreispos1y,kreis1x,kreis1y);
fill(random(0,255),random(0,255),random(0,255));

ellipse (kreispos1x + 300,kreispos1y + 200,kreis1x - 100,kreis1y - 100);
fill(random(0,255),random(0,255),random(0,255));

ellipse (kreispos1x - 250,kreispos1y + 150,kreis1x - 170,kreis1y - 170);
fill(random(0,255),random(0,255),random(0,255));

ellipse (kreispos1x - 50,kreispos1y + 250,kreis1x - 50,kreis1y - 50);
fill(random(0,255),random(0,255),random(0,255));

ellipse (kreispos1x + 70,kreispos1y + 50,kreis1x - 180,kreis1y - 180);
fill(random(0,255),random(0,255),random(0,255));
  
  
    kreis1x = kreis1x + geschwindigkeitx;
  kreis1y = kreis1y + geschwindigkeity;
  
  if ((kreis1x > height) || (kreis1x < 0)) {
    geschwindigkeitx = geschwindigkeitx * -1;
  }
  
  if ((kreis1y > width) || (kreis1y < 0)) {
    geschwindigkeity = geschwindigkeity * -1;
}

PFont myFont;
 
PFont font;
 
font = loadFont("Flareserif821BT-Bold-48.vlw");
textFont(font, 60);
text("A  C I   D", 70, 43);
 
 
font = loadFont("Flareserif821BT-Bold-48.vlw");
textFont(font, 40);
text("I  N", 310, 550);
 

font = loadFont("Flareserif821BT-Bold-48.vlw");
textFont(font, 56);
text("W I L  L I S A    U", 20,780);


}

