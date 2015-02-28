
UF[] duffs;
int numImgs = 1;
int display = 0;
int Start, End;
void setup()
{
  size(500, 500);

  duffs = new UF[numImgs];
  for (int i = 0; i <numImgs; i++)
  {
    Start = millis();
    String num;
    if (i+5 < 10)
      num = "0"+(i+5);
    else
      num = Integer.toString(i+5);
    //duffs[i] = new UF("http://vs.psc.edu/~awetzel/newjosh/j"+num+"/S1WGRAL00.jpg", "txts/j"+num+".txt");
    duffs[i] = new UF("http://vs.psc.edu/~awetzel/newjosh/j01/S1WGRAL00.jpg", "txts/j05.txt");
    duffs[i].populateColorArray();
    duffs[i].findAllSets();
    display = (display + 1) % numImgs;
    duffs[display].drawAllSets(400,200,500,500);
    duffs[display].drawUserSets();
    End = millis() - Start;
    println(End);
  }

}

void draw()
{
//  if(mousePressed)
  

}

/*This is a union finder class. It is built to search through an image 
 and find "similar" regions and unite them. That similarity, in this class
 is defined by adjacent pixels above a certain brightness threshold (this is
 only for black and white images). It also contains functions to correllate
 */
class UF
{
  UF(String nameOImg, String nameOFile)
  {
    i = 0;
    j = 0;
    this.nameOImg = nameOImg; 
    img = loadImage(nameOImg);
    img.loadPixels();
    N = img.pixels.length;
    coords = loadStrings(nameOFile);
  }

  String nameOImg;
  String coords[];
  int i, j;//general iterator
  int wthresh = 130;//threshhold greyscale
  int dthresh = 5; //similarity threshhold
 // color[][] box;//color array for image
  int[] id, sz;//Arrays for size/set
  PImage img;
  int N;//Stores total number of pixels

  /*This is a function that, in theory, would allow a user to select where
   they think neurons are in a particular mouse brain image. It returns a list
   of all the places the user selected....in theory*/
  int[] userFind()
  {
    int[] circleXs = new int[1000];
    int[] circleYs = new int[1000];
    int[] posits = new int[1000];
    int numCircs = 0;
    image(img, 0, 0);
    noFill();
    stroke(0);
    rect(400, 200, 500, 500);
    stroke(0);

    if (mousePressed) {
      if (mouseButton == LEFT)
      {
        if (numCircs < circleXs.length)
        {
          circleXs[numCircs] = mouseX;
          circleYs[numCircs] = mouseY;
          numCircs++;
        }
        else
        {
          print("Why on Earth did you click this many times!?!?!?!?!?!?!?\n");
        }
      }
      else if (mouseButton == RIGHT)
      {
        if (numCircs >= 1)
          numCircs--;
        else
          print("I can't delete nothing dude!\n");
      }

      //else
      // break; 

      stroke(204, 102, 0);
      for ( int i =0; i < numCircs; i++)
      {
        ellipse(circleXs[i], circleYs[i], 15, 15);
        posits[i] = circleXs[i] + circleYs[i]*img.width;
      }
    }
    return posits;
  }

  /* This is a function that pulls the color of each pixel from an image
   and puts it into an array called box. It's not very exciting or cool.*/
  void populateColorArray()
  {
    image(img, 0, 0);
    //box = new color[img.height][img.width];
    //for (i = 0; i < img.height; i ++)
    //  for (j = 0; j <img.width; j ++)
    //  {
   ///     box[i][j] = img.get(j, i);
   //   } 

    N = img.width*img.height;
    id = new int[N];
    sz = new int[N];

    for (i= 0; i< N; i++)
    {
      id[i] = i;
      sz[i] = 1;
    }
  }
//   int[]sizes =new int()
//   {
//   for(i= 0; handCount
//   sizes[i]=sizeOf(i) 
//   } 

  /* This is a function that takes a position within the image
   and returns a list of all pixels that share the set that pixel is in. (including itself).
   It does this by walking the ENTIRE image, so it's super inefficient. Flood fill would probably
   work a bit better. 
   */
  int[] allInSet (int x, int y)
  {
    int pos=x+y*img.width;
    int j=0;
    int[] set = new int[sizeOf(pos)]; 
    for (i=0; i<img.pixels.length ; i++)
    {
      if (id[i]==id[pos])
      {
        set[j]=i;
        j++;
      }
    }
    return set;
  }

