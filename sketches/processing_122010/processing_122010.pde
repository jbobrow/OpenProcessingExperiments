
//Import libraries to make use of file streaming facilities
import java.io.BufferedWriter;
import java.io.FileWriter;

//Declare objects of classes
Menu menu1 = new Menu();
Food food1 = new Food();
Collection Collection1 = new Collection();
WordCloud wordCloud1 = new WordCloud();

//Declare boolean values to highlight which part of the program should loop
boolean menuActive = true;
boolean foodActive = false;
boolean CollectionActive = false;
boolean wordCloudActive = false;

/**
 * Method to run when the program starts
 *
 * @param No parameters
 * @return No return
 */
void setup()
{
  //Set size of sketch
  size(800, 600);

  //Background image
  PImage finished_photo;
  finished_photo = loadImage("background.jpg");
  finished_photo.resize(800, 600);
  image(finished_photo, 0, 0);
}

/**
 * Method to continue to loop until told otherwise
 *
 * @param No parameters
 * @return No return
 */
void draw()
{
  //These are essentially logic gates because there were problems
  //with unwanted methods running over and over again

  //Menu system
  if (menuActive == true)
  { 
    //Call right method
    menu1.selection();
  }

  //Input window
  if (foodActive == true)
  {
    //Call right method
    food1.selection();
  }

  //Write to file
  if (CollectionActive == true)
  {
    //Call right method
    Collection1.input();
  }

  //Read from file and create word cloud
  if (wordCloudActive == true)
  {
    //Call right method
    wordCloud1.readFile();
  }
}

/**
 * Class for the menu system
 */
class Menu
{
  /**
   * Method to display the menu 
   * 
   * I didn't know how to draw hexagons in processing, I used part of this person's code:
   * http://www.openprocessing.org/sketch/26607
   * I've edited it quite a bit, but I have included start/ end indicators for the main part
   *
   * @param No parameters
   * @return No return
   */
  void display()
  {
    //Declare local variables
    float x_c = 115;
    float y_c = 194; 
    float side = 130;
    float x_v1;
    float y_v1;
    float x_v2;
    float y_v2;
    float x_v3;
    float y_v3;
    float x_v4;
    float y_v4;
    float x_v5;
    float y_v5;
    float x_v6;
    float y_v6;

    //These values are for the 'Add a food' button
    //Set colour to the returned value of the 'Add a food' button depending on with/out mouse hover
    int c = hover_AddAFood();

    //option is the text on top of the buttons 
    String option;
    option = "Add a food";

    //Loop 3 times (for each button)
    for (int i = 0; i < 3; i++)
    {
      //For 'Update my cloud' button do this
      if (i == 1)
      {
        //Change the button areas positions
        x_c = 251;
        y_c = 327; 
        //Change it's size
        side = 147;

        //Change the button's title
        option = "Update my cloud";
        //Change the button's colour depending on with/out mouse hover
        c = hover_UpdateMyCloud();
      }
      //For 'Quit' button do this 
      else if (i == 2)
      {
        //Change the button areas positions
        x_c = 133;
        y_c = 471; 
        //Change it's size
        side = 113;

        //Change the button's title
        option = "Quit";
        //Change the button's colour depending on with/out mouse hover
        c = hover_Quit();
      }


      //This draws the hexagon shape depending on its x and y positions and size
      //This part is the key part borrowed from the person's code
      x_v1 = x_c - (side /4) * 3;
      y_v1 = y_c;

      x_v2 = x_c - (side * 0.375);
      y_v2 = y_c + (side * 0.65);

      x_v3 = x_c + (side * 0.375);
      y_v3 = y_c + (side * 0.65);

      x_v4 = x_c + (side /4) * 3;
      y_v4 = y_c;

      x_v5 = x_c + (side * 0.375);
      y_v5 = y_c - side * 0.65;

      x_v6 = x_c - (side * 0.375);
      y_v6 = y_c - side * 0.65;


      //This is the colour of the button depending on if the mouse is over the button or not
      fill(c);
      //Border colour of the buttons
      stroke(148, 181, 70);
      //Width of border
      strokeWeight(4);

      //Draw the hexagon
      beginShape();
      vertex(x_v1, y_v1);
      vertex(x_v2, y_v2);
      vertex(x_v3, y_v3);
      vertex(x_v4, y_v4);
      vertex(x_v5, y_v5);
      vertex(x_v6, y_v6);
      endShape(CLOSE);

      //End of key part from the person's code

      //This is for the title of the buttons
      //Text colour
      fill(90, 115, 41);
      //Text alignment
      textAlign(CENTER);
      //Text size
      textSize(20);
      //Print text
      text(option, x_c, y_c);
    }
  }

