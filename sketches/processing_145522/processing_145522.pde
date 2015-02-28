
/*
 Original Character (OC) Maker by Alexa Saccone
 This is my interaction project for Building and Programming 
 Intelligent Machines Level 2: it prompts the user questions 
 about their character for a story and allows them to type in 
 their answers. The user can then take screenshots of their 
 answers to have a reference sheet (a bio) of their character.
 
 This program needs the ControlP5 library to run, which can be
 downloaded here: www.sojamo.de/libraries/controlp5 
 
 Modified from ControlP5 Textarea and ControlP5 Checkbox by Andreas Schelegel, 2012 
 www.sojamo.de/libraries/controlp5 
 I used the code for textfields and checkboxes to create spaces 
 for the user's answers to my questions; I edited the position, 
 size, and label of the textfields and checkboxes for each question 
 to create my program.
 
 Furthermore, I modified some questions and ideas from a pdf from nanowrimo.org
 (http://ywp.nanowrimo.org/files/ywp/nano_ywp_08_char_hs.pdf)
 that instructed how to create a good original character.
 */

import controlP5.*;

ControlP5 cp5;
Textarea myTextarea;
CheckBox checkbox;

int myColorBackground;
String textValue = "";


void setup() 
{
  size(700, 700);
  cp5 = new ControlP5(this);

  PFont font = createFont("arial", 20); //Creates font #1
  PFont font2 = createFont("arial", 14); //Creates font #2

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
    +" The program will NOT save your answers - make sure to take a screenshot of"
    +" each slide by taking a normal screenshot with your computer (Mac: command+shift+4, PC: Print Screen/PrtScn)"
    +" Also, make sure to follow all directions and to not write more than the textbox can hold!"
    +"                                                         "
    +" Press the ~ key to continue."
    );
}

