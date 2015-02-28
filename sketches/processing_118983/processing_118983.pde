
/**
*  AC21010.4 - Educational game
*  Group 11
*/

//Declare global variables

//Array to hold tile objects
Tile[] myTile;

//Declare object of class Menu
Menu myMenu;

//Array to hold colours of tiles
int[] colour;

//2D array to hold x and y values of tiles
int[][] coords;

//Variables for tile objects (x and y coords and colour)
int x;
int y;
int c;

//Variables to validate selected tiles
int firstTile;
int secondTile;
boolean picked;
boolean picked2;

//Menu (whether to display or not)
boolean menu;

//Variables for the tile width and height (to deactivate 'clickable' areas once a pair has been made)
int tile_width = 107;
int tile_height = 130;

//Variable and array to generate random numbers (to mix up position of tiles)
float r;
int[] numbers;


void setup()
{   
  //Set window size
  size(600,600);
  
  //Initialise variables
  myTile = new Tile[6];
  myMenu = new Menu();
  
  colour = new int[4];
  coords = new int[2][7];
  
  x = 91;
  y = 108;
  c = 255;
  
  firstTile = 10;
  secondTile = 11;
  
  picked = false;
  picked2 = false;
  
  menu = true;
  
  //Colours
  colour[0] = color(233,248,101);
  colour[1] = color(66,201,98);
  colour[2] = color(57,99,230);
  //White is used once a pair has been made, to blank out the right tiles
  colour[3] = 255;
    
  //x coords of tiles
  coords[0][0] = 91;
  coords[0][1] = 250;
  coords[0][2] = 410;
  coords[0][3] = 91;
  coords[0][4] = 250;
  coords[0][5] = 410;
  
  //y coords of tiles
  coords[1][0] = 108;
  coords[1][1] = 108;
  coords[1][2] = 108;
  coords[1][3] = 278;
  coords[1][4] = 278;
  coords[1][5] = 277;
  //Similar to the colour array, used once a pair has been made, display out of sight
  coords[0][6] = 600;
  coords[1][6] = 600;


  //Generate random number to set tile pairs' colour (0, 1 or 2)
  randomNumber();
  //Set colour counter to 0
  int c_counter = 0;
  
  //For every pair do this
  for (int i = 0; i < 3; i++)
  {
    //Make objects of array tile (makes a pair)
    myTile[i] = new Tile(coords[0][i],coords[1][i],colour[numbers[c_counter]]);
    myTile[numbers[c_counter]+3] = new Tile(coords[0][numbers[c_counter]+3],coords[1][numbers[c_counter]+3],colour[numbers[c_counter]]);
    //Once a pair has been made, add one to the counter
    c_counter++;
  }
}
  
void draw()
{ 
  //Display menu if true (Is true on start up)
  if (menu == true)
  {
    myMenu.display();
    myMenu.keyPress();
  }
  //Display game if player has chosen to start game
  else
  {
    //Draw the 6 tiles
    for (int i = 0; i < 6; i++)
    {
      myTile[i].display();
      myTile[i].keyPress();
    }
  }
}

class Tile
{
  
  //Declare variables for the tiles
  int x;
  int y;
  int col;
   
  //Set the positions as temp
  Tile(int temp_xPos, int temp_yPos, int temp_colour) 
  {
    x = temp_xPos;
    y = temp_yPos;
    col = temp_colour;
  }
  
  void display()
  {
    //Draw tiles
    fill(col);
    rect(x, y, tile_width, tile_height);
  }
  
  //Return colour value
  int getColour()
  {
    return col;
  }
  
  void keyPress()
  {
    if (keyPressed)
    {
      //If player presses q then quit
      if (key == 'q' || key == 'Q')
      {
        exit();
      }
      //If player presses r then restart
      if (key == 'r' || key == 'R')
      {
        setup();
      }
    }
  }
}

