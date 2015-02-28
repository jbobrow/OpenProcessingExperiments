
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
float standardx;
float standardy;
float random4;
float colorR;
float colorG;
float colorB;


void setup() {
  size(500, 400);
    frameRate(1);
  stroke(10);
  background(#FFFFFF);
  noFill();

}


void draw() {
  background(#FFFFFF);
  random4 = random(4);
  strokeWeight(2);
  colorR = random(255);
  colorG = random(255);
  colorB = random(255);
  fill(colorR, colorG, colorB);
  stroke(colorR, colorG, colorB);


  
  
  if (random4 < 1) {
x1 = (width/2)-random(width/2.4);
y1 = (height/2)-random(height/2.4);
x2 = (width/2) + random(width/2.4);
y2 = (height/2) - random(height/2.4);
x3 = (width/2) + random(width/2.4);
y3 = (height/2) + random(height/2.4);
x4 = (width/2) - random(width/2.4);
y4 = (height/2) + random(height/2.4);  
  curve(x1, y1,x2, y2, x3, y3, x4, y4);
  beginShape();
vertex(x1, y1);
vertex(x2, y2);
vertex(x3, y3);
vertex(x4, y4);
vertex(x1, y1);
endShape();
    }
 
  if (random4 >= 1 && random4 < 2) {
x1 = (width/2)-random(width/2.4);
y1 = (height/2)-random(height/2.4);
x2 = (width/2) + random(width/2.4);
y2 = (height/2) - random(height/2.4);
x3 = (width/2) + random(width/2.4);
y3 = (height/2) + random(height/2.4);
x4 = (width/2) - random(width/2.4);
y4 = (height/2) + random(height/2.4);
beginShape();
vertex(x1, y1);
vertex(x2, y2);
vertex(x3, y3);
vertex(x4, y4);
vertex(x1, y1);
endShape();
  }
  
  
  if (random4 >=2 && random4 < 3) {
x1 = (width/2)-random(width/2.4);
y1 = (height/2)-random(height/2.4);
x2 = (width/2) + random(width/2.4);
y2 = (height/2) - random(height/2.4);
x3 = (width/2) + random(width/2.4);
y3 = (height/2) + random(height/2.4);
x4 = (width/2) - random(width/2.4);
y4 = (height/2) + random(height/2.4);  

  curve(x4, y4,x1, y1, x2, y2, x3, y3);
  beginShape();
vertex(x1, y1);
vertex(x2, y2);
vertex(x3, y3);
vertex(x4, y4);
vertex(x1, y1);
endShape();

    
    
  }
  
    if (random4 >=3) {
x1 = (width/2)-random(width/2.4);
y1 = (height/2)-random(height/2.4);
x2 = (width/2) + random(width/2.4);
y2 = (height/2) - random(height/2.4);
x3 = (width/2) + random(width/2.4);
y3 = (height/2) + random(height/2.4);
x4 = (width/2) - random(width/2.4);
y4 = (height/2) + random(height/2.4);  

  curve(x4, y4,x1, y1, x2, y2, x3, y3);
    curve(x1, y1,x2, y2, x3, y3, x4, y4);
      curve(x2, y2,x3, y3, x4, y4, x1, y1);
        curve(x3, y3,x4, y4, x1, y1, x2, y2);
  beginShape();
vertex(x1, y1);
vertex(x2, y2);
vertex(x3, y3);
vertex(x4, y4);
vertex(x1, y1);
endShape();
    
  }
  
  }
