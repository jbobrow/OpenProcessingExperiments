
//CALL SCANNER that imports three additional packs
import java.util.Scanner; 
import java.applet.Applet; 
import java.awt.Button; 
Scanner input = new Scanner(System.in);
  int rect1X = 150; 
  int rect1Y = 200; 
  int rect2X = 150; 
  int rect2Y = 30; 
  int rectWidth = 300; //width of rectangles 
  int rectHeight = 60;
  boolean rect1Over = false; //boolean that shall be true when the mouse is over this rectangle
  boolean rect2Over = false;
  //set scoreCount and questions 
  int scoreCount = 0; 
  int questions; 
  int [] userAnswer = new int[5]; 
//when submit button is clicked, get scoreCount 
//change background to endpage 
//display scoreCount 
static class Sub56Q { 
    
  void draw() { 
  //set background 
  //PImage backImageFives; 
  //backImageFives = loadImage("5-6image.jpg"); 
  //background(backImageFives); 
  } 
  
  void setup() { 
          //set compAnswers 
              int [] compAnswers = new int[5]; 
                  compAnswers[0] = 2; 
                  compAnswers[1] = 20; 
                  compAnswers[2] = 18; 
                  compAnswers[3] = 18; 
                  compAnswers[4] = 13; 
          //create userAnswers array 
               int [] userAnswer = new int[5]; 
          //set scoreCount and questions (for loop) int scoreCount; 
               int questions; 
               int scoreCount;
          //validate answers 
           // set initial value 
                scoreCount = 0; 
                      for (questions = 0; questions < 5;) { 
                             //get the user's answer 
                                  userAnswer[questions] = input.nextInt(); 
                             //text box for users answer 
                                      if (userAnswer[questions] == compAnswers[questions]) { 
                                          //put tick next to answer 
                                          //add one to score 
                                          scoreCount = scoreCount + 1; 
                                      } else if (userAnswer[questions] != compAnswers[questions]) { 
                                          //put cross next to answer 
                                      } 
                             //go to next question 
                                      questions++ ; 
                        } 
  } 
  //when submit button is clicked, get scoreCount 
  //change background to endpage 
  //display scoreCount
}

static class Sub78Q { 
                void draw() { 
                          PImage backImageSevens; 
                          backImageSevens = loadImage("7-8image.jpg"); 
                          background(backImageSevens); 
                          function(); 
                } 
  
