
//all of the global variables are initialized here. Most variables are
//use in multiple functions so they exist here.
int maddy=3;
boolean absRun=false;
boolean stretchRun=false;
boolean iceRun=false;
boolean optionsRun=false;
boolean absOptions=false;
boolean stretchOptions=false;
boolean menuRun=true;
boolean newBackground=false;
int i;
int time;
float a=0;
boolean aUp=true;
int b;
int c;
int cheer;
int odd;
int holdX;
int holdY;
int backgroundColorA;
int backgroundColorB=255;
int backgroundColorC=255;
//int duration=45;
String tempTaskExercise;
int tempTaskDuration;
int iceTime;

//these variables are for changing the ab workout
int rectHeight;
String typing="";
int hoverExercise;
int clickExercise=-1;
//these two ints record the last clicked position of the mouse.
int clickX;
int clickY;
String typedDescription="";
String typedDuration="";
boolean typingString=false;
boolean typingInt=false;

ArrayList<Tasks> exercises;
ArrayList<Tasks> tempExercises;
ArrayList<Tasks> stretches;

void setup() {
  size(400, 400);
  background(169, 248, 253);
  //this creates the three arraylists that I will need.
  exercises = new ArrayList<Tasks>();
  tempExercises=new ArrayList<Tasks>();
  stretches = new ArrayList<Tasks>();
  //this fills the arraylists
  workoutArray();
}

void draw() {
  //this randomly changes the background when the ab workout or stretch
  //workout is running.
  if (absRun||stretchRun) {
    background(backgroundColorA, backgroundColorB, backgroundColorC); 
    newBackground=false;
  }else if(iceRun){
   background(200,255,255); 
  }
  else {
    background(192, 192, 192);
  }

//this big if and else if statement determines what state the program
//is in and then runs the corresponding function
  if (absRun) {
    workout();
    menuRun=false;
  }
  else if (stretchRun) {
    workout();
    menuRun=false;
  }
  else if (iceRun) {
    ice();
    menuRun=false;
  }
  else if (optionsRun) {

    optionsScreen();
    menuRun=false;
  }
  else if (absOptions) {
    absCustomizer();
    menuRun=false;
  }
  else if (stretchOptions) {
    absCustomizer();
    menuRun=false;
  }
  else if (menuRun) {
    menuRun=true;
    menu();
  }
}

//this function draws all the buttons in the main menu
void menu() {
  textSize(40);

  fill(255, 255, 102);
  rect(100, 225, 200, 50, 10);
  rect(100, 300, 200, 50, 10);
  rect(100, 75, 200, 50, 10);
  rect(100, 150, 200, 50, 10);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Conditioning Coach", 200, 25);
  //noFill();
  textSize(25);
  text("Options", 200, 320);
  text("Ab Workout", 200, 95);
  text("Ice", 200, 245);
  text("Stretch", 200, 170);
}

//if the mouse is clicked in any state, this function is called
void mouseClicked() {
 
  if ((absRun||stretchRun)&&mouseX>50&&mouseX<350&&mouseY>275&&mouseY<325) {
    menuRun=true;
    absRun=false;
    stretchRun=false;
    i=0;
  }
  else if (mouseX>100&&mouseX<300&&menuRun) {
    if (mouseY>75&&mouseY<125) {
      menuRun=false;
      absRun=true;
      background(200, 200, 200);
      time=millis();
    }
    else if (mouseY>150&&mouseY<200) {
      menuRun=false;
      stretchRun=true;
      background(200, 200, 200);
      time=millis();
    }
    else if (mouseY>225&&mouseY<275) {
      menuRun=false;
      iceRun=true;
      background(200, 200, 200);
      iceTime=millis();
    }
    else if (mouseY>300&&mouseY<350) {
      menuRun=false;
      optionsRun=true;
      background(200, 200, 200);
    }
  }
  else if (mouseX>50&&mouseX<350&&optionsRun) {
    if (mouseY>50&&mouseY<50+400/9) {
      absOptions=true;
      optionsRun=false;
    } 
    else if (mouseY>3*400/9&&mouseY<4*400/9) {
      stretchOptions=true;
      optionsRun=false;
    }
  }
  if (absOptions||stretchOptions) {
    if (clickY>rectHeight&&clickY<330) {
      holdX=clickX;
      holdY=clickY;
    }
    clickX=mouseX;
    clickY=mouseY;

    if (clickX>25&&clickX<225&&clickY>370&&clickY<385) {
      typingInt=false;
      typingString=true;
      typing=typedDescription;
      //typing="";
    }
    else if (clickX>230&&clickX<260&&clickY>370&&clickY<385) {
      typingInt=true;
      typingString=false;
      typing=typedDuration;
      //typing="";
    }
    else if (clickX>330&&clickX<375&&clickY>360&&clickY<380&&clickExercise>-1) {
      exercises.get(clickExercise).taskExercise=typedDescription;
      exercises.get(clickExercise).taskDuration=int(typedDuration);
      //println(":-");
      clickX=holdX;
      clickY=holdY;
    }
    else if (clickX>50&&clickX<150&&clickY>rectHeight/5&&clickY<4*rectHeight/5) {
      if (absOptions) {
        exercises.add(new Tasks("New Exercise", 0));
      }
      else if (stretchOptions) {
        stretches.add(new Tasks("New Exercise", 0));
      }
      clickX=holdX;
      clickY=holdY;
    }
    else if (clickX>150&&clickX<250&&clickY>rectHeight/5&&clickY<4*rectHeight/5) {
      if (absOptions) {
        exercises.remove(clickExercise);
      }
      else if (stretchOptions) {
        stretches.remove(clickExercise);
      }

      if (clickExercise==tempExercises.size()) {
        clickExercise=clickExercise-1; 
        holdY=holdY-rectHeight;
      }
      clickX=holdX;
      clickY=holdY;
    }
    else if (clickX>250&&clickX<350&&clickY>rectHeight/5&&clickY<4*rectHeight/5) {
      menuRun=true;
      absOptions=false;
      stretchOptions=false;
    }
  }
}

