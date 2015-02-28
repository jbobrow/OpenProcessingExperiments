
int rectSize = 32;
int rectSizeMax = 64;
int rectSizeMin = 1;

int squareHorIndex = 0;
int squareVertIndex = 0;
int rectId = 0;

int[][] occupied;
float maxDistance;
int maxDistanceValue = 5; //power of 2 which is the rectSizeMax

//PrintWriter output;


  void setup() 
  {
     size(512, 512);
     occupied = new int[width][height];
     maxDistance = dist(width/2, height/2, width, height);
     
     background(0, 0, 0);
     stroke(255);
     //i = 0;
     
     //output = createWriter("debug.txt");
  } 




  void draw() 
  {
    int dist = 0;
    int size = 0;
    int smallestInRow = height;
    
    if(frameCount % 10 == 0)
    {
      for (int y = 0; y < height; y+=smallestInRow)
      //for (int y = 0; y < 64; y+=smallestInRow)
      {
        for (int x = 0; x < width;)
        {
          dist = round(getRectCenterDistance(x,y,rectSize,rectSize)) + 1;
          //dist = dist + int(random(-1.1,1.1));
          size = (int)pow(2, dist);
          //have to somehow ensure the rects don't cross the rectSizeMax boundaries
          
          
          if ((x%rectSizeMax > (x+size-1)%rectSizeMax) || (y%rectSizeMax > (y+size-1)%rectSizeMax))
          {
            size /= 2;
          }




          if (1 != isOccupied(x,y,size,size))
          {
            occupyRect(x,y,size,size);
            x += size;
            if (size < smallestInRow)
              smallestInRow = size;
          }
          else
            x += smallestInRow;
        }
        //println(smallestInRow);
      }
      
      for (int y = 0; y < height; y++)
      {
        for (int x = 0; x < width; x++)
        {
          occupied[x][y] = 0;
        }
      }
    }
  }
    
    
  
  
  float getDistance(int x, int y)
  {
    return dist(width/2, height/2, x, y)/maxDistance * maxDistanceValue;
  }
  
  float getRectCenterDistance(int x, int y, int w, int h)
  {
    return getDistance(x+w/2, y+h/2);
  }
  
  
  
  void getFill()
  {
    if (random(2) >= 1)
      fill(0);
    else
      fill(255);
  }
  
  void getFill2()
  {
    fill(random(255));
  }
  
  
  void occupyRect(int x, int y, int w, int h)
  {
    for (int yy = y; ((yy < y+h) && yy < height); yy++)
    {
      for (int xx = x; ((xx < x+w) && xx < width); xx++)
      {
        //output.print(xx);output.print(' ');output.print(yy);output.println();
        occupied[xx][yy] = 1;
      }
    }
    getFill2();
    //stroke(127);
    rect(x,y,w,h);
    //output.flush();
    //fill(127); textSize(h/2);text(round(getRectCenterDistance(x,y,h,w)),x,y+w/2);
  }
  

  
  
  int isOccupied(int x, int y, int w, int h)
  {
    for (int yy = y; ((yy < y+h) && yy < height); yy++)
    {
      for (int xx = x; ((xx < x+w) && xx < width); xx++)
      {
        if (1 == occupied[xx][yy])
          return 1;
      }
    }
    return 0;
  }
  



