
int X=250, Y=250, R, G, B;
int i, RndX, RndY;

void setup(){
  size(500,500);
  frameRate(60);
  background(0,0,0,100);
}

void draw(){
  
  bgclr();
  
  RndX = int(random(0,100));
  fill(255);
  if(RndX < 50) { X = X + 1; } else { X = X - 1; }
  if(X > width){ X = 0;} else if(X < 0){ X = width;}

  RndY = int(random(0,100));  
  if(RndY < 50) { Y = Y + 1; } else { Y = Y - 1; } 
  if(Y > height){ Y = 0;} else if(Y < 0) { Y = height;}


  R = int(mouseX);
  G = int(dist(X, Y, mouseX, mouseY));
  B = int(mouseY);
  
  strokeWeight(1);
  stroke(255,0,0,10);
  line(X, Y, mouseX, mouseY);

  textSize(dist(X, Y, mouseX, mouseY)/10);
  fill(0,0,255,30);
  text(dist(X, Y, mouseX, mouseY),lerp(X, mouseX, 0.5)-dist(X, Y, mouseX, mouseY)/10, lerp(Y, mouseY, 0.5));
  
  color RanClr = color(R, G ,B); 
  set(int(X), int(Y), RanClr); 

}

void bgclr(){
  noStroke();
  fill(0,0,0,2);
  rect(0,0,width,height);
}

void mousePressed() {
  fill(255);
  textSize(40);
  text("Distance",10,50);
  text("between",30,100);
  text("us",100,150);
  text("and",10,200);
  text("the pseudo-",50,250);
  text("-Brownian motion",100,300);
  text("with",20,350);
  text("a Random walk",50,400);

}

void mouseReleased(){
  noStroke();
  fill(0,0,0,255);
  rect(0,0,width,height);
}


