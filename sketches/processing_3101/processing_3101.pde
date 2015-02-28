
// Genetic algorithm
//
// Alasdair Turner 2009
//
// This is an example of evolutionary algorithm
// The test optimisation is to maximise the
// square of the side lengths while minimising
// the volume

Population pop;

void setup()
{
  size(400,400,P3D);
  pop = new Population();
}

void draw()
{
  // evolution is slowed to 
  // make it easier to see
  if (frameCount % 10 == 0) {
    pop.evolve();
  }
  background(#336699);
  lights();
  noStroke();
  fill(255);
  for (int i = 0; i < pop.m_pop.length; i++)
  { 
    // this draws all the members of the population at
    // any one time step
    // fitter individuals appear to the top right
    pushMatrix();
    scale(0.1,0.1,0.1);
    translate(width * (i % 10), height * (9 - (i / 10)));
    translate(width/2,height/2,0);
    rotateY(0.01 * frameCount);
    pop.m_pop[i].draw();
    popMatrix();
  }
}

void mousePressed()
{
  pop = new Population();
}


