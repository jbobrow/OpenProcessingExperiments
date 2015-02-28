

void setup(){
  size(600,600);
  smooth();
  background(20);
  frameRate(10);
}

void draw(){
ellipseMode(CENTER);
noStroke();
fill(255,0,0,20);
ellipse(mouseX,mouseY,random(300),random(300));

 fill(0,0,0,63);
 ellipse(mouseX+30,mouseY+30,random(100),random(100));
}

void mousePressed(){
  noStroke();
  fill(0,20,0,20);
  ellipse(mouseX,mouseY,30,30);
  ellipse(mouseX+50,mouseY+50,20,80);
}
  
void keyPressed(){
  noStroke();
  fill(random(255),random(255),random(255),127);
  rect(100,220,20,20);
  rect(100,260,20,60);
  rect(140,220,20,100);
  rect(140,220,40,20);
  rect(140,300,60,20);
  rect(200,260,20,40);
  rect(240,220,20,100);
  rect(240,220,60,20);
  rect(280,260,20,20);
  rect(240,300,60,20);

  rect(340,280,20,40);
  rect(340,220,20,80);
  rect(360,220,40,20);
  rect(380,260,20,20);
  rect(400,220,20,100);
  
}