//This controls the 'clickable' areas for the game
void mouseClicked()
{
  //First drawn tile (top left) is selected then, do this
  if (mouseX > coords[0][0] && mouseX < (coords[0][0]+tile_width) && mouseY > coords[1][0] && mouseY < (coords[1][0]+tile_height))
  {
    //Player is making their second selection
    if (picked == true)
    {
      //Second selected tile is the first drawn tile (top left)
      secondTile = 0;
      //Call method to display user feedback (Second tile selected)
      second_tile();
    }
    else
    {
      //Player is making their first selection
      //First selected tile is the first drawn tile (top left)
      firstTile = 0;
      //Call method to display user feedback (First tile selected)
      first_tile();
    }
    
    //Check that the selected tiles are valid
    validateTile(); 
  }
  
  //Second drawn tile (middle, top) is selected, do this
  if (mouseX > coords[0][1] && mouseX < (coords[0][1]+tile_width) && mouseY > coords[1][1] && mouseY < (coords[1][1]+tile_height))
  {
     //Player is making their second selection
     if (picked == true)
     {
       //Second selected tile is the second drawn tile (middle, top)
       secondTile = 1;
       //Call method to display user feedback (Second tile selected)
       second_tile();
     }
     else
     {
       //Player is making their first selection
       //First selected tile is the second drawn tile (middle, top)
       firstTile = 1;
       //Call method to display user feedback (First tile selected)
       first_tile();
     }
     
     //Check that the selected tiles are valid
     validateTile(); 
  }

  //Third drawn tile (top right) is selected, do this
  if (mouseX > coords[0][2] && mouseX < (coords[0][2]+tile_width) && mouseY > coords[1][2] && mouseY < (coords[1][2]+tile_height))
  {
    //Player is making their second selection
    if (picked == true)
    {
      //Second selected tile is the third drawn tile (top right)
      secondTile = 2;
      //Call method to display user feedback (Second tile selected)
      second_tile();
    }
    else
    {
      //Player is making their first selection
      //First selected tile is the third drawn tile (top right)
      firstTile = 2;
      //Call method to display user feedback (First tile selected)
      first_tile();
    }
    
    //Check that the selected tiles are valid
    validateTile(); 
  }
  
  //Row 2 
  
  //Fourth drawn tile (bottom left) is selected, do this
  if (mouseX > coords[0][3] && mouseX < (coords[0][3]+tile_width) && mouseY > coords[1][3] && mouseY < (coords[1][3]+tile_height))
  {
     //Player is making their second selection
     if (picked == true)
     {
       //Second selected tile is the fourth drawn tile (bottom left)
       secondTile = 3;
       //Call method to display user feedback (Second tile selected)
       second_tile();
     }
     else
     {
        //Player is making their first selection
        //First selected tile is the fourth drawn tile (bottom left)
        firstTile = 3;
        //Call method to display user feedback (First tile selected)
        first_tile();
     }
     
     //Check that the selected tiles are valid
     validateTile();  
  }
  
  //Fifth drawn tile (middle, bottom) is selected, do this
  if (mouseX > coords[0][4] && mouseX < (coords[0][4]+tile_width) && mouseY > coords[1][4] && mouseY < (coords[1][4]+tile_height))
  {
    //Player is making their second selection
    if (picked == true)
    {
      //Second selected tile is the fifth drawn tile (middle, bottom)
      secondTile = 4;
      //Call method to display user feedback (Second tile selected)
      second_tile();
    }
    else
    {
      //Player is making their first selection
      //First selected tile is the fifth drawn tile (middle, bottom)
      firstTile = 4;
      //Call method to display user feedback (First tile selected)
      first_tile();
    }
    
    //Check that the selected tiles are valid
    validateTile();  
  }
  
  //Sixth drawn tile (bottom right) is selected, do this
  if (mouseX > coords[0][5] && mouseX < (coords[0][5]+tile_width) && mouseY > coords[1][5] && mouseY < (coords[1][5]+tile_height))
  {
    //Player is making their second selection
    if (picked == true)
    {
      //Second selected tile is the sixth drawn tile (bottom right)
      secondTile = 5;
      //Call method to display user feedback (Second tile selected)
      second_tile();
    }
    else
    {
      //Player is making their first selection
      //First selected tile is the sixth drawn tile (bottom right)
      firstTile = 5;
      //Call method to display user feedback (First tile selected)
      first_tile();
    }
    
    //Check that the selected tiles are valid
    validateTile();  
  }
}

  //Declare variables for colour, first tile's colour and the second's
  int c1, c2;
  void validateTile()
  {
    //Check if the same tile has been selected
    if (firstTile == secondTile)
    {
      //Call method to display user feedback (Clear any previous text, set colour, size)
      feedback_font();
      //Display actual feedback
      text("Same tile selected, try again!", 300, 545);
      
      //Reset variables used to validate selected tile pairs
      picked = false;
      picked2 = false;
      firstTile = 10;
      secondTile = 11;
    }
    else if (picked2 == true)
    {
      //Check if chosen tiles are the same colour
      if (myTile[firstTile].getColour()==myTile[secondTile].getColour())
      {
        //Call method to display user feedback (Clear any previous text, set colour, size)
        feedback_font();
        //Display actual feedback
        text("Well done, tiles match!", 300, 545);
        
        //Draw blank rectangles over matched pair
        fill(255);
        rect(coords[0][firstTile],coords[1][firstTile],tile_width,tile_height);
        rect(coords[0][secondTile],coords[1][secondTile],tile_width,tile_height);
        
        //Set coords of matched tile to out of sight
        coords[0][firstTile] = coords[0][6];
        coords[1][secondTile] = coords[1][6];
        //Give matched pair tiles dummy values
        myTile[firstTile] = new Tile(coords[0][6],coords[1][6],colour[3]);
        myTile[secondTile] = new Tile(coords[0][secondTile],coords[1][secondTile],colour[3]);
        //Due to this, matched pairs will blank out and can't be selected again
        
        //This checks whether all 3 pairs have been made
        //Set matched counter to 0
        int matched = 0; 
          for (int counter = 0; counter < 6; counter++)
          {  
            //If a pair has been made they will have been blanked (given 255)
            if (myTile[counter].getColour()==255)
            {
              //Add 1 to matched
              matched++;
            }
            //If are 6 matches then all pairs have been made
            if (matched == 6)
            {  
              //Display finished screen
              PImage finished_photo;
              finished_photo = loadImage("endofgamefinal.jpg");
              finished_photo.resize(600,600);
              image(finished_photo, 0, 0);
            }
          }
        //Reset variables used to validate selected tile pairs  
        picked = false;
        picked2 = false;
        firstTile = 10;
        secondTile = 11;
      }
    else
    {
      //Call method to display user feedback (Clear any previous text, set colour, size)
      feedback_font();
      //Display actual feedback
      text("They don't match! Try again!", 300, 545);
      
      //Reset variables used to validate selected tile pairs  
      picked = false;
      picked2 = false;
      firstTile = 10;
      secondTile = 11;
     }
    }
  }

  //These are to set font styles and clear boxes of any previous messages
  //This method sets the style and clears box for the 'selected first tile' 'selected second tile' messages
  void firstSecondFont()
  {
    fill(255);
    rect(115, 492, 383, 30);
    fill(205,43,43);
    textAlign(CENTER);
    textSize(26);
  }
  
  //This one is to let the player know they have selected their first tile
  void first_tile()
  {
    firstSecondFont();
    text("First tile selected", 300, 516);
    picked = true;
  }
  //This one is to let the player know they have selected their second tile
  void second_tile()
  {
    firstSecondFont();
    text("Second tile selected", 300, 516);
    picked2 = true;
  }
  
  //This method sets the style and clears box for the result of validating the selected pair
  void feedback_font()
  {
    fill(255);
    rect(115, 522, 383, 30);
    fill(205,43,43);
    textAlign(CENTER);
    textSize(26);
  }
  
  
