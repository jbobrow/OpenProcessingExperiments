
float posX = 235;
float posY = 235;
float posX1 = 205;
float posY1 = 150;
float posX2 = 175;
float posY2 = 200;
float posX3 = 145;
float posY3 = 215;
float fps = 15;
  
void setup(){
size(250,250);
frameRate(fps);
}
  
void draw(){
background(0);

// multicoloured moving circles
stroke(color(random(255),random(255),random(255)));
strokeWeight(30);
point(posX,posY);
posX = random(width);
posY = random(height);  
stroke(color(random(255),random(255),random(255)));
strokeWeight(15);
point(posX1,posY1);
posX1 = random(width);
posY1 = random(height);  
stroke(color(random(255),random(255),random(255)));
strokeWeight(10);
point(posX2,posY2);
posX2 = random(width);
posY2 = random(height);  
stroke(color(random(255),random(255),random(255)));
strokeWeight(20);
point(posX3,posY3);
posX3 = random(width);
posY3 = random(height);

// moving beziers 
strokeWeight(1);
stroke(255);
noFill();
bezier (0, 125, random(width), random(height), random(width), random(height), 250, 125);
bezier (0, 100, random(width), random(height), random(width), random(height), 250, 100);
bezier (0, 150, random(width), random(height), random(width), random(height), 250, 150);
}

