
 
float x, y, wd, ht;
color col;
color col2;
color col3;
 
void setup()
{
    size (400, 400);
    x = 0;
    y = height*0.6;
    wd = width*0.35;
    ht = height*0.43;
    col = color(0, 0, 0, 0);
    frameRate(50);
}
void mousePressed()
{
      col = color(random(255), random(255), random(255));
      col2 = color(random(255), random(255), random(255), 10);
}
 
void keyPressed()
{
      col3 = color(random(255), random(255), random(255));
}
 
void draw()
{
    fill(col2);
    noStroke();
    rect(0, 0, width, height);
    fill(col);
    stroke(col3);
    ellipse(mouseX, mouseY, mouseX - mouseY, mouseY - mouseX);
    
}



