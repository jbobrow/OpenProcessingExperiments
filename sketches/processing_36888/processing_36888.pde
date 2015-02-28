
float xPos;
float yPos;

void setup(){
  size(500,500);
  xPos = 0;//width/2;
  yPos = 0;//height/2;
  smooth();
}

void draw(){
  background(0,0,0);
  float periodX = .003;
  float periodY = .003;
  
  for(int i = 1;i<50;i++){
    xPos = .95*xPos*sin((millis()-i)*periodX) + (.05)*mouseX;
    yPos = .95*yPos*sin((millis()-i)*periodY) + (.05)*mouseY;
    ellipse(xPos, yPos, 25, 25);
  }
}       
                
