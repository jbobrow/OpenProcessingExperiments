

// extend this class with different colors?
// different colors have different reactions when nearing/connecting

public class Ball extends FCircle {
  
  public static final int BLUE = 1;
  public static final int GREEN = 2;
  public static final int RED = 4;
  public static final int PURPLE = 8;
  
  //tried to use a hashmap initially, but it always gave nullpointer
  private ArrayList<Ball> connections;
  private int type;
  private Molecule parent;
  private long recombinationDelay;
  
  
  public Ball(float diameter, int type) {
    super(diameter);
    parent = null;
    recombinationDelay = 0;
    
    this.setRestitution(1.0);
    this.setFriction(0);
    this.setAngularDamping(0.2);
    this.setDamping(0);
    this.setGrabbable(true);
    this.setNoFill();
    
    this.type = type;
    switch (type) {
      case BLUE:    this.setFillColor(COLOR_BLUE);     break;
      case GREEN:   this.setFillColor(COLOR_GREEN);    break;
      case RED:     this.setFillColor(COLOR_RED);      break;
      case PURPLE:  this.setFillColor(COLOR_PURPLE);   break;
    }
    
    connections = new ArrayList<Ball>();
  }
  
  // any reason to for balls to keep track of their connections?
  public void connectTo(Ball b) {
    connections.add(b);
  }
  
  
  public boolean isConnectedTo(Ball b) {
    return connections.contains(b);
  }
  
  public int getType() {
    return type;
  }
  
  public void setType(int type) {
    this.type = type;
    switch (type) {
      case BLUE:    this.setFillColor(COLOR_BLUE);     break;
      case GREEN:   this.setFillColor(COLOR_GREEN);    break;
      case RED:     this.setFillColor(COLOR_RED);      break;
      case PURPLE:  this.setFillColor(COLOR_PURPLE);   break;
    }
  }
  public ArrayList<Ball> getConnections() {
    return connections;
  }
  public void clearConnections() {
    connections.clear();
  }
  public void setRecombinationDelay(long frame) {
    recombinationDelay = frame;
  }
  public long getRecombinationDelay() {
    return recombinationDelay;
  }
  public Molecule getParentMolecule() {
    return parent;
  }
  public void setParentMolecule(Molecule parent) {
    this.parent = parent;
  }
}