  /**
   * Method to check if mouse is on 'Add a food' 
   * button and change the colour if it is
   *
   * @param  No parameters
   * @return Integer (the button's colour)
   */
  int hover_AddAFood()
  {
    //Button's colour
    int buttonColour;
    //Button's area
    if (((mouseX > 66.25) && (mouseX < 163.75)) && ((mouseY > 105.5) && (mouseY < 278.5)))
    {
      //If the mouse is on the button then change it's colour
      buttonColour = color(114, 146, 53);
      //Return button's colour
      return buttonColour;
    }
    else 
    {
      //If the mouse is not on the button then the button should be normal colour
      buttonColour = color(207, 236, 116);
      //Return button's colour
      return buttonColour;
    }
  }

  /**
   * Method to check if mouse is on 'Update my cloud' 
   * button and change the colour if it is
   *
   * @param  No parameters
   * @return Integer (the button's colour)
   */
  int hover_UpdateMyCloud()
  {
    //Button's colour
    int buttonColour;
    //Button's area
    if (((mouseX > 195.875) && (mouseX < 306.125)) && ((mouseY > 231.45) && (mouseY < 422.55)))
    {
      //If the mouse is on the button then change it's colour
      buttonColour = color(114, 146, 53);
      //Return button's colour
      return buttonColour;
    }
    else 
    {
      //If the mouse is not on the button then the button should be normal colour
      buttonColour = color(207, 236, 116);
      //Return button's colour
      return buttonColour;
    }
  }

  /**
   * Method to check if mouse is on 'Quit' 
   * button and change the colour if it is
   *
   * @param  No parameters
   * @return Integer (the button's colour)
   */
  int hover_Quit()
  {
    //Button's colour
    int buttonColour;
    //Button's area
    if (((mouseX > 90.625) && (mouseX < 175.375)) && ((mouseY > 397.55) && (mouseY < 544.45)))
    {
      //If the mouse is on the button then change it's colour
      buttonColour = color(114, 146, 53);
      //Return button's colour
      return buttonColour;
    }
    else 
    {
      //If the mouse is not on the button then the button should be normal colour
      buttonColour = color(207, 236, 116);
      //Return button's colour
      return buttonColour;
    }
  }

  /**
   * Method check if an option has been selected
   *
   * @param No parameters
   * @return No return
   */
  void selection()
  {
    //Redisplay menu
    menu1.display();

    //Value for the button's colour
    int check;
    //Get button's colour and assign it to check
    check = hover_AddAFood();

    //If the mouse is on 'Add a food' button and the user clicks then do this
    if (check == color(114, 146, 53) && (mousePressed == true))
    {
      //Clear word cloud space
      noStroke(); 
      fill(255);
      rect(400, 80, 400, 550);

      //Menu is no longer needed
      menuActive = false;
      //Input window needed
      foodActive = true;
    }

    //Get button's colour and assign it to check
    check = hover_UpdateMyCloud();

    //If the mouse is on 'Add a food' button and the user clicks then do this
    if (check == color(114, 146, 53) && (mousePressed == true))
    {
      //Menu is no longer needed
      menuActive = false;
      //Word cloud is needed
      wordCloudActive = true;
    }

    //Get button's colour and assign it to check
    check = hover_Quit();

    //If the mouse is on 'Add a food' button and the user clicks then do this
    if (check == color(114, 146, 53) && (mousePressed == true))
    {
      //Quit program
      exit();
    }
  }
}


/**
 * Class to take in entered food from the user
 */
