
//declaring the images we use throughout for backgrounds and info boxes
PImage homeScreen;
PImage welcomeScreen;
PImage aboutScreen;
PImage nameScreen;
PImage helpScreen;

PImage backButton;

PImage mousePlus; //we use this image in placeHive to add a + to the mouse
PImage mouseMinus; //we use this image in deleteHive to add a - to the mouse

PFont f; //declares the font

boolean once = true; //this is used to stop the initial hives from appearing over and over again

//these variables help to control the screens the app is moving through
boolean welcome = true; //this starts the program on the welcome screen
boolean help;
boolean home;
boolean about;
boolean addHive;
boolean placeHive;
boolean deleteHive;

boolean clicked = false; //use this along with a function to detect if mouse is pressed

//declares the variables for the begin button on the welcome page
int welcomeBox_x = 420;
int welcomeBox_y = 500;
int welcomeBox_width = 210;
int welcomeBox_height = 70;

//declaring the variables for the buttons on the home page
int addHiveBox_x = 525;
int addHiveBox_y = 340;
int addHiveBox_width = 155;
int addHiveBox_height = 30;

int deleteHiveBox_x = 555;
int deleteHiveBox_y = 380;
int deleteHiveBox_width = 125;
int deleteHiveBox_height = 20;

int aboutBox_x = 565;
int aboutBox_y = 400;
int aboutBox_width = 120;
int aboutBox_height = 40;

int helpBox_x = 575;
int helpBox_y = 440;
int helpBox_width = 120;
int helpBox_height = 50;

//declares the variables for the boxes on the help page
int closeHelp_x = 500;
int closeHelp_y = 450;
int closeHelp_width = 75;
int closeHelp_height = 30;

//declares the variables for the boxes on the about page
int closeAbout_x = 515;
int closeAbout_y = 515;
int closeAbout_width = 75;
int closeAbout_height = 30;

int infoBox_x = 110;
int infoBox_y = 520;
int infoBox_width = 130;
int infoBox_height = 25;

//declares the variables for the box required to input hive details
int enterBox_x = 452;
int enterBox_y = 325;
int enterBox_width = 68;
int enterBox_height = 25;

int textBox_x = 341;
int textBox_y = 275;
int textBox_width = 172;
int textBox_height = 21;

int backButton_x = 30;
int backButton_y = 550;
int backButton_width = 75;
int backButton_height = 37;

//declares the array list
ArrayList <BeeHive> hives = new ArrayList();

String hive_name = new String(); //stores each hive's name
String typing = ""; //this variable stores the text currently being typed

//declaring how far bees fly away from their hive (radius of the circles)
int drone_range = 90; //10km
int foraging_range = 27; //27km

//setup info 
void setup() {
  size(700, 600);
  smooth();
  noStroke();
  background(0); //just incase the images don't load

  //loads the font used
  f = createFont("Arial", 16, true);

  //loads images and resizes them accordingly (the files are already these sizes so this is just a precaution).
  homeScreen = loadImage("mainScreen.png");
  homeScreen.resize(width, height);

  welcomeScreen = loadImage("welcome.png");
  welcomeScreen.resize(width, height);

  aboutScreen = loadImage("about.png");
  aboutScreen.resize(width, height);

  helpScreen = loadImage("helpScreen.png");
  helpScreen.resize(width, height);

  nameScreen = loadImage("nameApiary.png");
  nameScreen.resize(width, height);

  mousePlus = loadImage("mouse+.gif");
  mousePlus.resize(20, 20);

  mouseMinus = loadImage("mouse-.gif");
  mouseMinus.resize(20, 20);

  backButton = loadImage("backButton.png");
  backButton.resize(75, 37);
}

class BeeHive { //creates the block for the class
  //declaring the fields used in the class
  int hive_x; //these store the hive location
  int hive_y;
  String name; //this string stores the hive name
  Boolean visible; //this is used to control when a hive dissapears using 'delete hive'

  BeeHive(int temp_hive_x, int temp_hive_y, String temp_name) { //the constructor
    //these valuse are inputted when the object is created and are determined by user input
    //(co-ordinates come from where the user clicks in the place hive fn)
    hive_x = temp_hive_x;
    hive_y = temp_hive_y;
    //name is typed in by the user
    name = temp_name;
    visible = true;
  }

  //function to "delete" hive. If this function is run it simply passes this onto a boolean
  void deleteHive() {
    visible = false;
  }

  //displays hive names when you hover over the centre of a hive
  void showName() {

    if (visible == true) { //checks that the hive hasn't already been 'deleted'
      if (mouseX > (hive_x - 10)
        && (hive_x + 10) > mouseX
        && mouseY > (hive_y - 10)
        && (hive_y + 10) > mouseY) { //checks to see if you're hovering within a 10 x 10 square of the hive 

        textFont(f);
        fill(255);
        text(name, mouseX, mouseY); //displays the hive name at the mouse co-ordinates
      }
    }
  }

