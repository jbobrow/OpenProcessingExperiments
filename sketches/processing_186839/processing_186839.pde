
float easing = 0.05; //Sets easing value for smooth motion
float easingCloud = 0.2; //Easing value to be used with drawing clouds
float fx; //"Follower" variable, to be used with easing formula
float fxCloud, fyCloud; //More "Follower" variables

int diameterX = 35; //Cloud Brush width
int diameterY = 15; //Cloud Brush height

void setup() { //Runs once
  size(800,600);
  background(180,240,255);
}

void draw() { //Runs on loop, 60FPS default
  
  //CLOUD DRAWING: "IF" structures
  noStroke();
  noFill();
  if(mousePressed) { //Checks if mouse button is pressed
    if(mouseButton == LEFT){ //Checks left mouse button specifically
      fill(255,75); //CREATE clouds with Left Mouse Button
    }else if(mouseButton == RIGHT) { //Checks right mouse button specifically
      fill(180,240,255); //ERASE clouds with Right Mouse Button
    }else {
      noFill();
    }
  }
  
  //SIZE OF CLOUD BRUSH: "IF" structures
  if(keyPressed) { //Checks if a key is pressed
    if(((key == '+') || (key == '=')) && (diameterX<70)) { //Check if PLUS or EQUALS is pressed (equals is the same key as plus, just without holding shift)
      diameterX += 35; //Brush size X-coordinate INCREASES once (only once because after that, diameterX is not less than 70)
      diameterY += 15; //Brush size Y-coordinate INCREASES once
    }else if((key == '-') && (diameterX>35)) { 
      diameterX -= 35; //Brush size X-coordinate DECREASES once (only once because after that, diameterX is not more than 35)
      diameterY -= 15; //Brush size Y-coordinate DECREASES once
    }
  }
  
  fxCloud += (mouseX - fxCloud) * easingCloud;
  fyCloud += (mouseY - fyCloud) * easingCloud;
  ellipse(fxCloud,fyCloud,diameterX,diameterY);
  
  //Gradient sky behind Bystander below:
  for(int rectHeight=300; rectHeight<=500; rectHeight+=5) {
    float r = map(rectHeight,300,500,180,60); //Red value
    float g = map(rectHeight,300,500,240,155); //Green value
    float b = map(rectHeight,300,500,255,180); //Blue value
    
    fill(r,g,b);
    rect(0,rectHeight,width,5); 
  }
    
  strokeWeight(2);
  stroke(94,29,0);
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
  
  fx += (mouseX-fx) * easing; //Formula for easing movement
  bystander(fx-51.5,320); //Moving CUSTOM OBJECT, see below
  
}

void bystander(float x, float y) { //CUSTOM OBJECT, the Bystander
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


