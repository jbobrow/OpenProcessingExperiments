
PImage bg;
PImage tree;
PImage redrose;
PImage fence;
PImage fountain;
PImage bathtub;
PImage pathway;
PImage SG;

int [] Xlocation;
int [] Ylocation;

boolean[][] buttonover = new boolean[16][6];
boolean[][] tree_placement = new boolean[16][6];
boolean[][] rose_placement = new boolean[16][6];
boolean[][] fence_placement = new boolean[16][6];
boolean[][] fountain_placement = new boolean[16][6];
boolean[][] bathtub_placement = new boolean[16][6];
boolean[][] pathway_placement = new boolean[16][6];
boolean[][] SG_placement = new boolean[16][6];

boolean tree_select;
boolean rose_select;
boolean fence_select;
boolean fountain_select;
boolean bathtub_select;
boolean pathway_select;
boolean SG_select;

void setup()
{
  size(1080, 720);
  Xlocation = new int[16];
  Ylocation = new int[6];
  imageMode(CENTER);

  for (int y = 0; y < 6; y++)
  {
    for (int x = 0; x < 16; x++)
    {
      if(x < 8)
      {
        Xlocation[x] = x*54 + 72;
      }else
      if(x >= 8)
      {
        Xlocation[x] = x*54 + 144;
      }
      Ylocation[y] = y*54 + 288;
      
      buttonover[x][y] = false;
      rose_placement[x][y] = false;
      tree_placement[x][y] = false;
      fence_placement[x][y] = false;
      fountain_placement[x][y] = false;
      bathtub_placement[x][y] = false;
      pathway_placement[x][y] = false;
      SG_placement[x][y] = false;
    }
  }
  
  bg = loadImage("housebg.png");
  redrose = loadImage("redrose.png");
  tree = loadImage("tree.png");
  fence = loadImage("fence.png");
  fountain = loadImage("fountain.png");
  bathtub = loadImage("bathtub.png");
  pathway = loadImage("pathway.png");
  SG = loadImage("SG.png");
  
  tree_select = false;
  fence_select = false;
  rose_select = true;
  fountain_select = false;
  bathtub_select = false;
  pathway_select = false;
  SG_select = false;
}

void draw()
{
  update(mouseX, mouseY);
  background(bg);
  
  pushMatrix();
  translate(50, 50);
  noFill();
  strokeWeight(4);
  rect(-35, -35, 75, 75, 10);  // Black rectangle
  popMatrix();
  if (rose_select == true)
  {
    image(redrose, 54, 54, 54, 54);
  }else
  if (tree_select == true)
  {
    image(tree, 54, 54, 72, 54);
  }else
  if (fence_select == true)
  {
    image(fence, 54, 54, 54, 54);
  }else
  if (fountain_select == true)
  {
     image(fountain, 54, 54, 27, 57);
  }else
  if (bathtub_select == true)
  {
     image(bathtub, 54, 54, 54, 40);
  }else
  if (pathway_select == true)
  {
    image(pathway, 54, 54, 54, 54);
  }else
  if (SG_select == true)
  {
    image(SG, 54, 54, 27, 57);
  }
  
  for (int iy = 0; iy < 6; iy++)
  {
    for (int ix = 0; ix < 16; ix++)
    {
      if(rose_placement[ix][iy] == true)
      {
        image(redrose, Xlocation[ix]+27, Ylocation[iy]+27, 54, 54);
      }
      if(tree_placement[ix][iy] == true)
      {
        image(tree, Xlocation[ix]+27, Ylocation[iy], 144, 108);
      }
      if(fence_placement[ix][iy] == true)
      {
        image(fence, Xlocation[ix]+27, Ylocation[iy]+27, 54, 54);
      }
      if(fountain_placement[ix][iy] == true)
      {
        image(fountain, Xlocation[ix]+27, Ylocation[iy]-3, 54, 114);
      }
      if(bathtub_placement[ix][iy] == true)
      {
        image(bathtub, Xlocation[ix]+27, Ylocation[iy]+15, 108, 81);
      }
      if(pathway_placement[ix][iy] == true)
      {
        image(pathway, Xlocation[ix]+27, Ylocation[iy]+27, 54, 54);
      }
      if(SG_placement[ix][iy] == true)
      {
        image(SG, Xlocation[ix]+27, Ylocation[iy]-2, 54, 114);
      }
    }
  }
}