class Menu
{
  void display()
  {
    //Display menu screen
    PImage menu_photo;
    menu_photo = loadImage("menu.jpg");
    menu_photo.resize(600,600);
    image(menu_photo, 0, 0);
  }
  
  void keyPress()
  {
    if (keyPressed)
    {
      //If player presses s then start game
      if (key == 's' || key == 'S')
      {
        menu = false;
        
        //Display game screen
        noStroke();
        PImage photo;
        photo = loadImage("letsmatchitcompletefinal.jpg");
        photo.resize(600,600);
        image(photo, 0, 0);
      }
      //If player presses q then quit
      else if (key == 'q' || key == 'Q')
      {
        exit();
      }
    }
  }
}

void randomNumber()
{
  //Declare array to hold random numbers 
  numbers = new int[3];
  
  //Give array dummy values
  numbers[0] = 200;
  numbers[1] = 300;
  numbers[2] = 2020;

  //Randomise r between 0 and pretty much 2 (2.9999...)
  r = random(0,3);
  //Assign this value to first item in array
  numbers[0] = int(r);
  
    //For the other 2 numbers in the array
    for (int i = 1; i < 3; i++)
    {
      //Randomise r between 0 and pretty much 2 (2.9999...)
      r = random(0,3);
      //Assign this value to first item in array
      numbers[i] = int(r);
        
        //While the second equals first or third equals first or third equals second
        while((numbers[1] == numbers[0]) || (numbers[2] == numbers[0]) || (numbers[2] == numbers[1]))
        {
          //Randomise r between 0 and pretty much 2 (2.9999...)
          r = random(0,3);
          //Assign this value to first item in array
          numbers[i] = int(r);
        }
    }
}






