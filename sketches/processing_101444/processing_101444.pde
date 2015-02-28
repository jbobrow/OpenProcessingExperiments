
// TODO: Remove spark after off screen or faded


// Gravity for physics
float GRAVITY = 0.01;
int NUMBER_SPARKS = 100;
float SPARK_SPEED = 0.7;
float SPARK_RESISTANCE = 0.1;
float SPARK_FADE = 3000;

//Set up an array to hold firework sparks
ArrayList<Spark> sparks = new ArrayList();


void setup() {
  size(500, 500);
  background(0);
  rectMode(CENTER);
}

long lastFrameTime = millis();        // Last frame time


void draw() {

  // Timing
  long now = millis();
  long elapsedTime = now - lastFrameTime;
  lastFrameTime = now;


  // Gradually fade screen
  noStroke();
  fill(0, 0, 0, constrain(elapsedTime * 2, 0, 255));
  rect(width/2, height/2, width, height);


  for (Spark sp : sparks) {
    sp.age += elapsedTime;
    sp.render(elapsedTime);
    sp.centre.evolve(elapsedTime);
  }
}

void mousePressed() {

  //Choose firework colour
  float red = random(0, 255);
  float green = random(0, 255);
  float blue = random(0, 255);

  // Create random sparks
  for (int i = 0 ; i < NUMBER_SPARKS ; i++) {
    // Explosion creates random spark velocities
    float speed = random(0, SPARK_SPEED);
    float dir = 360.0 / NUMBER_SPARKS * (i + random(-1, 1));
    createSpark(mouseX, mouseY, // Position
    speed * sin(dir), speed * cos(dir), // Velocity
    red, green, blue, // Colour
    (long) random(0, 1000));                 // Time (use lastFrameTime as close enough)
  }
}


void createSpark(float posX, float posY, float velX, float velY, 
float red, float green, float blue, 
long ageAdjust)
{
  Point2D pos = new Point2D(posX, posY);
  Vector2D vel = new Vector2D(velX, velY);
  Spark spark = new Spark(pos, vel, red, green, blue, ageAdjust);
  sparks.add(spark);
}



//---------------------------------------------------------------------
// Spark class for fireworks 
//---------------------------------------------------------------------

public class Spark {

  // This is the centre of the spark, used for applying physical attributes
  public Particle centre;
  // Time created for fading / sparkling
  public long age; 
  // Colour of the spark
  private float red;
  private float green;
  private float blue;
  // Air Resistance of the spark
  private float airResistance = SPARK_RESISTANCE;

  public Spark(Point2D location, Vector2D velocity, 
  float red, float green, float blue, 
  long ageAdjust) 
  {
    this.centre = new Particle(location, velocity, airResistance);
    this.red = red;
    this.green = green;
    this.blue = blue; 
    this.age = ageAdjust;
  } 

  // Draw the spark over the next time period
  public void render(float elapsedTime) {   
    float fade = (sin(age/100) + 1) / 2 * constrain(1 - age/SPARK_FADE, 0, 1) ;
    stroke(red, green, blue, 128*fade);
    strokeWeight(3);
    Point2D to = centre.location.shift(centre.velocity.times(elapsedTime));
    line(centre.location.x, centre.location.y, to.x, to.y);

    stroke(red, green, blue, 128 * fade);
    strokeWeight(1);
    fill(red, green, blue, 255 * fade);
    rect(to.x, to.y, 3, 3);
  }
}



//---------------------------------------------------------------------
// Particle class for physics to apply
//---------------------------------------------------------------------

public class Particle {

  private Point2D location;
  private Vector2D velocity;
  private float airResistance;

  public Particle(Point2D location, Vector2D velocity, float airResistance) {
    this.location = location;
    this.velocity = velocity;
    this.airResistance = airResistance;
  }

  // Evolve the particle over the time period
  public void evolve(float elapsedTime) {

    // Continue at current velocity in absence of other forces
    location = location.shift(velocity.times(elapsedTime)); 

    // Apply gravity
    velocity.y += GRAVITY;

    // Apply air resistance
    velocity.x *= (1 - airResistance);
    velocity.y *= (1 - airResistance);
  }
}



//---------------------------------------------------------------------
// Point2D class for coordinate system
//---------------------------------------------------------------------

public class Point2D {
  public float x;
  public float y;

  public Point2D(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public Point2D shift(Vector2D v) {
    return new Point2D(x + v.x, y + v.y);
  }
}


//---------------------------------------------------------------------
// Vector2D class for coordinate system
//---------------------------------------------------------------------

public class Vector2D {
  public float x;
  public float y;

  public Vector2D(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public Vector2D times(float t) {
    return new Vector2D(t * x, t * y);
  }
}



