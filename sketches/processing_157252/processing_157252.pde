
//I was inspired by Chinchbug on Open Processing
//I based this homework on one of his sketches

//I love mathematics and modeling the beauty that is inherent in 
//mathematics. What could be more natural than mathematics?
//Perlin noise is as a two-, three- or four-dimensional function, 
//but can be defined for any number of dimensions.
//Define an n-dimensional grid. Each grid coordinate stores a gradient 
//of unit length in n dimensions. To sample, determine which grid cell 
//you're in, and then compute the n-dimensional vectors from the sample 
//location to each grid coordinate of the cell. For each grid coordinate, 
//calculate the dot products of the corresponding distance and gradient vectors. 
//Finally, interpolate these dot products using a function that has zero first 
//derivative (and possibly also second derivative) at both endpoints.

//Defining global variables
float move = 0; //this used for the rotate function
float pos = 0;
float chg = 8.0;
 
void setup() {
  size(600,400, P3D);
}
 
void draw() {
  int level = 80;
  background(0);

 translate(width * 0.5, height, -height*3);
 rotateX(-.8);
 rotateY(move);
   
  pos += chg;

  for (float z = -level; z < level; z++)
    for (float x = -level; x < level; x++) {
      float expX = x*chg;
      float expZ = z*chg;
      //noise function in Processing returns the Perlin noise value at specified coordinates
      float expY = noise((expX+1000)*.01, (expZ-pos)*.01)*500;
      float sqY = expY*expY-(expX*expX+expZ*expZ)/chg;
     
      if(sqY > 1000) {
        stroke(sqY*.002,sqY*.004,sqY*.001);
        point (expX,-expY,expZ);
      }
    }
}



