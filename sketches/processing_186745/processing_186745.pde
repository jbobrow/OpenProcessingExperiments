
float easing = 0.05; //Sets easing value for smooth motion
float fx;

void setup() {
  size(800,600);
}

void draw() {
  
  background(255);
  
  stroke(94,29,0);
  fill(208,130,73);
  
  for(int posX1=-20; posX1<width; posX1+=120){ //Row A of brick pattern, X position
    float posX2 = map(posX1,-20,700,0,720); //Row B of brick pattern, X position
    
    for(int posY1=500; posY1<height; posY1+=40){ //Row A of brick pattern, Y position
      float posY2 = map(posY1,500,580,520,600); //Row B of brick pattern, Y position
      
      fill(208,130,73); //Light brown bricks
      rect(posX1,posY1,40,20);
      rect(posX2+40,posY2,40,20);
      
      fill(148,61,23); //Dark brown bricks
      rect(posX1+40,posY1,40,20);
      rect(posX2+80,posY2,40,20);
      
      fill(219,89,76); //Red brick
      rect(posX1+80,posY1,40,20);
      rect(posX2,posY2,40,20);
    }
  }
  
  fx += (mouseX-fx) * easing;
  fill(255);
  bystander(fx-51.5,320); //Moving Object
  
}

void bystander(float x, float y) { //CUSTOM OBJECT, the bystander
  pushMatrix(); //allows origin to move freely
  translate(x,y); //these variables are filled with values when the object is called in the draw() function
  
  strokeWeight(2);

  //LEGS
  stroke(10);
  fill(110);
      
  beginShape(); //Left leg; using custom shape to achieve no stroke where feet will align with leg
  vertex(26,251);
  vertex(26,216);
  vertex(46,216);
  vertex(46,271);
  vertex(26,271);
  endShape();
  
  beginShape(); //Right leg; using custom shape to achieve no stroke where feet will align with leg
  vertex(76,251);
  vertex(76,216);
  vertex(56,216);
  vertex(56,271);
  vertex(76,271);
  endShape();
  
  arc(26,261,30,20,radians(90),radians(270)); //Left Shoe
  arc(76,261,30,20,radians(-90),radians(90)); //Right Shoe
  
  //BODY
  stroke(0,68,98);
  fill(30,166,227);
  rect(1,126,100,50);
  arc(51,128,100,100,radians(180),radians(360));
  arc(51,175,100,100,radians(0),radians(180));
  
  //HAT (same color as body, no need for fill() or stroke() functions
  ellipse(51,46,90,90);
  
  //HEAD
  stroke(160,125,92);
  fill(250,229,209);
  ellipse(51,66,100,80);
  
  //EYES
  stroke(0);
  fill(255);
  ellipse(26,46,20,10);
  ellipse(76,46,20,10);
  
  //PUPILS
  fill(0);
  ellipse(26,43.5,5,5);
  ellipse(76,43.5,5,5);
  
  //MOUTH
  noFill();
  arc(51,56,25,10,radians(45),radians(135));
  
  //HANDS
  stroke(160,125,92);
  fill(250,229,209);
  ellipse(36,101,25,25);
  ellipse(66,101,25,25);

  popMatrix(); //snaps origin back to its default setting (0,0)
}


