
/*
  Based on
 http://www.cutsquash.com/2014/03/photo-colour-sorting/
 GitHub: https://github.com/Buntworthy/Processing/tree/master/photoColourSort
 */

/* @pjs preload="lego.jpg"; */

int SPEED = 10, imageH;
PImage img;
ArrayList<Integer> colours;
ArrayList<PVector> available;//empty pixels touching a coloured pixel
Boolean rgbMode = false, sortColors = true, shuffleColors = false, rmvDuplicates = false;
PVector src1, src2;//diffusion points

void setup() {
  size(240, 320, P2D);
  background(0);
  img = loadImage("lego.jpg");
  imageH = int(height/2);
  img.resize(width, imageH);
  image(img, 0, imageH);
  available = new ArrayList<PVector>();
  colours = new ArrayList<Integer>();
  for (int i=0; i<width; i++)
  {
    for (int j=0; j<imageH; j++)
    {
      colours.add((img.get(i, j)));
    }
  }

  if (sortColors) sortColours();
  else if (shuffleColors) shuffleColors();
  if (rmvDuplicates)
  {
    if (sortColors) sortedColRmvDuplicates();
    else unsortedColRmvDuplicates();
  }

  src1 = new PVector(width/2, imageH/2);
  available.add(src1);
}

void draw() {
  PVector bestLoc;
  int c, bestj, nbAvailablePixels, nbAvailableColors;;
  float diff, finalDiff;
  for (int i = 0; i < SPEED; i++)
  {
    nbAvailableColors = colours.size();
    if (nbAvailableColors > 0)
    {
      c = colours.remove(nbAvailableColors-1);//0 to start with the dark colors
      nbAvailablePixels = available.size();
      if (nbAvailablePixels > 0)//check the presence of empty pixels
      {
        bestj = 0;
        finalDiff = 500000;

        // check the color diff for each available pixel
        for (int j=0; j<nbAvailablePixels; j++)
        {
          diff = calcDiff(available.get(j), c);
          // check the index of the lowest mindiff
          if (diff < finalDiff)
          {
            bestj = j;
            //if (diff == 0) break;//stop the loop if the very same colour is found
            finalDiff = diff;
          }
        }
        bestLoc = available.remove(bestj);              

        // place the colored pixel
        set(int(bestLoc.x), int(bestLoc.y), c);
        
        //remove the image pixel
        if(!sortColors && !shuffleColors && !rmvDuplicates)
        set(nbAvailableColors % width, imageH + int(nbAvailableColors / float(width)), color(0));

        // update the available list
        updateAvailables(bestLoc);
      }
    } else if (i == SPEED-1)
    {
      println("done!");
      noLoop();
    }
  }
}

//add pv in the available list if not already present
void updateAvailables(PVector pv)
{  
  ArrayList<PVector> addAvailable = getNeighbours(pv);
  for (PVector curr : addAvailable)
  {
    int c = get(round(curr.x), round(curr.y));
    // if the cell is empty isn't in the list already
    if ((c>>16 & 0xFF) + (c>>8 & 0xFF) + (c & 0xFF) == 0)
    {
      // and the cell isn't in the list already
      Boolean ok = true;
      for (int jj=0; jj<available.size (); jj++) {
        PVector temp = available.get(jj);
        if (temp.x == curr.x && temp.y == curr.y) {
          ok = false;
          break;
        }
      }

      if (ok) available.add(curr);
    }
  }
}

// calculates how well a color fits at a given coordinate
float calcDiff(PVector pv, color c) {
  int min = 50000000, max = -50000000;
  // get the diffs for each neighbor separately
  ArrayList<PVector> neighbours = getNeighbours(pv);
  for (PVector n : neighbours)
  {
    color nc = get(int(n.x), int(n.y));
    if ((nc >> 16 & 0xFF) + (nc >> 8 & 0xFF) + (nc & 0xFF) != 0)
    {
      int colDelta = colDiff(nc, c);
      if (colDelta < min) min = colDelta;
      if (colDelta > max) max = colDelta;
    }
  }
  return min;
  //return max;  
  //return (min+max)/2;
}

// gets the difference between two colors
int colDiff(color c1, color c2) {
  int result;
  if (rgbMode) {
    int r = (c1>>16 & 0xFF) + (c2>>16 & 0xFF);
    int g = (c1>>8 & 0xFF) + (c2>>8 & 0xFF);//0
    int b = (c1 & 0xFF) + (c2 & 0xFF);
    result = r*r ;//+ g*g + b*b;
  } else {
    float h = hue(c1) - hue(c2);
    float s = saturation(c1) - saturation(c2);
    float b = brightness(c1) - brightness(c2);
    result = int(h*h + s*s + b*b);
  }
  return result;
}

// gets the unused neighbors (from 0 to 8) of the given coordinate
ArrayList<PVector> getNeighbours(PVector pv) {
  ArrayList<PVector> ret = new ArrayList<PVector>();
  for (int dy = -1; dy < 2; dy++) {
    if (pv.y + dy < 0 || pv.y + dy == imageH) {
      continue;
    }
    for (int dx = -1; dx < 2; dx++) {
      if (pv.x + dx < 0 || pv.x + dx == width || (dx==0 && dy==0) ) {
        continue;
      }
      ret.add(new PVector(pv.x + dx, pv.y + dy));
    }
  }
  return ret;
}

void sortColours()
{
  int c0, c1, c2, rank;
  for (int i = 0; i < colours.size (); i ++)
  {
    c0 = colours.get(i);
    c2 = c1 = c0;
    rank = i;
    for (int j = i+1; j < colours.size (); j ++)
    {
      c2 = colours.get(j);
      if (c2 < c1)
      {
        c1 = c2;
        rank = j;
      }
    }
    colours.set(i, c1);
    colours.set(rank, c0);
  }
}

void shuffleColors()
{
  int c1, c2;
  for (int i = 0; i < colours.size ()-1; i ++)
  {
    int j = (int)random(i+1, colours.size ()-1);
    c1 = colours.get(i);
    c2 = colours.get(j);
    colours.set(i, c2);
    colours.set(j, c1);
  }
}

//COLOURS HAVE TO BE SORTED FOR THIS TO WORK
void sortedColRmvDuplicates()
{
  if (colours.size() > 0)
  {
    int c1 = colours.get(0), c2;
    for (int i = 1; i < colours.size (); i ++)
    {
      c2 = colours.get(i);
      if (c2 == c1)
      {
        colours.remove(i);
      } else
      {
        c1 = c2;
      }
    }
  }
}

void unsortedColRmvDuplicates()
{
  if (colours.size() > 1)
  {
    int c1;
    for (int i = 0; i < colours.size (); i ++)
    {
      c1 = colours.get(i);
      for (int j = colours.size ()-1; j > i; j --)
      {
        if (colours.get(j) ==  c1)
        {
          colours.remove(j);
        }
      }
    }
  }
}

void keyPressed() {
  if (key == 'p') saveFrame(rgbMode?"sortRGB-":"sortHSB-"+(int)random(123456)+".png");
}

