
int woah;
int yeah;
float bang;
float bang2;
float bang3;

void setup() {
  size(500,500);
  background(255);
  smooth();
}


void draw() {
  
  woah=abs(pmouseX - mouseX);
  yeah=abs(pmouseY - mouseY);
  bang=((woah+yeah)/2)+random(30,100);
  bang2=bang+random(50,150);
  bang3=bang2+random(50,150);

  background(205);
  stroke(255,0,0);
  strokeWeight(0);
  

  
  if (mousePressed) {
    fill(255,255,255,100);
    noStroke();
    ellipse(mouseX,mouseY,bang,bang);
    ellipse(mouseX,mouseY,bang2,bang2);
    ellipse(mouseX,mouseY,bang3,bang3);
    //stroke(0,255,0);
    stroke(random(100,255),random(100,255),random(100,255));
    //strokeWeight((woah+yeah)/2);
    strokeWeight(((woah+yeah)/3)+random(0,5));
    
    line(pmouseX,pmouseY,mouseX+random(-200,200),mouseY+random(-200,200));
  line(pmouseX,pmouseY,mouseX+random(-200,200),mouseY+random(-200,200));
  line(pmouseX,pmouseY,mouseX+random(-200,200),mouseY+random(-200,200));
  } 
  line(pmouseX,pmouseY,mouseX,mouseY);
  line(0,0+random(0,height),mouseX,mouseY);
  line(width,0+random(0,height),mouseX,mouseY);
  line(random(0,width),0,mouseX,mouseY);
  line(random(0,height),height,mouseX,mouseY);
 
}




