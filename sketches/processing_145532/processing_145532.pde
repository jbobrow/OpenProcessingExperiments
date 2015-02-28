
/*
THIS CODE RUNS IN MULTIPLE WINDOWS AND AS A RESULT, CANNOT BE RUN ONLINE. PLEASE COPY AND PASTE INTO PROCESSING
TO RUN. THANKS!

 Note: This project will eventually evolve into my final project so not all features are
 available yet. There are also a number of println statements throughout the code that I am
 currentely using to debug, so feel free to ignore them.
 
 Sources:
 Code for new window from http://stackoverflow.com/questions/16630228/creating-a-second-appletwindow-in-processing
 Code for flashing icon in textbox from http://wiki.processing.org/w/Typed_input
 http://processing.org/reference/javadoc/core/processing/core/PApplet.html
 
 Appreciation
 Thank you to Ms. Freed for debugging and support.
 Also thanks to Paul Nakada for troubleshooting, debugging, and providing food.
 Thanks to Ciara Keegan and Emma Wexler for morale support!
 Thank you to Julia Thompson and Marissa Fong for testing my project.
 */

//all of the variables are initiallized here
import javax.swing.JFrame;
int headerHeight=40;
int headerFloat;
int sidebarWidth;
int mainWidth;
int menuFloatX;
//Homework math;
int textHeight;
boolean dropOpen=false;
int testTime;
int screenHeight=400;
int h;
int m;
boolean createNewAssignment=false;
PFrame f;
secondApplet s;
Homework homework;
int assignmentNumber=0;
int totalHeight=headerFloat+2*headerHeight;

//this creates the array Homework which can hold 10 assignments
Homework[] homeworks=new Homework[10];

//basic setup
void setup() {
  //frameRate(1);
  background(255);
  size(300, 400);
  rectMode(CORNER);
  for (int i=0; i<homeworks.length; i++) {
    homeworks[i]=new Homework("", "", 0);
  }
}

//this essentially runs all the code. Most of the code is in functions, so although it looks short, all of the code runs through here
void draw() {
  //println(assignmentNumber);
  //println(createNewAssignment);
  background(255);
  setNumbers();
  header();
  sidebar();
  readNumber();
   assignments();
  //println ("The time is "+h+":"+m);
}

//every time the code runs, these values are reset
void setNumbers() {
  headerHeight=screenHeight/10;
  headerFloat=headerHeight-headerHeight/4;
  sidebarWidth=width/4;
  mainWidth=width-sidebarWidth-2*headerFloat;
  menuFloatX=width-sidebarWidth/2-3*headerHeight/8;
  h=hour();
  m=minute();
  textHeight=20;
}

//creates the header at the top of the page
void header() {
  noStroke();
  fill(153, 0, 0);
  rect(0, 0, width, headerHeight);
  textSize(headerHeight/1.5);
  fill(255);
  text("Taskmanager", headerFloat/4, headerFloat);
  if (mouseX>menuFloatX&&mouseX<menuFloatX+3*headerHeight/4&&mouseY>headerFloat/8&&mouseY<headerFloat/8+3*headerHeight/4) {
    fill(102, 0, 0);
    rect(menuFloatX, headerFloat/8, 3*headerHeight/4, 3*headerHeight/4);
    textSize(headerHeight);
    fill(255);
    text("+", menuFloatX, headerFloat);
  }
  else {
    rect(menuFloatX, headerFloat/8, 3*headerHeight/4, 3*headerHeight/4);
    textSize(headerHeight);
    fill(153, 0, 0);
    text("+", menuFloatX, headerFloat);
  }
}

//creates the sidebar on the side of the page. This will later display the amount of time spent on each assignment once I get to my final project.
void sidebar () {
  fill(200, 50, 50);
  rect(width-sidebarWidth, headerHeight, sidebarWidth, height-headerHeight);
}

//this displays the number of active assignments at the top of the page
void readNumber(){
  textSize(12);
  fill(0);
  //rect(headerFloat, headerHeight+headerFloat, mainWidth, 20);
 text("You have " + assignmentNumber + " active assignments", headerFloat, headerFloat+headerHeight);
}