//this function fills both the workout array and the stretch array
void workoutArray() {
  exercises.add(new Tasks("Straight Crunches", maddy));
  exercises.add(new Tasks("Right Side Crunches", maddy));
  exercises.add(new Tasks("Left Side Crunches", maddy));
  exercises.add(new Tasks("Roll Backs", maddy));
  exercises.add(new Tasks("Right Twist Crunches", maddy));
  exercises.add(new Tasks("Left Twist Crunches", maddy));
  exercises.add(new Tasks("Leg Pushes", maddy));
  exercises.add(new Tasks("Toe Touches", maddy));
  exercises.add(new Tasks("Bicycles", maddy));
  exercises.add(new Tasks("Push Throughs", maddy));
  exercises.add(new Tasks("Russian Twists", maddy));

  stretches.add(new Tasks("Left Pigeon Stretch", 5));
  stretches.add(new Tasks("Right Pigeon Stretch", maddy));
  stretches.add(new Tasks("Left Quad Stretch", maddy));
  stretches.add(new Tasks("Right Quad Stretch", maddy));
  stretches.add(new Tasks("Left Pigeon Stretch", 5));
  stretches.add(new Tasks("Right Pigeon Stretch", maddy));
  stretches.add(new Tasks("Left Quad Stretch", maddy));
  stretches.add(new Tasks("Right Quad Stretch", maddy));
}

//this draws the main menu for the options screen
void optionsScreen() {
  noFill();
  rect(50, 400/9, 300, 400/9, 10);
  text("Change Ab Workout", 50, 400/9-2, 300, 400/9);
  rect(50, 3*400/9, 300, 400/9, 10);
  text("Change Stretch Routine", 50, 3*400/9-2, 300, 400/9);
  rect(50, 5*400/9, 300, 400/9, 10);
  text("Under Construction", 50, 5*400/9-2, 300, 400/9);
  rect(50, 7*400/9, 300, 400/9, 10);
  text("Return to Menu", 50, 7*400/9-2, 300, 400/9);
}

//this sets a random Background color for the ab workout that changes with
//every exercise
void randomBackground() {
  backgroundColorA=int(random(100, 250));
  backgroundColorB=int(random(100, 250));
  backgroundColorC=int(random(100, 250));
}

//this function runs the the code for when the user is actually using
//the program. It uses the number of millis from when the user started
//to determine how long they have been doing each exercise
void workout() {
  tempExercises.clear();
  if (absRun) {
    for (int h=0; h<exercises.size(); h++) {
      tempExercises.add(new Tasks(exercises.get(h).taskExercise, exercises.get(h).taskDuration));
    }
  }
  else if (stretchRun) {
    for (int h=0; h<stretches.size(); h++) {
      tempExercises.add(new Tasks(stretches.get(h).taskExercise, stretches.get(h).taskDuration));
    }
  }
  if (i<tempExercises.size()) {
    textSize(35);
    text(tempExercises.get(i).taskExercise, 200, 100); 
    if (tempExercises.get(i).taskDuration-(millis()-time)/1000!=0) {
      text(tempExercises.get(i).taskDuration-(millis()-time)/1000, 200, 300);
    }
    if ((millis()-time)/1000>=tempExercises.get(i).taskDuration) {
      i++;
      randomBackground();
      time=millis();
    }
    counter();
    textSize(12);
    text("Press the tab key to end workout and return to menu", 200, 380);
  }
  else {
    textSize(35);
    back();
  }
}

