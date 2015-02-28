
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/125739*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int numTrees = 192;
Tree[] unsorted = new Tree[numTrees];
Tree[] sorted = new Tree[numTrees];

boolean sorting = true;

Hill[] hills;
int numHills = 5;
float speed = 0.5;
float hillRatio = 0.35; //amount of screen used by hills 0.35 nice

color bgColour = color(50, 50, 150);
Window window;
Snow snow;
Moon moon;

boolean hillTesting = false;
boolean treeTesting = true;

void setup()
{
  size(700, 400);
  background(bgColour);

  //noLoop();

  //divide into bands for hill heights
  //nearer hills have larger shares
  int numHillsShriek = 0;
  for (int h = 0; h < numHills; h++)
  {
    numHillsShriek += h + 1;
  } 
  float hspacing = hillRatio * height / numHillsShriek;

  hills = new Hill[numHills];
  int hillSpaceCount = 0;
  for (int h = 0; h < numHills; h++)
  {
    hills[h] = new Hill();
    float halfh = (h + 1) / 2.0;
    hills[h].high = (1 - hillRatio) * height + (hillSpaceCount  - halfh) * hspacing;
    hills[h].low = (1 - hillRatio) * height + (hillSpaceCount + halfh) * hspacing;
    hills[h].speed = speed/numHills * (h + 1);
    hills[h].colour = 160 + 96 / numHills * h; //facing to darker with distance

    hills[h].makeHill();
    hillSpaceCount += h + 1;
  }

  moon = new Moon();

  snow = new Snow();
  snow.makeSnow();

  window = new Window(); 

  for (int t = 0; t < numTrees; t++)
  {
    unsorted[t] = new Tree();
    unsorted[t].makeTree();
  }
}

void draw()
{
  background(bgColour);

  if (sorting) sortArray();

  for (int h = 0; h < numHills; h++)
  {
    hills[h].display();
    hills[h].update();

    for (int t = 0; t < numTrees; t++)
    {
      if (sorting)
      {
        if (sorted[t].thisHill == h) sorted[t].display();
      }
      else
      {
        if (unsorted[t].thisHill == h) unsorted[t].display();
      }
    }
  }
  for (int t = 0; t < numTrees; t++)
  {
    unsorted[t].update();
  }


  moon.display();
  moon.update();

  snow.display();
  snow.update();

  window.display();
}

void sortArray()
{
  ArrayList<Integer> indices = new ArrayList<Integer>();
  for (int i = 0; i < numTrees; i++)
  { 
    indices.add(i);
  }
  for (int i = 0; i < numTrees; i++)
  {
    float maxDist = 2 * height * width;
    int index = -1;

    for (int j = 0; j < indices.size(); j++)
    {
      float testingThisValue = unsorted[indices.get(j)].pos.y;

      if (testingThisValue < maxDist)
      {
        maxDist = testingThisValue;
        index = j;
      }
    }
    sorted[i] = unsorted[indices.get(index)];
    indices.remove(index);
  }
}


void keyPressed()
{
  if (key == 'h' || key == 'H') hillTesting = !hillTesting;
  if (key == 't' || key == 'T') treeTesting = !treeTesting;
  if (key == 's' || key == 'S') sorting = !sorting;
}

class Hill
{
  PVector[] v;
  int num;
  float vspacing;
  float high = height/2;
  float low = 3 * height /4;
  float speed = 1;
  color colour = color(40, 140, 40);

  Hill()
  {
//    makeHill();
  }

  void makeHill()
  {
    float number = random(7, 13) + 5;
    vspacing = width / (number - 5); //to set some peaks offscreen
    num = (int)number;
    v = new PVector[num];
    for (int i = 0; i < (int)num; i++)
    {
      float thisV = -2 * vspacing + i * vspacing + random(vspacing*.4, vspacing*.6);
      v[i] = new PVector(thisV, random(high, low));
    }
  }

  void display()
  {
    noStroke();
    fill(colour);
    beginShape();
    curveVertex(width, height);
    curveVertex(0, height);
    for (int i = 0; i < num; i++)
    {
      curveVertex(v[i].x, v[i].y);
    }
    curveVertex(width, height);
    curveVertex(0, height);
    endShape();

    if(hillTesting)
    {
    for (int i = 0; i < num; i++)
    {
      fill(0);
      ellipse(v[i].x, v[i].y, 5, 5);
      fill(255, 0, 0);
      textSize(16);
      text(i, v[i].x, v[i].y + 20);
    }
    }
  }

