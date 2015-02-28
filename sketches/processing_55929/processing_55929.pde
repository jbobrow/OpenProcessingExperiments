
float a = 150;
float b = 600;
PFont font;
PFont fontt;
PFont fonttt;

void setup(){
  size(600,600);
  background(56,34,118);
    
  noStroke();
  fill(15,198,0);
  rect(0,400,800,200);
  
  noStroke();
  fill(34,100,116);
  rect(0,200,800,200);

  
  font = loadFont("AmericanTypewriter-90.vlw");
  fontt = loadFont("Arial-Black-48.vlw");
  fonttt = loadFont("Chalkboard-48.vlw");
  frameRate(10);
  
}

void draw(){


fill(random(255),0,random(b),150);
  textFont(fonttt);
  textSize(random(b));
  text("Service with a smile",random(b),random(a));
   
  noStroke();
  fill(89,171,191,50);
  ellipse(random(b),random(200),random(a),random(a));
  
  noStroke();
  fill(252,255,185,random(20));
  ellipse(random(b),random(b),random(b),random(400-700));
  
  fill(55,random(b),random(25));
  textFont(font);
  textSize(random(b));
  text("BuckyBalls",random(b),random(b));
  
  noStroke();
  fill(15,198,0);
  ellipse(random(b),600,random(b),random(b));

  
  fill(random(b),0,random(255));
  textFont(fontt);
  textSize(random(b));
  text("HOAR",random(b),500);

}

