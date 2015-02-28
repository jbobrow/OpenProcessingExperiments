
PFont f;
//String esp = "La Acera","Esta Cerrada","Cruce Aqui";
void setup(){
  size(600,600);
  f = loadFont("MalgunGothicBold-48.vlw");
}

void draw(){
  ///background(205);
  noStroke();
  fill(205);
  ellipseMode(CORNERS);
  ellipse(150,30,1200,298);
  
  noStroke();
  fill(205);
  rect(150,0,1200,150);
  
  noStroke();
  fill(205);
  rect(150,500,1200,200);
  
  noStroke();
  fill(255);
  ellipseMode(CORNERS);
  ellipse(150,400,1200,567);
  
  noStroke();
  fill(205);
  ellipseMode(CORNERS);
  ellipse(400,400,900,500);
  
  noStroke();
  fill(255);
  rect(449,100,400,350);
  
  noStroke();
  fill(255);
  ellipseMode(CORNERS);
  ellipse(420,400,900,480);
  
  noStroke();
  fill(255);
  ellipseMode(CORNERS);
  ellipse(449,51,900,150);
 
  noStroke();
  fill(205,205,205,10);
  rect(150,0,300,900);
  
  noStroke();
  fill(random(179,255),random(179,255),random(197,255),random(200));
  textFont(f);
  textSize(random(20,75));
  text("La Acera",random(-100,700),random(700));
}
