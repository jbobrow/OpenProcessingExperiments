
float speedY = 2.5;                    //speed of numbers going down 
float sumX = round (random (550));     //setting where the sum will fall from
float sumY = (20);                     // the height of where the sum will fall from
int number1 = round (random (15));     //first number in the sum rounded so we font get .whatever
int number2 = round (random (15));     //second number in the sum again rounded
int trigger = 0;                       // trigger to stop the number falling off the screen
String answerBox = "";                 // user input for answer
int lives = 5;                         // number of lives given
int score = 0;                         // starting score 
String answerstr = "";                 //varible for storing correct answer
PFont font;                            // font
int state;                             //screen changing code was received from Norman Brand
color[] colors = { 
  color(255), color(0), color(128), color(255,255), color(0, 0)
};


void setup() {
  size(600,600);                       //screensize
                                       // use of none cursive font to make reading onscreen easier
  font = createFont("Tahoma", 24);     //set up for font 
  state=0;
};
 
void draw(){ 
 
  if ( state == 0 ) {

      background(colors[0]);
      
      fill(125,32,56);
      textSize(24);
      text("1. Press the b key to progress to the main game.", width/4, 60,400,100);
      text("2. Enter the answer to the falling sum in the text box then press enter, if you are correct your score will increase. If you are wrong the sum will continue to fall.",width/4,130,400,250);
      text("3. If the sum reaches the bottom of the screen you will lose a life, if you lose all 5 lives the game is over.", width/4, 350,400,150);  
  } 
  
  if (state == 1) {
     mainGame();
  }   
  if(state == 2){
    fill(0);
    rect(600,600,0,0);
    fill(255);
    text("Unlucky, you have lost",width/4,height/2);
  }
};
      
      
      
void speedchange(){
      sumY = sumY+speedY;
};
    
void sumfall() {
            speedchange();
            fill (255);                       // set up for the sum that falls down
            text(number1 + " + " + number2, sumX, sumY);
   
};
    

    
void keyReleased(){                 //this function take in the users keystroke
      if (key != CODED){
        switch(key){
          case BACKSPACE:
         answerBox = answerBox.substring(0,max(0,answerBox.length()-1));
         break;
         case TAB:
         answerBox += "       ";
         break;                              
         case ENTER:
         answerstr = answerBox;
         answerBox = answerBox.substring(0,max(0,answerBox.length()-answerBox.length()));
         case RETURN:
         case ESC:
         case DELETE:
         break;
         default:
         answerBox += key;
        }
      }
}

void keyPressed() {
   if (key == 'b') {
    state =1;
  }
}
      
      
      
void ResetVariables() {               // this function resets falling varibles
        speedY =2.5;                        //speed of numbers going down 
        sumX = round (random (550)); 
        sumY = (20);
        number1 = round (random (15));      //first number in the sum rounded so we font get .whatever
        number2 = round (random (15));      //second number in the sum again rounded
        trigger = 0;                        // trigger to stop the number falling off the screen     
}
      
void mainGame() {
      answerCheck();
      
      if(lives ==0) {
          state = 2;
          speedY = 0;
      };
      
      background(0);                           // text box for user input
      fill(90);
      rect(25,530,150,30);
      fill(255);
      textFont(font, 24);
      text(answerBox+(frameCount/10%2 == 0 ? "_" :""),30, 550);
      text(lives,10,20);
      text(score,550,20);
      
     
      if(sumY > 600) {                        //this code detects the sum at the bottom of the screen and sends another one down
        lives = lives -1;
        trigger = 1;
        ResetVariables();
      };
      
      if(trigger == 0) {
          sumfall();
      };        
}
      

void answerCheck() {  
        int answer = number1+number2;        //this function checks the users answer against the correct answer
        int answer2 = int(answerstr);
        if(answer2 == answer){
          trigger = 1;
          ResetVariables();
          score = score+1;
        }
}
