
// Labour Poll Range
int maxPoll = 80, minPoll = 20;
float[][][] averagePointValue = new float[10][10][2];


// Grid for Labour's Share vs Unemployment
void writeGrid1()
{
  // Add y-axis labels
  for (int i = minPoll; i < maxPoll-15; i+=10)
  {
    text((i)+"%", 15, gridHeight(i)+5);
  }

  // Add x-Axis Labels
  for (int j = 0; j < 105; j+=15)
  {
    text(j, gridWidth(j), height-50);
  }

  // Add axis bars
  rect(65+35, gridHeight(minPoll) +35, width - 50 - 65-35-35, -10);  
  rect(gridWidth(0), gridHeight(minPoll), 5, -height + 200 + 65);

  // Source
  textFont(createFont("Tunga", 16));
  text("Source: Guardian ICM & ONS", width-250, height-10);

  // Title
  textFont(createFont("Times", 25));
  text("Dynamic Theme Chart: Labour's Share of the Mori Poll Vote", 300, 50);
  text("Against Unemployment by ONS Category 1992-2011", 340, 100);

  textFont(createFont("Tunga", 20));
  text("Unemployment (% of Category Peak)", (width/5)*2, height-25);
}

void setGridFont()
{
  textFont(createFont("Tunga", 16));
  fill(0);
  //image(backDrop,0,0,width,height);
  background(242, 219, 210);
}

/*
* Gives the location height in the Labour Share vs Employment 
 */
int gridHeight(float value)
{
  return (int) (height+value*-height/(maxPoll-minPoll)+150);
}


/*
* Gives the location width in the Labour Share vs Employment 
 */
float gridWidth(float value)
{
  return ((((float)value/105f)*((float)width-65f-35f))+65);
}


/*
*  Collect the data
 */
void loadPoll()
{
  String xAxisString;
  pollData = new float[poll.getRowCount()][4];
  pollCat = new String[pollData.length][3];

  for (int row = 1; row < pollData.length; row++)
  {
    //Get Values
    xAxisString = poll.getStringAt(row, 11);
    xAxisString = xAxisString.substring(0, xAxisString.length()-1);

    pollData[row][0] = (new Float(xAxisString)).floatValue();
    pollData[row][1] = poll.getFloatAt(row, 9);
   // System.out.println(pollData[row][0]+", "+pollData[row][1]);

    // Year and Month of the Data Point
    pollData[row][2] = gridHeight(poll.getFloatAt(row, 6));
    pollData[row][3] = gridHeight(poll.getFloatAt(row, 7));

    // get Age Category
    pollCat[row][0] = poll.getStringAt(row, 0);
    //get Gender
    pollCat[row][1] = poll.getStringAt(row, 1);
    // get Months Unemployed
    pollCat[row][2] = poll.getStringAt(row, 2);
  }
}

/*
* Shows the initial points
 */
void displayPoll()
{

  fill(58, 61, 203);

  for (float[] vals: pollData)
  {
    ellipse(gridWidth(vals[0]), gridHeight(vals[1]), 5, 5);
  }
}


/*
*  Take the loaded data and group them into categories
 */

void applyPollToGrid()
{
  //  ArrayList[][] gridCat; Declare Grid of 25x25

  gridCat = new ArrayList[10][10];

  for (int x = 0; x<10; x++)
  {
    for (int y = 0; y < 10; y++)
    {
      gridCat[x][y] = new ArrayList<Integer>();
    }
  }

  int catX, catY;

  for (int index = 1; index < pollData.length; index++)
  {
    catX = (int)((10f/26f)*(pollData[index][0])/4);
    catY = (int)((10f/26f)*(pollData[index][1]-20)/2);
    //    System.out.println("catX: "+catX+", catY: "+catY+", "+pollData[index][0]+", "+pollData[index][1]);
    gridCat[catX][catY].add(new Integer(index));
  }
}
/*
*  Gets the XAxis value Unemployment % of Category Peak from the x grid Coordinate when boxed to categories
 */
float getCatXValue(float value)
{
  return gridWidth((float)value*4);
}

/*
*  Gets the YAxis value support for Labour from the y grid Coordinate when boxed to categories
 */
float getCatYValue(float value)
{
  return gridHeight((float)((value*2)+20));
}


//Shows the Grid on Screen as a grid
void displayPollGrid()
{
  fill(247, 42, 97);
  for (int xAxis = 0; xAxis < gridCat.length; xAxis++)
  {
    for (int yAxis = 0; yAxis < gridCat[xAxis].length; yAxis++)
    {
      if (gridCat[xAxis][yAxis].size()>0) text(gridCat[xAxis][yAxis].size(), getCatXValue(xAxis), getCatYValue(yAxis));
    }
  }
}