//this is a simple timer that measures 15 minutes so that the user can
//ice their legs.
void ice() {
  int timeElapsed=900-(millis()-iceTime)/1000;
 // println(timeElapsed);
  if (timeElapsed<900) {
    if (timeElapsed%60>9) {
      text(timeElapsed/60+" : "+timeElapsed%60, 200, 300);
    }
    else {
      text(timeElapsed/60+" : 0"+timeElapsed%60, 200, 300);
    }
  }
}

//after the ice timer runs out, the user is brought to a menu with
//one button that prompts them to go back to the main menu
void back() {
  background(200, 200, 200);
  text("Good Job!", 200, 95);
  noFill();
  rect(50, 275, 300, 50, 10); 
  fill(0);
  text("Return to menu", 200, 295);
  counter();
}

//this runs the code for the boxes at the top of the screen while
//the user does abs that shows them their progress
void counter() {
  for (b=0; b<i; b++) {
    fill(0);
    int rectWidth=width/(tempExercises.size()+2)/2;
    rect((2+b*2)*rectWidth+rectWidth/2, 25, rectWidth, rectWidth);
  }
  for (c=tempExercises.size(); c>i; c--) {
    int rectWidth=width/(tempExercises.size()+2)/2;
    noFill();
    rect((2+(c-1)*2)*rectWidth+rectWidth/2, 25, rectWidth, rectWidth);
  }
}

//this is not used yet, but it has stick figures that jump
//up and down and encourage the user to keep going!
void cheerPic(){
  pickExercise();
  aChange();
}

void straightCrunch() {
  fill(160,160,160);
  line(180, 200, 220, 200);
  line(220, 200, 230, 175); 
  line(230, 175, 260, 175);
  line(180, 200, 130+a, 190-a);
  ellipse(130+a, 185-a, 30, 30);
  line((130+a+180)/2, (190-a+200)/2, 165+a, 170);
  line(165+a, 170,130+a, 185-a);
  fill(0);
}

void sideCrunch(){
  fill(160,160,160);
  line(180, 200, 220, 200);
  line(220, 200, 250, 175); 
  line(250, 175, 280, 200);
  line(180, 200, 130+a, 190-a);
  ellipse(130+a, 185-a, 30, 30);
  line((130+a+180)/2, (190-a+200)/2, 165+a, 170);
  line(165+a, 170,130+a, 185-a);
  line(220,200,250-a*1.5,175-a/4);
  line(250-a*1.5,175-a/4,280-1.5*a,200-a);
  fill(0);
}

void pickExercise(){
 if(i==0){
  straightCrunch();
 } else if(i==1||i==2){
   sideCrunch();
 }
}

void aChange(){
  if (a==25) {
    aUp=false;
  }
  else if (a==0) {
    aUp=true;
  }
  if (aUp) {
    a=a+.5;
  }
  else {
    a=a-.5;
  } 
}
//this creates the class for the object that gives each ab exercise
//a name and duration
class Tasks {
  String taskExercise;
  int taskDuration;
  Tasks(String tempExercise, int tempDuration){
    taskExercise=tempExercise;
    taskDuration=tempDuration;
  }
}

