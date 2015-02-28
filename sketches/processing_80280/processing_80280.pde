
/*Code created by Anne Marie Hood for YSDN Interactivity 2, Project 3*/
PImage img; 
PImage man;
PFont font;


void setup(){
  size(450,600);
  img= loadImage ("sign2.jpg");
  man= loadImage ("man.png");
  font= loadFont ("HelveticaCY-Bold-60.vlw");
}

void draw (){
  image (img,0,0);
  float mx = constrain(mouseX, 110, 260);
  image (man,mx,112);

  smooth();
  noStroke();
  fill (#bd2925);
  beginShape();
  vertex (115,195); 
  vertex (130,150);
  vertex (320,345);
  vertex (304,380);
  endShape (CLOSE);
  
  noFill();
  ellipseMode(CENTER);
  stroke(#bd2925);
  strokeWeight(50);
  ellipse (220,270,260,380);
  
  textFont (font);
  fill (mouseX);
  if (mouseX>200){
    fill (#bd2925,random(200));}
      else{
        fill (0,0);}
  text("BACK", 300, 480);
  text("BACK", 250, 590);
  text("BACK", 330, 550);
    
}