  //these both simply output the particular hive's X and Y co-ordinates when requested
  int getX() {
    return hive_x;
  }
  
  int getY() {
    return hive_y;
  }

  void display() { //this method displays the objects
    if (visible == true) { //checks to see the hive hasn't been 'deleted'
      fill (255, 0, 0);
      ellipse (hive_x, hive_y, 3, 3); //displays the actual hive

      fill (242, 187, 23, 60);
      ellipse (hive_x, hive_y, foraging_range*2, foraging_range*2); //this circle displays how far the foraging bees fly

      fill (242, 187, 23, 20);
      ellipse (hive_x, hive_y, drone_range*2, drone_range*2); //this circle displays how far the drones fly
    }
  }
}



void about() { //this function is run when the 'about' button is pressed

  background(aboutScreen); //shows the about info box we created as a .png file

  if (infoBox_x < mouseX
    && mouseX < (infoBox_x + infoBox_width)
    && infoBox_y < mouseY
    && mouseY < (infoBox_y + infoBox_height)
    && clicked == true
    && mouseButton == LEFT) { //we use 'clicked == true' and 'mouseButton' to make sure that 'clicked' isn't turned false if you click somewhere but the button
      //if this button is pressed, open a browser window with a page containing further info
      clicked = false;
      link("http://www.moraybeedinosaurs.co.uk/archives/Inbreeding.htm");
  }

  //code to enable the 'close' button
  if (closeAbout_x < mouseX
    && mouseX < (closeAbout_x + closeAbout_width)
    && closeAbout_y < mouseY
    && mouseY < (closeAbout_y + closeAbout_height)
    && clicked == true
    && mouseButton == LEFT) {

    clicked = false; //returns clicked to false
    home = true; //tells draw to run the home() function
  }
}

void addHive() { //this function is run when the 'add hive' button is pressed

  background(nameScreen); //shows the image allowing you to name screen

  //shows text that the user types within the text box.
  textFont(f);
  fill(255);
  text(typing, textBox_x, textBox_y, textBox_width, textBox_height);

  //done box closes the name hive part
  if (enterBox_x < mouseX
    && mouseX < (enterBox_x + enterBox_width)
    && enterBox_y < mouseY
    && mouseY < (enterBox_y + enterBox_height)
    && clicked == true
    && mouseButton == LEFT) { 

      clicked = false;
      placeHive = true; //moves the user onto the place hive function where they can choose the location of their hive
  }
}

//text input code adapted from code by Daniel Shiffman
void keyPressed() {
  typing = typing + key; //this adds the keys the user is typing onto the String which is then displayed on the screen
}
void deleteHive() { //this function is run when the delete hive button is pressed

  background(homeScreen); //shows the main screen image

  //displays however many hives are in the ArrayList
  for (int i = 0; i < hives.size(); i++) {
    hives.get(i).display(); //runs the 'display' function on every item in the array list
  }

  image(mouseMinus, (mouseX - 10), (mouseY - 10)); //displays a '-' image which follows the mouse
  
  image(backButton, backButton_x, backButton_y); //makes back button appear 

  //makes the back button return you to the home function if you click it
  if (backButton_x < mouseX
    && mouseX < (backButton_x + backButton_width)
    && backButton_y < mouseY
    && mouseY < (backButton_y + backButton_height)
    && clicked == true
    && mouseButton == LEFT) {

    clicked = false;
    home = true;
  }

  if (clicked == true && mouseButton == LEFT) {

    //this code goes through all the hives and checks if they're within the co-ordinates you're clicking
    for (int i = 0; i < hives.size(); i++) {

      //this part is used to extract each hive's x and y co-ords and to save them temporarily as integers
      int h_x = hives.get(i).getX();
      int h_y = hives.get(i).getY();

      if (mouseX > (h_x - 10)
        && (h_x + 10) > mouseX
        && mouseY > (h_y - 10)
        && (h_y + 10) > mouseY
        && clicked == true
        && mouseButton == LEFT) {

        //if there is a hive within 10 pixels of the co-ordinates, it runs the delete hive fn for that particular hive
        hives.get(i).deleteHive();
      }
    }

    clicked = false;
    home = true; //tells draw to run the home function
  }
}

void draw() {

  //if boolean welcome is true it runs the welcome function
  if (welcome == true) {
    welcome ();
  }
  
  //if boolean home is true it runs the home function (this happens from inside welcome screen)
  if (home == true) {
    welcome = false; //ensures welcome is not running anymore
    placeHive = false; //ensures place hive is not running anymore (after it has been used)
    deleteHive = false;
    help = false;
    about = false;
    home();
  }

  //runs the appropriate function
  if(deleteHive == true){
   home = false; //ensures home is not running anymore
   deleteHive();
   }
  

  //if boolean help is true it runs the appropriate function
  if (help == true) { 
    home = false; //ensures home is not running anymore
    help();
  }

  //if boolean about is true it runs the appropriate function
  if (about == true) {
    home = false; //ensures home is not running anymore
    about();
  }
  
  //if addHive is true then runs addhive function from home function
  if (addHive == true) {
    home = false; //ensures home is not running anymore
    addHive();
  }

  //from add hives if boolean placeHive is true, when the user has clicked done, runs appropriate function
  if (placeHive == true) {
    addHive = false; //ensures addhive is not running anymore
    placeHive();
  } 
  
}

