
void setup()
{
  size(480,480);
  background(0);
  //font = loadFont("BasicSansHeavySFBold-48");
  textFont(createFont("Basic Sans Heavy SF Bold",48));
  //noStroke();
}

PFont font;
Word word;
String wordie = "constraint";
int x = 0, y = 0;
float distance;
float centerx = 240;
float centery = 240;
float mousedist = dist(mouseX, mouseY, centerx,centery);
int textstage = 240;

void draw()
{
  background(0,0, 0);
    
    fill(0);
    float dx = constrain(mouseX, centerx -50,centery + 50);
    float dy = constrain(mouseY, centerx - 100, centery + 100);
    x += (dx - x) * 0.2;
    y += (dy - y) * 0.2;
    distance = dist(x,y,mouseX,mouseY)/2;
    if(distance < 30)
    {
      textstage--;
    }else
    {
      if(textstage < 240)
        textstage+=5;
    }
    stroke(255);
    line(centerx,centery,x,y);
    line(centerx,centery,x - 93,y);
    line(centerx,centery,x + 90,y);
    line(centerx,centery,x,y - 30);
    line(centerx,centery,x - 93,y - 25);
    line(centerx,centery,x + 90,y - 30);
    fill(150,25,textstage);
    text(wordie, x - 105,y); 

}

public class Word
{
  public void drawWord()
  {
    textSize(32);
    fill(0,100,153,204);
    float a = atan2(mouseY - centery, mouseX - centerx);
    float newx = centerx + cos(a) * mousedist;
    float newy = centery + cos(a) * mousedist;
    distance = dist(newx,newy,mouseX,mouseY)/3;
    fill(255);
    text(wordie,centerx,centery);
    stroke(255);
    line(0,0,100,100);
  }
  
  public void Draw()
  {
    fill(0,100,153,204);
    text(wordie,mouseX,mouseY);
  }
  
  public void drawCape()
  {
    fill(200,100,20);
    /*beginShape();
    vertex(50, 50); // first point
    bezierVertex(25, 25, 100, 50, 25, 25);
    bezierVertex(20, 130, 75, 140, 25, 50);
    endShape();*/
    pushMatrix();
     translate(mouseX, mouseY);
    triangle(0,0, 0,100, 100, 50);
    popMatrix();
  }
}


