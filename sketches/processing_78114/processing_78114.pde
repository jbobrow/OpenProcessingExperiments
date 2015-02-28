
//Holds all data and methods pertaining to the visual output of the program
class Display
{
  //Attributes
  int xType;              //X-axis data type ID
  int yType;              //Y-axis data type ID
  
  PFont displayFont;      //Display font (Futura Bold 32pt)
  PFont headerFont;       //Header font (Futura Bold 24pt)
  PFont contentFont;      //Content font (Futura 16pt)
  
  int gWidth;             //Data Grid Width
  int gHeight;            //Data Grid Height
  int gXPos;              //Data Grid X Position
  int gYPos;              //Data Grid Y Position
  
  //Constructor
  Display()
  { 
    //Grid values
    gWidth = 1000;
    gHeight = 600;
    gXPos = 160;
    gYPos = 100;
    
    //Default Data Points
    xType = 6;
    yType = 1;
  }
  
  //Load Resources
  void loadResources()
  {
    //This is called from setup
    //It'll load in the fonts
    displayFont = loadFont("AGFuturaBold-32.vlw");
    headerFont = loadFont("AGFuturaBold-24.vlw");
    contentFont = loadFont("AGFutura-16.vlw");
    
    //I am fully aware this could have went in the constructor,
    //however I thought having the additional control over when this
    //was loaded might be useful.
  }
  
  //Screen Render Function
  void render(Parser parser)
  {
    //Render BG
    background(20);
    
    //Render top title
    textFont(displayFont);
    fill(240);
    text("Data Analysis Application", 15, 40);
    
    //Render Graph Title
    textFont(headerFont);
    text(idToString(xType) + " vs " + idToString(yType), 600, 80);
    
    //Call the render Grid function
    renderGrid();
    
    //Draw Grid Numbers
    drawGridNumbers();
  
    //Draw Axis titles
    drawAxisTitles();  
    
    //Render the data on the grid
    renderData(parser);
    
    //Draw Control Buttons
    drawControls();
    
    //Check Controls
    checkControls(); 
  }
  
  
  //Check for input from the user on the controls
  void checkControls()
  {
      //If Mouse X is within area of buttons
      if(mouseX > 25 && mouseX < 350)
      {
        //If Mouse Y is within area of buttons
        if(mouseY > 730 && mouseY < 795)
        {
          //Calculate the button mouse is over using grid
          int mX = mouseX - 0;
          int mY = mouseY - 730;
          
            //Calculate the column
            int column = 0;
            column = ceil(mX / 35);
            
            //Then the row
            int row = 0;
            row = ceil(mY / 35);
            
            //Is the button pressed
            if(mousePressed == true)
            {
              if(row == 0)  //Row 0 = Y axis
              {
                yType = column;
              } else
              {
                xType = column;
              }
            } else
            {
              //Do rollover highlight button
              fill(140);
              if(row == 0)
              {
                ellipse(25 + (column * 35), 745, 30, 30);
              } else
              {
                ellipse(25 + (column * 35), 780, 30, 30);
              }
            }
        }
      }
  }
  
  
  
  //Draw controls on screen
  void drawControls()
  {
    //Set colour
    fill(70);
    
    //Draw base buttons
    for(int i = 0; i < 10; i++)
    {
      ellipse(25 + (i * 35), 780, 30, 30);
    }
    
    for(int i = 0; i < 10; i++)
    {
      ellipse(25 + (i * 35), 745, 30, 30);
    }
    
    fill(200);
    //Draw highlighted buttons
    for(int i = 0; i < 10; i++)
    {
      if(i == xType)
      {
        ellipse(25 + (i * 35), 780, 30, 30);
      }
    }
    
    for(int i = 0; i < 10; i++)
    {
      if(i == yType)
      {
        ellipse(25 + (i * 35), 745, 30, 30);
      }
    }
  }
  
  
  //Draw Axis Titles
  void drawAxisTitles()
  {
    //Draw Axis Titles
    textAlign(RIGHT);
    textFont(contentFont);
    String[] temp = split(idToString(yType), " ");
    String out = join(temp, "\n");
    text(out, 110, int(gYPos + (gHeight * 0.5) + 5));
    
    textAlign(CENTER);
    String[] temp2 = split(idToString(xType), " ");
    String out2 = join(temp2, "\n");
    text(out2, int(gXPos + (gWidth * 0.5)), int(gYPos + gHeight + 55));
    textAlign(LEFT);

  }
  
