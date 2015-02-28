
/*

  Genetic Programming Example
  
    This is an application that evolves images with 
    genetic algorithms and genetic programming techniques.

    Users will be able to manually set:
      function set
      terminal set
      genes
      
*/

organism machine;
int counter = 0;

void setup(){

  size(960,540);
  frameRate(60);
  machine = new organism();
  
}

void draw(){
  
  background(0);
  noStroke();
  int xResolution = 10;
  int yResolution = 10;
  
  float drawSize = 1.0;
  for(int i = 0; i < width; i+=xResolution)
  {
    for(int j = 0; j < height; j+=yResolution)
    {
      fill(machine.EvaluateOrganism(float(i), float(j), float(counter), float(millis())));
      rect(i * drawSize, j * drawSize, xResolution, yResolution); 
    }
  }
  
  if(counter > 100) { counter = 0; machine.GenerateRandomCode(); } else { counter++; }
}

void keyPressed(){
 
   machine.GenerateRandomCode();
   redraw();
   
  
}

