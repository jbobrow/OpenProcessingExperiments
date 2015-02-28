
void setup()
{
  size(600,400);
fill(255,0,0,90);
//background(0,0,0);
}
void draw()
{
fill(140,140,140,25);
noStroke();
rect(0,0,width,height);

stroke(random(255),random(100),random(200));
strokeWeight(random(5));
line(0,0,mouseX,mouseY);

strokeWeight(random(5));
line(600,0,mouseX,mouseY);

strokeWeight(random(5));
line(0,400,mouseX,mouseY);

}