/*
* Displays the gridCat array as shapes
 */
void displayPlacedShapes(ArrayList[][] grid)
{
  fill(247, 42, 97);
  float xValue, yValue;
  int index, sizeSeries, pointSize;

  for (int xAxis = 0; xAxis < grid.length; xAxis++)
  {
    for (int yAxis = 0; yAxis < grid[xAxis].length; yAxis++)
    {
      xValue = 0;
      yValue = 0;
      sizeSeries = grid[xAxis][yAxis].size();

      if (sizeSeries>0)
      {
        //Integer[] indexList = gridCat[xAxis][yAxis].toArray();

        for (int i = 0; i < sizeSeries; i++)
        {
          index = ((Integer)grid[xAxis][yAxis].get(i)).intValue();
          try {
            xValue += pollData[index][0];
            yValue += pollData[index][1];
          }
          catch(Exception e)
          {
            System.out.println("try catch error");
          }
        }

        //   System.out.println("DisplayPlacedShape: SizeSeries "+sizeSeries+", XValue "+xValue+", YValue "+yValue);

        xValue /= sizeSeries;
        yValue /= sizeSeries;

        // System.out.println("DisplayPlacedShape: SizeSeries "+sizeSeries+", XValue "+xValue+", YValue "+yValue);
        //  System.out.println("Output: "+gridWidth(xValue)+", "+gridHeight(yValue));
        // text(sizeSeries, gridWidth(xValue), gridHeight(yValue));

        //   pointSize = (((sizeSeries/10)/2)*((sizeSeries/10)/2))*2;

        pointSize = (int)sqrt(sizeSeries);
        ellipse(gridWidth(xValue), gridHeight(yValue), pointSize, pointSize);

        averagePointValue[xAxis][yAxis][0] = xValue;
        averagePointValue[xAxis][yAxis][1] = yValue;
      }
    }
  }
}


boolean shrinkGrid(ArrayList[][] grid) 
{
  int xMin = -1, yMin = -1, xMax = -2, yMax = -2, 
  minValue = Integer.MAX_VALUE, maxValue = Integer.MIN_VALUE, 
  listSize = 0;  

  //System.out.println("Entering Shrink Grid");

  for (int xAxis = 0; xAxis < grid.length; xAxis++)
  {
    for (int yAxis = 0; yAxis < grid[xAxis].length; yAxis++)
    {
      listSize = grid[xAxis][yAxis].size();

      if (listSize > 0)
      {
        if (minValue > listSize)
        {
          minValue = listSize;
          xMin = xAxis;
          yMin = yAxis;
        }

        if (maxValue <= listSize)
        {
          maxValue = listSize;
          xMax = xAxis;
          yMax = yAxis;
        }
      }
    }
  }


  if (xMin == xMax && yMin == yMax)
  {
    page = 1;
 //   System.out.println("Exiting Theming");
    return false;
  }

  // part two getting the values for extraction 
  Integer target = (Integer)grid[xMin][yMin].get(0);
  float xUnit, yUnit;
  float distance = MAX_FLOAT, localDistance;
  int newX = -1, newY = -1;

  xUnit = pollData[target][0];
  yUnit = pollData[target][1];

  for (int xAxis = 0; xAxis < grid.length; xAxis++)
  {
    for (int yAxis = 0; yAxis < grid[xAxis].length; yAxis++)
    {
      listSize = grid[xAxis][yAxis].size();

      if (listSize > 0 &&(xAxis != xMin || yAxis != yMin))
      {
        localDistance = (xUnit-averagePointValue[xAxis][yAxis][0])/
          sin(atan((xUnit-averagePointValue[xAxis][yAxis][0])/(yUnit-averagePointValue[xAxis][yAxis][1])));

        localDistance = sqrt(localDistance*localDistance);

        if (localDistance < distance)
        {
          newX = xAxis;
          newY = yAxis;
          distance = localDistance;
        }
      }
    }
  }

  grid[newX][newY].add(target);
  grid[xMin][yMin].remove(0);

  return true;
}


/**
 * Takes the grid points and puts them into an array for easier handling
 */
