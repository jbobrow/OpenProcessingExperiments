
int cube_size = 200; 
int randDir = 0;
int randX = 1;
int randY = 1;
int randZ = 1;
float easing = 0.05;
// initial coord
float rowX_coord = cube_size; 
float rowY_coord = cube_size; 
float rowZ_coord = cube_size * -1;
float x = cube_size;
float y = cube_size;
float z = -cube_size;
float dx = cube_size;
float dy = cube_size;
float dz = cube_size;

void setup () 
{ 
  size(900, 600, P3D); 
} 

void draw () 
{ 
  // assign new coords
  float new_rowX_coord = randX * cube_size; 
  float new_rowY_coord = randY * cube_size; 
  float new_rowZ_coord = randZ * cube_size * -1;

  //easing
  if (randDir == 0 || randDir == 3)
  {
    dx = new_rowX_coord - x;
    if(abs(dx) > 1) x += dx * easing;
    else dirChoice();
  }
  else if (randDir == 1 || randDir == 4)
  {
    dy = new_rowY_coord - y;
    if(abs(dy) > 1) y += dy * easing;
    else dirChoice();
  }
  else if (randDir == 2 || randDir == 5)
  {
    dz = new_rowZ_coord - z;
    if(abs(dz) > 1) z += dz * easing;
    else dirChoice();
  }

  background(255); 
  rotateX (-0.55); 
  translate (-50, 100, 0); 

  //draw shifting cube

  pushMatrix();

  translate(x, y, z);

  fill(0, 0, 50, 200);
  stroke(0, 0, 0, 50);
  box(cube_size);

  popMatrix(); 

  //draw surrounding grid

  for (int rowX = 1; rowX <= 4; rowX++) 
  { 
    for (int rowY = 1; rowY <= 4; rowY++) 
    { 
      for (int rowZ = 1; rowZ <= 4; rowZ++) 
      { 

        pushMatrix(); 
        // expansion
        rowX_coord = rowX * cube_size; 
        rowY_coord = rowY * cube_size; 
        rowZ_coord = rowZ * cube_size * -1; 

        translate(rowX_coord, rowY_coord, rowZ_coord); 
        
        if( rowZ == randZ && rowX == randX && rowY == randY)
        {
          fill(255, 255, 0, 50);
          stroke(0, 0, 0, 35);
        }
        else {        
          noFill();
          stroke(0, 0, 0, 35);
        }

        box(cube_size);

        popMatrix(); 
      } 
    } 
  } 
} 

int movePlus (int currentPos) // if random move is plus
{
  if (currentPos > 1) return -1;
  else return 1;
}

int moveMinus (int currentPos)
{
  if (currentPos < 4) return 1; // if random move is minus
  else return -1;
}

void dirChoice()     //random directional choice
{
  randDir = (int)(random(0, 6));

  if (randDir == 0) randX = randX + movePlus(randX);
  else if (randDir == 1) randY = randY + movePlus(randY);
  else if (randDir == 2) randZ = randZ + movePlus(randZ);
  else if (randDir == 3) randX = randX + moveMinus(randX);
  else if (randDir == 4) randY = randY + moveMinus(randY);
  else if (randDir == 5) randZ = randZ + moveMinus(randZ);
}






















