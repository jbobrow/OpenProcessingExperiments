

void setup(){
  size(500,500);
  background(0);
  
 
}

void draw(){
  if (mousePressed == true){
 
  
  noStroke();
  scale(random(2));
  rotate(random(180));
  smooth();
  fill(68,93,102,random(250));
  ellipse(mouseX+50,mouseY+50,50,50);
  
  noStroke();
  scale(1,1,random(3));
  smooth();
  fill(143,152,176,random(250));
  ellipse(mouseX+50,mouseY+0,50,50);
  
  noStroke();
  smooth();
  fill(143,152,176,random(250));
  ellipse(mouseX+50,mouseY+100,50,50);
  
  noStroke();
  smooth();
  fill(115,113,128,random(250));
  ellipse(mouseX+5,mouseY+25,50,50);
  
  noStroke();
  scale(1,1,random(2));
  smooth();
  fill(115,113,128,random(250));
  ellipse(mouseX+95,mouseY+75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(250));
  ellipse(mouseX+5,mouseY+75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(250));
  ellipse(mouseX+95,mouseY+25,50,50);
}
}

