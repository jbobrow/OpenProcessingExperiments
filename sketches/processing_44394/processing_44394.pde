
float easing,dxa,dya,cxa,cya;
 float dxa1,dya1,cxa1,cya1;


void setup(){
  size(600,600);
  smooth();
  noStroke();
  
  easing= .05;
  
}

void draw(){
  background(250);
  
  for(int x=0; x<width; x+=10){
    for(int y=0;y <height; y+=10){
      if(x%5 ==0 && y%5 ==0){
        fill(0);
        float ellSizeX = (random(0-20));
        float ellSizeY = (random(0-20));
        rect(x,y,ellSizeX,ellSizeY);
        if(dist(mouseX,mouseY,x,y)<75){
          fill(255);
          rect(x+random(0-600),y+random(0-800),ellSizeX,ellSizeY);
          rect(x-random(0-600),y-random(0-800),ellSizeX,ellSizeY);
          rect(x+random(0-600),y-random(0-800),ellSizeX,ellSizeY);
          rect(x-random(0-600),y+random(0-800),ellSizeX,ellSizeY);
        }
      }
    }
  }

  
  
  
  fill(0);
  ellipse(300,500,100,100);
  stroke(255);
  strokeWeight(1);
  line(290,500,310,500);
  fill(255);
  triangle(290,500,296,500,293,505);
  triangle(310,500,304,500,307,505);
  fill(0);
  stroke(255);
  
  float ax = constrain(mouseX,230,250);
  float ay = constrain(mouseY,250,500);
  stroke(0);
  strokeWeight(2.5);
  line(ax,ay,275,500);
  stroke(255);
  strokeWeight(1);
  ellipse(ax,ay,30,30);
  
  
  float ax2 = constrain(mouseX,350,370);
  float ay2 = constrain(mouseY,250,500);
  stroke(0);
  strokeWeight(2.5);
  line(ax2,ay2,325,500);
  stroke(255);
  strokeWeight(1);
  ellipse(ax2,ay2,30,30);
  
  
  
    dxa = constrain(mouseX,310,320) - cxa;
    dya = constrain(mouseY,480,490) - cya;
    cxa = cxa + dxa  * easing;
    cya = cya + dya  * easing;
     fill(255);
      ellipse(cxa,cya,10,10);
      
      dxa1 = constrain(mouseX,280,290) - cxa1;
    dya1 = constrain(mouseY,480,490) - cya1;
    cxa1 = cxa1 + dxa1  * easing;
    cya1 = cya1 + dya1  * easing;
     fill(255);
      ellipse(cxa1,cya1,10,10);
  
  
  if (mousePressed == true) {
    fill(0);
  } else {
    noFill();
    noStroke();
  }
  ellipse(300, 500, 100, 100);
  
 fill(255);
 
  text("PARTY HARD & click me!",200,150,200,20);
  
  
  
}


