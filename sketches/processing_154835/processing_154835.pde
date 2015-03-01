
void setup(){
  size(800, 500);

}
void draw(){
 background(random(1000), random(500), random(250));
 fill(0, 125,0);
 textSize(20);
 text("Quando vc está impressionado que cara vc faz?",175, 250); 
 
if (mousePressed == true)
{
  background(0);
  fill(255,255, 0, 200);
  ellipse(255, 255, 250, 250); 
  fill(0);
  ellipse(210, 220, 30, 50);
  ellipse(300, 220, 30, 50);
  fill(255, 0, 0);
  ellipse(255, 310, 80,50);
}
}
