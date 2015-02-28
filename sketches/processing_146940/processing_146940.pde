
PFont f;
String answeroptionAQ1= "Control+Z";
String msgText2 = "Control+B";
String msgText3 = "Control+Shift+>";
String msgText4 = "Control+Y" ;
String question1 = "What keyboard shortcut is used for 'Undo'?";
String msgText5 = "";
String NextQuestion = "" ; 
String msgText7 = "";
String msgText8 = "" ; 
String msgText9 = "";
String msgText10 = ""; 
String msgText11 = ""; 
String msgText12 = "" ;
String msgText13 = ""; 
String msgText14 = "";

int msgX=0;        
int msgY=0;
int y;
int Qno = 1; 
int numChars =26; 

void setup() {
  size(1045,800);
  refreshBackground ();
  background (244, 126,125) ; 
  f = createFont("Teen Light",30,true) ; 
}
void draw() {
  refreshBackground();
  textFont(f);
  text(answeroptionAQ1, 75, 200);
  text(msgText2, 500,200);
  text(msgText3, 75,600);
  text(msgText4, 500,600);
  text(msgText5, 85,225);
  text (NextQuestion, 250, 400) ; 
  text(msgText7, 510, 230) ; 
  text (msgText8, 520, 260) ;
  text (msgText9, 78, 630) ;
  text (msgText10, 80, 655) ;
  text (msgText11, 500, 630) ; 
  text (msgText12, 500, 655) ;  
text (question1, 175,375) ; 
}

void keyPressed() {
  println(keyCode); 
  if (Qno == 1) {
    if ((keyCode >= 65) && (keyCode <= 90)) { 
       answeroptionAQ1= "dfgh";
       msgText2 = "coqs"; 
       msgText3 = "asdf"; 
       msgText4 = "jkl;"; 
       question1 = "What are the guide keys for the right hand?";
       NextQuestion = "" ; 
       msgText5 = "";
       NextQuestion = "" ; 
       msgText7 = "";
       msgText8 = "" ; 
       msgText9 = "";
       msgText10 = ""; 
       msgText11 = ""; 
       msgText12 = "" ;
       msgText13 = ""; 
       msgText14 = "";
       Qno=2;
       println("Question 2");
  if (Qno == 2) { 
    if((keyCode >= 65) && (keyCode <== 90)) {
      
    }}}

void mouseClicked() { 
  if (Qno == 1) { 
  if ( (mouseX<width/2  )   &&  ( mouseY < height/2  )     ) {
       answeroptionAQ1 = "Correct! This shortcut is used " ;
       msgX=50;
       msgY=50;
       //Qno++; 
  }
  if ( (mouseX<width/2  )   &&  ( mouseY < height/2  )     ) {
       msgText5 = "to undo the last action." ; 
  }
   if ( (mouseX<width/2  )   &&  ( mouseY < height/2  )     ) {
      NextQuestion = "Press a key for the next question";
   }
   if ( (mouseX>width/2  )   &&  ( mouseY < height/2  )     ) {
       msgText2 = "Oops. Sorry~! This answer is incorrect." ;
       msgX=width/2+ 50;
       msgY=50;
   }
   if ( (mouseX>width/2  )   &&  ( mouseY < height/2  )     ) {
      msgText7 = "Control+B is used to bold the" ;
   }
   if ( (mouseX>width/2  )   &&  ( mouseY < height/2  )     ) {
     msgText8 = "text selected." ; 
  }
  if ( (mouseX<width/2  )   &&  ( mouseY > height/2  )     ) {
       msgText3 = "Oh no! Wrong answer. This " ; 
       msgX=50;
       msgY=height/2+50;
  }
  if ( (mouseX<width/2  )   &&  ( mouseY > height/2  )     ) {
       msgText9 = "shortcut is to increase the"  ; 
  }
  if ( (mouseX<width/2  )   &&  ( mouseY > height/2  )     ) {
       msgText10 = "font size one value."; 
  }
   if ( (mouseX>width/2  )   &&  ( mouseY > height/2  )     ) {
       msgText4 = "Sorry. Better luck next time!" ; 
       msgX=width/2+50;
       msgY=height/2+50;
  }
   if ((mouseX> width/2) && (mouseY> height/2) ) {
     msgText11 = "Control+Y is used to redo" ; 
   }
   if ((mouseX>width/2) && (mouseY> height/2) ){ 
    msgText12 = "the previous action.";
   } 
  }
  
  

  if (Qno == 2) { 
      if ( (mouseX<width/2  )   &&  ( mouseY < height/2  )     ) {
       answeroptionAQ1 = "That's the wrong answer~! " ;
       msgX=50;
       msgY=50;
       //Qno++; 
  }
   if ( (mouseX>width/2  )   &&  ( mouseY < height/2  )     ) {
       msgText2 = "Oops. Sorry~! This answer is incorrect." ;
       msgX=width/2+ 50;
       msgY=50;
   }
  if ( (mouseX<width/2  )   &&  ( mouseY > height/2  )     ) {
       msgText3 = "Oh no! Wrong answer. This " ; 
       msgX=50;
       msgY=height/2+50;
  }
   if ( (mouseX>width/2  )   &&  ( mouseY > height/2  )     ) {
       msgText4 = "Sorry. Better luck next time!" ; 
       msgX=width/2+50;
       msgY=height/2+50;
  }
 }}
  
void refreshBackground() {
  background (244, 126, 125) ;
  f = createFont("Teen Light",30,true) ; 
}


