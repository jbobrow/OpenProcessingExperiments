
class Comment{
  //variables from comment data sheet
  String IDnum; //comment id number
  int author; //speaker id number
  String [] auds; //array to hold split list of response targets
  String eventTag; //tag to indicate if comment is part of event
  int date;
  int time;
  int feeling; //number to indicate sentiment
  String [] comType; //array to hold split list of communication type
  String place;

  //variables from associated person data
  String authName;
  String authType;
  int zip;
  
  //native variables
  float diam = 15; //general diameter of image bubble
  float rate = 30; //for movement
  float xpos;
  float ypos;
  float xtarget;
  float ytarget;
  color col;   
  int comment = 1; //control for showing comments
  
  Comment (String tempID, int tempAuthor, String tempAud, String tempEvent, int tempDate, int tempTime, int tempFeeling, String tempType, String tempPlace)
  {
    IDnum = tempID;
    author = tempAuthor;
    auds = splitTokens(tempAud,"#");
    eventTag = tempEvent;
    date = tempDate;
    time = tempTime;
    feeling = tempFeeling;
    comType = splitTokens(tempType,"#");
    place = tempPlace;
    checkAuthor();//get data from related person data file
    //col = basic; //just as default
  }
  
 void checkAuthor()
  {
    for (int i = 0; i<csvID.length; i++)
      { 
        if (author == int(csvID[i][1]))
        {authName = csvID[i][0];
         authType = csvID[i][2];
         //zip = int(csvID[i][3]);
         }
      }
   }
  
  void setColor(color input)
   {
    col = input;
   } 
  
  //////////
  //LOCATION TARGETS 
  /////////
  
  void getTimePositions() //xpos and ypos by date and time
  {
    xpos = map(date, startDay, endDay, barStartX, barEndX);
    ypos = map (time, startTime, endTime, barY+space, height-space*3);
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
  
//  float getXTime ()
//  {
//    float a = map(date, startDay, endDay, 100, width-100);
//    return a;
//  }
//  
//  float getYTime ()
//  {
//   float a = map (time, startTime, endTime, xaxis+10, 50); 
//   return a;
//  }
  
  String getIDnum()
  {
   return IDnum; 
  }
  
  //////
  //MOVE!
  /////
  void moveAlong()
  {
    float dy = (ytarget - ypos)/rate;
    float dx = (xtarget - xpos)/rate;
    
    if (xpos == xtarget)
    { //println("xpos == xtarget");
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
   image (bubble, xpos, ypos, diam, 17*(diam/20));
   noTint();
  }
  
  void showInfo()
  {
   float d = dist(mouseX, mouseY, xpos, ypos);
   //float a = random(0,2);
   float x = xpos+85;
   float y = ypos;
   if (d<diam/2)// && mousePressed) //works for now but not very well...
   {//comment++;}
   
   //if (comment%2 == 0)
   //{ 
     if (time > 1300)
     { image (bubbleInfo1, x,y);}
     else
     {image (bubbleInfo2, x,y);}
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
//  
//  void connectEvents()
//  {
//    if (eventTag.equals("e1") == true)
//    {stroke(teal);
//    line (xpos, ypos, e1x, e1y);}
//    else if (eventTag.equals("e2") == true)
//    {stroke(teal3);
//    line (xpos, ypos, e2x, e2y);}
//    else if (eventTag.equals("e3") == true)
//    {stroke(teal2);
//    line (xpos, ypos, e3x, e3y);}
//    
//  }
//

  
}

