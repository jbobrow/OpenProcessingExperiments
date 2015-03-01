
ArrayEnemies[] myArrays = new ArrayEnemies[25];      //Starting the array for the rectangles that go from left to right
ArrayEnemies2[] myArrays2 = new ArrayEnemies2[25];   //Starting the array for the rectangles that go from right to left
Player myPlayer;                                     //Making the player which you control with the 
float fltPlayerSize = 10;

void setup(){                                        //Start of void setup
  size(600,600);                                     //Making the display size 600x600
  myPlayer = new Player(200,300,300,10);             //Saying the player's variables match along with the variables over in the player teir
  for(int index = 0; index < myArrays.length; index ++){ //Saying that the index goes up by one with every loop, and starts at 0.  
    myArrays[index] = new ArrayEnemies(random(600),random(height),random(width/10),random(15,50), random(.8,1.7));//Setting up the variables for the rectangles that go from left to right
    }                                                //End of for statement
      for(int index2 = 0; index2 < myArrays2.length; index2 ++){ //Saying that the second index goes up by one with every loop, and starts at 0.  
    myArrays2[index2] = new ArrayEnemies2(random(600),random(height),random(width/10),random(15,50), random(.8,1.7), 0);//Setting up the variables for the rectangles that go from right to left
    }                                                //End of for statement
}                                                    //End of void setup

void draw(){                                         //Start of void draw
  background(255);                                     //Making a black background
  for (int index = 0; index < myArrays.length; index++){ //According to index rules,
    myArrays[index].display();                           //Making the display class in the myArrays tier
fltPlayerSize  = myArrays[index].collide(fltPlayerSize); //Making the display class in the myArrays tier
    myArrays2[index].display();                          //Making the display class in the myArrays2 tier
fltPlayerSize  = myArrays2[index].collide(fltPlayerSize);//Making the display class in the myArrays2 tier
    println (fltPlayerSize);
    myPlayer.display(fltPlayerSize);                     //Making the display class in the playrt tier 
}}                                                       //End of for statement

class ArrayEnemies {                                                   
  float fltX;
  float fltY;
  float fltWidth;
  float fltColor;
  float speedvar;
  float fltSize;
  ArrayEnemies(float fltXCatch, float fltYCatch, float fltWidthCatch, float fltColorCatch, float speedvarCatch){
    fltX = fltXCatch;
    fltY = fltYCatch;
    fltWidth = fltWidthCatch;
    fltColor = fltColorCatch;
    speedvar = speedvarCatch;
  }
  float collide(float fltSizeCatch){                        //Start of the tier where the left-to-right squares collide with the player
fltSize = fltSizeCatch;                                     //Saying that the size variable used here is the same as fltSizeCatch from the Self Game teir
 float distance = dist(fltX+fltWidth/2,fltY-fltWidth/2,mouseX,mouseY); //Saytub tgat float distance is equal to the mouse's distance from the center of any given enemy
    if (distance < fltWidth/2+fltSize/2 && mouseX < ((fltX+fltWidth/2) +(fltWidth/2+fltSize/2)) && mouseX > ((fltX+fltWidth/2) - (fltWidth/2+fltSize/2)) && mouseY > ((fltY-fltWidth/2) - (fltWidth/2+fltSize/2)) && mouseY < ((fltY-fltWidth/2) + (fltWidth/2+fltSize/2)) && fltSize >= fltWidth){ //If the player touches a smaller square,
  fltSize = fltSize + 1;                                      //The size grows larger slightly
  fltX = -50;                                                 //the X location of the eaten enemy resets
  fltY = random(600);                                         //The Y location of the eaten enemy resets and is randomized
     }                                                      //End if statement
                                                                                                                                                                                                                                                                                                                               
    if (distance < fltWidth/2+fltSize/2 && mouseX < ((fltX+fltWidth/2) +(fltWidth/2+fltSize/2)) && mouseX > ((fltX+fltWidth/2) - (fltWidth/2+fltSize/2)) && mouseY > ((fltY-fltWidth/2) - (fltWidth/2+fltSize/2)) && mouseY < ((fltY-fltWidth/2) + (fltWidth/2+fltSize/2)) && fltSize <= fltWidth && (fltSize/10) > 1){ //If the player touches a larger square,
        exit();                                             //The program exits
       }                                                    //End of if statement
       return fltSize;                                      //Returning the flt size variable
  }                                                         //End of float collide
   void display(){                                          //Beginning void display

     fill(fltWidth*4,0,0);                                  //Filling based on size. The larger, the brighter
     rectMode(CORNERS);                                     //Using rectmode corners for programming ease
     rect(fltX,fltY,fltX+fltWidth,fltY-fltWidth);           //Drawing enemies
     fltX = fltX + speedvar;                                //Making the enemies move
     if (fltX > 600){                                       //If the enemies move off screen,
       fltX = 0-fltWidth;                                     //They reset X-wise,
       fltY = random(600);                                    //And reset Y-wise
     }                                                      //End of if statement
   speedvar = speedvar*1.00014;                             //Making speedvar grow as the program goes along. Makes enemies faster.
   fltWidth = fltWidth * 1.00014;                           //Making widthvar grow as the program goes along. Makes enemies bigger.
     }                                                      //End of void display
}                                

