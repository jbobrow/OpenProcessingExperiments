
PImage a,b;


void setup() {
  size(500, 500);
  stroke(255,255,255);
  smooth();
  background(0);
  ellipseMode(CENTER);
  rectMode(CENTER);
  a = loadImage("spiral.png");
  b = loadImage("kitty.png");
}
 
int numObjects = 10;
int loops = 8;
int centerX = 250;
int centerY = 250;
float distance = 250;
float angle = 0;
 
void draw() {
  background(abs(distance/2),125-abs(distance - distance/5),125);
  image(a,0,0);
  fill(125-abs(distance - distance/5),125-abs(distance/2),125);;
  int x = 250;
  int y = 250;
  float hy = 0.5;
  int dia = 700;
  
  angle = radians(angle);
  arc(x, y, dia+hy*dia, dia+hy*dia, angle, angle + 1);
  arc(x, y, dia+hy*dia, dia+hy*dia, angle-PI, angle + 1-PI);
  line(x+20*cos(angle), y+20*sin(angle), x+30*cos(angle), y+30*sin(angle));
  line(x+20*cos(angle+1), y+20*sin(angle+1), x+30*cos(angle+1), y+30*sin(angle+1));
  arc(x, y, dia+hy*50, dia+hy*50, angle, angle + 1);
  arc(x, y, dia+hy*50, dia+hy*50, angle-PI, angle + 1-PI);
  line(x+20*cos(angle-PI), y+20*sin(angle-PI), x+30*cos(angle-PI), y+30*sin(angle-PI));
  line(x+20*cos(angle + 1-PI), y+20*sin(angle + 1-PI), x+30*cos(angle + 1-PI), y+30*sin(angle + 1-PI));

  //inner
  arc(x, y, dia+hy*50, dia+hy*50, 2*PI-angle, 2*PI-angle + 1);
  arc(x, y, dia+hy*50, dia+hy*50, 2*PI - angle-PI, 2*PI-angle + 1-PI);
  
  angle = degrees(angle);
  
  float angleObject = 360/numObjects;
  
  distance -= 1 + abs(distance/100);
  if (distance < -1000){
    distance = 1000;
  }
  angle++;
  
  float shifter = 1;
  
  for (int i=0;i<numObjects ;i++)
  {
    
    float posX=centerX + distance *cos( radians(angleObject*i + angle) );
    float posY=centerY + distance *sin( radians(angleObject*i + angle) );
    
    ellipse(posX, posY, 10, 10);
    pushMatrix();
      translate(150, 150);
      rotate(radians(angle));
      image(b, posX, posY, abs(distance/4),abs(distance/4));
    popMatrix();
    
    for(int j = 0; j < loops; j++){
      fill(i*25.5,j*42.5,i*25.5);
      rect(posX+j*10, posY+i*10, distance-distance/50, distance-distance/50);
      rect(posX-j*10, posY-i*10, distance-distance/50, distance-distance/50);
      rect(posX+j*10, posY-i*10, distance-distance/50, distance-distance/50);
      rect(posX-j*10, posY+i*10, distance-distance/50, distance-distance/50);
      ellipse(posX+j*18, posY+j*18, 10+j*18*shifter, 10+j*18*shifter);
      ellipse(posX-j*18, posY-j*18, 10-j*18*shifter, 10-j*18*shifter);
      line(posX+j*18, posY+j*18,posX-j*18, posY-j*18);

    }
  }
}

