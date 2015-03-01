
void setup()
{
  size(400, 600);
  background(0, 155,188);
  smooth();
   
   noStroke();
  fill(136,167,2);
  triangle(200,0,100,500,300,500);
   
  fill(77,32,2);
  rect(175,500,50,50);
  fill(255,157,17);
  textSize(36);
  textAlign(CENTER);
 
  text("Frohe Weihnachten!",width/2,height-20);
}
void draw()
{
  fill(240,252,69);
  triangle(200,0,175,35,225,35);
  triangle(200,50,175,15,225,15);
  if(mousePressed==true){
      fill(random(255),random(80),random(80));
      ellipse(mouseX, mouseY, 15, 15);
  }
   
}
 

