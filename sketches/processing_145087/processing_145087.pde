
int currentPage = 0;      // 0 means the start page
PImage startPage;         //Datatype for storing the startpage
PImage levelOne;          //Datatype for storing level one image
PImage infoButton;        //Datatype for storing the info button  
PImage backButton;        //Datatype for storing the back button
PImage flies;             //Datatype for stroing the flies
PImage frog;              //Datatype for storing the frogs 
PImage gameover;
float xf1= 0;            //random coordinates for xf1
float yf1= 0;            //random coordinates for yf1
float xf2= 120;          //random coordinates for xf2
float yf2= 300;          //random coordinates for yf2
float xf3= 130;          //random coordinates for xf3
float yf3= 180;          //random coordinates for yf3
float xf4= 0;            //random coordinates for xf4
float yf4= 110;          //random coordinates for yf4
float fx1= 450;          //random coordinates for fx1
float fy1= 10;          //random coordinates for fy1
float fx2 =450;          //random coordinates for fx2
float fy2 =300;          //random coordinates for fy2
float fx3 =450;          //random coordinates for fx3
float fy3 =170;          //random coordinates for fy3
float fx4 =450;          //random coordinates for fx4
float fy4 =110;           //random coordinates for fy4
PFont letters;            //Font
boolean showInfoButton = true;  //holds the true and false value of info button  
boolean showbackButton = true;  //holds the true or false value of back button
boolean showfrog1 = true;       //holds the true or false value of frog one
boolean showfrog2 = true;       //holds the true or false value of frog two
boolean showfrog3 = true;       //holds the true or false value of frog three
boolean showfrog4 = true;       //holds the true or false value of frog four
boolean showfly1 = true;       //holds the true or false value of fly one
boolean showfly2 = true;
boolean showfly3 = true;
boolean showfly4  = true;
boolean gameoverB = false;
color c;                        //Datatype for storing color values


void setup () {
      size (650, 392);      //size of canvas 
      startPage  = loadImage ("frog_startpage.jpg");  //startpage 
      levelOne= loadImage ("lil_pad.jpg");            //level one background
      infoButton = loadImage ("info-button.png");     //info button
      backButton = loadImage ("back_button.png");     //back button 
      flies = loadImage ("flies.png");                //fly
      frog = loadImage ("frog.gif");                  //frog
      gameover = loadImage ("game_over.jpg");
     
      
}

void draw() {
        image (startPage,0,0);     //Displays images to the screen
        loadPixels();              //Loads the pixel data 
        updatePixels();            //Updates the display window with the data 

     
         if(currentPage == 0){        // statement start page  
           drawstartPage();           // draws start page
 }
     else if (gameoverB == true) {
        drawgameoverPage();      //draws game over page
     }
       
        else if(currentPage == 1){   // statement for level one
           drawLevelOne();           // draws level one
           drawbackButton ();        // draws back button
 }  
        else if(currentPage == 2){    // statement for info page
           drawInfopage();            // draws info page
           drawbackButton ();         // draw back button
 }
     
         
  
        if(showInfoButton == true){   // statement to show info button
         drawInfoButton();            // draws info buton
 }

}
  
void drawstartPage (){
      image(startPage, 0,0);         //Displays start page
      drawStartButton();

}  

void drawStartButton(){
      fill(0, 255, 0);            //green
      rect(235, 238, 150, 50);    //draw start button
      fill(0);                    //Black text
      text("Start!", 290, 270);   // text
}
    
