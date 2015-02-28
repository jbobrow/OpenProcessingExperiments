
void setup() {
  size (400,400);
  
  noStroke();
  color from = color(156,233,255); //blue
  color to = color(84,197,28); //green
  color interA = lerpColor (from, to, .20); //less amount of green colour incorporated
  color interB = lerpColor (from, to, .60); //more colour (green) 
                                            //incorporated closer to the bottom
  fill(from); //(from) the sky=(blue);
    rect(0,0,400,100);
  fill (interA);
    rect(0,100,400,200);
  fill (interB);
    rect(0,200,400,300);
  fill (to); //(to) the grass=(green);
    rect(0,300,400,400);
    
}

void draw() {  
  
  // rain
  fill(10,135,171);
  smooth();
  for (int x = 160; x < 250; x = x+20) {
  for (int y = 110; y < 300; y = y+20) {
    ellipse(x,y,8,8);
  }
}

//cloud
  smooth();
  fill(255);
  noStroke();
  ellipse(200,50,60,60);
  ellipse(150,70,60,60);
  ellipse(250,70,60,60);
  ellipse(200,95,65,65);
  ellipse(240,110,35,35);
  ellipse(160,110,35,35);
  
  
  
  
}