  void update()
  {
    for (int i = 0; i < num; i++)
    {
      v[i].x -= speed;
    }
    if (v[0].x < -2*vspacing)
    {
      for (int i = 0; i < num - 1; i++)
      {
        v[i].x = v[i + 1].x;
        v[i].y = v[i + 1].y;
      }
      v[num-1].x = width + 2 * vspacing + random(vspacing*.4, vspacing*.6);
      v[num-1].y = random(high, low);
    }
  }
}

class Moon
{
  PVector pos = new PVector(0, 0);
  float diameter =30;
  
  Moon()
  {
    pos.y = height / 5;
  }
  
  void update()
  {
    pos.x = map(millis() % 100000, 0, 100000, width, 0);
  }
  
  void display()
  {
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-PI/8);
    fill(255, 255, 200);
    ellipse(0, 0, diameter, diameter);
    fill(bgColour);
    ellipse(diameter/2, 0, diameter, diameter);
    popMatrix();
  }
}

class Snow
{
  PVector[] pos, vel;
  int numFlakes = 1000;
  float flakeSize = 2;

  Snow()
  {
  }

  void makeSnow()
  {
    pos = new PVector[numFlakes];
    vel = new PVector[numFlakes];
    for (int i = 0; i < numFlakes; i++)
    {
      pos[i] = new PVector(random(width), random(height));
      vel[i] = new PVector(random(-1, 1), random(0.3, 1));
    }
  }

  void display()
  {
    noStroke();
    fill(255);
    for (int i = 0; i < numFlakes; i++)
    {
      ellipse(pos[i].x, pos[i].y, flakeSize, flakeSize);
    }
  }


  void update()
  {
    for (int i = 0; i < numFlakes; i++)
    {
      pos[i].add(vel[i]);
      if (pos[i].x < 0) pos[i].x = width;
      if (pos[i].x > width) pos[i].x = 0;
      if (pos[i].y > height) pos[i].y = 0;
    }
  }
}


class Tree
{
  PVector pos = new PVector(0, 0);
  float speed;
  int thisHill;
  float scaling;
  color colour;
  int variant = 0;

  int index = -1;

  float diam = 300;

  Tree()
  {
  }

  void makeTree()
  {
    thisHill = (int)random(numHills); //choose a hill at random
    speed = hills[thisHill].speed;
    float minx = -2 * hills[thisHill].vspacing;
    float maxx = width + 2 * (hills[thisHill].vspacing + random(hills[thisHill].vspacing/2, hills[thisHill].vspacing));
    pos.x = random(minx, maxx);
    float diff = hills[thisHill].low - hills[thisHill].high;
    pos.y = random(hills[thisHill].high, hills[thisHill].low) + diff / (numHills - thisHill);
    scaling = hills[thisHill].speed / 2.5; //this looks right
    
    colour = color(random(64), random(100, 200), random(64));
    variant = (int)random(12);

  }

  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scaling);
    if(variant == 11) drawSStree(colour);
    else if(variant == 10) drawMItree();
    else if(variant == 9) drawLUtree();
    else if(variant == 8) drawLCtree();
    else if(variant == 7) drawIbJtree();
    else if(variant == 6) drawIdJtree();
    else if(variant == 5) drawDMtree();
    else if(variant == 4) drawFJtree();
    else if(variant == 3) drawHBtree();
    else if(variant == 2) drawDMtree();
    else drawPlainTree();
    popMatrix();
  }
  
  void drawPlainTree()
  {    
    fill(100, 80, 50);
    rect(-15, 50-80, 30, 80);
    fill(colour);
    triangle(0, -150-80, 70, 50-80, -70, 50-80);
  }

  void update()
  {
    pos.x -= hills[thisHill].speed;
    if (pos.x < -2 * hills[thisHill].vspacing)
    {
      pos.x = width + 2 * (hills[thisHill].vspacing + random(hills[thisHill].vspacing/2, hills[thisHill].vspacing));
      pos.y = random(hills[thisHill].high, hills[thisHill].low);
      variant = (int)random(12);
    }
  }

}
class Window
{
  float radius = max(50, height/3);
  float b = radius * 4 * (sqrt(2) - 1) / 3; //bezier sweet spot
  int offset = 10; 

  Window() 
  {
  }

