
int NUM_THINGONE = 200;
int NUM_THINGTWO = 200;
int NUM_THINGTHREE = 150;


// creating an (empty) global array with a
// capacity of 10 elements of type Ball
TypeOne [] thingones = new TypeOne [NUM_THINGONE];
TypeTwo [] thingtwos = new TypeTwo [NUM_THINGTWO];
TypeThree [] thingthrees = new TypeThree [NUM_THINGTHREE];

void setup() 
{
  size(500, 500); 
  smooth();


  for (int i = 0; i < NUM_THINGONE; i++) 
  {
    thingones[i] = new TypeOne();   // populating the array
  }
  for (int i = 0; i < NUM_THINGTWO; i++) 
  {
    thingtwos[i] = new TypeTwo();   // populating the array
  }
  for (int i = 0; i < NUM_THINGTHREE; i++) 
  {
    thingthrees[i] = new TypeThree();   // populating the array
  }
}

void draw() 
{ 
  background(0);
  //fill(75);
  //ellipse(width/2,height/2,400,400);

  for (int i = 0; i < NUM_THINGONE; i++)
  {
    thingones[i].drawme();
    thingones[i].update();
  }
  for (int i = 0; i < NUM_THINGTWO; i++)
  {
    thingtwos[i].drawme();
    thingtwos[i].update();
  }
  for (int i = 0; i < NUM_THINGTHREE; i++)
  {
    thingthrees[i].drawme();
    thingthrees[i].update();
  }
  
 // stroke(255);
//  strokeWeight(10);
  //noFill();
//  ellipse(width/2,height/2,405,405);
}



void mousePressed()
{
  for(int i=0; i<NUM_THINGONE; i++)
  {
    thingones[i].disperse =true;
  }
  for(int i=0; i<NUM_THINGTWO; i++)
  {
    thingtwos[i].disperse =true;
  }
  for(int i=0; i<NUM_THINGTHREE; i++)
  {
    thingthrees[i].disperse =true;
  }
}
void mouseReleased()
{
  for(int i=0; i<NUM_THINGONE; i++)
  {
    thingones[i].disperse =false;
  }
  for(int i=0; i<NUM_THINGTWO; i++)
  {
    thingtwos[i].disperse =false;
  }
  for(int i=0; i<NUM_THINGTHREE; i++)
  {
    thingthrees[i].disperse =false;
  }
}


