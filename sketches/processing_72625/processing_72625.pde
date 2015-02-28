
size (1000,1000);
background(#ff0000);
noStroke();
for (int i =0;i<200;i++) {
  ellipseMode(CENTER);
  ellipse(random(width),random(height/10),random(width/20),height*0.95);
  ellipse(random(width),height,random(width/20),height*0.8);
}
