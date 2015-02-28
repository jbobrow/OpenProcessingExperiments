


class AlienPuppetAntennas extends AlienPuppetPinnableEnd {
  private PApplet parent;

  public AlienPuppetAntennas(PApplet parent) {
    super();
    this.parent = parent;
  }

  public void draw(PVector currentPosition, boolean deadEyes) {	
    parent.stroke(255);

    PVector lAntenna = new PVector(getEndsPinDownPosition().x - 31, getEndsPinDownPosition().y -64);		
    PVector rAntenna = new PVector(getEndsPinDownPosition().x + 31, getEndsPinDownPosition().y -64);

    parent.line(currentPosition.x - 22, currentPosition.y -52, lAntenna.x, lAntenna.y);
    parent.line(currentPosition.x + 22, currentPosition.y -52, rAntenna.x, rAntenna.y);

    if (deadEyes == false)
    {
      parent.fill(0);
    }
    else
    {
      parent.fill(255);			
    }
    parent.ellipseMode(parent.CENTER);


    parent.ellipse(lAntenna.x, lAntenna.y, 3, 3);
    parent.ellipse(rAntenna.x, rAntenna.y, 3, 3);
  }	
}


class AlienPuppetLegs extends AlienPuppetPinnableEnd {

  private PApplet parent;

  public AlienPuppetLegs(PApplet parent) {
    super();
    this.parent = parent;
  }

  public void draw(PVector currentPosition, boolean deadEyes) {
    parent.stroke(255);
    parent.fill(255);

    parent.line(currentPosition.x - 10, currentPosition.y + 50, getEndsPinDownPosition().x - 20, getEndsPinDownPosition().y + 60);
    parent.line(currentPosition.x + 10, currentPosition.y + 50, getEndsPinDownPosition().x + 20, getEndsPinDownPosition().y + 60);		
  }	
}


abstract class AlienPuppetPinnableEnd {

  private boolean endsArePinnedDown = false;
  private PVector endsPinDownPosition = new PVector();

  public PVector getEndsPinDownPosition() {
    return endsPinDownPosition.get();
  }

  public void pinDown() {
    endsArePinnedDown = true;
  }

  public void unpinDown() {
    endsArePinnedDown = false;
  }

  public boolean AreEndsPinnedDown() {
    return endsArePinnedDown;
  }

  public void updateCurrentPinDownPosition(PVector currentPosition) {
    if (endsArePinnedDown == false)
    {				
      endsPinDownPosition = new PVector(currentPosition.x, currentPosition.y); 
    }
  }

  public int getStretchLenght(PVector currentPosition) {
    if (endsArePinnedDown == true)
    {
      return (int)endsPinDownPosition.dist(currentPosition);
    }		

    return 0;
  }

  public abstract void draw(PVector currentPosition, boolean deadEyes);
}