ArrayList gridToArray(ArrayList[][] grid)
{
  ArrayList<ArrayList<Integer>> tempArray = new ArrayList<ArrayList<Integer>>();

  for (int xAxis = 0; xAxis < grid.length; xAxis++)
  {
    for (int yAxis = 0; yAxis < grid[xAxis].length; yAxis++)
    {
      if ( grid[xAxis][yAxis].size() > 0)
      {
        tempArray.add(grid[xAxis][yAxis]);
      }
    }
  }

  return tempArray;
}

/**
 *  Take the points and split them up into themes
 */

ArrayList splitGrid(ArrayList setList, boolean horizontal)
{
  float minX, minY, maxX, maxY, meanX, meanY, 
  pointX1, pointY1, pointX2, pointY2, tempX, tempY, tempVal, tempVal2;
  int listSize, index;

  ArrayList<Integer> temp1 = new ArrayList<Integer>(), 
  temp2 = new ArrayList<Integer>();

  ArrayList<ArrayList<Integer>> returnList = new ArrayList<ArrayList<Integer>>();


  for (Object pointList: setList)
  {
    minX = MAX_FLOAT;
    minY = MAX_FLOAT;
    maxX = 0;
    maxY = 0;
    meanX = 0;
    meanY = 0;
    listSize = ((ArrayList)pointList).size();
    temp1 = new ArrayList<Integer>();
    temp2 = new ArrayList<Integer>();

    for (Object pointVal: (ArrayList)pointList)
    {
      index = ((Integer)pointVal).intValue();

      if (minX > pollData[index][0]) minX = pollData[index][0];
      if (minY > pollData[index][1]) minY = pollData[index][1];

      if (maxX < pollData[index][0]) maxX = pollData[index][0];
      if (maxY < pollData[index][1]) maxY = pollData[index][1];      

      meanX += pollData[index][0];
      meanY += pollData[index][1];
    }

    meanX /= listSize;
    meanY /= listSize;

    pointX1 = (minX + meanX)/2f;
    pointY1 = (minY + meanY)/2f;
    pointX2 = (maxX + meanX)/2f;
    pointY2 = (maxY + meanY)/2f;

    if (horizontal)
    {
      pointY1 = meanY;
      pointY2 = meanY; //correct code for horizontal
    }
    else
    {
      pointX1 = meanX;
      pointX2 = meanX; // for vertical split
    }
    //System.out.println("lower Value: " + pointX1 +","+ pointY1+", upper Value: " +pointX2+","+pointY2);

    for (Object pointVal: (ArrayList)pointList)
    {
      index = ((Integer)pointVal).intValue();
      tempX = pollData[index][0];
      tempY = pollData[index][1];

      tempVal =  (tempX - pointX1)/
        sin(atan((tempX - pointX1)/(tempY - pointY1)));
      tempVal2 = (tempX - pointX2)/
        sin(atan((tempX - pointX2)/(tempY - pointY2)));

      tempVal = sqrt(tempVal * tempVal);
      tempVal2 = sqrt(tempVal2 * tempVal2);

      if (tempVal < tempVal2)
      {
        temp1.add((Integer)pointVal);
      } 
      else {
        temp2.add((Integer)pointVal);
      }
    }

    if (temp1.size() > 0) returnList.add(temp1);
    if (temp2.size() > 0) returnList.add(temp2);

    //System.out.println("temp1 size: "+temp1.size()+", temp2 size: "+temp2.size()+", returnList size: "+returnList.size());
  }

  return returnList;
}

/**
 *  Turn the array to a grid for display consistency
 *
 */

ArrayList[][] arrayToGrid(ArrayList inputArray)
{
  int listSize = inputArray.size();
  ArrayList[][] returnGrid = new ArrayList[10][10];
  int countGrid = 0;

  for (int x = 0; x < 10; x++)
  {
    for (int y = 0; y < 10; y++)
    {
      returnGrid[x][y] = new ArrayList<Integer>();
    }
  }

  for (Object pointList: inputArray)
  {
    returnGrid[(int)(countGrid/10)][(int)(countGrid%10)] = (ArrayList)pointList;
    countGrid++;
  }

  return returnGrid;
}


/**
 *  returns a copy of the array
 */
ArrayList getArrayStore(ArrayList inputArray)
{
  ArrayList<ArrayList<Integer>> returnArray = new ArrayList<ArrayList<Integer>>();

  for (Object pointsList: inputArray)
  {
    ArrayList<Integer> tempArray = new ArrayList<Integer>();
    
    for(Object values: (ArrayList) pointsList)
  {
    tempArray.add(((Integer)values).intValue());
  }
    
    returnArray.add(tempArray);
  }
  
  return returnArray;
}