  //Draw the grid numbers
  void drawGridNumbers()
  {
    String x1, x2, x3, x4, x5;
    String y1, y2, y3, y4, y5;
    
    if(xType != 6)
    {
      //X Axis
      x1 = "0";
      x2 = "0.25";
      x3 = "0.5";
      x4 = "0.75";
      x5 = "1";
    } else
    {
      //X Axis
      x1 = "0";
      x2 = "25";
      x3 = "50";
      x4 = "75";
      x5 = "100"; 
    }
    
    if(yType != 6)
    {
      //Y Axis
      y1 = "0";
      y2 = "0.25";
      y3 = "0.5";
      y4 = "0.75";
      y5 = "1";
    } else
    {
      //Y Axis
      y1 = "0";
      y2 = "25";
      y3 = "50";
      y4 = "75";
      y5 = "100";
    }
    
    //Draw on X Axis
    textFont(contentFont);
      //yeeahhhhhh
      text(x1, gXPos - 5, gYPos + gHeight + 20);
      text(x2, gXPos + (gWidth * 0.25) + -10, gYPos + gHeight + 20);
      text(x3, gXPos + (gWidth * 0.5) + -10, gYPos + gHeight + 20);
      text(x4, gXPos + (gWidth * 0.75) + -10, gYPos + gHeight + 20);
      text(x5, gXPos + gWidth + -10, gYPos + gHeight + 20);
      
    //Draw on Y Axis
      text(y1, gXPos - 20, gYPos + gHeight + 5);
      text(y2, gXPos - 45, gYPos + (gHeight * 0.75) + 5);
      text(y3, gXPos - 35, gYPos + (gHeight * 0.5) + 5);
      text(y4, gXPos - 45, gYPos + (gHeight * 0.25) + 5);
      text(y5, gXPos - 20, gYPos + 5);
  }
  
  
  //Render Data on grid
  void renderData(Parser parser)
  {    
    //The plan is for us to draw a small transparent ellipse on every data point
    //This will give the effect of making the colour stronger where data in condensed
    //create a pseudo line of best fit.
    
    int tx, ty;    //Temp variables for x/y positions
    
    //Set colour
    noStroke();
    fill(0, 126, 255, 15);
    
    //Iterate through data
    for(int i = 0; i < parser.data.length; i++)
    {
      //Calculate position
      tx = gXPos + idToXPos(xType, parser.data[i].accessor(xType));
      ty = gYPos + idToYPos(yType, parser.data[i].accessor(yType));
      
      //Draw ellipse
      ellipse(tx, ty, 30, 30);
    }
  }
  
  
  
  //Convert data ID and data position to X Position on grid
  int idToXPos(int id,  float data)
  {
    int retVal = 0;  //Return value placeholder
    
    //Lets specify an upper bound for every data type
    float upper = 0;
    switch(id)
    {
      case 0:
        upper = 1;
        break; 
      
      case 1:
        upper = 1;
        break;
        
      case 2:
        upper = 1;
        break;
       
      case 3:
        upper = 1;
        break;
       
      case 4:
        upper = 1;
        break;
       
      case 5:
        upper = 1;
        break;
       
      case 6:
        upper = 100;
        break;
       
      case 7:
        upper = 1;
        break;
       
      case 8:
        upper = 1;
        break;
       
      case 9:
        upper = 1;
        break;
    }
    
    //So now we can create a multiplier of this
    float multiplier = data / upper;
   
    //We can now apply this multiplier to the grid width which gives its Xpos
    retVal = int(float(gWidth) * multiplier);
    //print(data + " ");
   
    //Return the x pos value
    return retVal;
  }
  