class Food
{
  /**
   * Method to display the input window
   * 
   * @param No parameters
   * @return No return
   */
  public void display()
  {
    //Set colour to the returned value of the quit button depending on with/out mouse hover
    int c = hover_Quit();

    //Border colour
    stroke(148, 181, 70);
    //Border width
    strokeWeight(4);
    //Window colour
    fill(207, 236, 116);
    //Draw window
    rect(400, 200, 300, 200);

    //Quit button colour
    fill(c);
    //Draw quit button
    rect(670, 210, 20, 20);

    //This is for the title the quit button
    //Text colour
    fill(90, 115, 41);
    //Text alignment
    textAlign(LEFT);
    //Print text
    text("Add a food", 410, 230);

    //Change the button's colour depending on with/out mouse hover on delete button
    c = hover_Delete();
    //Set delete button's colour
    fill(c);
    //Draw delete button
    rect(430, 260, 240, 40);

    //This is for the title the delete button
    //Text colour
    fill(90, 115, 41);
    //Text alignment
    textAlign(CENTER);
    //Text size
    textSize(20);
    //Print text
    text("Clear all food", 550, 290);

    //Change the button's colour depending on with/out mouse hover on input button
    c = hover_Input();
    //Set input button's colour
    fill(c);
    //Draw input button
    rect(430, 330, 240, 40);

    //This is for the title the input button
    //Text colour
    fill(90, 115, 41);
    //Text alignment
    textAlign(CENTER);
    //Text size
    textSize(20);
    //Print text
    text("Enter food", 550, 360);
  }

  /**
   * Method to check if mouse is on the quit box 
   * button and change the colour if it is
   *
   * @param  No parameters
   * @return Integer (the button's colour)
   */
  int hover_Quit()
  { 
    //Button's colour
    int buttonColour;
    //Button's area
    if (((mouseX > 670) && (mouseX < 690)) && ((mouseY > 210) && (mouseY < 230)))
    {
      //If the mouse is on the button then change it's colour
      buttonColour = color(114, 146, 53);
      //Return button's colour
      return buttonColour;
    }
    else
    {
      //If the mouse is not on the button then the button should be normal colour
      buttonColour = color(207, 236, 116);
      //Return button's colour
      return buttonColour;
    }
  }

  /**
   * Method to check if mouse is on the delete box 
   * button and change the colour if it is
   *
   * @param  No parameters
   * @return Integer (the button's colour)
   */
  int hover_Delete()
  {
    //Button's colour
    int buttonColour;
    //Button's area
    if (((mouseX > 430) && (mouseX < 670)) && ((mouseY > 260) && (mouseY < 300)))
    {
      //If the mouse is on the button then change it's colour
      buttonColour = color(114, 146, 53);
      //Return button's colour
      return buttonColour;
    }
    else
    {
      //If the mouse is not on the button then the button should be normal colour
      buttonColour = color(207, 236, 116);
      //Return button's colour
      return buttonColour;
    }
  }

  /**
   * Method to check if mouse is on the input box 
   * button and change the colour if it is
   *
   * @param  No parameters
   * @return Integer (the button's colour)
   */
  int hover_Input()
  {
    //Button's colour
    int buttonColour;
    //Button's area
    if (((mouseX > 430) && (mouseX < 670)) && ((mouseY > 330) && (mouseY < 370)))
    {
      //If the mouse is on the button then change it's colour
      buttonColour = color(114, 146, 53);
      //Return button's colour
      return buttonColour;
    }
    else
    {
      //If the mouse is not on the button then the button should be normal colour
      buttonColour = color(207, 236, 116);
      //Return button's colour
      return buttonColour;
    }
  }

