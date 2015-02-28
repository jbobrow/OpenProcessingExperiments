
public class Particle{
  /** Properties ***************/
  private float _mass;
  private PVector _loc;
  private PVector _vel;
  private PVector _acc;
  
  private ArrayList _breadcrumb; 
  private color _c;
  private int _tailLength;
  
  /** Methods  ******************/
  // get mass of particle
  public float getMass(){
    return _mass;
  }
  
  // get vector location of particle
  public PVector getLocation(){
    return _loc.get();
  }
  
  // set vector location of particle
  public void addAcceleration(PVector i_acc){
    PVector myAcc = new PVector(i_acc.x, i_acc.y, i_acc.z);
    _acc.add(myAcc);
  }

  // update position of particle
  public void move(){
    _vel.add(_acc);
    _loc.add(_vel);
    _acc.set(0,0,0);
    
    // manage previous positions
    _breadcrumb.add(this.getLocation());
    if(_breadcrumb.size() > _tailLength) _breadcrumb.remove(0);
  }

  // draw particle on screen
  public void paint(){
    //draw the particle
    fill(_c);
    stroke(0,200);
    strokeWeight(2);
    point(_loc.x, _loc.y, _loc.z);
    
    //draw a trail based on previous positions
    for(int i = 1, len = _breadcrumb.size(); i<len; i++){
        PVector start = (PVector) _breadcrumb.get(i-1);
        PVector stop = (PVector)  _breadcrumb.get(i);
        
        //add color and dissipate over time
        stroke(_c,i);
        strokeWeight(3  + (len-i)/3);
        line(start.x, start.y, start.z, stop.x, stop.y, stop.z);
    }
  }

  /** Constructors  ****************/
  public Particle(float i_initMass, PVector i_initLoc){
    _loc = i_initLoc;
    _mass = i_initMass;
    _vel = new PVector(0,0,0);
    _acc = new PVector(0,0,0);
    
    _breadcrumb = new ArrayList();
    _c = color(random(255), random(255), random(255));
    _tailLength = 80;
  }
}