//this function controls the 'clicked' boolean which we use throughout the program
void mouseClicked() {        
  if (clicked == false) { 
    clicked = true; //turns clicked on when the mouse is clicked
  }
  else {
    clicked = false; //turns clicked off again if 'clicked' was already true
  }
}

void help() { //this function is run when the help button is pressed

  background(helpScreen); //shows the help info box

  //code to enable the 'close Help' button
  if (closeHelp_x < mouseX
    && mouseX < (closeHelp_x + closeHelp_width)
    && closeHelp_y < mouseY
    && mouseY < (closeHelp_y + closeHelp_height)
    && clicked == true
    && mouseButton == LEFT) {

    clicked = false;
    home = true; //tells draw to run the home() function
  }
} 

//main screen for the application
void home() {

  //creates the initial beehives only once because boolean once is only true at the very start
  if (once == true) {

    hives.add(new BeeHive(130, 300, "Doris Fischler")); //these values were chosen by me in the code and are inputted straight to the class
    hives.add(new BeeHive(310, 500, "Scapa Bees"));
    hives.add(new BeeHive(400, 400, "Mary - Airport "));

    once = false; //makes sure these hives are only created once
  }

  background(homeScreen); //displays the map
  
  //displays the hive names when you hover over them
  for (int i = 0; i < hives.size(); i++) {
    hives.get(i).showName(); //runs the function on each item in the array list
  }
  
  //displays however many hives are in the ArrayList
  for (int i = 0; i < hives.size(); i++) {
    hives.get(i).display(); //runs the display function on each item in the array list
  }

  //enable the 'Add Hive' button
  if (addHiveBox_x < mouseX
    && mouseX < (addHiveBox_x + addHiveBox_width)
    && addHiveBox_y < mouseY
    && mouseY < (addHiveBox_y + addHiveBox_height)
    && clicked == true
    && mouseButton == LEFT) {

    clicked = false;
    addHive = true; //tells draw to run the add hive function
  }

  // Code to enable the 'Delete Hive' button
  if (deleteHiveBox_x < mouseX
    && mouseX < (deleteHiveBox_x + deleteHiveBox_width)
    && deleteHiveBox_y < mouseY
    && mouseY < (deleteHiveBox_y + deleteHiveBox_height) && clicked == true) { // takes you back to the main menu

    clicked = false;
    deleteHive = true; //te;;s draw to run the delete hive function
  } 

  //enable the 'About' button
  if (aboutBox_x < mouseX
    && mouseX < (aboutBox_x + aboutBox_width)
    && aboutBox_y < mouseY
    && mouseY < (aboutBox_y + aboutBox_height)
    && clicked == true
    && mouseButton == LEFT) { 

    clicked = false;
    about = true; //tells draw to run the about function
  }

  //enable the 'help' button
  if (helpBox_x < mouseX
    && mouseX < (helpBox_x + helpBox_width)
    && helpBox_y < mouseY
    && mouseY < (helpBox_y + helpBox_height)
    && clicked == true
    && mouseButton == LEFT) {

    clicked = false;
    help = true; //tells draw to run the help function
  }
}

void placeHive() { //this function runs after addhive

  background(homeScreen); //shows the standard map screen
  
  //displays however many hives are in the ArrayList so the user can judge where they should place their hive
  for (int i = 0; i < hives.size(); i++) {
    hives.get(i).display();
  }

  image(mousePlus, (mouseX - 10), (mouseY - 10)); //displays a + which follows the mouse

  if (clicked == true && mouseButton == LEFT) { //'clicked' and 'mouseButton' are used together to ensure that only one hive is made when the user clicks, not as many as how long he clicks for
    hives.add(new BeeHive(mouseX, mouseY, typing)); //adds a new bee hive where the user clicks and also includes the previous variable storing the name
    
    typing = ""; //returns the variable to blank for the next time 'addHive' is run

    clicked = false;
    home = true; //tells draw to run the home function
  }
}  


void welcome() { //this function is run when the program is started

  background(welcomeScreen); //this shows the splash screen image with logo

  //code to enable the welcome button
  if (welcomeBox_x < mouseX
    && mouseX < (welcomeBox_x + welcomeBox_width)
    && welcomeBox_y < mouseY
    && mouseY < (welcomeBox_y + welcomeBox_height)
    && clicked == true
    && mouseButton == LEFT) { //checks if we click the 'begin' button

    clicked = false;
    home = true; //tells draw to run the home function
  }
}