  //Convert data ID and data position to Y Position on grid
  int idToYPos(int id,  float data)
  {
    int retVal = 0;  //Return value placeholder
    
    //Lets specify an upper bound for every data type
    float upper = 0;
    switch(id)
    {
      case 0:
        upper = 1;
        break; 
      
      case 1:
        upper = 1;
        break;
        
      case 2:
        upper = 1;
        break;
       
      case 3:
        upper = 1;
        break;
       
      case 4:
        upper = 1;
        break;
       
      case 5:
        upper = 1;
        break;
       
      case 6:
        upper = 100;
        break;
       
      case 7:
        upper = 1;
        break;
       
      case 8:
        upper = 1;
        break;
       
      case 9:
        upper = 1;
        break;
    }
    
    //So now we can create a multiplier of this
    float multiplier = data / upper;
   
    //We can now apply this multiplier to the grid width which gives its Ypos
    retVal = int(float(gHeight) * multiplier);
   
    //Apply opposite to it so our value is top down instead of bottom up
    retVal = gHeight - retVal;
   
    //Return the y pos value
    return retVal;
  }
  
  
  
  //Convert data ID to human name
  String idToString(int id)
  {
    String retVal;
    
    //Run switch check on ID
    //Correct ID case will return the human readable name
    switch(id)
    {
      case 0:
        retVal = "Fluid Intelligence";
        break;
        
      case 1:
        retVal = "Internet Confidence";
        break;
        
      case 2:
        retVal = "Processing Speed";
        break;
        
      case 3:
        retVal = "Short Term Memory";
        break;
        
      case 4:
        retVal = "Long Term Memory";
        break;
        
      case 5:
        retVal = "Internet Usage";
        break;
        
      case 6:
        retVal = "Age";
        break;
        
      case 7:
        retVal = "Disorientation";
        break;
        
      case 8:
        retVal = "Ease of Use";
        break;
        
      case 9:
        retVal = "Total";
        break;
      
      default:
        retVal = "UNKNOWN";
    }
    
    //Return final value
    return retVal;
  }
  
  
  //Render the Grid BG for the data
  void renderGrid()
  {    
    /* * *
     * Graph size is 1000 x 600, with increments
     */
        //Define Some Info
        int Width = gWidth;
        int Height = gHeight;
        int vInc = 25;
        int hInc = 25;
        int xPos = gXPos;
        int yPos = gYPos;
     
        //Main Box
        stroke(60);
        noFill();
        strokeWeight(4);
        
        rect(xPos, yPos, Width, Height);
        
        //Draw Grid
          //Vertical
          for(int i = 1; i < 40; i++)
          {
            //Default Stroke Weight
            strokeWeight(1);
            
            //Increase if it's a half
            if(i == 20)                {  strokeWeight(3);  }
            
            //Increase if it's a quarter
            if(i == 10 || i == 30)      {  strokeWeight(2);  }
            
          
            //Draw Vertical Line
            line(  xPos + (vInc * i),    //P1 X pos
                   yPos,                 //P1 Y pos
                   xPos + (vInc * i),    //P2 X pos
                   yPos + Height         //P2 Y pos
                   );
                   
          }
          
          
          //Horizontal
          for(int i = 1; i < 24; i++)
          {
            //Default Stroke Weight
            strokeWeight(1);
            
            //Increase if it's a half
            if(i == 12)                {  strokeWeight(3);  }
            
            //Increase if it's a quarter
            if(i == 6 || i == 18)      {  strokeWeight(2);  }
            
            
            //Draw Horizontal Line
            line(  xPos,               //P1 X Pos
                   yPos + (hInc * i),  //P1 Y Pos
                   xPos + Width,       //P2 X Pos
                   yPos + (hInc * i)   //P2 Y Pos
                  );
          }
  }
}

