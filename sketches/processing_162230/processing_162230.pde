
/*
Objective: 

The objective of this assignment is to create an interactive sketch in Processing. This sketch 
will run in active mode and receive input from both the mouse and keyboard. Artistically, you’re 
goal is to create a canvas which remains blank until the user begins interacting with it. 
Additionally, your sketch should be capable of capturing the canvas and saving it as an image 
file. You will also write an artistic description to accompany your sketch. As with your previous 
assignments, your peers will be reviewing your work and reading your artistic description.

You’ve been given the fundamental tools to create highly interactive canvases capable of producing 
unique images based on the user’s input. In this assignment, you must produce an original sketch 
utilizing the following:

•Keyboard Input
•Mouse Input
•Screenshot Saving Capability
•A blank canvas until it receives user input, and a static canvas after input completes.

The window size for your sketch must be no smaller than 800x600 and no larger than 1280x720. 
Lastly, as with last previous assignments, you must include a 2 sentence (minimum) description 
of your artistic intent/goal for your assignment. Place this at the top of your sketch as a 
comment. Make sure to make line breaks appropriate so that your description is readable for 
your peers. 

Submission:

Upon completion of the assignment, you must select Edit->Select All, AND Edit->Copy in Processing 
to store your assignment in the operating system clipboard. Then, load the assignment submission 
page on coursera and paste (Win:CTRL+V, Mac: CMD+V) the contents of your assignment (including 
your artistic description in the comments). You must submit your work before the deadline in order 
to be eligible for peer review. 

Grading:
As in previous assignments, grading will be completed by your peers in a two stage assessment. 
The first layer of assessment includes your completed assignment being reviewed by 3 of your 
peers. The second layer of assessment is the scoring the peer reviews given to you, by 3 
additional people. These collected reviews will be tallied and will form your grade for this 
assignment. This two stage process, a critique of your work, and a critique of the critiques 
of your work, form the basis of how this assignment will be graded. The following is a rubric 
for earning points on this assignment.

Assignment runs without errors.
Assignment implements Keyboard Input.
Assignment implements  Mouse Input.
Assignment implements image saving.
Assignment remains blank until it receives user input.
*/


/************************************************************************************************
                A R T I S T I C   D E S C R I P T I O N
In this sketch I am continuing my theme of 'the face' giving the user the opportunity to create a 
face of their own and save it as an image file at any stage through the creation. The user will 
be led step-by-step through the process until they have finished their creation. (Unlike an 
avatar, there will be no body or clothes, just a face!) At each stage the user will have choices 
to make within the predefined functions of the sketch. As a final step the face is backed by a 
crowd of random faces representing the population of the world.

Written by David Leslie Williams
************************************************************************************************/