class ArrayEnemies2 {                                      
  float fltX;                                              
  float fltY;
  float fltWidth;
  float fltColor;
  float speedvar;
  float fltSize;
  float fltLevel;
  ArrayEnemies2(float fltXCatch, float fltYCatch, float fltWidthCatch, float fltColorCatch, float speedvarCatch, float fltLevelCatch){
    fltX = fltXCatch;
    fltY = fltYCatch;
    fltWidth = fltWidthCatch;
    fltColor = fltColorCatch;
    speedvar = speedvarCatch;
    fltLevel = fltLevelCatch;
  }
  float collide(float fltSizeCatch){                       //Start of float collide where we define what happens if the player collides with an enemy
fltSize = fltSizeCatch;                                    //Size variable is equal to fltSizeCatch from the Self Game teir

 float distance = dist(fltX+(fltWidth/2),fltY-(fltWidth/2),mouseX,mouseY);
   if (distance < fltWidth/2+fltSize/2 && mouseX < ((fltX+fltWidth/2) +(fltWidth/2+fltSize/2)) && mouseX > ((fltX+fltWidth/2) - (fltWidth/2+fltSize/2)) && mouseY > ((fltY-fltWidth/2) - (fltWidth/2+fltSize/2)) && mouseY < ((fltY-fltWidth/2) + (fltWidth/2+fltSize/2)) && fltSize >= fltWidth){ //If the player collides with an enemy smaller than it,
  fltSize = fltSize + 1;                                     //The player gets larger slightly,
  fltX = -50;                                                //The X location of the eaten enemy resets,
  fltY = random(600);                                        //The Y location of the eaten enemy resets and is randomized
     }                                                     //End of if statement
  
    if (distance < fltWidth/2+fltSize/2 && mouseX < ((fltX+fltWidth/2) +(fltWidth/2+fltSize/2)) && mouseX > ((fltX+fltWidth/2) - (fltWidth/2+fltSize/2)) && mouseY > ((fltY-fltWidth/2) - (fltWidth/2+fltSize/2)) && mouseY < ((fltY-fltWidth/2) + (fltWidth/2+fltSize/2)) && fltSize <= fltWidth && (fltSize/10) > 1){ //If the platyer collides with an enemy larger than it, (including the requirement that at least 
        exit();                                              //The program exits
       }                                                   //End of if statement    
        textSize(20);                                      //Making a text size of 20
       text("Level:", 10, 20);                             //Writing "Level:" text at upper left
       fltLevel = fltSize/10;                              //Fltlevel is equal to the size divided by ten
           if (fltSize > 9) {                              //If the size is greater than 10,
             text(fltLevel,65,20);                            //Making the level display on-screen
           }                                                //End of if float distance
                
       return fltSize;                                      //Returning fltsize
  }                                                         //End of float collide

   void display(){                                          //Beginning void display
        text("Hit the smaller squares to grow.", 100,300);
  text("Hit a bigger square and you lose.", 100,400);
        fill(fltWidth*4,0,0);                               //Filling based on size. The larger, the brighter
     rectMode(CORNERS);                                     //Using rectmode corners for programming ease
     rect(fltX,fltY,fltX+fltWidth,fltY-fltWidth);           //Drawing enemies
     fltX = fltX - speedvar;                                //Making the enemies move
     if ((fltX+fltWidth) < -50 ){                                      //If the enemies move off screen,
       fltX = width+fltWidth;                                 //They reset X-wise,
       fltY = random(600);                                    //And reset Y-wise
     }                                                      //End of if statement
   speedvar = speedvar*1.00014;                             //Making speedvar grow as the program goes along. Makes enemies faster.
   fltWidth = fltWidth * 1.00014;                           //Making widthvar grow as the program goes along. Makes enemies bigger.
     }                                                      //End of void display
}                 

class Player {                                                                                          //Making class human
   float fltColor;                                                                                 //Making a color variable
   float fltX;                                                                             //Making an X location variable
   float fltY;                                                                             //Making a Y location variable


  Player(float fltColorCatch, float fltXCatch, float fltYCatch, float fltSizerCatch) { //Defining our human
     fltColor = fltColorCatch;                                                                     //Saying that our color variable is equal to what we defined it as in the above definition of our human
     fltX = fltXCatch;                                                             //Saying that our X location variable is equal to what we defined it as in the above definition of our human
     fltY = fltYCatch;                                                             //Saying that our Y location variable is equal to what we defined it as in the above definition of our human                                                                //Saying that our speed variable is equal to what we defined it as in the above definition of our human

  }    

  
void display(float fltSizer){
  rectMode(CENTER);
  fill(0,fltColor,0);
  rect(mouseX,mouseY,fltSizer,fltSizer);
  if (fltSizer < 11){
    fill(200,0,0);
  }
 if (fltSizer > 600){
    fill(random(0,255),random(0,255),random(0,255));
    textSize(25);
    text("Congratulations, you destroyed everything.",40,200);
    text("Now go outside.",200,400);
 }
  fill(255);
  textSize(15);
 text(fltSizer-10,width/2-10,20);
  fltColor = fltColor * fltSizer*1.05;
}
}                     
