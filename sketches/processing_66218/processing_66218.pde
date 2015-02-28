
public class Goal extends GameObject {
  private float s;
  private color goalColor;
  private float topEdge;
  private float bottomEdge;
  private float leftEdge;
  private float rightEdge;
  public boolean isObtained;

  public Goal(float x_, float y_, float s_) {
    super(x_, y_);
    s = s_;
    goalColor = #0000ff;
    isObtained = false;
    setEdges();
  }

  private void changeColor(color color_) {
    goalColor = color_;
  }

  public void changeSizeTo(float s_) {
    s = s_;
  }

  public boolean checkCollision(Player player) {
    if (this.bottomEdge > player.topEdge && this.topEdge < player.bottomEdge
      && this.rightEdge > player.leftEdge && this.leftEdge < player.rightEdge) {
      isObtained = true;
      changeColor(#00ff00);
      return true;
    }
    else {
      return false;
    }
  }
  
   public boolean checkCollision(Wall wall) {
    if (this.bottomEdge > wall.topEdge - wall.personalBubbleSize && this.topEdge < wall.bottomEdge + wall.personalBubbleSize
      && this.rightEdge > wall.leftEdge - wall.personalBubbleSize && this.leftEdge < wall.rightEdge + wall.personalBubbleSize) {
      return true;
    }
    else {
      return false;
    }
  }

  private void setEdges() {
    leftEdge = x - s/2;
    rightEdge = x + s/2;
    topEdge = y - s/2;
    bottomEdge = y + s/2;
  }

  public void display() {
    pushMatrix();
    translate(x, y);
    rectMode(CENTER);
    fill(goalColor);
    rect(0, 0, s, s);
    popMatrix();
  }
}