void drawLevelOne(){
      image(levelOne, 0, 0);       // Displays the image for level one
 
     if(showfly1 == true) {  
           image(flies, fx1, fy1);       //Displays the image of frog #1
     }
     if(showfly2 == true) {  
         image(flies, fx2, fy2);       //Displays the image of frog #1
     }
     
     if(showfly3 == true) {  
          image(flies, fx3, fy3);       //Displays the image of frog #1
     }
     
     if(showfly4 == true) {  
         image(flies, fx4, fy4);       //Displays the image of frog #1
     }
 
 
     if(showfrog1 == true) {  
          image(frog, xf1, yf1);       //Displays the image of frog #1
     }
     if(showfrog2 == true) { 
          image(frog, xf2, yf2);       //Displays the image of frog #2
     }
     if(showfrog3 == true) { 
          image(frog, xf3, yf3);       //Displays the image of frog #3 
     }
     if(showfrog4 == true) { 
          image(frog, xf4, yf4);       //Displays the image of frog #4
     }
      xf1 = xf1 + 4;               //Makes frog 1 move by a speed of 2
      xf1 = min(xf1,400);
      xf2 = xf2 + 3.9;              //Makes frog 2 move by a speed of 1.9
      xf2= min(xf2,400);
      xf3 = xf3 + 3;              //Makes frog 3 move by a speed of 1
      xf3= min(xf3,400);
      xf4 = xf4 + 2.9;              //Makes frog 4 move by a speed of .9
      xf4= min(xf4,400);
      
}

void drawgameoverPage () {
      image (gameover,0, 0 );      // display the game oover page
    
}

void drawInfoButton(){
      image(infoButton, 508, 260);  // display the info button
}

void drawbackButton (){
     image (backButton, 0, 255);    // displays the back button
  
}
void drawInfopage() {
     background(255);              // white background
     letters = loadFont("LucidaSans-20.vlw");  // font size
     textFont(letters);      // text font
     text("INFORMATION PAGE", 205, 30);  // write info page title
     text("HOW TO PLAY:", 10, 75);       //How to play
     text("1. Click or tap the frogs to pop them before they get to the flies.", 30, 110);  //step one in playing the game
     text("2. Avoid letting the frogs get to the flies.", 60, 150);   //step two in playing the game
     text("3. If that happens then you will lose the game", 90, 190); //step three in playing the game
     text("4. Let the flies live free.",120, 230); //step four in playing the game
     text("5. Have fun and enjoy!",150, 270);  //step five in playing the game
    
}


void mousePressed(){
     if(currentPage == 0 && mouseX > 230 && mouseX < 380 && mouseY > 240 && mouseY < 290){  // statement for start button
          currentPage = 1;          // go to page one
          xf1= 0;           //random coordinates for xf1 yf1= 0;      
          yf1= 0;           //random coordinates for yf1
          xf2= 120;         //random coordinates for xf2
          yf2= 300;         //random coordinates for yf2
          xf3= 130;         //random coordinates for xf3
          yf3= 180;         //random coordinates for yf3
          xf4= 0;           //random coordinates for xf4
          yf4= 110;         //random coordinates for xf4
          showfrog1 = true;
          showfrog2 = true;
          showfrog3 = true;
          showfrog4 = true; 
}
    if(mouseX > 508 && mouseX < 650 && mouseY > 260 && mouseY < 393) {                     // statement for info button
        currentPage = 2;            //go to info page
    }
     if (mouseX > 0 && mouseX < 150 && mouseY > 255 && mouseY < 405) {                    // statement fot back buttton
           currentPage = currentPage - 2;   // goes back to previous page 
          
     }
    if (Math.abs( xf1 - fx1)< 75 && Math.abs (yf1 - fy1) < 75 ) {
        showfly1 = false; 
        gameoverB = true;
    }
    
    if (Math.abs( xf2 - fx2)< 75 && Math.abs (yf2 - fy2) < 75 ) {
        showfly2 = false; 
        gameoverB = true;
    }
    
    if (Math.abs( xf3 - fx3)< 75 && Math.abs (yf3 - fy3) < 75 ) {
        showfly3 = false; 
        gameoverB = true;
    }
    
    if (Math.abs( xf4 - fx4)< 75 && Math.abs (yf4 - fy4) < 75 ) {
        showfly4 = false; 
        gameoverB = true;
    }
    
    if (Math.abs(mouseX - xf1)< 75 && Math.abs (mouseY- yf1) < 75) {
        showfrog1 = false;  
    }
   if (Math.abs(mouseX - xf2)< 75 && Math.abs (mouseY- yf2) < 75) {
        showfrog2 = false;  
   }
   if (Math.abs(mouseX - xf3)< 75 && Math.abs (mouseY- yf3) < 75) {
        showfrog3 = false;  
   }
   if (Math.abs(mouseX - xf4)< 75 && Math.abs (mouseY- yf4) < 75) {
        showfrog4 = false;  
   }
} 

