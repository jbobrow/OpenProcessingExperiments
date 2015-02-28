
int x= 150;
int y= 150;
int d;
int t= 0;

void setup(){
  size(640,480);
}

void draw(){
  
  strokeWeight(t);
  stroke(0,0,0,20);
  line(pmouseX,pmouseY,mouseX,mouseY);
  t = abs(mouseX -pmouseX);
  
for(int i=0; i<200; i++) {
  float r = random(-50,50);
  stroke(r*5);
  background(random(0,255),random(0,255),random(0,255),random(0,255));
  line(width/2,0,width/2,height);
  line(2*width/2,0,2*width/2,height);
  println(r);
  

}

x = mouseX;
y = mouseY;
  smooth();
  strokeWeight(2);
  fill(0, 255, 0,100);
ellipse(x, y, 200, 200);
ellipse(x+325, y-20, 200, 200);
ellipse(x+174, x+180, 300, 300);

fill(255,0,0,50);
  if (mouseX < width/3)
    rect(0,0,width/2, height);
    else if(mouseX<2* width/2)
    rect(width/2,0,width/2, height);

}

