
int w = 400;
int h = 400;
int s = 8;
color c = color(0,0,0);

void setup() {
  clearBackground();
}
void draw() {
}




void mouseDragged() 
{
  stroke(c);
  strokeWeight(s);
  line(pmouseX,pmouseY,mouseX,mouseY);
}

void keyPressed(){
  if (key=='['){
    s = s-2;
  }
    if (key==']'){
    s = s+2;
  }
  if (key=='c'){
    c = color(random(0,255),random(0,255),random(0,255));
  }
  if (key=='e'){
    clearBackground();
  }
  
}


void clearBackground(){
  background(255);
  noStroke();
  size(w, h);
  fill(#FCF5F0);
  ellipse(w/2,0,400,600);
  fill(#FACFDE);
  arc(w/2,h/2+2-30,140,40,0,PI);
  arc(w/2-30,h/2-30,80,40,PI,2*PI);
  arc(w/2+30,h/2-30,80,40,PI,2*PI);
  stroke(#FACFDE);
  strokeWeight(8);
  line(w/2-30,0,w/2-40,80);
  line(w/2-40,80,w/2,80);
}
