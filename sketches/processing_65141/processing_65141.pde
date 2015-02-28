
float rota=0;
float dista=0;
PShape image3;

PFont font;
String s = "G r i f f i t h  O b s e r v e t o r y";

void setup() {
  size(800, 800, P3D);
  smooth(); 
  font=loadFont("Futura-Medium-48.vlw");

  textFont(font);
  textSize (10);
  textAlign(CENTER);

  background(9,8,36);
   

  shapeMode(CENTER);
  smooth();
  image3 = loadShape("image3.svg");
  image3.disableStyle();
 
}

void draw() {
  smooth();
  noStroke();
  fill(0);
  shape ( image3, 400, 360, 325, 205);
   
  fill(0, 5);
  translate(width/2, height/2);
  // rotateX(15*millis()*0.02);



  stroke(255);
  strokeWeight(0.4);
  float noivel=noise(dista)*800;
  fill(255);
  smooth();
  text(s, -400, 340, 300, 200);
 
  rotate(rota);

  float maxdis=height*0.45;
  pushMatrix();
  line(noivel, 0, maxdis, 0);
  line(noivel*0.5, 0, noivel*0.2, 0);
  noStroke();
  fill(255);
  ellipse(noivel*0.2, 0, 3, 3);
  ellipse(noivel*0.5, 0, 5, 5);
  fill(random(0, 255));
 
  ellipse(maxdis, 0, 2, 2);
  popMatrix();
  rota+=0.01;
  dista+=noivel;
  fill(0, 3);
  rect(0, 0, width, height);


  float ra = random(TWO_PI);
  float rr = random(75, 130);

  noStroke();
  fill(255);

  float x = width/2 +  cos(ra) * rr;
  float y = height/2+  sin(ra) * rr;
  ellipse(1, y, 2, 2);
  ellipse(x, 1, 2, 2);
  ellipse(x, y, 8, 8);
}



//text (" G R I F F I T H O B S E R V A T O R Y "); 


