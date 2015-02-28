
int cube_size = 40;
float cube_dist = 0.0;
float shift = HALF_PI;
float new_shift = 0.0;
float change_color = 0.0;
int R, G, B = 0;

void setup ()
{
  size(850, 700, P3D);
}

void draw ()
{
  background(255);
  lights();
  noStroke();
  rotateX (-0.475);
  float anchor_offset = 400-(cube_dist*5.98);
  translate (anchor_offset, anchor_offset/5.9, -anchor_offset*1.94);

  for (int rowsZ = 1; rowsZ <= 10; rowsZ++)
  { 
    for (int rowsX = 1; rowsX <= 10; rowsX++)
    { 
      for (int colsY = 1; colsY <= 10; colsY++)
      { 
        pushMatrix();
        float rowsX_coord = rowsX * cube_dist;
        float rowsZ_coord = rowsZ * cube_dist * -1;
        float colsY_coord = colsY * cube_dist;
        translate(rowsX_coord, colsY_coord, rowsZ_coord);      
        rotateX(new_shift);
        rotateY(new_shift);
        rotateZ(new_shift);

        if (shift == 0.0) change_color = 0.0;
      
        if (shift <= HALF_PI)
        {
          R = rowsX * 25;
          G = rowsZ * 25;
          B = colsY * 25;
        }
        else
        {
          change_color += 0.002;
          R = rowsX * 25 + (int)change_color;
          G = rowsZ * 25 - (int)change_color;
          B = colsY * 25 + (int)change_color / 2;
        }
        
        fill(R,G,B);
        box(cube_size);
        popMatrix();
      }
    }
  }

  shift += 0.01;
  if (shift > 2.5) shift = 0.0;  

  new_shift = constrain(shift, 0, HALF_PI);
  cube_dist = cube_size + (new_shift * 500);
}