  /*This is a function that takes the entire image and produces a different, random color
   for each set (neuron/capillary/bizarre image artifact/etc) and colors it thusly.*/
  void drawAllSets(int x, int y, int dx, int dy)
  {
    color[] colors = new color[N];
    for ( i = 0; i < N; i += 1)
      colors[i] = color((i*15) % 255, (i*30) % 255, (i*60)%255);

    for ( i = x; i < x+dx; i ++ )
    {
      for ( j = y; j < y+dy; j ++ )
      {
        if(id[j*img.width+i] != -1)
          set(i-x, j - y, colors[id[j*img.width+i]]);
        else
          set(i-x,j-y,color(0,0,0));
      }
    }
//
//
//    for ( i = 0; i < N; i += 1)
//    {
//      set( i % img.width, i / img.width, colors[id[i]] );
//    }
  }

  /* This is a function that takes in a list (from a file) of positions where a user
   has identified the presense of neurons, it then overlays those positions on the image*/
  void drawUserSets()
  {
    int[] userCoords = pullUserSelectedCoords();
    int x, y;
    fill(255);
    for ( int i = 0; i < userCoords.length; i ++)
    {
      x = userCoords[i] % img.width - 400;
      y = userCoords[i] / img.width - 200;
      ellipse(x, y, 10, 10);
    }
  }
  /*This is a function that reads in a file consisting of nothing but lines formatted as 
   xposition, yposition. Where xposition and yposition are numbers*/
  int[] pullUserSelectedCoords()
  {
    String xString, yString;
    int x, y;
    int[] pixelNum = new int[coords.length];
    for ( i = 0; i < coords.length; i++)
    {
      xString = coords[i].substring(0, coords[i].indexOf(','));
      yString = coords[i].substring(coords[i].indexOf(' ')+1, coords[i].length());
      x = Integer.parseInt(xString);
      y = Integer.parseInt(yString);
      pixelNum[i] = x + y*img.width;
    } 

    return pixelNum;
  }

int getPix(int i, int j)
{
 return img.pixels[i*img.width+j]; 
}

  /* This function scans through all of the pixels of the image to find pixels that are connected by moving
   first down a row and left a column, then down a row while staying in the same column, then down a row and
   to the right a column. The scanning begins in the top left corner of the image and works its way down and
   across so it does not need to check pixels above the focus pixel; those will be covered. Then the connected
   pixels are put into sets. Each grouping of pixels getting its own set based on the root pixel of the group
   which is the top left pixel.*/
  void findAllSets( )
  {
    int rows = img.height;
    int cols = img.width;
    for (i=0; i<rows; i++)
      for (j=0; j<cols; j++)
      {
        if (i != rows -1)
        {
          if ((j!=0) && i != rows-1)
            if (isConnected(getPix(i,j), getPix(i+1,j-1)))
              connect(i*cols+j, (i+1)*cols+j-1);
          if (isConnected(getPix(i,j), getPix(i+1,j)))
            connect(i*cols+j, (i+1)*cols+j);
          if (j != cols-1)
            if (isConnected(getPix(i,j), getPix(i+1,j+1)))
              connect(i*cols+j, (i+1)*cols+j+1);
        }
        if (j != cols-1)
          if (isConnected(getPix(i,j), getPix(i,j+1)))
            connect(i*cols+j, i*cols+j+1);
      }
    for (i=0; i<rows; i++)
      for (j=0; j<cols; j++)
      {
       if(sz[id[i*img.width+j]] == 1)
        id[i*img.width+j] = -1; 
      }
  }

  /* This is used to check if two colors ought to be in the same set*/
  boolean isConnected(color C1, color C2)
  {
    //checks to see if C1, C2 are within a certain amount
    //Assumes that info is grayscale pulls the blue value
    return ((C1 & 0xFF) > wthresh) && ((C2 & 0xFF) > wthresh);
    //return ((C1 & 0xFF) - (C2 & 0xFF)) < dthresh;
  }

  /*connect is a function that takes two integers that are pixel indices into the
   pixel array. First it finds the root pixel of each set that the two indices are
   in. Next it sets the root pixel of the smaller set to be in the set of the larger.
   Remember it is compoletely valid for this to work on sets of size 1 (and it in fact
   does most of the time).
   */
  void connect(int i, int j)
  {
    //Find the root pixel of the set i is in
    while (i != id[i])
      i = id[i];
    //Find the root pixel of the set j is in
    while (j != id[j])
      j = id[j];
    if (i == j)
      return;
    if (sz[i] < sz[j])
    {
      id[i] = j;
      sz[j] += sz[i];
    }
    else
    {
      id[j] = i;
      sz[i] += sz[j];
    }
  }

  /*Returns the size of the set any given pixel is in*/
  int sizeOf(int i)
  {
    return sz[id[i]];
  }
}


