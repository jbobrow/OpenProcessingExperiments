
/*
 Original Character (OC) Maker by Alexa Saccone
 Lick Wilmerding High School, May-June 2014
 With help from Ms. Freed.
 
 This is my final project for Building and Programming 
 Intelligent Machines Level 2: I continued working on my
 interaction project, by changing the interface and 
 making it more user-friendly. The OC Maker  prompts the 
 user questions about their character for a story and allows 
 them to type in their answers. The user can then take screenshots 
 of their answers to have a reference sheet (a bio) of their character.
 
 This program needs the ControlP5 library to run, which can be
 downloaded here: www.sojamo.de/libraries/controlp5 
 
 Modified from ControlP5 Textarea, Checkbox, and Tab by Andreas Schelegel, 2012 
 www.sojamo.de/libraries/controlp5 
 I used the code for textfields and checkboxes to create spaces 
 for the user's answers to my questions; I edited the position, 
 size, and label of the textfields and checkboxes for each question 
 to create my program.
 I also used the code for tabs - although I changed the color, the
 amount of tabs, labels, and what is contained in each tab.
 
 Furthermore, I modified some questions and ideas from a pdf from nanowrimo.org
 (http://ywp.nanowrimo.org/files/ywp/nano_ywp_08_char_hs.pdf)
 that instructed how to create a good original character.
 */

import controlP5.*;

ControlP5 cp5;
Textarea myTextarea;
CheckBox checkbox;

String textValue = "";

int myColorBackground = color(128);


