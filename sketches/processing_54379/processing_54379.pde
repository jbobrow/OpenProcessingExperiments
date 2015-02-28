
class Comment{
  //variables from comment data sheet
  String IDnum;
  int author;
  String [] auds; //array to hold split list of audience members
  String audType;
  int date;
  int time;
  String place;
  String feeling;
  String [] comType; //array to hold split list of communication type
  
  //variables from associated person data
  String authName;
  String authType;
  int zip;
  
  //native variables
  float diam = 20; //general diameter of image bubble
  float rate = 30; //for movement
  float xpos;
  float ypos;
  float xtarget;
  float ytarget;
  color col;   
  
  Comment (String tempID, int tempAuthor, String tempAud, String tempAudType, int tempDate, int tempTime, String tempPlace, String tempFeeling, String tempType)
  {
    IDnum = tempID;
    author = tempAuthor;
    date = tempDate;
    time = tempTime;
    place = tempPlace;
    feeling = tempFeeling;
    audType = tempAudType;
    auds = splitTokens(tempAud,"#");
    comType = splitTokens(tempType,"#");
    checkAuthor();//get data from related person data file
    //col = teal; //just as default
  }
  
 void checkAuthor()
  {
    for (int i = 0; i<csvID.length; i++)
      { 
        if (author == int(csvID[i][1]))
        {authName = csvID[i][0];
         authType = csvID[i][2];
         zip = int(csvID[i][3]);}
      }
   }
  
  void setColor(color input)
   {
    col = input;
   } 
  
  //////////
  //LOCATION TARGETS 
  /////////
  
//  void getTimePositions() //xpos and ypos by date and time
//  {
//    xpos = map(date, startDay, endDay, 100, width-100);
//    ypos = map (time, startTime, endTime, xaxis+10, 50);
//  }
  
  float getYPlacePosition()
  {
    float a = (xaxis/7);
    float y1 = a*2;
    float y2 = a*3;
    float y3 = a*4;
    float y4 = a*5;
    float y5 = a*6;
    
    if (place.equals(place_per) == true)
    {return y1;}
    else if (place.equals(place_let) == true)
    {return y2;}
    else if (place.equals(place_rpt) == true)
    {return y3;}
    else if (place.equals(place_eml) == true)
    {return y4;}
    else if (place.equals(place_nws) == true)
    {return y5;}
    else
    {return a;}
  }
  
  float getYPerTypePosition()
  {
    float a = (xaxis/7);
    float y1 = a*2;
    float y2 = a*3;
    float y3 = a*4;
    float y4 = a*5;
    float y5 = a*6;
    if (authType.equals(perType_res) == true)
    {return y1;}
    else if (authType.equals(perType_key) == true)
    {return y2;}
    else if (authType.equals(perType_elct) == true)
    {return y3;}
    else if (authType.equals(perType_gov) == true)
    {return y4;}
    else if (authType.equals(perType_con) == true)
    {return y5;}
    else
    {return a;} 
  }
  
  /////////////
  //for getting and setting x and y position values
  ////////////
  float getYpos()
  {return ypos;}
  
  float getXpos()
  {return xpos;}
  
  void setYpos(float value)
  {ypos = value;}
  
  void setXpos (float value)
  {xpos = value;}
  
  void setYtarget(float value)
  {ytarget = value;}
  
  float getYtarget()
  {return ytarget;}
  
  void setXtarget(float value)
  {xtarget = value;}
  
  float getXTime ()
  {
    float a = map(date, startDay, endDay, 100, width-100);
    return a;
  }
  
  float getYTime ()
  {
   float a = map (time, startTime, endTime, xaxis+10, 50); 
   return a;
  }
  
  //////
  //MOVE!
  /////
  void moveAlong()
  {
    float dy = (ytarget - ypos)/rate;
    float dx = (xtarget - xpos)/rate;
    
    if (ypos == ytarget)
    { //println("ypos == ytarget");
      ypos = ytarget; xpos = xtarget;}
    else
    {ypos += dy;  xpos += dx;}
    
  }
  
  ///////
  //SHOW COMMENT OBJECT + etc
  //////
  
  void display()
  {
   tint (col);
   //stroke(0);
   //ellipse (xpos, ypos, diam, diam); 
   image (bubble, xpos, ypos);
  }
  
  void showAuthor()
  {
   float d = dist(mouseX, mouseY, xpos, ypos);
   float x = xpos+diam/2;
   if (d<diam/2)
   { fill(255);
     noStroke();
     rect ( x, ypos-10, textWidth(authName)+8, 15); // white background behind name
     fill(0); 
     text (authName, x+2, ypos); 
   }    
  }
  
  void showCommType()
  {
   float d = dist(mouseX, mouseY, xpos, ypos);
   float x = xpos+diam/2;
   float y = ypos;
   if (d<diam/2)
   {
    for (int i = 0; i<comType.length; i++)
    {
     fill(255);
     noStroke();
     rect (x, y-10, textWidth(comType[i])+8, 11);
     fill(0);
     text (comType[i], x+2, y);
     y+=13; 
    }
   }
  }
  
  ////////
  //DRAW CONNECTIONS TO AUDIENCE
  ///////
  
  void makeConnections()
  {
    for (int i = 0; i<auds.length; i++)
    {
      for (int j = 1; j<comments.length; j++)
        {
          if (auds[i].equals(comments[j].IDnum) == true)
           { stroke(0);
             line (xpos, ypos, comments[j].xpos, comments[j].ypos);}  //how to add something here so direction is clear??
        }    
    }
  }
  
  
}

