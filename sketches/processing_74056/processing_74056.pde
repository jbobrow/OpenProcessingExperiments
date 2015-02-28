
float xPos;
float yPos;
boolean mouse = false;

void setup(){
  size(700,700);
  background(19,43,62);
  xPos = width/2;
  yPos = height/2;
}
 
void draw(){
  smooth();
  fill(19,43,62,20);
  rect(0,0, width,height);
  strokeWeight(1.5);

    
  fill(#FAF8AE);
  int i = 1;
  if (mouse==true){
    xPos = 0.90*xPos + 0.10*mouseX +random(-15,15); 
    yPos = 0.90*yPos + 0.10*mouseY +random(-15,15);
    ellipse(xPos+90, yPos-90, 40,40);
  }
  if (mouse==false){
    textSize(20);
    text("Your destiny is slipping away! Go after it!",50,50);
    text("(Click to begin)",50,70);
  }
}

void mousePressed(){
  mouse = true;
}