//this is the part of the code that lets the user change their workout
void absCustomizer() {
  tempExercises.clear();
  //this determines if the user is changing the stretches or the ab exercises
  //it take whichever one they are doing and puts it in a temporary arraylist,
  //which is what is actually changed. At the end, the temporary arraylist is
  //stuck back in the array that it was derived from with all the changes saved.
  if (absOptions) {
    for (int h=0; h<exercises.size(); h++) {
      tempExercises.add(new Tasks(exercises.get(h).taskExercise, exercises.get(h).taskDuration));
    }
  }
  else if (stretchOptions) {
    for (int h=0; h<stretches.size(); h++) {
      tempExercises.add(new Tasks(stretches.get(h).taskExercise, stretches.get(h).taskDuration));
    }
  }
  otherButtons();
  textAlign(LEFT, BASELINE);
  textSize(12);
  //this determines how big the array is and therefore if it should
  //be in one or two columns.
  if (tempExercises.size()>12) {
    if (tempExercises.size()%2!=0) {
      rectHeight=660/(tempExercises.size()+1);
      //println("HI");
      odd=1;
    }
    else {
      rectHeight=660/tempExercises.size();
      odd=0;
    }
    bigExercise();
    bigHover();
    if (clickY>rectHeight&&clickY<330) {
      if (clickX>20&&clickX<180) {
        clickExercise=clickY/(rectHeight)-1;
        typedDescription=tempExercises.get(clickExercise).taskExercise;
        typedDuration=""+ tempExercises.get(clickExercise). taskDuration;
      }
      else if (clickX>220&&clickX<380||clickExercise<tempExercises.size()-1) {
        clickExercise=clickY/rectHeight-1+(tempExercises.size()/2)+odd;
        typedDescription=tempExercises.get(clickExercise).taskExercise;
        typedDuration=""+tempExercises.get(clickExercise).taskDuration;
      }
    }
  }
  else {
    rectHeight=320/(tempExercises.size());
    smallExercise();
    if (mouseY>rectHeight&&mouseY<330&&mouseX>rectHeight&&mouseX<rectHeight*(tempExercises.size()+2)) {
      hoverExercise=mouseY/rectHeight-1;
    }
    else {
      hoverExercise=-1;
    }
    if (clickY>rectHeight&&clickY<330&&clickX>rectHeight&&clickX<rectHeight*(tempExercises.size()+2)) {
      clickExercise=clickY/rectHeight-1;
      typedDescription=tempExercises.get(clickExercise).taskExercise;
      typedDuration=""+tempExercises.get(clickExercise).taskDuration;
    }
  }
  edit();
  if (absOptions) {
    for (int h=0; h<exercises.size(); h++) {
      exercises.set(h, tempExercises.get(h));
    }
  }
  else if (stretchOptions) {
    for (int h=0; h<stretches.size(); h++) {
      stretches.set(h, tempExercises.get(h));
    }
  }
}

//this draws the exercise list in 1 column if there are less than 12
//exercises
void smallExercise() {
  for (int i=0; i<tempExercises.size(); i++) {
    Tasks nowTask=tempExercises.get(i);
    // rectHeight=(340)/(tempExercises.size()+1);
    if (i==clickExercise) {
      fill(255, 0, 0);
    }
    else if (i==hoverExercise) {
      fill(255, 255, 0);
    }
    else {
      fill(255);
    }
    rect(50, (i+1)*rectHeight, 300, rectHeight);
    fill(0);
    text(nowTask.taskExercise, 55, rectHeight*(i+1)+rectHeight-(rectHeight-12)/2);
    text(nowTask.taskDuration, 325, rectHeight*(i+1)+rectHeight-(rectHeight-12)/2);
    fill(255);
  }
}

//this draws the exercises in 2 columns if there are more than 12,
//changes the color of the one being hovered over
void bigExercise() {
  rectHeight=660/(tempExercises.size()+2);
  int lastI=0;
  for (int i=0; i<tempExercises.size(); i++) {
    fill(255);
    Tasks nowTask=tempExercises.get(i);
    if (i<(tempExercises.size()+odd)/2) {
      if (i==clickExercise) {
        fill(255, 0, 0);
      }
      else if (i==hoverExercise) {
        fill(255, 255, 0);
      }
      rect(20, (i+1)*rectHeight, 170, rectHeight);
      fill(0);
      text(nowTask.taskExercise, 25, rectHeight*(i+1)+rectHeight-(rectHeight-12)/2);
      text(nowTask.taskDuration, 160, rectHeight*(i+1)+rectHeight-(rectHeight-12)/2);
      lastI=i;
    }
    else {
      if (i==clickExercise) {
        fill(255, 0, 0);
        // typedDescription=
        // typedDuration=
      }
      else if (i==hoverExercise) {
        fill(255, 255, 0);
      }
      else {
        fill(255);
      }
      rect(210, (i-lastI)*rectHeight, 170, rectHeight);
      fill(0);
      text(nowTask.taskExercise, 215, (i-lastI)*rectHeight+rectHeight-(rectHeight-12)/2);
      text(nowTask.taskDuration, 350, (i-lastI)*rectHeight+rectHeight-(rectHeight-12)/2);
      fill(255);
    }
  }
}