  /**
   * Method check if an option has been selected
   *
   * @param No parameters
   * @return No return
   */
  void selection()
  {
    //Redisplay input window
    display();

    //Value for the button's colour
    int check;
    //Get button's colour and assign it to check
    check = hover_Quit();

    //If the mouse is on 'Add a food' button and the user clicks then do this
    if (check == color(114, 146, 53) && (mousePressed == true))
    {
      //Input window is no longer needed
      foodActive = false;
      //Menu is needed
      menuActive = true;
      //Start from the beginning
      setup();
    }

    //Get button's colour and assign it to check
    check = hover_Delete();
    //If the mouse is on 'Add a food' button and the user clicks then do this
    if (check == color(114, 146, 53) && (mousePressed == true))
    {
      //This is to clear the contents of the food file
      //Basically just overwrites it with a blank value
      //Make a string and assign it a blank
      String words = "   ";   
      //Array to hold blank value    
      String[] empty = split(words, " ");
      //Save this blank to the food file
      saveStrings("data/Food_cloud.txt", empty);

      //Button's colour (colour when highlighted)
      fill(114, 146, 53);
      //Draw delete button
      rect(430, 260, 240, 40);
      //Text colour
      fill(90, 115, 41);
      //Text alignment
      textAlign(CENTER);
      //Text size
      textSize(20);
      //Print text
      text("All food cleared", 550, 290);
    }

    //Get button's colour and assign it to check
    check = hover_Input();
    //If the mouse is on 'Add a food' button and the user clicks then do this
    if (check == color(114, 146, 53) && (mousePressed == true))
    {
      //Button's colour (colour when highlighted)
      fill(114, 146, 53);
      //Draw input button
      rect(430, 330, 240, 40);
      //Text colour
      fill(90, 115, 41);
      //Text alignment
      textAlign(CENTER);
      //Text size
      textSize(20);
      //Print text
      text("Type here...", 550, 360);

      //Input window is no longer needed
      foodActive = false;
      //Write to file needed
      CollectionActive = true;
    }
  }
}

/**
 * Class to write entered food to file
 */
class Collection
{
  //Declare global class variables
  String outFilename = "Food_cloud.txt";
  String myText = "";

  /**
   * Method to allow editing of written food
   *
   * @param No parameters
   * @return No return
   */
  void input()
  {
    //
    text(myText, 550, 360);

    //Text alignment
    textAlign(CENTER);
    //Text size
    textSize(20);
    //Text colour
    fill(90, 115, 41);

    //Depending on what key has been pressed do
    if (keyPressed == true)
    {
      if (key != CODED) {
        switch(key) {

          //Backspace pressed, take away a character from the typed food
        case BACKSPACE:
          //Blank out the current string
          fill(114, 146, 53);
          rect(430, 330, 240, 40);
          //Text colour
          fill(90, 115, 41);
          //Print updated text
          myText = myText.substring(0, max(0, myText.length()-1));
          //Key no longer is needed to be pressed
          keyPressed = false;
          //Break out of switch statement
          break;

          //Enter pressed, input typed food to file
        case ENTER:
          //Call method to write typed food to the next available line of the text file
          appendTextToFile(outFilename, myText);
          //Blank out the input box
          fill(114, 146, 53);
          rect(430, 330, 240, 40);

          //Text colour
          fill(90, 115, 41);
          //Text alignment
          textAlign(CENTER);
          //Text size
          textSize(20);
          //Print out message
          text("Press TAB to stop", 550, 360);
          //Key no longer is needed to be pressed
          keyPressed = false;
          //Typed text is nothing now
          myText = "";
          //Break out of switch statement
          break;

          //Tab pressed, exit input box
        case TAB:
          //Write to file is no longer needed
          CollectionActive = false;
          //Input window is needed
          foodActive = true;
          //Key no longer is needed to be pressed
          keyPressed = false;
          //Break out of switch statement
          break;

          //Other key pressed, probably a character making up the name of the typed food
        default:
          //Blank out the input box
          fill(114, 146, 53);
          rect(430, 330, 240, 40);
          //Text colour
          fill(90, 115, 41);
          //Add pressed key to typed string
          myText += key;
          //Print updated string
          text(myText, 550, 360);
          //Key no longer is needed to be pressed
          keyPressed = false;
          //Break out of switch statement
          break;
        }
      }
    }
  }

  /**
   * Method to write entered food to the next avaliable line
   * 
   * Had trouble with the program overwriting the file every time the user entered
   * a new food, used this person's code:
   * http://stackoverflow.com/questions/17010222/how-do-i-append-text-to-a-csv-txt-file-in-processing
   *
   */

  //Person's code starts

