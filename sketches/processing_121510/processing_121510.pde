
void setup() {
  size(500, 500);
  noStroke();
  textAlign(CENTER)
  colorMode(HSB);
}

Void change_color();
{
   fill(random(255),  255, 255);
    text("LHS", width/2, height/2);
    }

void change_size() 
{
    textSize(random(50));
    text("LHS", width/2, height/2);
  }
  
  void draw()
  {
  
  change_color();
  change_size();
  }
