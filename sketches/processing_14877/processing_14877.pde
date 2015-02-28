

void setup() {
  size(800,800);
  background(0);{
    stroke(255,0,100,60);
  fill(100);
  ellipse(200,200,200,200);
  fill(100);
  ellipse(600,200,200,200);
  fill(25);
  ellipse(400,400,500,500);
  fill(125);
  ellipse(300,360,100,150);
  fill(125);
  ellipse(500,360,100,150);
  fill(0);
  ellipse(300,400,80,70);
  fill(0);
  ellipse(500,400,80,70);{
    stroke(125);
    line(300,600,600,450);
    line(200,600,400,500);
    line(100,400,500,600);
    line(400,500,500,550);
  } 
}
}

  void draw() {
    textSize(30);
    fill(random(255),0,50,60);
    text("something",mouseX,mouseY);
    textSize(random(5,30));
    fill(255,150);
    text("?",random(mouseX),random(mouseY));
   }
                   
