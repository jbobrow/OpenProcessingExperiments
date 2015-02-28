
void setup() {
  size(500, 100);
  noStroke();
}

Void change_color();
{
  textAlign(CENTER);
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