//this displays the assignments on the main window
void assignments() {
  int tempHeight=totalHeight;
   for (int i=0; i<=assignmentNumber; i++) {
     
    fill(0);
    textSize(12);
    homework=homeworks[i];
    text(homework.blurb, headerFloat, tempHeight+20);
    text(homework.description, headerFloat, tempHeight+40);
    if (homework.duration!=0) {
      text(homework.duration, headerFloat, tempHeight+60);
    }
    tempHeight=tempHeight+80;
  }
}

//if the mouse clicks the plus button in the top of the screen, this makes a new window
void mouseClicked() {
  if (mouseX>menuFloatX&&mouseX<menuFloatX+3*headerHeight/4&&mouseY>headerFloat/8&&mouseY<headerFloat/8+3*headerHeight/4) {
    PFrame f = new PFrame();
  }
}


/*this was code I wrote earlier in the program to resize the screen.
 It turns out there was an easier way to do all of this with one line
 of code, but I left my initial code in to show my process
 void changesize() {
 if (mouseY>=height-4&&mouseX>=width-4) {
 cursor(diagonalCursor);
 if (mousePressed==true) {
 height=mouseY;
 width=mouseX;
 frame.setSize(width, height);
 println("width is " + width + " height is " + height);
 }
 }
 else if (mouseX>=width-4) {
 cursor(acrossCursor);
 if (mousePressed==true) {
 width=mouseX;
 frame.setSize(width, height);
 println("width is " + width + " height is " + height);
 }
 }
 else if (mouseY>=height-4) {
 cursor(verticalCursor);
 if (mousePressed=true) {
 height=mouseY; 
 frame.setSize(width, height);
 println("width is " + width + " height is " + height);
 }
 }
 else if (mouseX<width-4||mouseY<width-4) {
 cursor(ARROW);
 }
 }
 */
 
 //this makes a new Window
class secondApplet extends PApplet {
  //int headerHeight=40;
  //int headerFloat;
  //int sidebarWidth;
  //int mainWidth;
  int textHeight=20;
  int menuFloatX;
  String blurbInput="";
  String descriptionInput="";
  String durationInput="";
  String typing="";
  //String saved="";
  int typingWidth;
  int descriptionLines=1;
  int assignmentLines=1;
  boolean descriptionText=false;
  boolean assignmentText=false;
  boolean durationText=false;
  int assignmentHeight=textHeight;
  int descriptionHeight=textHeight;

  //all of the functions with the same names as in the main menu serve the same purpose
  void setup() {
    //println(assignmentText);
    //println(height);
    size(400, 300);
    background(255);
    loop();
  }

  void draw() {
    //println("Hello");
    background(255);
    setNumbers();
    header();
    sidebar();
    textboxes();
  }

  void setNumbers() {
    headerFloat=headerHeight-headerHeight/4;
    sidebarWidth=width/4;
    mainWidth=width-sidebarWidth-2*headerFloat;
    menuFloatX=width-sidebarWidth/2-3*headerHeight/8;
    //println("MAIN IS", mainWidth);
  }

  void header() {
    //println(headerHeight/1.5);
    //println(headerHeight);
    noStroke();
    fill(153, 0, 0);
    rect(0, 0, width, headerHeight);
    textSize(headerHeight/1.5);
    fill(255);
    text("Taskmanager", headerFloat/4, headerFloat);
  }

  void sidebar () {
    fill(200, 50, 50);
    rect(width-sidebarWidth, headerHeight, sidebarWidth, height-headerHeight);
  }