void draw() 
{
  background(0);
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

void controlEvent(ControlEvent theEvent) //Allows textfields to work
{
  if (theEvent.isAssignableFrom(Textfield.class)) 
  {
    println("controlEvent: accessing a string from controller '"
      +theEvent.getName()+"': "
      +theEvent.getStringValue()
      );
  }
}

public void input(String theText) // automatically receives results from controller input for textfields
{
  println("a textfield event for controller 'input' : "+theText);
}

void controlEvent2(ControlEvent theEvent2) //Allows checkboxes to work
{
  if (theEvent2.isFrom(checkbox)) 
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

void keyPressed() 
{
  if (key=='~') 
  {
    myTextarea.setText("Okay, we'll start with the most basic aspect of a character - a name." //Instructions for page 1
    +" Press ! to continue."
      +"                                                                    "
      +" Note: the program begins by selecting all the textboxes, so press delete"
      +" and then select the correct box you want to write in!"
      +" Once you're finished, press @ to go on. Don't forget to take a screenshot!"
      );
  } 

  if (key=='!') 
  {
    PFont font2 = createFont("arial", 14); //Creates a textfield for the question "First name"

    cp5.addTextfield("First name") //sets label of textfield
        .setPosition(300, 50) //sets position of textfield
        .setSize(200, 40) //sets size of textfield
          .setFont(font2) //sets font
            .setFocus(true)
              .setColor(color(255, 0, 0)) //sets color
                ;

    cp5.addTextfield("Middle name") //Creates a textfield for the question "Middle name"
      .setPosition(300, 150)
        .setSize(200, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;  

    cp5.addTextfield("Last name") //Creates a textfield for the question "Last name"
      .setPosition(300, 250)
        .setSize(200, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;

    cp5.addTextfield("Nickname?") //Creates a textfield for the question "Nickname?"
      .setPosition(300, 330)
        .setSize(200, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;

    cp5.addTextfield("Do they like that nickname?") //Creates a textfield for the question "Do they like that nickname?"
      .setPosition(550, 330)
        .setSize(100, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;

    textFont(font2);
  } 

  if (key=='@') 
  {
    ((Textfield) cp5.getController("First name")).hide(); //hides textfields
    ((Textfield) cp5.getController("Middle name")).hide();
    ((Textfield) cp5.getController("Last name")).hide();
    ((Textfield) cp5.getController("Nickname?")).hide();
    ((Textfield) cp5.getController("Do they like that nickname?")).hide();

    myTextarea.setText("Intriguing name!" //Instructions for page 2
    +" Next, let's get a sense of what your character looks like."
      +" Press the # key to continue when you've finished and taken a screenshot."
      ); 

    checkbox = cp5.addCheckBox("checkBox") //Creates checkboxes for "Female vs. Male vs. Other"
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

    PFont font2 = createFont("arial", 14); //Creates font for textfields

    cp5.addTextfield("Age?") //Creates a textfield for the question "Age?"
      .setPosition(300, 125)
        .setSize(300, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;

    cp5.addTextfield("Birthday?") //Creates a textfield for the question "Birthday?"
      .setPosition(300, 225)
        .setSize(300, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("Hair color? Length? Wavy, curly, straight?") //Creates a textfield for the question "Hair color? Length? Wavy, curly, straight?"
      .setPosition(300, 325)
        .setSize(300, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("Skin tone?") //Creates a textfield for the question "Skin tone?"
      .setPosition(300, 425)
        .setSize(300, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("Eye color?") //Creates a textfield for the question "Eye color?"
      .setPosition(300, 525)
        .setSize(300, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("Nationality?") //Creates textfield for the question "Nationality?"
      .setPosition(300, 625)
        .setSize(300, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    textFont(font2);
  }

  if (key=='#') 
  {
    ((Textfield) cp5.getController("Age?")).hide(); //hides textboxes
    ((Textfield) cp5.getController("Birthday?")).hide();
    ((Textfield) cp5.getController("Hair color? Length? Wavy, curly, straight?")).hide();
    ((Textfield) cp5.getController("Skin tone?")).hide();
    ((Textfield) cp5.getController("Eye color?")).hide();
    ((Textfield) cp5.getController("Nationality?")).hide();


    myTextarea.setText("Now, we'll go a bit more into their physical aspects" //Instructions for page 3
    +" before going briefly into their family and childhood."
      +" Remember to make sure your answers fit into the textbox."
      +"                                                                 "
      +" Once you've finished with this page, press the $ key to continue. Don't forget to take a screenshot!"
      ); 

    checkbox = cp5.addCheckBox("checkBox") //Creates checkboxes for "Tall vs. Short vs. Average"
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
                          .addItem("Average", 250)
                            ;

    PFont font2 = createFont("arial", 14); //Creates a font for the textfields

    cp5.addTextfield("Any scars? If so, where?") //Creates a textfield for the question "Any scars? If so where?"
      .setPosition(300, 125)
        .setSize(350, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;

    cp5.addTextfield("Piercings or tattoos?") //Creates a textfield for the question "Piercings or tattoos?"
      .setPosition(300, 225)
        .setSize(350, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("Any siblings?") //Creates a textfield for the question "Any siblings?"
      .setPosition(300, 325)
        .setSize(350, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("What's their relationship with their parents/guardians?") //Creates a textfield for the question "What's their relationship with their parents/guardians?"
      .setPosition(300, 425)
        .setSize(350, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("Where did they grow up? Did they (overall) have a happy childhood?") //Creates a textfield for the question "Where did they grow up? Did they (overall) have a happy childhood?"
      .setPosition(300, 525)
        .setSize(350, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("Significant other? Children? Important relatives?") //Creates a textfield for the question "Signifcant other? Children? Important relatives?"
      .setPosition(300, 625)
        .setSize(350, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    textFont(font2);
  }

  if (key=='$') 
  {
    ((Textfield) cp5.getController("Any scars? If so, where?")).hide(); //hides textfields
    ((Textfield) cp5.getController("Piercings or tattoos?")).hide();
    ((Textfield) cp5.getController("Any siblings?")).hide();
    ((Textfield) cp5.getController("What's their relationship with their parents/guardians?")).hide();
    ((Textfield) cp5.getController("Where did they grow up? Did they (overall) have a happy childhood?")).hide();
    ((Textfield) cp5.getController("Significant other? Children? Important relatives?")).hide();

     myTextarea.setText("Okay, last page!" //Instructions for last page
    +" We just need to get to know their personality a bit."
      +" Remember to make sure your answers fit in the textbox, and that you take a screenshot."
      +"                                                         "
      +" Once you've finished: good job, you've successfully created an OC!"
      +" Now you can start writing and get to know your new OC better."
      ); 

    checkbox = cp5.addCheckBox("checkBox") //Creates checkboxes for traits of "Introvert vs. Extrovert vs. Ambivert"
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

    checkbox = cp5.addCheckBox("checkBox1") //Creates checkboxes for traits of "Intelligent vs. Average vs. Dimwitted"
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

    checkbox = cp5.addCheckBox("checkBox2") //Creates checkboxes for traits of "Honest vs. Liar vs. Stretches truth when necessary"
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

    checkbox = cp5.addCheckBox("checkBox3") //Creates checkboxes for the traits of "Leader vs. Follower"
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

    checkbox = cp5.addCheckBox("checkBox4") //Creates checkboxes for the traits of "Mature vs. Naive"
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

    checkbox = cp5.addCheckBox("checkBox5") //Creates checkboxes for the traits of "Sarcastic vs. Sincere"
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

    checkbox = cp5.addCheckBox("checkBox6") //Creates checkboxes for the traits of "Humble vs. Proud"
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

    PFont font2 = createFont("arial", 14); //Creates a font for the text boxes

    cp5.addTextfield("Best quality?") //Creates a textfield for the question "Best quality?"
      .setPosition(100, 425)
        .setSize(285, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("Worst quality?") //Creates a textfield for the question "Worst quality?"
      .setPosition(400, 425)
        .setSize(285, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("Major hobbies, interests, favorites?") //Creates a textfield for the question "Major hobbies, interests, favorites?"
      .setPosition(100, 525)
        .setSize(575, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    cp5.addTextfield("Anything else important or noteworthy?") //Creates a textfield for the question "Anything else important or noteworthy?"
      .setPosition(100, 625)
        .setSize(575, 40)
          .setFont(font2)
            .setFocus(true)
              .setColor(color(255, 0, 0))
                ;
    textFont(font2);
  }
}
