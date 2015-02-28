
PFont texto;
PFont texto2;
float posX, posY,posX2, posY2;
void setup(){
 size(500,400);
 texto = loadFont("Eyes-48.vlw");
 texto2 = loadFont("Ubuntu-Light-48.vlw");
  
 frameRate(3);
}

void draw(){
  
  background(0);
  for (int y = 0; y <= height; y += 30) { 
  for (int x = 0; x <=width; x += 30) { 
    /*strokeWeight(10);
    stroke(10,y/2,x);
    point(x, y);*/
  posX = random(x, x+10);
  posY = random(y-10, y+10);
  posX2 = random(x-10, x+10);
  posY2 = random(y-10, y+10);
  
  fill(245);
  textAlign(CENTER);
  textFont(texto, 48);
  text("w", posX, posY);
  
  }
}
  for (int y = 0; y <= height; y += 100) { 
  for (int x = 0; x <=width; x += 100) { 
    /*strokeWeight(10);
    stroke(10,y/2,x);
    point(x, y);*/
  
  posX2 = random(x-10, x+10);
  posY2 = random(y-10, y+10);
  
  
  textAlign(CENTER);
  
  
  fill(255);
  textFont(texto2, random(10,25));
  text("olhar na multidão", posX2, posY2 );
  }
}
 
}

