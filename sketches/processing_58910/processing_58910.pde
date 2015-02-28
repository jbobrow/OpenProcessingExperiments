
void setup(){
  size(800, 800);
  frameRate(200);
}
void draw(){
  tint(mouseX,mouseY,random(0,255));
  strokeWeight(2);
  stroke(random(mouseX/50,150),0,random(mouseX/50,255),random(0,255));
  line(mouseX+random(-800,800),mouseY+random(-800,800),mouseX,mouseY);
   stroke(random(mouseX/50,150),0,random(mouseX/50,255),random(0,255));
  line(mouseX+random(-800,800),mouseY+random(-800,800),mouseX,mouseY);
   stroke(random(mouseX/50,150),0,random(mouseX/50,255),random(0,255));
  line(mouseX+random(-800,800),mouseY+random(-800,800),mouseX,mouseY);
   stroke(random(mouseX/50,150),0,random(mouseX/50,255),random(0,255));
  line(mouseX+random(-800,800),mouseY+random(-800,800),mouseX,mouseY);
   stroke(random(mouseX/50,150),0,random(mouseX/50,255),random(0,255));
  line(mouseX+random(-800,800),mouseY+random(-800,800),mouseX,mouseY);
   stroke(random(mouseX/50,150),0,random(mouseX/50,255),random(0,255));
  line(mouseX+random(-800,800),mouseY+random(-800,800),mouseX,mouseY);
   stroke(random(mouseX/50,150),0,random(mouseX/50,255),random(0,255));
  line(mouseX+random(-800,800),mouseY+random(-800,800),mouseX,mouseY);
   stroke(random(mouseX/50,150),0,random(mouseX/50,255),random(0,255));
  line(mouseX+random(-800,800),mouseY+random(-800,800),mouseX,mouseY);
   stroke(random(mouseX/50,150),0,random(mouseX/50,255),random(0,255));
  line(mouseX+random(-800,800),mouseY+random(-800,800),mouseX,mouseY);
  strokeWeight(0);
  fill(255,255,255,random(0,255));
  ellipse(mouseX,mouseY,mouseX/4,mouseY/4);
  
  
  
}

