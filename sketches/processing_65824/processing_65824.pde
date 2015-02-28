
float speed = 10;

class Robot
{
  private int config, y;
  private float tx, ty, sclx, scly;
  private color c, colors[];
  
  public Robot(int config, float tx, float ty, float sclx, float scly, color c)
  {
    this.config = config;
    this.y = (config == 0 ? -50 : 50);
    this.tx = tx;
    this.ty = ty;
    this.sclx = sclx;
    this.scly = scly;
    this.c = c;
    
    this.colors = new color[20];
    updateColors();
  }
  
  public void updateColors()
  {
    for(int i = 0; i < 20; i++)
      colors[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }
  
  public void move()
  {
    tx = constrain(tx + random(-speed, speed), 0, width);
    ty = constrain(ty + random(-speed, speed), 0, height);
  }
  
  public void display()
  {
    pushMatrix();
    translate(tx, ty);
    scale(sclx, scly);
    
    fill(c);
    // Face
    rect(0, 0, 300, 200);
    
    for(int x = 0; x < 10; x++)
    {
      noStroke();
      fill(colors[x * 2]);
      rect(x * 25 - 112.5, y - 12.5, 25, 25);
      fill(colors[x * 2 + 1]);
      rect(x * 25 - 112.5, y + 12.5, 25, 25);
      
      stroke(0);
      line(x * 25 - 100, y - 25, x * 25 - 100, y + 25);
    }
    line(-125, y, 125, y);
    
    noFill();
    // Eye
    rect(0, y, 250, 50);
    
    fill(255);
    // Nose
    rect(0, 0, 50, 50);
    // Mouth
    rect(0, -y, 200, 50);
    
    popMatrix();
  }
}

