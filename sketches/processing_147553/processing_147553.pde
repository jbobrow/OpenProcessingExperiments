
ArrayList <Particle> particles = new ArrayList(); //container <nameoftheclass> function = new container

void setup()   
{
  size (700, 700, P3D);

  frameRate(60);
}

void draw() 
{
  background (100, 200, mouseY);
  for ( int i = 0; i < particles.size(); i++)
  {
    Particle tempParticle = particles.get(i); 
    tempParticle.updatePosition();
    tempParticle.draw();
  }

  //Manages dead particles
  ArrayList<Particle> particlesToBeDeleted = new ArrayList(); //create our second container, we will add particles that we want to delete

  for (int i=0; i<particles.size(); i++)
  {
    Particle myParticle = particles.get(i);
    //chack if this particle is Alive, if not add it the the particlesToBeDeleted container
    if (myParticle.isAlive() == false ) 
      particlesToBeDeleted.add (myParticle);
  }
  particles.removeAll(particlesToBeDeleted);
  
  //to know how many particles we have inside
  println ("particles running; " + particles.size());
  fill(255);
  textAlign(CENTER);
  textSize(40);
  String s = "Happy Birthday My Love X X X";
  text (s, 170, 300, width/2, height/2);
}

//void mousePressed()
void mouseMoved()
{
  Particle p = new Particle();
  p.setup(mouseX, mouseY);  // 3/3 to make the balls appear where the mouse is 
  particles.add( p );
}

class Particle
{
  PVector position;
  PVector velocity;

  int currentLife; // 1/3 to die: to create variables to delete objects after a while 
  int maxLife;

  void setup(float startX, float startY) // 1/3 to make the balls appear where the mouse is
  {
    position = new PVector (startX, startY); // 2/3 to make the balls appear where the mouse is
    velocity = new PVector (random(-5, 5), random(-5, 5));

    currentLife = 0; // 2/3 to die: when baby borns it has 0 years hahah
    maxLife = 255; // 3/3 to die: alfa value
  }

  void draw()
  {
    noStroke();
    fill(255, 255 - currentLife);  //add to the be alive function
    //stroke (0, 255 - currentLife); //to delete the line of the ellipse
    //ellipse(position.x, position.y, 10, 10); //original line
    ellipse(position.x, position.y, currentLife, currentLife);
  }

  void updatePosition() 
  {
    position.add(velocity);

    if (position.x <= 0) //if you only have 1 line of comment dont open and close {}
      velocity.x = -velocity.x;

    if (position.x >= width)
      velocity.x = -velocity.x;

    if (position.y <= 0)
      velocity.y = -velocity.y;

    if (position.y >= height)
      velocity.y = -velocity.y;

    //addition to be alive functions
    position.add(velocity);
    //addition to be alive functions
    currentLife ++;
  }
  //isAlive() function
  //Check if this particle is alive. If is alive it will return TRUE,
  //if not it will return 
  //addition to be alive functions
  boolean isAlive()
  {
    if (currentLife > maxLife)
      return false;
    else 
      return true;
  }
}



