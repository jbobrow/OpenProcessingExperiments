
PVector actorOnePosition;
PVector actorTwoPosition;

int actorOneRadius = 30;
int actorTwoRadius = 25;

PFont font = createFont("tahoma", 40);

float distance_between_actors;

boolean Colliding = false;
boolean runOnce=true;

void setup()
{
 if (runOnce)
 {
  size(500, 500); 
  runOnce = false;
 }

  actorOnePosition = new PVector(width/2, height/2);
  actorTwoPosition = new PVector(mouseX, mouseY);
  
  // This is the heart of radius collision detection
  // If you understand these simple lines.
  distance_between_actors = PVector.dist(actorOnePosition, actorTwoPosition);
  
  if (distance_between_actors < actorOneRadius + actorTwoRadius)
  {
    Colliding = true;
  }
  else
  {
     Colliding = false; 
  }
}

void draw()
{
  background(0);
  stroke(255);
  noFill();
  
  ellipse(actorOnePosition.x, actorOnePosition.y, actorOneRadius*2, actorOneRadius*2);
  ellipse(actorTwoPosition.x, actorTwoPosition.y, actorTwoRadius*2, actorTwoRadius*2);
  
  line(actorOnePosition.x, actorOnePosition.y, actorTwoPosition.x, actorTwoPosition.y);
  
  if (Colliding)
    fill(#434AF7);  
  else
    fill(255);
  
  text("IF distance between actors: "+distance_between_actors, 10, 40);
  text("IS LESS THAN", 10, 60);
  text("actor radiuses combined: "+ (actorOneRadius+actorTwoRadius), 10, 80);
  text("WE WOULD HAVE COLLIDED", 10, 100);

  setup();
}
