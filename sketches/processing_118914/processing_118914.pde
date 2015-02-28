
  //Variable for the skelton image, 
  //which is used in both parts of the game.
  PImage webImg; 

  //Sets partNum to 7, to represent seven parts.
  int partNum = 7; 

  //Creates an array for the BodyParts
  BodyPart[] bodyArray = new BodyPart[partNum]; 

  //coordinates from which we start drawing buttons in testing part
  int xDef = 300; 
  int yDef = 240;
  
  //These two variables save the current score & question.
   int score = 0; 
   int question = 1; 

   IntList que = new IntList(); 

   //variables for menu 

   //Sets both pages to false as the default value
   boolean startTeaching = false; 
   boolean startTesting = false;   

  void setup() 
  {
    //Sets the background to a default color 
    //and sets the size of skelton image.
    background(255); 
    size(475,700); 
    
    //Calls the image from the url given on the web.
    String url = "http://science.pppst.com/science_skeleton.gif"; 
    // Load image from a web server.
    webImg = loadImage("http://science.pppst.com/science_skeleton.gif"); 

    //Sets attributes for head 
    bodyArray[0] = new BodyPart( color(255,0,0), 125, 120, 90, 90, "UNE TÊTE", xDef, yDef); 
     
    //Sets attributes for foot   
    bodyArray[1] = new BodyPart( color(0,255,0), 100, 650, 110, 85, "UN PIED", xDef, yDef+50);   

    //Sets attributes for elbow 
    bodyArray[2] = new BodyPart( color(0,0,255), 35, 314, 50, 50, "UN COUDE", xDef, yDef+100); 

    //Sets attributes for knee 
    bodyArray[3] = new BodyPart( color(255,0,0), 135, 510, 55, 55, "UN GENOU", xDef+110, yDef+100); 

    //Sets attributes for hand 
    bodyArray[4] = new BodyPart( color(255,0,0), 430, 135, 85, 85, "UNE MAIN", xDef+110, yDef); 

    //Sets attributes for hip 
    bodyArray[5] = new BodyPart( color(0,255,0), 200, 350, 150, 60, "UNE HANCHE", xDef+110,yDef+50); 

    //Sets attributes for ribs 
    bodyArray[6] = new BodyPart( color(0,0,255), 195, 230, 60, 150, "DES CÔTES", xDef+60, yDef+150); 

  //append numbers 0-6 to the list
  for(int i=0; i<partNum; i++)
  { 
    que.append(i); 
  } 
  //set random order of the numbers in the list
    que.shuffle(); 

  //Make the first element in the queue visible
  bodyArray[que.get(0)].show = true; 
  } 

  //Function that draws the rectangle 'speechbubble'.
  void drawBubble()
  {
    stroke(0); 
    fill(255); 
    rect(170, 25, 220, 90, 10);   
  } 