  /**
   * Appends text to the end of a text file located in the data directory, 
   * creates the file if it does not exist.
   * Can be used for big files with lots of rows, 
   * existing lines will not be rewritten
   *
   * @param String filename, String text (where to write, what to write)
   * @return No return
   */
  void appendTextToFile(String filename, String text) 
  {
    File f = new File(dataPath(filename));
    if (!f.exists()) 
    {
      //Call method to create a new file
      createFile(f);
    }
    try 
    {
      PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
      out.println(text);
      out.close();
    }
    catch (IOException e) 
    {
      e.printStackTrace();
    }
  }

  /**
   * Creates a new file including all subfolders
   *
   * @param File f 
   * @return No return
   */
  void createFile(File f) {
    File parentDir = f.getParentFile();
    try {
      parentDir.mkdirs(); 
      f.createNewFile();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  //Person's code ends
}

/**
 * Class to read from file and create a word cloud from the contents
 */
class WordCloud
{

  /**
   * Method to open file to read
   *
   * @param No parameters
   * @return BufferedReader object reader
   */
  public BufferedReader openFileToRead()
  {

    //Create an object of BufferedReader
    BufferedReader reader;

    //Open Food_cloud.txt
    reader = createReader("Food_cloud.txt"); 

    //Return reader (object of BufferedReader)
    return reader;
  }

  /**
   * Method to allow editing of written food
   *
   * @param No parameters
   * @return No return
   */
  void readFile()
  {
    //Blank out word cloud area
    noStroke(); 
    fill(255);
    rect(400, 80, 400, 550);

    //String to hold read line
    String line;


    try {
      //Call method to open file to read from
      BufferedReader reader = openFileToRead();

      //Read a line of text and store it in line
      line = reader.readLine();

      //Declare a String to hold to entire contents of the text file
      String entireLine = "";
      //Every food item will be divided by a comma, which is used in the creation of the word cloud
      entireLine = entireLine + "," + line;

      //While there is still more to read
      while (line!=null)
      {
        //Add more to the string that holds the entire contents of the text file
        entireLine = entireLine + "," + line;
        //Read another line from the text file
        line = reader.readLine();
      }
      //Close the BufferReader object 
      reader.close();
      //Create the work cloud
      wordCloud(entireLine);
    }
    //If something went wrong, e.g. - file doesn't exist
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }

    //Mouse no longer is needed to be pressed
    mousePressed = false;

    //Menu is needed
    menuActive = true;
    //Read from file and create word cloud is no longer needed
    wordCloudActive = false;
  }


  /**
   * Method to create the word cloud
   *
   * @param String textLine (the read text)
   * @return No return
   */
  void wordCloud(String textLine)
  {

    //Arrays for food
    //Split the entire contents of the text file into the food items using the commas
    String[] list = split(textLine, ',');
    String[] dummylist = split(textLine, ',');
    //Array for frequency of times entered
    int[] frequency = new int[list.length];

    //For every item in the array
    for (int i=0; i<list.length; i++)
    {
      //Make currentItem equal to current item
      String currentItem = "";
      currentItem = list[i];

      //This is the size of the text for one item
      //Set 
      frequency[i] = 20;
      //Set frequency of item to nothing
      int freq = 0;

      //For every item before the current one
      for (int j=0; j<i; j++)
      {
        //If another item equals the current one then it must have been entered more than once
        if (dummylist[j].equals(currentItem))
        {
          //Add one to the frequency of the word
          freq = freq + 1;
          //Set the food name to nothing
          list[j] = "";
          //Size of text for one item is increased by 10
          frequency[i] = frequency[j] + 10;
          //Set the food text size of the duplicated food item to nothing
          frequency[j] = 0;
        }
      }
    }

    //For every item in the array
    for (int x = 0; x < list.length; x++)
    {
      //Text size depends on the frequency of the word, 20 for once
      textSize(frequency[x]);

      //Text colour
      fill(90, 115, 41);

      //Array for the x and y positions of the food items
      int[] posX = new int[list.length];
      int[] posY = new int[list.length];

      //Declare x and y position variables
      int wordPosX;
      int wordPosY;

      //Randomise x and y positions
      wordPosX = int(random(500, 800-textWidth(list[x])));
      wordPosY = int(random(150, 550));

      //Print out word cloud
      text(list[x], wordPosX, wordPosY);
    }
  }
}