void update(int x, int y)
{
  for (int iy = 0; iy < 6; iy++)
  {
    for (int ix = 0; ix < 16; ix++)
    {
      if (overButton(Xlocation[ix], Ylocation[iy], 54, 54))
      {
        buttonover[ix][iy] = true;
      }else
      {
        buttonover[ix][iy] = false;
      }
    }
  }
}

void mousePressed()
{
  for (int y = 0; y < 6; y++)
  {
    for (int x = 0; x < 16; x++)
    {
      if (buttonover[x][y])
      {
        if(rose_select == true)
        {
          if(rose_placement[x][y] == false)
          {
            if(collision_check(x, y) == false)
            {
              rose_placement[x][y] = true;
            }
          }else
          if(rose_placement[x][y] == true)
          {
            rose_placement[x][y] = false;
          }
        }else
        if(tree_select == true)
        {
          if(tree_placement[x][y] == false)
          {
            if(collision_check(x, y) == false)
            {
            tree_placement[x][y] = true;
            }
          }else
          if(tree_placement[x][y] == true)
          {
            tree_placement[x][y] = false;
          }
        }else
        if(fence_select == true)
        {
          if(fence_placement[x][y] == false)
          {
            if(collision_check(x, y) == false)
            {
            fence_placement[x][y] = true;
            }
          }else
          if(fence_placement[x][y] == true)
          {
            fence_placement[x][y] = false;
          }
        }else
        if(fountain_select == true)
        {
          if(fountain_placement[x][y] == false)
          {
            if(collision_check(x, y) == false)
            {
            fountain_placement[x][y] = true;
            }
          }else
          if(fountain_placement[x][y] == true)
          {
            fountain_placement[x][y] = false;
          }
        }else
        if(bathtub_select == true)
        {
          if(bathtub_placement[x][y] == false)
          {
            if(collision_check(x, y) == false)
            {
            bathtub_placement[x][y] = true;
            }
          }else
          if(bathtub_placement[x][y] == true)
          {
            bathtub_placement[x][y] = false;
          }
        }else
        if(pathway_select == true)
        {
          if(pathway_placement[x][y] == false)
          {
            if(collision_check(x, y) == false)
            {
            pathway_placement[x][y] = true;
            }
          }else
          if(pathway_placement[x][y] == true)
          {
            pathway_placement[x][y] = false;
          }
        }else
        if(SG_select == true)
        {
          if(SG_placement[x][y] == false)
          {
            if(collision_check(x, y) == false)
            {
            SG_placement[x][y] = true;
            }
          }else
          if(SG_placement[x][y] == true)
          {
            SG_placement[x][y] = false;
          }
        }
      }
    }
  }
}

boolean overButton(int x, int y, int width, int height)
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height)
      {
    return true;
  } else {
    return false;
  }
}

boolean collision_check(int ix, int iy)
{
  if (rose_placement[ix][iy] == true || tree_placement[ix][iy] == true||
      fence_placement[ix][iy] == true || fountain_placement[ix][iy] == true||
      bathtub_placement[ix][iy] == true || pathway_placement[ix][iy] == true||
      SG_placement[ix][iy] == true)
  {
    return true;
  } else {
    return false;
  }
}

void keyPressed()
{
  if(key == '1')
  {
    rose_select = true;
    tree_select = false;
    fence_select = false;
    fountain_select = false;
    bathtub_select = false;
    pathway_select = false;
    SG_select = false;
  }else
  if(key == '2')
  {
    rose_select = false;
    tree_select = true;
    fence_select = false;
    fountain_select = false;
    bathtub_select = false;
    pathway_select = false;
    SG_select = false;
  }else
  if(key == '3')
  {
    rose_select = false;
    tree_select = false;
    fence_select = true;
    fountain_select = false;
    bathtub_select = false;
    pathway_select = false;
    SG_select = false;
  }else
  if(key == '4')
  {
    rose_select = false;
    tree_select = false;
    fence_select = false;
    fountain_select = true;
    bathtub_select = false;
    pathway_select = false;
    SG_select = false;
  }else
  if(key == '5')
  {
    rose_select = false;
    tree_select = false;
    fence_select = false;
    fountain_select = false;
    bathtub_select = true;
    pathway_select = false;
    SG_select = false;
  }else
  if(key == '6')
  {
    rose_select = false;
    tree_select = false;
    fence_select = false;
    fountain_select = false;
    bathtub_select = false;
    pathway_select = true;
    SG_select = false;
  }else
  if(key == '0')
  {
    rose_select = false;
    tree_select = false;
    fence_select = false;
    fountain_select = false;
    bathtub_select = false;
    pathway_select = false;
    SG_select = true;
  }
}