  void display()
  {
    fill(50);
    rect(0, 0, width, offset);
    rect(width-offset, 0, offset, height);
    rect(0, height - offset, width, offset);
    rect(0, 0, offset, height);
    

    //top left
    drawCorner();

    //top right
    pushMatrix();
    translate(width, 0);
    rotate(HALF_PI);
    drawCorner();
    popMatrix();

    //bottom right
    pushMatrix();
    translate(width, height);
    rotate(PI);
    drawCorner();
    popMatrix();

    //bottom left
    pushMatrix();
    translate(0, height);
    rotate(3 * HALF_PI);
    drawCorner();
    popMatrix();
  }

  void drawCorner()
  {
    fill(32);
    beginShape();
    vertex(0, 0);
    vertex(0, radius);
    vertex(offset, radius);
    bezierVertex(offset, b, radius - b, offset, radius, offset);
    vertex(radius, 0);
    endShape();
    
    fill(50);
    ellipse(0.3 * radius, 0.3 * radius, 10, 10);
    ellipse(0.17 * radius, 0.47 * radius, 10, 10);
    ellipse(0.47 * radius, 0.17 * radius, 10, 10);
    ellipse(0.09 * radius, 0.62 * radius, 10, 10);
    ellipse(0.62 * radius, 0.09 * radius, 10, 10);
  }
}

void drawSStree(color colour)
{
  float redbit = red(colour);
  float greenbit = green(colour);
  float bluebit = blue(colour);

  //trunk
  fill(100, 80, 50);
  rect(100 - 15, 200-280, 30, 80);
  //bottom triangle
  fill(redbit-20, greenbit-20, bluebit-20);
  triangle(100, 150-280, 180, 230-280, 20, 230-280);
  //middle triangle
  fill(redbit, greenbit, bluebit);
  triangle(100, 100-280, 170, 180-280, 30, 180-280);
  //top triangle
  fill(redbit+20, greenbit+20, bluebit+20);
  triangle(100, 50-280, 160, 130-280, 40, 130-280);
  //ornaments
  fill(255, 200, 64);
  //top
  int ellipseSize = 15;
  ellipse(150, 120-280, ellipseSize, ellipseSize);
  ellipse(50, 120-280, ellipseSize, ellipseSize);
  ellipse(120, 130-280, ellipseSize, ellipseSize);
  ellipse(80, 130-280, ellipseSize, ellipseSize);
  //middle
  ellipse(160, 170-280, ellipseSize, ellipseSize);
  ellipse(40, 170-280, ellipseSize, ellipseSize);
  ellipse(125, 180-280, ellipseSize, ellipseSize);
  ellipse(75, 180-280, ellipseSize, ellipseSize);
  //bottom
  ellipse(170, 220-280, ellipseSize, ellipseSize);
  ellipse(30, 220-280, ellipseSize, ellipseSize);
  ellipse(130, 230-280, ellipseSize, ellipseSize);
  ellipse(70, 230-280, ellipseSize, ellipseSize);
}

void drawDMtree()
{
  fill(180, 100, 70);
  rect(70, 200-300, 60, 100);
  fill(40, 150, 40);
  triangle(100, 120-300, 180, 170-300, 20, 170-300);
}

void drawFJtree()
{
  fill(150, 100, 50);
  rect(85, 250-250, 30, 50);
  fill(0, 225, 0 );
  triangle(100, 150-250, 150, 250-250, 50, 250-250  );
  fill(128, 225, 0);
  triangle(100, 100-250, 150, 200-250, 50, 200-250  );
  triangle(100, 50-250, 150, 150-250, 50, 150-250  );
}

void drawHBtree()
{
  fill(150, 100, 50);
  rect(85, 200-250, 30, 50);
  fill(40, 150, 20);
  triangle(100, 150-250, 170, 200-250, 30, 200-250);
  fill(20, 200, 10);
  triangle(100, 100-250, 170, 170-250, 30, 170-250);
  fill(0, 255, 0);
  triangle(100, 30-250, 170, 130-250, 30, 130-250);
}

void drawIbJtree()
{
  fill(150, 100, 50);
  rect(80, 250-330, 40, 80);
  fill(40, 150, 40);
  triangle(100, 150-330, 175, 200-330, 25, 200-330);
}

