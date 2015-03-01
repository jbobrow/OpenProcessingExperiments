
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];


void setup() 
{
  size(640, 360); 
  noStroke();
 
}

void draw() 
{   
  background(51); 
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i, i);
  fill(255, 204);
 if (mousePressed) {
    stroke(255);
    fill(random(255), random(255), random(255));
  } else {
    stroke(0);
  }
  ellipse(mouseX-66, mouseY, mouseX+66, mouseY);
   rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
   ellipse(mouseX, mouseX/3, mouseY/2+12, mouseY/2+12);
}
}


