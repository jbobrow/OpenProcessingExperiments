

int positionX;
int positionY;

void setup(){
  size(1000,800);
  smooth();
  background(0);
}

void draw(){  

  
    fill(255,random(222),random(248),random(40));
    noStroke();
    beginShape();
    vertex(width/2, height/2);
    bezierVertex(random(width), random(height), random(width), random(height),random(width), random(height));
    endShape();
    
    if(mousePressed && (mouseButton==LEFT)){
      fill(random(255),random(255),random(255),random(80));
      positionX=mouseX;
      positionY=mouseY;
      beginShape();
      vertex(positionX, positionY);
      bezierVertex(random(width), random(height), random(width), random(height),random(width), random(height));
      bezierVertex(random(width), random(height), random(width), random(height),random(width), random(height));
      endShape();
    }
    if(mousePressed && (mouseButton==RIGHT)){
      fill(0);
      positionX=mouseX;
      positionY=mouseY;
      ellipse(positionX,positionY,300,300);
    }    
}