void drawIdJtree()
{
  fill(150, 100, 50);
  rect(85, 200-250, 30, 50);
  fill(40, 150, 40);
  triangle (100, 150-250, 170, 200-250, 30, 200-250);   
  fill(20, 200, 10);
  triangle(100, 100-250, 170, 170-250, 30, 170-250);
  fill(0, 255, 0);
  triangle(100, 30-250, 170, 130-250, 30, 130-250);
}

void drawLUtree()
{
  fill(150, 100, 50);
  rect(80, 230-280, 40, 50);
  fill(40, 150, 40);
  triangle (100, 150-280, 25, 230-280, 175, 230-280);
  fill(0, 200, 0);
  triangle (100, 100-280, 40, 175-280, 160, 175-280);
  fill(0, 255, 0);
  triangle (100, 50-280, 55, 125-280, 150, 125-280);
}

void drawLCtree()
{
  fill(150, 100, 0);
  rect(75, 200-300, 50, 100);
  fill(40, 150, 40);
  triangle(100, 150-300, 175, 250-300, 25, 250-300);
}

void drawMItree()
{
  fill(150, 100, 50);
  rect(75, 200-300, 50, 100);
  fill(40, 150, 40);
  triangle(100, 150-300, 175, 250-300, 25, 250-300);
}

color bgColour = color(50, 50, 150);

Hill[] hills;
int numHills = 5;
float speed = 0.5;
float hillRatio = 0.35; //amount of screen used by hills 0.35 nice

Tree[] trees, sortedTrees;
int numTrees = 100;
boolean sortingTrees = false;

Window window;
Snow snow;
Moon moon;

boolean hillTesting = false;
boolean treeTesting = false;

void setup()
{
  size(700, 400);
  background(bgColour);
  
  //noLoop();

  //divide into bands for hill heights
  //nearer hills have larger shares
  int numHillsShriek = 0;
  for(int i = 0; i < numHills; i++)
  {
    numHillsShriek += i+1;
  } 
  float hspacing = hillRatio * height / numHillsShriek;
  
  hills = new Hill[numHills];
  int hillSpaceCount = 0;
  for (int i = 0; i < numHills; i++)
  {
    hills[i] = new Hill();
    float halfi = (i + 1) / 2.0;
    hills[i].high = (1 - hillRatio) * height + (hillSpaceCount  - halfi) * hspacing;
    hills[i].low = (1 - hillRatio) * height + (hillSpaceCount + halfi) * hspacing;
    hills[i].speed = speed/numHills * (i + 1);
    //    println(hills[i].speed);
    hills[i].colour = 160 + 96 / numHills * i;

    hills[i].makeHill();
    hillSpaceCount += i + 1;
  }

  trees = new Tree[numTrees];
  sortedTrees = new Tree[numTrees];
  for (int i = 0; i < numTrees; i++)
  {
    trees[i] = new Tree();
    trees[i].makeTree();
  }

  moon = new Moon();

  snow = new Snow();
  snow.makeSnow();
  
  window = new Window();
}

void draw()
{
  background(bgColour);

  if(sortingTrees) sortTrees();

  for (int i = 0; i < numHills; i++)
  {
    hills[i].display();
    hills[i].update();
    for (int j = 0; j < numTrees; j++)
    {
      if (trees[j].thisHill == i)
      {
        if(sortingTrees) sortedTrees[j].display();
        else trees[j].display();
        trees[j].update();
      }
    }
  }
  
  moon.display();
  moon.update();

  snow.display();
  snow.update();
  
  window.display();
}

void sortTrees()
{
  ArrayList<Integer> treeIndices = new ArrayList<Integer>();
  for (int i = 0; i < numTrees; i++)
  { 
    treeIndices.add(i);
  }
  for (int i = 0; i < numTrees; i++)
  {
    float maxDist = 2*height;
    int index = -1;

    for (int j = 0; j < treeIndices.size(); j++)
    {
      float thisypos = trees[treeIndices.get(j)].pos.y;
//      println(i +" "+ (int)thisypos);
      
      if (thisypos < maxDist)
      {
        maxDist = thisypos;
        index = j;
      }
    }
//    println();
    sortedTrees[i] = trees[treeIndices.get(index)];
    treeIndices.remove(index);
  }
}




void keyPressed()
{
  if (key == 'h' || key == 'H') hillTesting = !hillTesting;
  if(key == 't' || key == 'T') treeTesting = !treeTesting;
  if (key == 's' || key == 'S') sortingTrees = !sortingTrees;
}



