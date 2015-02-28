







int CheckpointNumber = 70; // Number of checkpoints
int PersonNumber = 10000; // Number of person(s)
 
float CheckpointX; // Distance among checkpoints (in X-axis)
 
ArrayList Checkpoint;
ArrayList Person;
 
void setup()
{
  size(920, 480);
  background(255);
  smooth();
  ellipseMode(RADIUS);
   
  Checkpoint = new ArrayList();
  for(int i = 0; i < CheckpointNumber; i++)
  {
    CheckpointX += width/CheckpointNumber; // Make a checkpoint every [CheckpointX] pixels
    Checkpoint.add(new Checkpoint(CheckpointX, noise(CheckpointX) * height)); // Add checkpoints and randomize the height of the checkpoints
  }
   
  BuildPath(); // Build the paths for the person(s)
   
  Person = new ArrayList();
  for(int i = 0; i < PersonNumber; i++)
  {
    Person.add(new Person());
  }
   
}
  float r = 0;
float g = 0;
float b = 0;
 
void backgroundColor() {
   background(r,g,b);
    
   if (mouseX > 0 && mouseX < width/3) {
     r = r + 2;
   } else {
     r = r - 2;
   }
   
   if (mouseX > width/3 && mouseX < width - width/3) {
     g = g + 2;
   } else {
     g = g - 2;
   }
   
   if (mouseX > width - width/3 && mouseX < width) {
     b = b + 2;
   } else {
     b = b - 2;
   }
    
   r = constrain(r,0,50);
   g = constrain(g,0,50);
   b = constrain(b,0,50);
   
}
void draw()
{
  
  
 
   
  stroke(255, 25);
  DrawLines(); // Display the paths
   
  for(int i = 0; i < Person.size(); i++)
  {
    Person P = (Person) Person.get(i);
    P.Update();
    P.Display();
  }
   
}
 
 
 
 
// Create paths between the checkpoints
void BuildPath()
{
  boolean bIsInRange;
  for(int i = 0; i < CheckpointNumber; i++)
  {
    Checkpoint CP = (Checkpoint) Checkpoint.get(i);
    for(int j = 0; j < CheckpointNumber; j++)
    {
      Checkpoint OCP = (Checkpoint) Checkpoint.get(j);
      bIsInRange = dist(CP.X, CP.Y, OCP.X, OCP.Y) > 0 && dist(CP.X, CP.Y, OCP.X, OCP.Y) < 150;
      if(bIsInRange == true) // Make paths with checkpoints within range
      {
        CP.OpenCP[CP.OpenCPNumber] = j;
        CP.OpenCPNumber += 1;
      }
    }
  }
   
   
}
 
void DrawLines()
{
  for(int i = 0; i < CheckpointNumber; i++)
  {
    Checkpoint CP = (Checkpoint) Checkpoint.get(i);
    for(int j = 0; j < CP.OpenCPNumber; j++)
    {
      Checkpoint OCP = (Checkpoint) Checkpoint.get(CP.OpenCP[j]);
      line(CP.X, CP.Y, OCP.X, OCP.Y);
    }
  }
}

class Person
{
  float X, Y;
  float DX, DY;
  float Speed;
  float Angle;
   
  int CurrentCP;
   
  boolean bAtCheckpoint;
   
  Person()
  {
    Speed = random(5.5, 5.5);
     
    CurrentCP = int(random(CheckpointNumber)); // Choose a starting CP
    Checkpoint CP = (Checkpoint) Checkpoint.get(CurrentCP);
    X = CP.X;
    Y = CP.Y;
     
    /** Choose a destination checkpoint */
    ChooseCP();
    CP = (Checkpoint) Checkpoint.get(CurrentCP);
     
    /** Calculate the destination direction in which the person will be moving */
    DX = CP.X - X;
    DY = CP.Y - Y;
    Angle = atan2(DY, DX);
  }
   
   
  void Update()
  {
    if(bAtDestination() == true) // If arrived at a checkpoint, choose another checkpoint and calculate the direction in which the person should be moving.
    {
      ChooseCP();
      Checkpoint CP = (Checkpoint) Checkpoint.get(CurrentCP);
      DX = CP.X - X;
      DY = CP.Y - Y;
      Angle = atan2(DY, DX);
    }
     
    X += Speed * cos(Angle);
    Y += Speed * sin(Angle);
  }
   
   
  void ChooseCP() // Choose a checkpoint to go to
  {
    Checkpoint CP = (Checkpoint) Checkpoint.get(CurrentCP);
    int Random = int(random(CP.OpenCPNumber-1));
    CurrentCP = CP.OpenCP[Random];
  }
   
  boolean bAtDestination() // Check whether the person has arrived at destination checkpoint or not
  {
    Checkpoint CP = (Checkpoint) Checkpoint.get(CurrentCP);
    if(dist(X, Y, CP.X, CP.Y) < 1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
   
  void Display()
  {
    pushMatrix();
    translate(X, Y);
    fill(0);
    ellipse(0, 0, 1, 1);
    popMatrix();
  }
   
}

class Checkpoint
{
  float X, Y;
   
  int[] OpenCP;
  int OpenCPNumber;
   
  Checkpoint(float X_, float Y_)
  {
    X = X_;
    Y = Y_;
     
    OpenCP = new int[CheckpointNumber];
  }
 
}

