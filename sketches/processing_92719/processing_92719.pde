
//inspired from http://processing.org/learning/anatomy/


void setup() {
  size(600, 600);
  background(255);
  colorMode(HSB, 360, 100, 100);
  setColor();
}

void setColor(){
  baseAngle = int(random(255));  // Grundfarbe setzen
  strokeCol = color(baseAngle, random(100), random(100));
}
void renewColor(){
  strokeCol = color(baseAngle, random(100), random(100));
}

void draw(){
  if(mousePressed){
      if(mouseButton == RIGHT){
      background(255,0,100);
      setColor();
      }else{
    muenze();
    splash();
    }
  }
  deleteDrawing();
}

void muenze(){
  if(key == 'm'){
    ellipse(mouseX+10, mouseY+20, mouseX-20, mouseY-50);
  }
}

void splash(){
  renewColor();
  stroke(strokeCol);
  fill(strokeCol);
  star((int)random(2, 8), mouseX-random(100), mouseY-random(100), random(100), random(100), -PI / 2.0, random(0, 1.5));
  star((int)random(2, 8), mouseX+random(200), mouseY+random(140), random(100), random(100), -PI / 2.0, random(0, 3.0));
  star((int)random(2, 8), mouseX+random(50), mouseY-random(78), random(100), random(100), -PI / 2.0, random(0, 2));
  star((int)random(2, 8), mouseX-random(120), mouseY+random(100), random(100), random(100), -PI / 2.0, random(0, 0.50));
//  ellipse(mouseX + 50, mouseY + 50,random(40),random(40));
}

void star(int n, float cx, float cy, float r, float proportion)
{
  star(n, cx, cy, 2.0 * r, 2.0 * r, 0.0, proportion);
}

void star(int n, float cx, float cy, float w, float h,
  float startAngle, float proportion)
{
  if (n > 2)
  {
    float angle = TWO_PI/ (random(2,6) *n);
    float dw; // draw width
    float dh; // draw height
    
    w = w / 2.0;
    h = h / 2.0;
    
    beginShape();
    for (int i = 0; i < random(4, 12) * n; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) // for odd vertices, use short radius
      {
        dw = w * proportion;
        dh = h * proportion;
      }
      curveVertex(cx + dw * cos(startAngle + angle * i) + random(10),
        cy + dh * sin(startAngle + angle * i) + random(10));
    }
    endShape(CLOSE);
  }
}

void deleteDrawing(){
  if(keyPressed && key == 'd'){ 
    setup();
  }
}