//Function to create the button allowing changes between test and teach
  void swapScreens(int x, int y, String label)
  { 
    //draw the button  
    noStroke(); 
    fill(255, 100, 100); 
    ellipse(x, y, 50, 50); 

    //if the mouse clicks on the area of 
    //the values of startTeaching and testingTeaching change to opposite
    if(mousePressed && dist(mouseX, mouseY, x, y) < 25)
    { 
      startTeaching = !startTeaching; 
      startTesting = !startTesting; 
    } 
    
    //add label
    fill(0);
    textAlign(CENTER); 
    textSize(18); 
    text("Go to "+label, x, y); 
    }
    
  //TEACH ME FUNCTIONS 
  void teachMe()
  { 
    //Sets the skelton as the background image.
    image(webImg, 0, 50); 
    //Draws the rectangle 'bubble'
    //by calling the function.
    drawBubble();

 //settings for text in the bubble
    fill(0); 
    textSize(22); 
    textAlign(CENTER); 
    int xPos = 280; 
    int yPos = 45; 

    //Puts the text on top of the skelton image.
    text("Hi, I'm Pierre!", xPos, yPos); 
    text("Click within circles", xPos, yPos+20); 
    text("to learn body parts", xPos, yPos+40); 
    text("in French.", xPos, yPos+60); 

    //For every body part in array
    //the loop will call the drawCircle & teach function.
    for (int i=0; i<partNum; i++)
    { 
      bodyArray[i].drawCircle(); 
      bodyArray[i].teach(); 
    } 
    //place the button to move to testing
     swapScreens(400, 550, "testing."); 
  } 

  //TEST ME FUNCTIONS 
  void drawInstructions()
  { 
    //Gives a textsize for the message at the top
    //Also the textsize used for the answers & centers the text.
    textAlign(CENTER);  
    textSize(22); 
    drawBubble(); 
    //Sets colour of the text
    fill(111,224,32); 
    int xPos = 280; 
    int yPos = 70; 
    text("Click the name of", xPos, yPos); 
    text("the circled area", xPos, yPos+25);  
    
    text("Answers:", 420, 198); 
   
   //New textsize for the score message
   //Needs to be smaller to fit on page
   textSize (20); 
   text("The score is " + score + "/" + partNum, 390, 550); 
  } 

  void testMe()
  { 
      //Sets image.
      image(webImg, 0, 50); 

      //Draws the instructions by calling the drawInstruction method.
      drawInstructions(); 

    //loop to show the buttons and change their shape if clicked

       for (int i=0; i<partNum; i++)
       { 
          if(bodyArray[i].show)
          { 
             bodyArray[i].drawCircle(); 
          } 
       bodyArray[que.get(i)].test(); 
       } 
    
       swapScreens(400, 620, "teaching.");  

     int radius = 20; //radius of a button
    if (mousePressed)
    { 
        frameRate(14); 
        fill(248, 224, 192); 
        noStroke(); 
        //a loop to check if answer is correct
        for (int i=0; i<partNum-1; i++)
        { 
          //if the mouse click is the correct answer, 
          if (dist(mouseX, mouseY, bodyArray[que.get(i)].xAns, bodyArray[que.get(i)].yAns) <= radius)
          { 
                //
             if (question == i+1) 
             { 
                question++; //go to next question
                bodyArray[que.get(i)].show = false; //set current element as invisible
                bodyArray[que.get(i+1)].show = true; //set the next element as visible
                score++; //increment score
              } 
           } 
         } 
        //the last question needs separate if statement, so that the program doesn't try 
        //to acces non-existent position in array
        if(question == partNum)
        { 
          if (dist(mouseX, mouseY, bodyArray[que.get(score)].xAns, bodyArray[que.get(score)].yAns) <= radius) 
            { 
              question++; 
              bodyArray[que.get(score)].show = false;
              score++; 
            } 

         } 
    } 
  } 


  //MENU FUNTIONS 

  void drawMenu()
  { 
     //varaibles to draw buttons
    int xOpt = 305; 
    int yOpt = 490;
    int diameter = 40; 

    //Sets the buttons used in menu.
    fill(210, 10); 
    noStroke(); 
    ellipse(xOpt, yOpt, diameter, diameter); 
    ellipse(xOpt, yOpt+50, diameter, diameter); 

    //Coordinates where to start writing text
    int startX = 190; 
    int startY = 450; 

    //Displays the text that is in the menu page.
    textSize(55); 
    fill(111,224,32); 
    text("Options:",startX, startY); 
    textSize(30); 

    fill(237, 144, 29); 
    text("1 -Teach me!", startX+15, startY+50); 
    textSize(30); 

    fill(111,224,32); 
    text("2 -Test me!", startX+15, startY+100); 

    // Draws the French flag 
    noStroke(); 
    fill(227, 21, 27); 
    rect(290,55,108,200); 

    fill(21,48,193); 
    rect(75,55,108,200); 
    stroke(4); 
    
    strokeWeight(4); 
    noFill(); 
    rect(75,55, 325, 200); 

    if(mousePressed)
    { 
        
      //If the mouse is clicked then go to the teach me page. 
      if (dist(mouseX, mouseY, xOpt, yOpt) <= (diameter/2)) 
      { 
        startTeaching = true; 
      } 

      //If the mouse is clicked go to the test me page. 
      if (dist(mouseX, mouseY, xOpt, yOpt+50) <= 20)
      { 
        startTesting = true; 
      } 

    } 
  }  


  void draw()
  { 
    //If not on the teach or test page, then display the menu.
    if (!startTeaching && !startTesting)
    { 
       drawMenu(); 
    } 

    //If the teach page is selected go to that method.
    if(startTeaching)
    { 
      teachMe(); 
    } 
    
    //If the test page is selected go to that method.
    if (startTesting)
    { 
      testMe();
      //If the score equals the number of body parts,
      //Then display a message of congratulations in French.
      if(score == partNum)
      { 
        stroke(0); 
        strokeWeight(7); 
        fill(255); 
        rect((width/2)-200, (height/2)-100, 400, 200); 
        fill(0); 
        textSize(40); 
        textAlign(CENTER); 
        text("FÉLICITATIONS!", width/2, height/2); 
       } 
     } 
  } 

  class BodyPart
  {    
    // instance variables for BodyPart.
    color cl; 
    int xPos; 
    int yPos; 
    int xSize; 
    int ySize; 
    String name; 
    int xAns; 
    int yAns; 
    boolean show = false; 

    //Gives bodyParts attributes.
    BodyPart(color clTmp, int xPTmp, int yPTmp, int xSTmp, int ySTmp, String nameTmp, int xATmp, int yATmp)
    { 
       cl = clTmp; //color of the circle
       xPos = xPTmp; 
       yPos = yPTmp; //^coordinates of position of body part
       xSize = xSTmp; 
       ySize = ySTmp; //^size of circle
       name = nameTmp; //name of body part
       xAns = xATmp; 
       yAns =yATmp; //position of correct answer to this body part in testing part
    } 
    
    //Used by all bodyParts
    //Function to draw a circle around the body part.
    void drawCircle()
    { 
      stroke(cl); 
      strokeWeight(4); 
      noFill();  
      ellipse(xPos, yPos, xSize, ySize);         
    } 

   //Used by all bodyParts in teaching
   //Function to detect the mouse click & what body part is being clicked.
   //Displays the 'name' in to the 'bubble' rectangle.
   void teach()
   { 
      if (mousePressed)
      { 
         if( (mouseX < xPos+(xSize/2)) && (mouseX > xPos-(xSize/2)) && (mouseY < yPos+(ySize/2)) && (mouseY > yPos-(ySize/2)) )
         { 
           drawBubble(); 
           fill(0); 
           textAlign(CENTER); 
           textSize(25); 
           text(name, 270, 80); 
          } 
       } 
    } 

  //Used by all bodyParts in testing
  //Function to detect the mouse click & what button is being clicked.
  
   void test()
   { 
      //Draws the lables and buttons for each part.
      textSize(18); 
      fill(237, 144, 29); 
      text(name, xAns, yAns); 
      fill(100, 50); 
      noStroke(); 
      ellipse(xAns, yAns, 40, 40); 
      
         if (mousePressed && dist(mouseX, mouseY, xAns, yAns) < 21 )
         { 
            if(!show)
            { 
              //Changes to color to red,
              //if it is clicked & not the correct answer.
              fill(255, 10, 10, 50); 
            } 
            else
            { 
              //Changes color to green if the answer is correct.
              fill(10, 255, 10, 50);     
            } 
            rect(xAns-20, yAns-20, 40, 40); 
         } 
      } 
 } 