                void setup() { 
                          //set compAnswers 
                              int [] compAnswers = new int[5]; 
                                     compAnswers[0] = 4; 
                                     compAnswers[1] = 12; 
                                     compAnswers[2] = 36; 
                                     compAnswers[3] = 55; 
                                     compAnswers[4] = 42; 
  
                          /* introduce variables that are needed for the front page*/ 
                                /*int rect1X, rect1Y; //Position of first button 
                                  int rect2X, rect2Y; //Position of second button */
                                  int rectWidth = 300; //width of rectangles 
                                  int rectHeight = 60; //height of rectagles 
                                  boolean rect1Over = false; //boolean that shall be true when the mouse is over this rectangle
                                  boolean rect2Over = false; 
  
                           //setup function for the general design 
 
                                size( 600, 600); //setting the window size 
                                background(255, 249, 44); //changing background color 
                                fill(255); //changing fill color to white 
                                rect(100, 100, 400, 300); //drawing a big white rectangle 
                                fill(14, 100, 28); //changing fill color to a dark green 
                                
                           //defining variables needed for the rectangles 
                                int rect1X = 150; 
                                int rect1Y = 200; 
                                int rect2X = 150; 
                                int rect2Y = 30; 
  
                           //drawing two rectangles using the defined variables 
                                rect(rect1X, rect1Y, rectWidth, rectHeight); 
                                rect(rect2X, rect2Y, rectWidth, rectHeight); 
                                fill(0); //changing fill color to black 
                                PFont font; //changing the font 
                                font = loadFont("AngsanaUPC-Italic-32.vlw"); 
                                textFont(font, 50); text("Math`e`Game", 200, 150); //first text part -> Name of the Game 
                                textSize(40); //changing textsize 
                                text("Age 5-6", 240, 245); //text defining two different age groups 
                                text("Age 7-8", 240, 345); 
                } 
                //draw function that is used to call function
                /*function that is testing whether the mouse is over one of the rectangles or not*/
                void function() {
                        //if calls the boolean overRect1 and looks whether it is fulfilled, if it is....
                        if (overRect1(rect1X, rect1Y, rectWidth, rectHeight) )  {
                                rect1Over = true;                          //is sets rect1Over true
                                rect2Over = false;                         //and rect1Over false
    
                        //else if does the same for overRect2, if fulfilled....  
                        } else if (overRect2(rect2X, rect2Y, rectWidth, rectHeight) ) {
                                 rect1Over = false;                         //rect1OVer is false
                                 rect2Over = true;                          //and rect2Over is true
                        //if none of the booleans is true...  
                        } else {
                        //both are false
                                 rect1Over = rect2Over = false;
                        }
                }
                void mousePressed() {
                        //if the condition rect1Over is fulfilled the button1 function is called
                        if (rect1Over ==true) {
                                Sub56Q.draw();
                                Sub78Q.setup();
                        }
                        //if the condition rect2Over is fulfilled the button2 function is called
                        if (rect2Over ==true) {
                                Sub78Q.draw();
                                Sub78Q.setup();
                        }
  
               }
                        //boolean that should check whether the mouse-cursor is over the first button
                        boolean overRect1(int x, int y, int width, int height) {
                                if (mouseX >= x && mouseX <= x+width &&   //checks whether the x and y coordinate of the mouse at the moment are inside the rectangle
                                     mouseY >= y && mouseY <= y+height) {
                                     return true;      //if inside the rectangle return true
                                } else { 
                                     return false;     //else false 
                                }
                        }
                        //boolean that should check whether the mouse-cursor is over the second button
                        boolean overRect2(int x, int y, int width, int height) {
                                 if (mouseX >= x && mouseX <= x+width &&   //checks whether the x and y coordinate of the mouse at the moment are inside the rectangle
                                      mouseY >= y && mouseY <= y+height) {
                                      return true;      //if inseide return true
                                  } else { 
                                      return false;     //else false
                                  }
                         }
}

/*void bool() {
            //boolean that should check whether the mouse-cursor is over the first button
                  boolean overRect1(int x, int y, int width, int height) {
                          if (mouseX >= x && mouseX <= x+width &&   //checks whether the x and y coordinate of the mouse at the moment are inside the rectangle
                                     mouseY >= y && mouseY <= y+height) {
                                     return true;      //if inside the rectangle return true
                          } else { 
                                     return false;     //else false 
                          }
                  }
            //boolean that should check whether the mouse-cursor is over the second button
                  boolean overRect2(int x, int y, int width, int height) {
                           if (mouseX >= x && mouseX <= x+width &&   //checks whether the x and y coordinate of the mouse at the moment are inside the rectangle
                                      mouseY >= y && mouseY <= y+height) {
                                      return true;      //if inseide return true
                            } else { 
                                      return false;     //else false
                            }
                   }
}*/
class Answers {
  //validate answers 
  // scoreCount = 0; 
  void setup() {
  for (questions = 0; questions < 5;) { 
    //get the user's answer 
    userAnswer[questions] = input.nextInt(); 
    //text box for users answer 
    if (userAnswer[questions] == compAnswers[questions]) { 
    //put tick next to answer 
    //add one to score 
      scoreCount = scoreCount + 1; 
    } else if (userAnswer[questions] != compAnswers[questions]) { 
    //put cross next to answer 
  } 
  questions++ ; 
}
  }
}
