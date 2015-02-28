
int x;
int y;
int l;

void setup() {
  size(600,600);
  frameRate(10);
}

void draw() {
  background(0);
 
 y = 0;
l = 50;
  
  for(x = 0; x < width; x += 50) {
    strokeWeight(1);
    stroke(0);
    fill(0);
    rect(x,y,l,height);
  
  if(mouseX > x-l && mouseX < x+l) { //se colocar mouseX = x-l*2, trÃªs rectÃ¢ngulos "acendem" em vez de dois. Se colocar mouseX = x, sÃ³ um rectÃ¢ngulo "acende"
      strokeWeight(random(1,50));
      stroke(0);
      fill(255);
    rect(x,y,l,height);
  }
  }
}


