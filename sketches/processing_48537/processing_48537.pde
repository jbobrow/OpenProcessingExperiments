

void setup()
{
 size(400,600);
 background(255,255,255);
  smooth();
  textAlign(CENTER);
  textSize(32);
  frameRate(15);

}

void draw()
{
  textSize(random(50));
 
  
  
}
void mousePressed()
{
 fill(random(255),random(255),random(255)); 
  text("Merry Christmas",mouseX,mouseY); 
}  
void keyPressed()
{
fill(random(0),random(255),random(0));  
triangle(200,100,100,300,300,300);  
fill(111,75,41);
rect(175,300,50,50);
}



