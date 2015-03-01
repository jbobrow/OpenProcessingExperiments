
PFont f;
int i = 10;
int j = 350;
void setup() {
  size(400,80);
  f = loadFont("FuturistFixedWidth_Regular-48.vlw"); 
  background(255);
}

void draw() {
  if(i < 250)
    i += 5;
  else
    noLoop();
    
  if(j > 200)
    j -= 2;
    
  background(255);
  stroke(0);
  
  textFont(f,52);       
  fill(0);
  textAlign(CENTER);
  text("NASKOU",width/2,60); 
  stroke(255);
  strokeWeight(2);
  line(10, 52, i+5, 52);
  line(380, 52, j+5, 52);
}