/************************************************************************************************
                          I N S T R U C T I O N S
The screen is blank to start with in line with the assignment requirements. TO START, JUST CLICK 
THE MOUSE ANYWHERE ON THE SKETCH. 
Select the background colour from the set displayed by mouse clicking on the colour you prefer. 
You will then be presented with a partial head allowing you to select the skin colours for the 
head and two ears independently. When satisfied click in the area to signify completion. 
The face will then be shown with your skin colour selections together with the nose, frown lines, 
and eyes. 
You will be able to select the colours for the eyeballs, irises and pupils independantly from 
palettes using mouse clicks. Once you have completed the selections for the eyes, click the area 
signifying completion. 
The next choice will be to select the eyebrows. There are two aspects to these, firstly selecting 
the colours from a palette using the mouse, and secondly using keys 1-6, with and without Shift 
to set the thickness of each eyebrow. 
The lip gloss is the next task, again choosing from a palette using the mouse. 
Last you will decide if you want to have hair and if so how much and how long together with choice 
of hair colour. (A slight bit of my humour appears at this point).
As soon as the face is complete a crowd of random faces is generated with yours positioned to the 
fore. With the title "Your face stands out from the crowd."
Congratulations your face design is complete and you can press 'S' or 's' to save a copy. In fact 
you can do this at any point during your design, and multiple images can be stored.  
(NOTE: YOU MUST HAVE SAVED THE PROGRAM FIRST SO YOU KNOW WHERE IT WILL SAVE THE IMAGES.)
If you want to go back and change aspects you can reset the design back to the start keeping the 
values you have chosen by pressing BACKSPACE or reset the design back to the default settings by 
pressing DELETE.

I hope you enjoy and find this instructive.
************************************************************************************************/
//Global Variables
color[] backdrop = {#397F3B, #32F70C, #6FA775, #ADEDB7, #8DD440};                   // setup a palette for background
color[] skin = {#FCD4C4, #C9A292, #4F3E25, #FFCDB8, #E8B56C, #82653C};              // setup a palette for skin
color[] eyebrowHairColor = {#000000, #371B08, #915915, #82083C, #A29D9D, #FFFFFF};  //setup palettes for eyeball, iris, pupil and eyebrows
color[] eyeBallColor = {#FCF7F5, #DEC9C9, #D6ECF7, #F4D6F7, #FFC5FF, #FFFBCF};
color[] eyeIrisColor = {#5BADC9, #597E62, #4F462E, #163EBF, #3B7F20, #4F421F};
color[] eyePupilColor = {#000000, #6C6927, #362504, #6B6B6B, #43437C, #442545};
color[] lipsColor = {#FF0000, #991411, #EB7207, #47092D, #592F40, #E12FD3};         //setup palette for lips
String myTextMessage;
String myTitle = "Your face stands out from the crowd";
String[] myTextArray = {"Face", "Left Ear", "Right Ear"};
String[] myTextArray2 = {"Right Eyeball", "Left Eyeball", "Right Iris", "left Iris", "Right Pupil", "Left Pupil"};
String[] myTextArray3 = { "Click here if finished on Skin Color", 
                          "Click here if finished on Eye Colors", 
                          "Click here if finished on Eyebrow Color and Sizes", 
                          "Click here if finished on lip Color", 
                          "Click here if finished on hair Color and Style", 
                          "Click here to join the crowd and finalise the sketch."};
int backgroundColor = 0;
int rightEar = 0;
int leftEar  = 0;
int head     = 0;
int rightEyeBall = 0;
int rightIris = 0;
int rightPupil = 0;
int leftEyeBall = 0;
int leftIris = 0;
int leftPupil = 0;
int leftEyebrowColor = 0;
int rightEyebrowColor = 0;
int leftEyebrowThickness = 12;
int rightEyebrowThickness = 12;
int lipColor = 0;
int lipThickness = 14;
int hairColor = 0;
int hairAmount = 6;
int hairLength = 10;
boolean selectingBackground = false;
boolean backgroundSet = false;
boolean sorSPressed = false;
boolean selectingSkin = false;
boolean headSet = false;
boolean selectingEyes = false;
boolean eyesSet = false;
boolean selectingEyebrows = false;
boolean eyebrowsSet = false;
boolean selectingLips = false;
boolean lipsSet = false;
boolean selectingHair = false;
boolean hairSet = false;
boolean selectingTear = false;
boolean tearSet = false;
boolean awatingStart = true;
boolean faceComplete = false;
boolean crowdDrawn = false;

//*************************** setup  ****************************************************************
void setup(){
  size(1260,720);
  colorMode(HSB,360,100,100,100);
  noFill();
}


//*************************** draw ******************************************************************
void draw(){
  if (!awatingStart) {
    if (faceComplete && !crowdDrawn) {  //Lastly when the face design is complete at the crowd.
      drawCrowd();
      textSize(25);      // Add the title to the sketch
      fill(#ffffff);
      rect((width/2)-(textWidth(myTitle))/2-5, height-40,10+textWidth(myTitle), 35);
      fill(backdrop[int(random(5))]);   //randomly change the text colour from the greens in the backdrop palette
      text(myTitle, (width-textWidth(myTitle))/2, height-13);
      crowdDrawn = true;               //set crowdDrawn to true so it is only drawn once
    }
    if (!backgroundSet){               //First select a background and lock that in.
      backgroundSelectColor();
    } else if (backgroundSet && !faceComplete){
      background(backdrop[backgroundColor]);
    }
    if (!headSet && backgroundSet){    //Second select the skin colours for ears and face and lock them in
      drawHead();
      chooseSkinType();
    } else if (headSet && backgroundSet){
      drawHead();      
    }
    if (!eyesSet && headSet && backgroundSet){    //Third select the colours for the eyes and lock them in
      drawEyes();
      chooseEyeColors();
    } else if (eyesSet && headSet && backgroundSet){
      drawEyes();
    }
    if (!eyebrowsSet && eyesSet && headSet && backgroundSet){    //Fourth select the eyebrows and lock them in
      drawEyebrows();
      selectEyebrows();
    } else if (eyebrowsSet && eyesSet && headSet && backgroundSet){
      drawEyebrows();
    }
   if (!lipsSet && eyebrowsSet && eyesSet && headSet && backgroundSet){    //Fifth select lip colour and lock them in
     drawMouth();
     selectMouth();
   } else if (lipsSet && eyebrowsSet && eyesSet && headSet && backgroundSet) {
     drawMouth();
   }
   if (!hairSet && lipsSet && eyebrowsSet && eyesSet && headSet && backgroundSet) {  //Sixth select hair and lock in
     drawHair();
     selectHair();
   } else if (hairSet && lipsSet && eyebrowsSet && eyesSet && headSet && backgroundSet) {
     drawHair();
   }
   if (!tearSet && hairSet && lipsSet && eyebrowsSet && eyesSet && headSet && backgroundSet) {  //Seventh accept tear
     drawTear();
     drawTearMessage();
   } else if (tearSet && hairSet && lipsSet && eyebrowsSet && eyesSet && headSet && backgroundSet) {
     drawTear();
     faceComplete = true;
   }
   if (!faceComplete && backgroundSet){
     showMessageSave();
   }  
  }
}
//******************************** Key Pressed ********************************************************************
void keyPressed(){
  if (key == 's' || key == 'S'){
    sorSPressed = true;
  }  
}
//******************************** Key Released ********************************************************************
void keyReleased(){
  if (key == BACKSPACE || key == DELETE) {  //clear all booleans back to start
    selectingBackground = false;
    backgroundSet = false;
    selectingSkin = false;
    headSet = false;
    selectingEyes = false;
    eyesSet = false;
    selectingEyebrows = false;
    eyebrowsSet = false;
    selectingLips = false;
    lipsSet = false;
    selectingHair = false;
    hairSet = false;
    selectingTear = false;
    tearSet = false;
    //awatingStart = true; this would take it back to blank screen
    faceComplete = false;
    crowdDrawn = false;
  }
  if (key == DELETE) {  //clear face parameters back to default
    backgroundColor = 0;
    rightEar = 0;
    leftEar  = 0;
    head     = 0;
    rightEyeBall = 0;
    rightIris = 0;
    rightPupil = 0;
    leftEyeBall = 0;
    leftIris = 0;
    leftPupil = 0;
    leftEyebrowColor = 0;
    rightEyebrowColor = 0;
    leftEyebrowThickness = 12;
    rightEyebrowThickness = 12;
    lipColor = 0;
    lipThickness =14;
    hairColor = 0;
    hairAmount = 6;
    hairLength = 10;
  }
  if (key == 's' || key == 'S'){
    String fileName = "Face-"+day()+"-"+hour()+"-"+minute()+"-"+second()+".png";
    saveFrame(fileName);
    sorSPressed = false;
  }
  if (selectingEyebrows){
    if (key == '1') leftEyebrowThickness = 12;
    if (key == '2') leftEyebrowThickness = 14;
    if (key == '3') leftEyebrowThickness = 16;
    if (key == '4') leftEyebrowThickness = 18;
    if (key == '5') leftEyebrowThickness = 20;
    if (key == '6') leftEyebrowThickness = 22;
    if (key == '!') rightEyebrowThickness = 12;
    if (key == '"') rightEyebrowThickness = 14;
    if (key == '£') rightEyebrowThickness = 16;
    if (key == '$') rightEyebrowThickness = 18;
    if (key == '%') rightEyebrowThickness = 20;
    if (key == '^') rightEyebrowThickness = 22;
  }
  if (selectingLips){
    if (key == '1') lipThickness = 14;
    if (key == '2') lipThickness = 16;
    if (key == '3') lipThickness = 18;
    if (key == '4') lipThickness = 20;
    if (key == '5') lipThickness = 22;
    if (key == '6') lipThickness = 24;
  }
  if (selectingHair){
    if (key == '1') hairAmount = 1;
    if (key == '2') hairAmount = 2;
    if (key == '3') hairAmount = 3;
    if (key == '4') hairAmount = 4;
    if (key == '5') hairAmount = 5;
    if (key == '6') hairAmount = 6;
    if (key == '0') hairAmount = 0;
    if (key == '<') {
      if (hairLength >= 10) hairLength = hairLength - 5;
    }
    if (key == '>') {
      if (hairLength < 100) hairLength = hairLength + 5;
    }   
  }
}
//******************************** Mouse Released ******************************************************************
void mouseReleased() {
  if (awatingStart) {              //use mouse to start the sketch
    awatingStart = false;
  }
  if (selectingBackground) {      //use mouse to select background
    backgroundColor = (int)(mouseX/(width/5));
    selectingBackground = false;
    backgroundSet = true;
  }
  if (selectingSkin){              //use mouse to select skin colour
    if (mouseX > (3 * width / 4) && mouseX < (3 * width / 4 + 300) && mouseY > 0 && mouseY < 150){
      int pointerX = (int)((mouseX - (3 * width / 4)) / 50);
      int pointerY = (int)(mouseY / 50);
      if (pointerY == 0){
        head = pointerX;
      } else if (pointerY == 1){
        leftEar = pointerX;
      } else if (pointerY == 2){
        rightEar = pointerX;
      }
    }
    mouseDoneClicked();
  }
  if (selectingEyes){                // use mouse to select eye colours
    if (mouseX > (3 * width / 4) && mouseX < (3 * width / 4 + 300) && mouseY > 0 && mouseY < 300){
      int pointerX = (int)((mouseX - (3 * width / 4)) / 50);
      int pointerY = (int)(mouseY / 50);
      if (pointerY == 0){
        rightEyeBall = pointerX;
      } else if (pointerY == 1){
        leftEyeBall = pointerX;
      } else if (pointerY == 2){
        rightIris = pointerX;
      } else if (pointerY == 3){
        leftIris = pointerX;
      } else if (pointerY == 4){
        rightPupil = pointerX;
      } else if (pointerY == 5){
        leftPupil = pointerX;
      }
    }
    mouseDoneClicked(); 
  }
  if (selectingEyebrows){              // use mouse to select eyebow colours
    if (mouseX > (3 * width / 4) && mouseX < (3 * width / 4 + 300) && mouseY > 0 && mouseY < 100){
      int pointerX = (int)((mouseX - (3 * width / 4)) / 50);
      int pointerY = (int)(mouseY / 50);
      if (pointerY == 0){
        rightEyebrowColor = pointerX;
      } else if (pointerY == 1){
        leftEyebrowColor = pointerX;
      }
    }
    mouseDoneClicked();   
  }
  if (selectingLips){                  //use mouse to select lip colour
    if (mouseX > (3 * width / 4) && mouseX < (3 * width / 4 + 300) && mouseY > 0 && mouseY < 50){
       lipColor = (int)((mouseX - (3 * width / 4)) / 50);
    }
    mouseDoneClicked();   
  }
  if (selectingHair){                  //use mouse to select hair colour
    if (mouseX > (3 * width / 4) && mouseX < (3 * width / 4 + 300) && mouseY > 0 && mouseY < 50){
       hairColor = (int)((mouseX - (3 * width / 4)) / 50);
    }
    mouseDoneClicked();   
  }
  if (selectingTear){                  //use mouse to accept tear and move to crowd
    mouseDoneClicked();   
  }
}
//******************************** Mouse Released on setting complete *****************************************************
void mouseDoneClicked(){
    if (mouseX > 20 && mouseX < 650 && mouseY > height-90  && mouseY < height-40){
      if (!headSet && selectingSkin) {            // use mouse to lock skin colours chosen
        selectingSkin = false;
        headSet = true;
      }  
      if (!eyesSet && selectingEyes) {            // use mouse to lock eye colours chosen
        selectingEyes = false;
        eyesSet = true;
      }
      if (!eyebrowsSet && selectingEyebrows) {    // use mouse to lock eyebrow colours & settings chosen
        selectingEyebrows = false;
        eyebrowsSet = true;   
      }  
      if (!lipsSet && selectingLips) {            // use mouse to lock lip colour chosen
        selectingLips = false;
        lipsSet = true;   
      }  
      if (!hairSet  && selectingHair) {          // use mouse to lock hair colour & settings chosen
        selectingHair = false;
        hairSet = true;   
      }
      if (!tearSet  && selectingTear) {          // use mouse to accept tear and move to the crowd
        selectingTear = false;
        tearSet = true;   
      }
    }
}
//**************** Done button for locking in the stage of design when complete ***************************************
void doneButton(int messageNumber){
  //done button for locking in the stage of design when complete.
  if (!sorSPressed){
    fill(0);
    rect(20, height - 90, 650, 50);
    fill(255);
    textSize(25);
    myTextMessage = myTextArray3[messageNumber];
    text(myTextMessage, 25, height-60);
  }
}
//**************** Select Background colour **********************************************
void backgroundSelectColor(){
  for (int i = 0; i < 5; i++){      //draw 5 boxes (columns) in 5 colours then allow user to select
    noStroke();
    fill(backdrop[i]);
    rect(i*width/5, 0, width/5 , height);
    fill(360);
    textSize(50);
    myTextMessage = "Mouse click on a color to select your background";
    text(myTextMessage, (width-textWidth(myTextMessage))/2, height/2);
  }
  selectingBackground = true;
}
//**************** Show Message how to save **********************************************
void showMessageSave(){
  if (!sorSPressed){
    fill(0,0,0);
    textSize(25);
    myTextMessage = "Press 'S' or 's' to save a screen image";
    text(myTextMessage, width - textWidth(myTextMessage)-10, height-70);
    myTextMessage = "Backspace to restart (keep your choices)";
    text(myTextMessage, width - textWidth(myTextMessage)-10, height-40);
    myTextMessage = "Delete to restart (to default choices)";
    text(myTextMessage, width - textWidth(myTextMessage)-10, height-10);
  }
}
//**************** Draw the HEAD and EARS **********************************************
void drawHead(){  
  //stroke(#FFFFFF);  //white stroke round ears
  //strokeWeight(1);
  noStroke();
  fill(skin[rightEar]);  //right ear
  ellipse(width/2+200,height/3+50,100,150);
  fill(skin[leftEar]);  //left ear
  ellipse(width/2-200,height/3+50,100,150);
  if (headSet) {   //shade inside of ears once colours set
    noStroke();
    fill(#333007, 10);
    ellipse(width/2+200,height/3+50,70,105);
    ellipse(width/2-200,height/3+50,70,105);
  }
  noStroke();
  fill(skin[head]);  //Head
  ellipse(width/2,height/2,400,500);
  if (headSet){  //Once colours set then display the nose, frown & cheeks as well
    fill(#EB404F, 10); // triangle for nose, fill fairly transparent
    stroke(#814D38);
    strokeWeight(1);
    triangle(width/2, height/3, width/2-50, 2*height/3-50, width/2+50, 2*height/3-50);
    stroke(0);    //two black ellipses for nostrils
    strokeWeight(1);
    fill(0);
    ellipse(width/2-25,2*height/3-60,15.5,20.5);
    ellipse(width/2+25,2*height/3-60,15.5,20.5);
    stroke(#482C1D);  //Frown lines
    strokeWeight(1);
    line(width/2-50,height/4-20,width/2+50,height/4-20);
    line(width/2-70,height/4,width/2+70,height/4);
    line(width/2-90,height/4+20,width/2+90,height/4+20);
    noStroke();    //two ellipses for cheeks
    fill(#EB404F, 10); // fill fairly transparent
    ellipse(width/2-110,height/2+20,80,80);
    ellipse(width/2+110,height/2+20,80,80);
  }
}
//**************** Choose colours for the HEAD and EARS **********************************************
void chooseSkinType(){   
  for (int i = 0; i < 6; i++){      //show a palette grid of skin colours
    for (int j = 0; j < 3; j++){
      stroke(0);
      strokeWeight(1);
      fill(skin[i]);
      rect (3*width/4 + i * 50, 0 + j * 50, 50, 50);
      fill(360);          //Add descriptions to lines of palette
      textSize(25);
      myTextMessage = myTextArray[j];
      text(myTextMessage, ((3 * width / 4)-5-textWidth(myTextMessage)), 40 + j * 50);
    }
  }
  doneButton(0);      //set up button for completion
  selectingSkin = true;
}
//************************ Draw the Eyes **********************************************
void drawEyes(){
  stroke(#814D38);  //two ellipses for eyeballs
  strokeWeight(1);
  fill(eyeBallColor[leftEyeBall]);
  ellipse(width/2-110,height/3+50,100,50);
  fill(eyeBallColor[rightEyeBall]);
  ellipse(width/2+110,height/3+50,100,50);
  noStroke();      //two circles for Irises
  fill(eyeIrisColor[leftIris]);
  ellipse(width/2-110,height/3+50,40,40);
  fill(eyeIrisColor[rightIris]);
  ellipse(width/2+110,height/3+50,40,40);
  fill(eyePupilColor[leftPupil]);  //two circles for the Pupils
  ellipse(width/2-110,height/3+50,20,20);
  fill(eyePupilColor[rightPupil]);
  ellipse(width/2+110,height/3+50,20,20);
}
//************************ Choose the colours for the Eyes ************************************
void chooseEyeColors(){
  stroke(0);
  strokeWeight(1);
  textSize(25);
  for (int i = 0; i < 6; i++){      //six colours in each palette
    for (int j = 0; j < 2; j++){    //the left and right eyeballs palettes
      fill(eyeBallColor[i]);
      rect (3*width/4 + i * 50, 0 + j * 50, 50, 50);
      fill(360);
      myTextMessage = myTextArray2[j];
      text(myTextMessage, ((3 * width / 4)-5-textWidth(myTextMessage)), 40 + j * 50);
    }
    for (int j = 2; j < 4; j++){    //the left and right Iris palettes
      fill(eyeIrisColor[i]);
      rect (3*width/4 + i * 50, 0 + j * 50, 50, 50);
      fill(360);
      myTextMessage = myTextArray2[j];
      text(myTextMessage, ((3 * width / 4)-5-textWidth(myTextMessage)), 40 + j * 50);
    }
    for (int j = 4; j < 6; j++){    //the left and right Pupils palettes
      fill(eyePupilColor[i]);
      rect (3*width/4 + i * 50, 0 + j * 50, 50, 50);
      fill(360);
      myTextMessage = myTextArray2[j];
      text(myTextMessage, ((3 * width / 4)-5-textWidth(myTextMessage)), 40 + j * 50);
    }
  }
  doneButton(1);      //set up button for completion
  selectingEyes = true;  
}
//************************ Draw the Eyebrows **********************************************
void drawEyebrows(){
  stroke(eyebrowHairColor[leftEyebrowColor]);  //arc for left eyebrows
  strokeWeight(leftEyebrowThickness);
  noFill();
  arc(width/2-100,height/3+25,150,80, 1.2*PI, 1.8*PI);
  stroke(eyebrowHairColor[rightEyebrowColor]);  //arc for right eyebrows
  strokeWeight(rightEyebrowThickness);
  noFill();
  arc(width/2+100,height/3+25,150,80, 1.2*PI, 1.8*PI); 
}
//************************ Choose the colours & thickness for the Eyebrows *********************
void selectEyebrows(){
  for (int i = 0; i < 6; i++){
    for (int j = 0; j < 2; j++){
      stroke(0);
      strokeWeight(1);
      fill(eyebrowHairColor[i]);
      rect (3*width/4 + i * 50, 0 + j * 50, 50, 50);
    }
  }
  fill(360);
  textSize(25);
  myTextMessage = "Right eyebrow";
  text(myTextMessage, ((3 * width / 4)-5-textWidth(myTextMessage)), 40);
  myTextMessage = "Left eyebrow";
  text(myTextMessage, ((3 * width / 4)-5-textWidth(myTextMessage)), 90);
  myTextMessage = "Press keys !-^ for thickness of right eyebrow";
  text(myTextMessage, 20, 40);
  myTextMessage = "Press keys 1-6 for thickness of left eyebrow";
  text(myTextMessage, 20, 90);
  //myTextMessage = "Shift 1-6 (Note does not work with numeric pad)";
  //text(myTextMessage, 20, 90);
  doneButton(2);      //set up button for completion
  selectingEyebrows = true;
}
//************************ Draw the Mouth *****************************************************
void drawMouth(){
  stroke(0);                     // rectangles as teeth
  strokeWeight(1);
  fill(#FFFFFF);
  pushMatrix();
    translate(width/2, 3*height/4);
    rect(-65,-46,10,24);        //both top and bottom teeth
    rect(-55,-62,10,46);        //both top and bottom teeth
    rect(-45,-62,10,46);
    rect(-35,-62,15,46);
    rect(-20,-62,20,46);
    rect(  0,-62,20,46);
    rect( 20,-62,15,46);
    rect( 35,-62,10,46);
    rect( 45,-62,10,46);
    rect( 55,-46,10,24);    
    line(65, -39, -65, -39);    //using a line to split top and bottom
    stroke(lipsColor[lipColor]);    // two different arcs for the top and bottom lips
    strokeWeight(lipThickness);
    noFill();
    arc(0,-27,150,80, 1.1*PI, 1.9*PI);
    arc(0,-50,150,80, 2.1*PI, 2.9*PI);
    noStroke();            // triangle in head skin colour to give a 'v' in the top lip
    fill(skin[head]);
    triangle(0, -68, -15, -80, +15, -80);
  popMatrix();
}
//************************ Choose the colour for the Lips ***********************************
void selectMouth(){
  for (int i = 0; i < 6; i++){
    stroke(0);
    strokeWeight(1);
    fill(lipsColor[i]);
    rect (3*width/4 + i * 50, 0 , 50, 50);
  }
  fill(360);
  textSize(25);
  myTextMessage = "Lips";
  text(myTextMessage, ((3 * width / 4)-5-textWidth(myTextMessage)), 40);
  myTextMessage = "Press keys 1-6 for thickness of lips";
  text(myTextMessage, 20, 40);
  doneButton(3);      //set up button for completion
  selectingLips = true;
}
//************************ Draw the Hair *******************************************************
void drawHair(){
  stroke(eyebrowHairColor[hairColor]);  // lines in an arc for hair!
  strokeWeight(1);
  float spacing = 0.005;
  pushMatrix();
    translate(width/2, 3*height/8+20);
    rotate(-spacing*40*hairAmount);
    for (int i = 0; i < 480-((6-hairAmount)*80); i++){
      rotate(spacing);
      line(0, -178, 0, -(178 + hairLength));
    } 
  popMatrix();  
}
//************************ Choose the colour, amount and length of the Hair ******************************
void selectHair(){
  for (int i = 0; i < 6; i++){
    stroke(0);
    strokeWeight(1);
    fill(eyebrowHairColor[i]);
    rect (3*width/4 + i * 50, 0 , 50, 50);
  }
  fill(360);
  textSize(25);
  myTextMessage = "Hair color";
  text(myTextMessage, ((3 * width / 4)-5-textWidth(myTextMessage)), 40);
  myTextMessage = "Press keys 1-6 for amount of hair";
  text(myTextMessage, 20, 40);
  myTextMessage = "Press keys < or > to decrease or increase length of hair";
  text(myTextMessage, 20, 65);
  myTextMessage = "Press key 0 for no hair";
  text(myTextMessage, 20, 90);
  doneButton(4);      //set up button for completion
  selectingHair = true;
}
//************************ Draw the Tear *******************************************************
void drawTear(){
  noStroke();          // triangle and circle to form a tear!
  fill(#4A7AA2);
  pushMatrix();
    translate(width/2+70, height/2-30);
    ellipse(0, 0, 12, 12);
    triangle(0, -25, -6, 0, +6, 0);
  popMatrix();
}
//************************ Draw the Tear Message*******************************************************
void drawTearMessage(){
  fill(360);
  textSize(25);
  myTextMessage = "Your face design brings a tear to the eye!";
  text(myTextMessage, 20, 40);
  doneButton(5);      //set up button for completion
  selectingTear = true;
}
//************************ Draw the Crowd *******************************************************
void drawCrowd(){
  int population = 724; //724 is chosen as each face represents 10 million people making a population of 7.24 billion.
  for (int i = 0; i < population; i++){
    pushMatrix();
      rotate(random(PI/8)-(PI/16));    //give a slight rotation to faces so they do not look regimented
      drawFace(int(random(width)), int(random(height)), int(random(15,25)), int(random(6)));
    popMatrix();
  }
}
//************************ Draw a Face in the Crowd *******************************************************
void drawFace(int posX, int posY, int faceScale, int faceColorIndex){
  color skintype;        // two ears
  skintype = skin[faceColorIndex];
  //stroke(#FFFFFF);
  //strokeWeight(1);
  noStroke();
  fill(skintype);
  ellipse(posX+2*faceScale,posY-5*faceScale/10,1*faceScale,1.5*faceScale);
  ellipse(posX-2*faceScale,posY-5*faceScale/10,1*faceScale,1.5*faceScale);
  fill(#333007, 10);    //shade inner ears
  ellipse(posX+2*faceScale,posY-5*faceScale/10,0.7*faceScale,1.05*faceScale);
  ellipse(posX-2*faceScale,posY-5*faceScale/10,0.7*faceScale,1.05*faceScale);
  stroke(#FFFFFF);      // head as an ellipse in a "flesh" colour!
  //strokeWeight(1);
  //fill(skintype);
  noStroke();
  fill(skintype);
  ellipse(posX,posY,4*faceScale,5*faceScale);
  noStroke();    //two ellipses for cheeks
  fill(#EB404F, 10); // fill fairly transparent
  ellipse(posX-1.1*faceScale,posY+0.4*faceScale,0.8*faceScale,0.8*faceScale);
  ellipse(posX+1.1*faceScale,posY+0.4*faceScale,0.8*faceScale,0.8*faceScale);
  fill(#EB404F, 10);   // triangle for nose, fill fairly transparent
  stroke(#814D38); 
  strokeWeight(1);
  triangle(posX, posY-faceScale/1.1, posX-faceScale/2, posY+faceScale/1.1, posX+5*faceScale/10, posY+faceScale/1.1);
  noStroke();          //two ellipses for nostrils
  fill(0);
  ellipse(posX-0.25*faceScale,posY+0.8*faceScale,0.15*faceScale,0.20*faceScale);
  ellipse(posX+0.25*faceScale,posY+0.8*faceScale,0.15*faceScale,0.20*faceScale);
  fill(#FCF7F5);  //two ellipses for eyes
  ellipse(posX-1.10*faceScale,posY-0.5*faceScale,1*faceScale,0.5*faceScale);
  strokeWeight(1);
  ellipse(posX+1.10*faceScale,posY-0.5*faceScale,1*faceScale,0.5*faceScale);
  fill(eyeIrisColor[int(random(6))]); //two ellipses for irises random eyecolor from pallette 
  ellipse(posX-1.10*faceScale,posY-0.5*faceScale,.40*faceScale,.40*faceScale);
  ellipse(posX+1.10*faceScale,posY-0.5*faceScale,.40*faceScale,.40*faceScale);
  fill(0);  //two black ellipses for the pupils
  ellipse(posX-1.10*faceScale,posY-0.5*faceScale,.20*faceScale,.20*faceScale);
  ellipse(posX+1.10*faceScale,posY-0.5*faceScale,.20*faceScale,.20*faceScale);
  noFill();        //arcs for eyebrows
  stroke(0);
  strokeWeight(.16*faceScale);
  arc(posX+1*faceScale,posY-1*faceScale,1.5*faceScale,0.8*faceScale, 1.2*PI, 1.8*PI);
  arc(posX-1*faceScale,posY-1*faceScale,1.5*faceScale,0.8*faceScale, 1.2*PI, 1.8*PI);
  stroke(0);      // rectangles as teeth
  strokeWeight(1);
  fill(#FFFFFF);
  rect(posX-.55*faceScale,posY+1.68*faceScale,.1*faceScale,.2*faceScale);  //bottom row of teeth
  rect(posX-.45*faceScale,posY+1.68*faceScale,.1*faceScale,.2*faceScale);
  rect(posX-.35*faceScale,posY+1.68*faceScale,.15*faceScale,.2*faceScale);
  rect(posX-.20*faceScale,posY+1.68*faceScale,.2*faceScale,.2*faceScale);
  rect(posX              ,posY+1.68*faceScale,.2*faceScale,.2*faceScale);
  rect(posX+.20*faceScale,posY+1.68*faceScale,.15*faceScale,.2*faceScale);
  rect(posX+.35*faceScale,posY+1.68*faceScale,.1*faceScale,.2*faceScale);
  rect(posX+.45*faceScale,posY+1.68*faceScale,.1*faceScale,.2*faceScale);
  rect(posX-.55*faceScale,posY+1.48*faceScale,.1*faceScale,.2*faceScale);  //top row of teeth
  rect(posX-.45*faceScale,posY+1.48*faceScale,.1*faceScale,.2*faceScale);
  rect(posX-.35*faceScale,posY+1.48*faceScale,.15*faceScale,.2*faceScale);
  rect(posX-.20*faceScale,posY+1.48*faceScale,.2*faceScale,.2*faceScale);
  rect(posX              ,posY+1.48*faceScale,.2*faceScale,.2*faceScale);
  rect(posX+.20*faceScale,posY+1.48*faceScale,.15*faceScale,.2*faceScale);
  rect(posX+.35*faceScale,posY+1.48*faceScale,.1*faceScale,.2*faceScale);
  rect(posX+.45*faceScale,posY+1.48*faceScale,.1*faceScale,.2*faceScale);
  stroke(#FF0000);  // two different arcs for the top and bottom lips
  strokeWeight(int(0.20*faceScale));
  noFill();
  arc(posX,posY+1.8*faceScale,1.5*faceScale,.8*faceScale, 1.1*PI, 1.9*PI);
  strokeWeight(0.25*faceScale);
  arc(posX,posY+1.58*faceScale,1.5*faceScale,.8*faceScale, 2.1*PI, 2.9*PI);
  noStroke();      // triangle to give a 'v' in the top lip
  fill(skintype);
  triangle(posX, posY+1.4*faceScale, posX-.20*faceScale, posY+1.1*faceScale, posX+.20*faceScale, posY+1.1*faceScale);
  stroke(#482C1D);      // lines for frowning
  strokeWeight(1);
  line(posX-.50*faceScale,posY-2.25*faceScale,posX+.50*faceScale,posY-2.25*faceScale);
  line(posX-.70*faceScale,posY-2.05*faceScale,posX+.70*faceScale,posY-2.05*faceScale);
  line(posX-.90*faceScale,posY-1.85*faceScale,posX+.90*faceScale,posY-1.85*faceScale);
  stroke(#482C1D);      // lines for hair!
  strokeWeight(1);
  line(posX,posY-2.5*faceScale,posX-.35*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.30*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.25*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.20*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.15*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.10*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX-.05*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.05*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.10*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.15*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.20*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.25*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.30*faceScale,posY-2.9*faceScale);
  line(posX,posY-2.5*faceScale,posX+.35*faceScale,posY-2.9*faceScale);
}