  //this function creates the textboxes and surrounding text for user input
  void textboxes() {
    fill(0);

    textSize(20);
    text("Assignment/Subject", headerFloat, headerHeight+headerFloat);
    noFill();
    stroke(0);
    rect(headerFloat, headerHeight+headerFloat+textHeight/2, mainWidth, assignmentHeight);
    //line(headerFloat+5, headerHeight+headerFloat+textHeight/2+5, headerFloat+typingWidth, headerHeight+headerFloat+textHeight/2+5);
    //line(headerFloat+5, headerHeight+headerFloat+textHeight/2+10, headerFloat+textWidth(typing)+5, headerHeight+headerFloat+textHeight/2+10);
    textSize(12);
    fill(0, 0, 255);

    //for each of these 3 textboxes, if the user clicks the box the content of the other boxes is saved and continues to be displayed, but not changed. 
    //The text in the current box IS changed and a flashing cursor displays
    if (assignmentText) {
      //println(assignmentText);
      text(typing+(frameCount/40 % 2 == 0 ? "|" : ""), headerFloat+5, headerHeight+headerFloat+textHeight/2+2, mainWidth, assignmentHeight);
      if (typingWidth>mainWidth-10) { 
        //println("Main is ", mainWidth);
        //println("Typed is ", typingWidth);
        assignmentLines++; 
        typingWidth=0;
        assignmentHeight=textHeight*assignmentLines;
      }
      typingWidth=int(textWidth(typing))-(mainWidth)*(assignmentLines-1);
      descriptionInput=typing;
      text(blurbInput, headerFloat+5, 2+headerHeight+2*headerFloat+textHeight/2+textHeight*assignmentLines+textHeight/2, mainWidth, textHeight*descriptionLines);
      text(durationInput, headerFloat+5, 2+headerHeight+3*headerFloat+3*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines, mainWidth, 20);
    }

    fill(0);
    textSize(20);
    text("Description", headerFloat, headerHeight+2*headerFloat+textHeight/2+textHeight*assignmentLines);
    noFill();
    stroke(0);
    rect(headerFloat, headerHeight+2*headerFloat+textHeight/2+textHeight*assignmentLines+textHeight/2, mainWidth, descriptionHeight);

    textSize(12);
    fill(0, 0, 255);

    if (descriptionText) {
      //println(assignmentText);
      text(typing+(frameCount/40 % 2 == 0 ? "|" : ""), headerFloat+5, 2+headerHeight+2*headerFloat+textHeight/2+assignmentHeight+textHeight/2, mainWidth, descriptionHeight);
      if (typingWidth>mainWidth-10) { 
        //println("Main is ", mainWidth);
        //println("Typed is ", typingWidth);
        descriptionLines++; 
        typingWidth=0;
        descriptionHeight=textHeight*descriptionLines;
      }
      typingWidth=int(textWidth(typing))-(mainWidth)*(descriptionLines-1);
      blurbInput=typing;
      text(descriptionInput, headerFloat+5, headerHeight+headerFloat+textHeight/2+2, mainWidth, textHeight*assignmentLines);
      text(durationInput, headerFloat+5, 2+headerHeight+3*headerFloat+3*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines, mainWidth, 20);
    }
    //println(typingWidth);

    ///////////////////////   

    fill(0);
    textSize(20);
    text("Duration (Minutes)", headerFloat, headerHeight+3*headerFloat+2*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines);
    noFill();
    stroke(0);
    rect(headerFloat, headerHeight+3*headerFloat+3*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines, mainWidth, 20);

    textSize(12);
    fill(0, 0, 255);

    if (durationText) {

      //println(assignmentText);
      text(typing+(frameCount/40 % 2 == 0 ? "|" : ""), headerFloat+5, 2+headerHeight+3*headerFloat+3*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines, mainWidth, 20);
      //println("HI");
      //typingWidth=int(textWidth(typing))-(mainWidth)*(assignmentLines-1);
      durationInput=typing;
      text(blurbInput, headerFloat+5, 2+headerHeight+2*headerFloat+textHeight/2+textHeight*assignmentLines+textHeight/2, mainWidth, textHeight*descriptionLines);
      text(descriptionInput, headerFloat+5, headerHeight+headerFloat+textHeight/2+2, mainWidth, textHeight*assignmentLines);
    }
    //println(durationText);
    //textSize(12);
    //fill(0, 0, 255);
    ////////////////////
    fill(153, 0, 0);
    rect((width-sidebarWidth)/2-50, headerHeight+4*headerFloat+4*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines, 100, 20, 5);  
    fill(255);
    textSize(20);
    text("DONE", (width-sidebarWidth)/2-28, headerHeight+4*headerFloat+4*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines+18);
  }

//this says, if the mouse is clicked in a certain textbox, that is the one that is currently typing. It also tracks if the user hits the done button
  void mouseClicked() {
    //println("CLICK");
    if (mouseX>headerFloat&&mouseX<headerFloat+mainWidth&&mouseY>headerHeight+headerFloat+textHeight/2&&mouseY<headerHeight+headerFloat+textHeight/2+textHeight*assignmentLines) {
      if (descriptionText=true) {
        typing=descriptionInput;
      }
      else if (durationText=true) {
        typing=durationInput;
      }
      assignmentText=true;
      descriptionText=false;
      durationText=false;
      //println("HELLO");
      //typing=descriptionInput;
    }
    else if (mouseX>headerFloat&&mouseX<headerFloat+mainWidth&&mouseY>headerHeight+2*headerFloat+textHeight/2+textHeight*assignmentLines+textHeight/2&&mouseY<headerHeight+2*headerFloat+textHeight/2+textHeight*assignmentLines+textHeight/2+textHeight*assignmentLines) {
      if (assignmentText=true) {
        typing=blurbInput;
      }
      else if (durationText=true) {
        typing=durationInput;
      }
      descriptionText=true;
      assignmentText=false;
      durationText=false;
      //typing=blurbInput;
    }
    else if (mouseX>headerFloat&&mouseX<headerFloat+mainWidth&&mouseY>headerHeight+3*headerFloat+3*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines&&mouseY<headerHeight+3*headerFloat+3*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines+descriptionHeight) {
      if (assignmentText=true) {
        typing=durationInput;
      }
      else if (descriptionText=true) {
        typing=descriptionInput;
      }

      durationText=true;
      assignmentText=false;
      descriptionText=false;
      // println("HI");
      // println(durationText);
    }
    else if (mouseX>(width-sidebarWidth)/2-50&&mouseX<(width-sidebarWidth)/2+50&&mouseY>headerHeight+4*headerFloat+4*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines&&mouseY<headerHeight+4*headerFloat+4*textHeight/2+textHeight*assignmentLines+textHeight*descriptionLines+20) {
      //println("saving");
      saveAssignment();
    }
  }

//if the user hits a key, this function tracks what they type and displays it on the screen
  void keyPressed() {
    //println(typing);
    if (key==CODED) { 
      if (key == SHIFT) {
        println("SHIFT");
        typing=typing;
      }
    }
    //else if (key == '\n' ) {
    // saved = typing;
    // typing = "";
    // } 
    else if (keyCode == BACKSPACE) {
      typing = typing.substring(0, typing.length() - 1);
      background(255);
    }
    else {
      typing = typing + key;
    }
  }

//this creates a new homework object when the user hits save, to be displayed on the homescreen.
  void saveAssignment() {
    homeworks[assignmentNumber]=new Homework(blurbInput, descriptionInput, parseInt(durationInput));
    assignmentNumber++;
    //println("Window 2" + assignmentNumber);
  }
}

//honestly, I'm not quite sure what this does. When I got the code for the new Window this came with it,
//and it's necessary to the code.
public class PFrame extends JFrame {
  public PFrame() {
    println("public pframe");
    setBounds(0, 0, 400, 300);
    s = new secondApplet();
    add(s);
    s.init();
    show();
  }
}

//this is a new class that creates an object called homework. It has a description,
//blurb, and duration.
class Homework {
  String blurb;
  String description;
  int duration;
  int spent=0;
  int completion;
  boolean running=false;

  Homework(String tempBlurb, String tempDescription, int tempDuration) {
    fill(0);
    blurb=tempBlurb;
    description=tempDescription;
    duration=tempDuration;
  }
  void display() {
    fill(0);
    textSize(12);
    text(blurb, headerFloat, headerHeight+textHeight);
    strokeWeight(1);
    text(description, headerFloat, headerHeight+textHeight*2, mainWidth, 100);
    completion();
    // text(description, 0,0);
  }
  void completion() {
    stroke(0);
    fill(255);
    rect(headerFloat, headerHeight+textHeight*3, mainWidth-headerFloat*2, 12);
    fill(0);
    text(duration-spent, headerFloat+2, headerHeight+textHeight*3+11);
    //println("test");
  }
}