//this displays the typing at the bottom of the screen.
void edit() {
  rect(20, 350, 360, 40);
  fill(0);
  text("Description", 25, 365);
  noFill();
  rect(25, 370, 200, 15);
  fill(0);
  if (clickX>25&&clickX<225&&clickY>370&&clickY<385) {
    text(typing+(frameCount/40 % 2 == 0 ? "|" : ""), 30, 382);
    text(typedDuration, 235, 382);
  }
  else if (clickX>230&&clickX<260&&clickY>370&&clickY<385) {
    text(typing+(frameCount/40 % 2 == 0 ? "|" : ""), 235, 382);
    text(typedDescription, 30, 382);
  }
  else {
    text(typedDuration, 235, 382);
    text(typedDescription, 30, 382);
  }
  text("Duration", 230, 365);
  noFill();
  rect(230, 370, 30, 15);
  fill(0);
  text("Seconds", 265, 382);
  text("Done", 337, 375);
  noFill();
  rect(330, 360, 45, 20);
}

//this changes the color of the block that is being hovered over when
//the arraylist is longer than 12
void bigHover() {
  if (mouseY>rectHeight&&mouseY<330) {
    if (mouseX>20&&mouseX<180) {
      hoverExercise=mouseY/rectHeight-1;
    }
    else if (mouseX>220&&mouseX<380) {
      hoverExercise=mouseY/rectHeight-1+(tempExercises.size()/2)+odd;
    }
    else {
      hoverExercise=-1;
    }
  }
  else {
    hoverExercise=-1;
  }
}

//whenever a key is pressed this function is called. It basically
//adds to what the user has typed, or lets them move variables around
//in the array list.
void keyPressed() {

  if (keyCode == SHIFT) {
    println("SHIFT");
    typing=typing;
  }
  else if (keyCode == BACKSPACE&&typing.length()>0) {
    typing = typing.substring(0, typing.length() - 1);
    //background(255);
  }
  else if (keyCode == BACKSPACE&&typing.length()==0) {
    typing=typing;
  }
  else if (keyCode==TAB) {
    menuRun=true;
    absRun=false;
    stretchRun=false;
    iceRun=false;
    optionsRun=false;
    absOptions=false;
    stretchOptions=false;
  }
  else if ((stretchOptions||absOptions)&&keyCode == UP &&clickExercise>0) {
    //  println("Hi");
    String holdingExercise=tempExercises.get(clickExercise).taskExercise;
    int holdingDuration=tempExercises.get(clickExercise).taskDuration;
    tempExercises.get(clickExercise).taskExercise=tempExercises.get(clickExercise-1).taskExercise;
    tempExercises.get(clickExercise).taskDuration=tempExercises.get(clickExercise-1).taskDuration;
    tempExercises.get(clickExercise-1).taskExercise=holdingExercise;
    tempExercises.get(clickExercise-1).taskDuration=holdingDuration;
    clickExercise=clickExercise-1;
    clickY=clickY-rectHeight;
  }
  else if ((stretchOptions||absOptions)&&keyCode == DOWN &&clickExercise<tempExercises.size()-1) {
    // println("Bye");
    String holdingExercise=tempExercises.get(clickExercise).taskExercise;
    int holdingDuration=tempExercises.get(clickExercise).taskDuration;
    tempExercises.get(clickExercise).taskDuration=tempExercises.get(clickExercise+1).taskDuration;
    tempExercises.get(clickExercise).taskExercise=tempExercises.get(clickExercise+1).taskExercise;
    tempExercises.get(clickExercise+1).taskDuration=holdingDuration;
    tempExercises.get(clickExercise+1).taskExercise=holdingExercise;
    clickExercise=clickExercise+1;
    clickY=clickY+rectHeight;
  }
  else if (keyCode==UP||keyCode==DOWN) {
    typing=typing;
  }
  else {
    typing = typing + key;
  }
  if (typingInt) {
    typedDuration=typing;
  }
  else if (typingString) {
    typedDescription=typing;
  }
}

//this draws the other buttons on the screen
void otherButtons() {
  fill(50, 255, 50);
  rect(50, rectHeight/5, 100, 3*rectHeight/5);
  fill(255, 50, 50);
  rect(150, rectHeight/5, 100, 3*rectHeight/5);
  fill(125, 125, 255);
  rect(250, rectHeight/5, 100, 3*rectHeight/5);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Add new", 50, rectHeight/5, 100, 3*rectHeight/5);
  text("Remove current", 150, rectHeight/5, 100, 3*rectHeight/5);
  text("Back to Menu", 250, rectHeight/5, 100, 3*rectHeight/5);
}



