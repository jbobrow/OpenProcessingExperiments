
PFont fonte;
 
void setup(){
  size(800,600);
 background(0,0,0);
 //fonte = loadFont("fonte.vlw");
 fonte = createFont("",30);
 textFont(fonte); 
  background(0,0,0);
}
void draw() {
  //fill(random(12,255),random(247,255));
  fill(255,157);
  text( "Digite",width/2, height/2);


  //rect(1200,800,1200,800);
  filter(BLUR, 1);
 
}


void keyPressed() {

  pushMatrix();
  translate(width/2, height/2);
  rotate(millis() /0.2);
  fill(random(100,230),random(20,255),random(20,220));
  text(key, random(-width/2, width/2), random(-height/2, height/2) );
  //rect(random(width), random(height), 10, 300);
  popMatrix();
}
  


