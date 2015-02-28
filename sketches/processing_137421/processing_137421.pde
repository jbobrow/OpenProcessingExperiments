

String word = "you can't get a job because you have no experience because";
PFont font;
float r = 150;
void setup()
{
    size(1000,750);
    font = createFont("Ariel", 50);
    textFont(font);
    textAlign(CENTER);
    smooth();
}

void draw()
{
    background(0);
    stroke(255);

    int cx = 500;
    int cy = 350;
    int a = 350; 
    int b = 250; 
    float t = millis()/4000.0f; //increase to slow down the movement
    ellipse(cx, cy, 5, 5);
    for (int i = 1 ; i <= 12; i++) 
    {
        t = t + 100;
        int x = (int)(cx + a * cos(t));
        int y = (int)(cy + b * sin(t));
        textSize(35);
        text(i, x, y);
    }
     translate(width/2, height/2);
  noFill();
  noStroke();
  ellipse(0,0,r*2,r*2);
  float arc = 0;
  for(int i = 0; i < word.length(); i ++)
  {
    char current = word.charAt(i);
    float wid = textWidth(current);
    arc += wid/2;
    float rot = PI + arc/r;
    pushMatrix();
    translate(r*cos(rot), r*sin(rot));
    rotate(rot + PI/2);
    fill(255);
    text(current, 0, 0);
    popMatrix();
    arc += wid/2;
  }
  
}