void setup() 
{
  size(700, 700);
  noStroke();
  cp5 = new ControlP5(this);

  cp5.addTab("Name") //Creates a new tab
      .setColorBackground(color(135, 160, 27))
      .setColorLabel(color(255))
        .setColorActive(color(182, 216, 31))
          ;

  cp5.addTab("Appearance") 
    .setColorBackground(color(234, 194, 90))
      .setColorLabel(color(255))
        .setColorActive(color(255, 214, 111))
          ;

  cp5.addTab("Appearance Continued + Family") 
    .setColorBackground(color(173, 95, 31)) 
      .setColorLabel(color(255))
        .setColorActive(color(232, 137, 59)) 
          ;

  cp5.addTab("Personality + Misc")
    .setColorBackground(color(139, 28, 28))
      .setColorLabel(color(255))
        .setColorActive(color(165, 5, 5))
          ;

  cp5.getTab("default")
    .activateEvent(true)
      .setLabel("Intro")
        .setId(1)
          ;

  cp5.getTab("Name")
    .activateEvent(true)
      .setId(2)
        ;

  cp5.getTab("Appearance")
    .activateEvent(true)
      .setId(3)
        ;

  cp5.getTab("Appearance Continued + Family")
    .activateEvent(true)
      .setId(4)
        ;

  cp5.getTab("Personality + Misc")
    .activateEvent(true)
      .setId(5)
        ;


  myTextarea = cp5.addTextarea("txt") //Adds text area for instructions/introduction
    .setPosition(50, 50) //sets position
      .setSize(200, 200) //sets size
        .setFont(createFont("arial", 14)) //sets and creates font
          .setLineHeight(14)
            .setColor(color(255)) 
              .setColorBackground(color(255, 100))
                .setColorForeground(color(255, 100));
  ;

  myTextarea.setText("Hello, welcome to the OC Maker!" //Introduction of program
  +"                                                                           "
    +" Here, I'll help you create an OC (original character) by asking"
    +" questions about your undoubtably awesome and 3-dimensional character."
    +" Although the program will save your answers while running, make sure to take a screenshot of"
    +" each slide by taking a normal screenshot with your computer (Mac: command+shift+4, PC: PrtScn)"
    +" once you've finished filling out the questions."
    +" Click on each tab to navigate back and forth between slides."
    );

  PFont font2 = createFont("arial", 14); //Creates a font for the question "First name"

  cp5.addTextfield("First name") //Creates a textfield
      .setPosition(300, 50) 
      .setSize(200, 40)
        .setFont(font2) 
          .setFocus(true)
            .setColor(color(196, 235, 243)) 
              ;

  cp5.addTextfield("Middle name") 
    .setPosition(300, 150)
      .setSize(200, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;  

  cp5.addTextfield("Last name") 
    .setPosition(300, 250)
      .setSize(200, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;

  cp5.addTextfield("Nickname?") 
    .setPosition(300, 330)
      .setSize(200, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;

  cp5.addTextfield("Do they like that nickname?")
    .setPosition(550, 330)
      .setSize(100, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;

  cp5.addTextfield("Age?") 
    .setPosition(300, 125)
      .setSize(300, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;

  cp5.addTextfield("Birthday?") 
    .setPosition(300, 225)
      .setSize(300, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Hair color? Length? Wavy, curly, straight?") 
    .setPosition(300, 325)
      .setSize(300, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Most distinguishing facial feature?") 
    .setPosition(300, 425)
      .setSize(300, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Eye color?") 
    .setPosition(300, 525)
      .setSize(300, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Nationality?") 
    .setPosition(300, 625)
      .setSize(300, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;

  cp5.addTextfield("Any scars? If so, where?") 
    .setPosition(300, 125)
      .setSize(350, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;

  cp5.addTextfield("Piercings or tattoos?") 
    .setPosition(300, 225)
      .setSize(350, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Any siblings?") 
    .setPosition(300, 325)
      .setSize(350, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("What's their relationship with their parents/guardians?") 
    .setPosition(300, 425)
      .setSize(350, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Where did they grow up? Did they (overall) have a happy childhood?") 
    .setPosition(300, 525)
      .setSize(350, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Significant other? Children? Important relatives?") 
    .setPosition(300, 625)
      .setSize(350, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Best quality?") 
    .setPosition(100, 425)
      .setSize(285, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Worst quality?") 
    .setPosition(400, 425)
      .setSize(285, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Major hobbies, interests, favorites?") 
    .setPosition(100, 525)
      .setSize(575, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  cp5.addTextfield("Anything else important or noteworthy?")
    .setPosition(100, 625)
      .setSize(575, 40)
        .setFont(font2)
          .setFocus(true)
            .setColor(color(196, 235, 243))
              ;
  textFont(font2);

  checkbox = cp5.addCheckBox("checkBox") //Creates checkboxes
    .setPosition(300, 50) //Sets position
      .setColorForeground(color(120)) //Sets color when mouse is hovering
        .setColorActive(color(255)) //Sets color selected
          .setColorLabel(color(255)) //Sets color of label
            .setSize(40, 40) //Sets size of each box
              .setItemsPerRow(3) //Sets # of boxes per row
                .setSpacingColumn(40) //Sets spacing between each box (column)
                  .setSpacingRow(20) //Sets spacing between each box (row)
                    .addItem("Female", 150) //Adds checkbox "Female"
                      .addItem("Male", 200) 
                        .addItem("Other", 250)
                          ;
  checkbox = cp5.addCheckBox("checkBox1") 
    .setPosition(300, 50)
      .setColorForeground(color(120))
        .setColorActive(color(255))
          .setColorLabel(color(255))
            .setSize(40, 40)
              .setItemsPerRow(3)
                .setSpacingColumn(40)
                  .setSpacingRow(20)
                    .addItem("Tall", 150)
                      .addItem("Short", 200)
                        .addItem("Average Height", 250)
                          ;

  checkbox = cp5.addCheckBox("checkBox2") 
    .setPosition(300, 50)
      .setColorForeground(color(120))
        .setColorActive(color(255))
          .setColorLabel(color(255))
            .setSize(40, 40)
              .setItemsPerRow(3)
                .setSpacingColumn(60)
                  .setSpacingRow(20)
                    .addItem("Introvert", 150)
                      .addItem("Extrovert", 350)
                        .addItem("Ambivert", 550)
                          ;

  checkbox = cp5.addCheckBox("checkBox3") 
    .setPosition(300, 100)
      .setColorForeground(color(120))
        .setColorActive(color(255))
          .setColorLabel(color(255))
            .setSize(40, 40)
              .setItemsPerRow(3)
                .setSpacingColumn(60)
                  .setSpacingRow(20)
                    .addItem("Intelligent", 150)
                      .addItem("Average", 350)
                        .addItem("Dimwitted", 550)
                          ;

  checkbox = cp5.addCheckBox("checkBox4") 
    .setPosition(300, 150)
      .setColorForeground(color(120))
        .setColorActive(color(255))
          .setColorLabel(color(255))
            .setSize(40, 40)
              .setItemsPerRow(3)
                .setSpacingColumn(60)
                  .setSpacingRow(20)
                    .addItem("Honest", 150)
                      .addItem("Liar", 350)
                        .addItem("Stretches truth when necessary", 550)
                          ;

  checkbox = cp5.addCheckBox("checkBox5") 
    .setPosition(300, 200)
      .setColorForeground(color(120))
        .setColorActive(color(255))
          .setColorLabel(color(255))
            .setSize(40, 40)
              .setItemsPerRow(2)
                .setSpacingColumn(60)
                  .setSpacingRow(20)
                    .addItem("Leader", 150)
                      .addItem("Follower", 350)
                        ;

  checkbox = cp5.addCheckBox("checkBox6") 
    .setPosition(300, 250)
      .setColorForeground(color(120))
        .setColorActive(color(255))
          .setColorLabel(color(255))
            .setSize(40, 40)
              .setItemsPerRow(2)
                .setSpacingColumn(60)
                  .setSpacingRow(20)
                    .addItem("Mature", 150)
                      .addItem("Naive", 350)
                        ;

  checkbox = cp5.addCheckBox("checkBox7") 
    .setPosition(300, 300)
      .setColorForeground(color(120))
        .setColorActive(color(255))
          .setColorLabel(color(255))
            .setSize(40, 40)
              .setItemsPerRow(2)
                .setSpacingColumn(60)
                  .setSpacingRow(20)
                    .addItem("Sarcastic", 150)
                      .addItem("Sincere", 350)
                        ;

  checkbox = cp5.addCheckBox("checkBox8") 
    .setPosition(300, 350)
      .setColorForeground(color(120))
        .setColorActive(color(255))
          .setColorLabel(color(255))
            .setSize(40, 40)
              .setItemsPerRow(2)
                .setSpacingColumn(60)
                  .setSpacingRow(20)
                    .addItem("Humble", 150)
                      .addItem("Proud", 350)
                        ;
  myTextarea = cp5.addTextarea("txt1") //Adds text area for "name" tab
    .setPosition(50, 50) //sets position
      .setSize(200, 200) //sets size
        .setFont(createFont("arial", 14)) //sets and creates font
          .setLineHeight(14)
            .setColor(color(255)) 
              .setColorBackground(color(255, 100))
                .setColorForeground(color(255, 100))
                  ;
  myTextarea.setText("We'll start with the most basic aspect of a character - a name."
    +" To write in your answers, click on the textfield you want to type in.  "
    );

  myTextarea = cp5.addTextarea("txt2") //Adds text area for "Appearance" tab
    .setPosition(50, 50) 
      .setSize(200, 200) 
        .setFont(createFont("arial", 14)) 
          .setLineHeight(14)
            .setColor(color(255)) 
              .setColorBackground(color(255, 100))
                .setColorForeground(color(255, 100))
                  ;
  myTextarea.setText("Intriguing name!" 
    +" Next, let's get a sense of what your character looks like."
    ); 

  myTextarea = cp5.addTextarea("txt3") //Adds text area for "Appearance + Family" tab
    .setPosition(50, 50) 
      .setSize(200, 200) 
        .setFont(createFont("arial", 14)) 
          .setLineHeight(14)
            .setColor(color(255)) 
              .setColorBackground(color(255, 100))
                .setColorForeground(color(255, 100))
                  ;
  myTextarea.setText("Now, we'll go a bit more into their physical aspects" 
    +" before going briefly into their family and childhood."
    +" Remember to make sure your answers fit into the textbox."
    ); 

  myTextarea = cp5.addTextarea("txt4") //Adds text area for last tab
    .setPosition(50, 50) 
      .setSize(200, 200) 
        .setFont(createFont("arial", 14)) 
          .setLineHeight(14)
            .setColor(color(255)) 
              .setColorBackground(color(255, 100))
                .setColorForeground(color(255, 100))
                  ;
  myTextarea.setText("Okay, last page!"
    +" We just need to get to know their personality a bit."
    +" Remember to make sure your answers fit in the textbox, and that you have taken a screenshot"
    +" of every slide.                                                                "
    +" Once you've finished: good job, you've successfully created an OC!"
    +" Now you can start writing and get to know your new OC better."
    ); 

  // arrange controllers in separate tabs
  ((Textfield) cp5.getController("First name")).moveTo("Name"); //moves controller to a certain tab
  ((Textfield) cp5.getController("Middle name")).moveTo("Name");
  ((Textfield) cp5.getController("Last name")).moveTo("Name");
  ((Textfield) cp5.getController("Nickname?")).moveTo("Name");
  ((Textfield) cp5.getController("Do they like that nickname?")).moveTo("Name");
  ((ControllerGroup) cp5.getGroup("txt1")).moveTo("Name");

  ((Textfield) cp5.getController("Age?")).moveTo("Appearance"); 
  ((Textfield) cp5.getController("Birthday?")).moveTo("Appearance");
  ((Textfield) cp5.getController("Hair color? Length? Wavy, curly, straight?")).moveTo("Appearance");
  ((Textfield) cp5.getController("Most distinguishing facial feature?")).moveTo("Appearance");
  ((Textfield) cp5.getController("Eye color?")).moveTo("Appearance");
  ((Textfield) cp5.getController("Nationality?")).moveTo("Appearance");
  ((ControllerGroup) cp5.getGroup("checkBox")).moveTo("Appearance");
  ((ControllerGroup) cp5.getGroup("txt2")).moveTo("Appearance");

  ((Textfield) cp5.getController("Any scars? If so, where?")).moveTo("Appearance Continued + Family"); 
  ((Textfield) cp5.getController("Piercings or tattoos?")).moveTo("Appearance Continued + Family");
  ((Textfield) cp5.getController("Any siblings?")).moveTo("Appearance Continued + Family");
  ((Textfield) cp5.getController("What's their relationship with their parents/guardians?")).moveTo("Appearance Continued + Family");
  ((Textfield) cp5.getController("Where did they grow up? Did they (overall) have a happy childhood?")).moveTo("Appearance Continued + Family");
  ((Textfield) cp5.getController("Significant other? Children? Important relatives?")).moveTo("Appearance Continued + Family");
  ((ControllerGroup) cp5.getGroup("checkBox1")).moveTo("Appearance Continued + Family");
  ((ControllerGroup) cp5.getGroup("txt3")).moveTo("Appearance Continued + Family");

  ((Textfield) cp5.getController("Best quality?")).moveTo("Personality + Misc"); //hides textfields
  ((Textfield) cp5.getController("Worst quality?")).moveTo("Personality + Misc");
  ((Textfield) cp5.getController("Major hobbies, interests, favorites?")).moveTo("Personality + Misc");
  ((Textfield) cp5.getController("Anything else important or noteworthy?")).moveTo("Personality + Misc");
  ((ControllerGroup) cp5.getGroup("checkBox2")).moveTo("Personality + Misc");
  ((ControllerGroup) cp5.getGroup("checkBox3")).moveTo("Personality + Misc");
  ((ControllerGroup) cp5.getGroup("checkBox4")).moveTo("Personality + Misc");
  ((ControllerGroup) cp5.getGroup("checkBox5")).moveTo("Personality + Misc");
  ((ControllerGroup) cp5.getGroup("checkBox6")).moveTo("Personality + Misc");
  ((ControllerGroup) cp5.getGroup("checkBox7")).moveTo("Personality + Misc");
  ((ControllerGroup) cp5.getGroup("checkBox8")).moveTo("Personality + Misc");
  ((ControllerGroup) cp5.getGroup("txt4")).moveTo("Personality + Misc");
}

void draw() 
{
  background(0); //background
  pushMatrix();
  translate(width/2 + 200, height/2);
  stroke(255);
  strokeWeight(2);
  fill(myColorBackground);
  popMatrix();
  if (keyPressed && key==' ') //Allows user to scroll down textfields
  {
    myTextarea.scroll((float)mouseX/(float)width);
  }
  fill(255);
  text(textValue, 360, 180);
}

void controlEvent(ControlEvent theControlEvent) //allows tabs to work
{
  if (theControlEvent.isTab())
  {
    println("got an event from tab : "+theControlEvent.getTab().getName()+" with id "+theControlEvent.getTab().getId());
  }
}

void keyPressed() //takes user to the "Intro" tab if tab is pressed
{
  if (keyCode==TAB) 
  {
    cp5.getTab("default").bringToFront();
  }
}

void controlEvent2(ControlEvent theEvent2) //Allows textfields to work
{
  if (theEvent2.isAssignableFrom(Textfield.class)) 
  {
    println("controlEvent: accessing a string from controller '"
      +theEvent2.getName()+"': "
      +theEvent2.getStringValue()
      );
  }
}

public void input(String theText) // automatically receives results from controller input for textfields
{
  println("a textfield event for controller 'input' : "+theText);
}

void controlEvent3(ControlEvent theEvent3) //Allows checkboxes to work
{
  if (theEvent3.isFrom(checkbox)) 
  {
    myColorBackground = 0;
    print("got an event from "+checkbox.getName()+"\t\n");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
    println(checkbox.getArrayValue());
    int col = 0;
    for (int i=0;i<checkbox.getArrayValue().length;i++) {
      int n = (int)checkbox.getArrayValue()[i];
      print(n);
      if (n==1) {
        myColorBackground += checkbox.getItem(i).internalValue();
      }
    }
    println();
  }
}

void checkBox(float[] a) //Receives results from controller's input for checkboxes
{
  println(a);
}

