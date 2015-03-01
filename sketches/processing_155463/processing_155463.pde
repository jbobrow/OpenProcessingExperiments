
// Miranda Parker
// July 28
// This program draws some semblance of a flower :D

void draw() {  
  size(500,500); //adjust size to 500x500 screen
  background(74,236,247); //changes background color to a nice blue

  fill(random(200,256),random(50,100),random(250,256));
  ellipse(250,175,100,100); // draws top petal
  // draws bottom two petals
  ellipse(290,325,100,100); 
  ellipse(210,325,100,100);
  // draws two more petals
  ellipse(175,275,100,100);
  ellipse(325,275,100,100);
  //draws top two petals
  ellipse(175,205,100,100);
  ellipse(325,205,100,100);
  
  fill(255,250,120);
  rect(200,200,100,100); //center of flower
}
