
public class Ball extends MyObject{
  // instance variables
  boolean stopped;
  boolean antigrav;
  int lives;
  int myRad, myDiam;
  int jumps;
  public boolean wraparound;
   
  // default constructor
  public Ball(){
    // default sets values of ball and physics of ball
    myRad=32;
    myDiam=64;
    myWidth=myDiam;
    myHeight=myDiam;
    position = new PVector(myRad+1,height-myRad-1);
    PVector velocity = new PVector(0,0);
    PVector acc = new PVector(.085,.3);
    PVector drag = new PVector(.05,.25);
    physics = new Physics(velocity,acc,drag);
    stopped=false;
    antigrav=false;
    lives=5;
    jumps=0;
  }
  
  // constructor to start ball at a specified position
  public Ball(PVector position){
    this();
    this.position=position;
  }
  

   /*
  public Ball(PVector myPosition,int thisWidth,int thisHeight, Physics myPhysics){
    //sets custom values
    position = myPosition;
    myWidth=thisWidth;
    myHeight=thisHeight;
    physics = myPhysics;
    antigrav=false;
  }
*/
  
  // draws a circle.
  // This also outputs some properties
  // of the ball for debuging purposes.
  void drawMe(){
    //displays the ball at the current vector position.
    fill(#FF0000);
    ellipse(((int)position.x),position.y,myDiam,myDiam);
    fill(255);
    text(position.x, 15, 35);
    text(position.y, 15, 45);
    text(physics.velocity.x, 285, 35);
    text(physics.velocity.y, 285, 45);
    text(physics.acc.x, 405, 35);
    text(physics.acc.y, 405, 45);
    text(jumps, 400,40);
  }
  /*
  public ArrayList<MyObject> collide(ArrayList<MyObject> objects){
    PVector distance;
    ArrayList<MyObject> out = new ArrayList<MyObject>();
    for (MyObject o : objects){
      distance = position.get();
      distance.sub(o.getPosition());
      if (Math.sqrt(distance.x*distance.x+distance.y*distance.y)<=myRad+o.getWidth()/2 && !o.equals(this))
          out.add(o);
    }
    return out;
  }
  */
  
  // flipY is called in all collisions.
  // It handles bouncing and helps make
  // gravity work the way it should.
  void flipY(){
    // this stops the ball from bouncing infinitely
    if(Math.abs(physics.getVelocity().y) < 2 && physics.getVelocity().y > 0) stopped=true;
    if(stopped)physics.getVelocity().y = 0;
    
    // flips the vertical velocity and takes drag into account.
    // This makes the ball slow slightly with every
    // every collision, as it would in real life.
    physics.getVelocity().y *= -1 + physics.getDrag().y;
    
    jumps=0;
  }
  
  double getRad(PVector other){
    return myRad;
  } 
  
  // called when space is pressed
  void jump(){
    // only allows two jumps
    stopped=false;
    if(jumps<2){
      physics.velocity.y += (position.y>=height-myRad)? 6.5 : -6.5;
    }
    ++jumps;
    
    
  }
  
  void antigrav(){
    antigrav = !antigrav;
  }
  
  
  void moveMe(){
    //check for key presses
    if(keyPressed == false)
      physics.decellerateX(); // the ball decellerates when no keys are pressed
    if(pressed[LEFT])
      physics.accLeft();
    if(pressed[RIGHT])
      physics.accRight();
      
    // Increases vertical velocity by accelleration,
    // giving the ball a realistic look of falling.
    physics.getVelocity().y += physics.getAcc().y;
    
    // screen top/bottom edge bounds checks
    if(position.y >= height-myRad || position.y <= myRad)
      flipY();
    // this code handles horizantal wraparound.
    if(wraparound){
      if(position.x < 0 - myRad) position.x = width + myRad;
      else if(position.x > width + myRad) position.x = 0-myRad;
    }else{
      if(position.x >= width-myRad || position.x <= myRad) // left or right of screen 
      physics.getVelocity().x *=-1;
    }
    
    // these two lines of code add velocity to the current position.
    // This is what actually moves the ball.
    // Y velocity is only added if the ball is not resting on a block,
    // otherwise the ball will clip through the block.
    if(!stopped) position.y += physics.getVelocity().y;
    position.x += physics.getVelocity().x;
  }
  
  // When a ball copllides with something, 
  // it must bounce off in an appropriate direction.
  public void handleCollisions(ArrayList<MyObject> objects, World w){
    // First, the MyObject.collided method
    // must be called to detect which objects are currently being collided with.
    ArrayList<MyObject> collided = detectCollisions(objects);
    
    if(collided.size() == 0) stopped=false;
    
    for(MyObject o : collided){
        // This block is where bouncing on collision is handled.
        // Y direction must be flipped on any collision.
        flipY();
        
        // This block detects and handles collisions on the side
        // of an object. It reverses X direction, and makes the
        // ball fall down no matter what. This is not entirely
        // realistic, but seemed best for our game.
        if (Math.abs(position.x - o.getPosition().x) > Math.abs(position.y - o.getPosition().y)) {
          physics.getVelocity().y = Math.abs(physics.getVelocity().y);
          physics.getVelocity().x *= -1;
        }
        //}
    }
  }
}


