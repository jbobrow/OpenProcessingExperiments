
class cityBlock
{
  PVector position;
  int numCubes;
  float block_scale,block_width,block_length;
  PVector[] cubeLocations;

  cityBlock(float x, float y, float z, float BlockScale, float BlockWidth, float BlockLength, int NumCubes)
  {
    position = new PVector(x,y,z);
    numCubes = NumCubes;
    block_scale = BlockScale;
    block_width=BlockWidth;
    block_length=BlockLength;
    cubeLocations = new PVector[numCubes];
    for(int i = 0; i < numCubes; i++)
    {
      cubeLocations[i] = new PVector(random(-(BlockWidth/3),BlockWidth/3),0,random(-(BlockLength/3),BlockLength/3)); 
    }
  }

  void render()
  {
    pushMatrix();
    translate(position.x,position.y,position.z);
    for(int i = 0; i < numCubes; i++)
    {
      pushMatrix();
      float shortestLength = abs((cubeLocations[i].x-(block_width/2)));
      if(abs(cubeLocations[i].x+(block_width/2)) < shortestLength) shortestLength = abs((cubeLocations[i].x+(block_width/2)));
      if(abs(cubeLocations[i].z-(block_length/2)) < shortestLength) shortestLength = abs((cubeLocations[i].z-(block_length/2)));
      if(abs(cubeLocations[i].z+(block_length/2)) < shortestLength) shortestLength = abs((cubeLocations[i].z+(block_length/2)));
      translate(cubeLocations[i].x,-(shortestLength*block_scale)/2,cubeLocations[i].y);
      box(shortestLength,shortestLength*block_scale,shortestLength);
      popMatrix();
    }
    popMatrix(); 
  }
}


