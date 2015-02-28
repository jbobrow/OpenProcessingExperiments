
float rCol;
float gCol;
float bCol;
float xPos;
float yPos;

void setup () {
  size (500,500);
  xPos = width/2;
  yPos = height/2;
  rCol = mouseX/2.35;
  gCol = random (255);
  bCol = mouseY/2.35;
}

void draw () {
  rCol = rCol + random (-10,10);
  bCol = bCol + random (-10,10);
  fill (rCol, 0, bCol);
  
  float centerX = 250;
  float ampX = 200;
  float ampY = 200;
  float periodX = .003;
  float periodY = .0045;
  
  
  
  xPos = centerX + ampX*sin(millis()*periodX);
  yPos = centerX + ampY*cos(millis()*periodY);
  ellipse (xPos, yPos, 20,20);
  
  /*
  fill (255,255,255, 20);
  rect (0,0, width,height);
  */
  println (rCol);
}        
