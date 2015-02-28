
//fullscreen mode

/*boolean sketchFullScreen() 
 {
 return true;
 } */
// declaring variables
boolean locked=false;
PFont textFont, nameFont, headerFont;
// declaring tables for database
Table animeInfo, tvInfo, sideInfo;
String infoString;
// selection buttons
PImage animeIcon, tvShowIcon, saveIcon, addIcon, deleteIcon, storeSideIcon, clearStoredIcon, toggleIcon, clearLastIcon, helpIcon, searchIcon, removeFavoriteIcon;
Button animeButton, tvShowButton, saveButton, addButton, deleteButton, storeSideButton, clearStoredButton, toggleButton, clearLastStoredButton, helpButton, searchButton, removeFavoriteButton;
// arraYlist to store shows/buttons
ArrayList<Button> animeShows = new ArrayList<Button>();
ArrayList<PImage> animePosters = new ArrayList<PImage>();
ArrayList<Button> tvShows = new ArrayList<Button>();
ArrayList<PImage> tvPosters = new ArrayList<PImage>();
ArrayList<Button> pageButtons=new ArrayList<Button>();

// booleans for selection button and user messages 
boolean animeOn, tvShowOn, textInput, printing, addDisplay, saved, deleted, notfound, deletionDisplay, toggle, overOne, found, searchDisplay, favoriteRemoved, favouritesearch;
// variables for printing
String fileName = "", fileNameTemp="";
// new show adding varables
String collectionName="", title="", studio="", episodes="", aired="", airs="", channel="";
//passing string message to method
String message="";
//used to control switch statements during user input
int addInput=0;
//timer for timed messages
int savedTimer= -3000;
//number of shows to display on screen
int numberOfObjects;
// controls display coordinates
int k=0;
int doubleTap=0;
// colour variables 
color text =color(255);  // general text  colour
color dragHeader= color(0);  // header in drag zone
color headerText= color(255);  // header in side Info 
color background =color(31); //obvious here
color dragArea =color(255);  // drag zone colour 
color highlight= color(0);  // when hovered over with mouse
color nameColor=color(41); // for ANIME / TV SERIES text in middle of the drag zone
// font size variables
int fontSizeText=18; //for general text
int fontSizeHeader=16; // for headers
int fontSizeName=40; // for ANIME / TV SERIES text in middle of the drag zone
// variable to get right  row from table
int hex;
public void setup()
{
  // loading fonts as countermeasure if they dont exist in users computer, otherwise using created ones for far superior font quality
  textFont=loadFont("CordiaUPC-18.vlw");
  nameFont=loadFont("ImprintMT-Shadow-40.vlw");
  headerFont=loadFont("CenturySchoolbook-15.vlw");
 
  //creating custom fonts
  textFont=createFont("CordiaUPC", 20, true);           // general text font    
  nameFont=createFont("Imprint MT Shadow", 40,true);     // name font ( big text in drag zone )
  headerFont=createFont("Century Schoolbook", 15,true);         // headers font
  frameRate(60);
  size(1300, 700);
  // setting window size to same as monitors resoliution
  //size(displayWidth, displayHeight);
  // resizable frame, not used in fullscreen
  /* if (frame != null) 
   {
   frame.setResizable(true);
   }*/
  //String[] fontList = PFont.list();
  // println(fontList);
  // loading tables
  animeInfo=loadTable("animeinfo.csv", "header, csv");
  tvInfo=loadTable("tvinfo.csv", "header, csv");
  sideInfo=loadTable("favourites.csv", "header, csv");
  //loading anime posters
  for (int i =0; i<tvInfo.getRowCount(); i++)
  {
    tvPosters.add(loadImage("tvPosters/"+tvInfo.getString(i, 6)));
  }
  //loading tv posters
  for (int i=0; i<animeInfo.getRowCount(); i++)
  {
    animePosters.add(loadImage("animePosters/"+animeInfo.getString(i, 6)));
  }

  // control button images
  animeIcon=(loadImage("buttonIcons/anime.png"));
  tvShowIcon=(loadImage("buttonIcons/TVShow.png"));
  saveIcon=(loadImage("buttonIcons/Save.png"));
  addIcon=(loadImage("buttonIcons/add.png"));
  deleteIcon=(loadImage("buttonIcons/delete.png"));
  // storeSideIcon=(loadImage("buttonIcons/storeInfo.png"));
  clearStoredIcon=(loadImage("buttonIcons/clearStored.png"));
  toggleIcon=(loadImage("buttonIcons/toggle.png"));
  clearLastIcon=(loadImage("buttonIcons//clearLast.png"));
  helpIcon=(loadImage("buttonIcons//help.png"));
  searchIcon=(loadImage("buttonIcons//search.png"));
  removeFavoriteIcon=(loadImage("buttonIcons//favoriteRemove.png"));

  // control buttons
  animeButton=new Button(width*.67f, height*.95f, 35, 35, animeIcon, "Anime Series");
  tvShowButton=new Button(width*.70f, height*.95f, 35, 35, tvShowIcon, "TV Series");
  saveButton=new Button(width*.73f, height*.95f, 35, 35, saveIcon, "Save favourites to text file");
  addButton=new Button(width*.86f, height*.95f, 35, 35, addIcon, "Add new series");
  deleteButton=new Button(width*.89f, height*.95f, 35, 35, deleteIcon, "Delete existing series");
  //storeSideButton=new Button(width*.92f, height*.75f, 35, 35, storeSideIcon, "Add shows to list");
  clearStoredButton=new Button(width*.83f, height*.95f, 35, 35, clearStoredIcon, "Clear favourites list");
  toggleButton=new Button(width*.57f, height*.95f, 35, 35, toggleIcon, "Legacy Toggle");
  clearLastStoredButton= new Button(width*.79f, height*.95f, 35, 35, clearLastIcon, "Remove last item in favourites list");
  helpButton= new Button(width*.95f, height*.95f, 35, 35, helpIcon, "Start by clicking on Anime or Tv Buttons. Numbers next to white zone represent pagenumbers and act as buttons. Left mouse button to pick up a tv series card. Right mouse button to release it. Items dragged into white zone will display information associated with them in favourites section. Favourites list can be cleared using Clear button, single items can be removed using remove last item button, or searching and removing favourite by title. Favourites list can be saved to a text file by using save button. New tv series can be added to database by using Add button and existing series can be removed by using Delete button. Search button allows to search and add existing series to favourites list.");
  searchButton= new Button(width*.92f, height*.95f, 35, 35, searchIcon, "Search for a series");
  removeFavoriteButton= new Button(width*.76f, height*.95f,35, 35, removeFavoriteIcon, "Remove existing favourite ");
  // changing cursor icon
  cursor(HAND);
  // initializing various states to control the program and displays
  animeOn=false; 
  tvShowOn=false;
  textInput=false; 
  printing=false;
  addDisplay=false;  
  saved=false;
  deleted=false; 
  notfound=false; 
  deletionDisplay=false;
  toggle=true;
  overOne=false;
  found=false;
  searchDisplay=false;
  favoriteRemoved=false;
  favouritesearch=false;
}
public void draw()
{
  background(background);
  // area where to drag and drop 
  fill (dragArea);
  noStroke();
  rect(width/2, 0, width/6, height);
  // displaying general text
  fill(dragHeader);
  textFont(headerFont, 13);
  text("Number of shows in favourites: "+sideInfo.getRowCount(), width*0.505f, height*.02f);
  fill(headerText);
  text("Title", width/1.46f, height*.09f);
  text("Company", width/1.32f, height*.09f);
  text("Episodes", width/1.20f, height*.09f);
  // text("First Aired", width/1.20, height*.09f);
  text("Airs", width/1.125f, height*.09f);
  text("On", width/1.055f, height*.09f);
  textFont(nameFont, fontSizeName);
  text("FAVOURITES", width/1.38f, height*.05f);
  // displaying stored items in drag zone
  if (toggle)
  {
    displayStored();
  }
  // covertng sideInfo.getRowCount()>=1 to boolean, because processing will bugg out with sideInfo.getRowCount()>=1
  if (sideInfo.getRowCount()>=1)
  {
    overOne=true;
  }
  else if (sideInfo.getRowCount()<=1)
  {
    overOne=false;
  }
  // displlaying anime
  if (animeOn)
  { 
    fill(nameColor);
    textFont(nameFont, fontSizeName);
    text("ANIME", width*0.528f, height*.5f);
    for (int i=0; i<numberOfObjects;i++)
    {
      animeShows.get(i).display();
      // displaying info in sidebar
      if (!toggle)
      {
        sideInfo(animeShows, animeInfo);
      }
    }
    // displaying anime page buttons/numbers
    for (int i=0; i<pageButtons.size(); i++)
    {
      pageButtons.get(i).displayPages();
    }
  }

  // displaying tvshows
  if (tvShowOn)
  {
    fill(nameColor);
    textFont(nameFont, fontSizeName);
    text("TV SERIES", width*0.4985f, height*.5f);
    for (int i=0; i<numberOfObjects;i++)
    {
      tvShows.get(i).display();
      if (!toggle)
      {
        sideInfo(tvShows, tvInfo);
      }
    }
    // displaying tvshows page buttons/numbers
    for (int i=0; i<pageButtons.size(); i++)
    {
      pageButtons.get(i).displayPages();
    }
  }  
  // updating button functions
  update2(mouseX, mouseY);
  // text display for save collection to file function
  if (textInput )
  {
    fill(text);
    textFont(textFont, fontSizeText);
    text("File name: "+fileName+(frameCount/10 % 2 == 0 ? "_" : ""), width*.70f, height*.85f);
  }
  if (deletionDisplay )
  {
    // deletion  text ,promts display
    deleteShowDisplay();
  }
  if (searchDisplay)
  {
    //search promts on screen
    findShowDisplay();
  }
  if (favouritesearch)
  {
    findFavoriteDisplay();
  }

  // timed text  messages for various functions (self explanatory )
  if (millis() - savedTimer < 3000)
  {
    fill(text);
    textFont(textFont, fontSizeText);
    if (printing)
    {
      text("Selection successfully saved to "+fileNameTemp, width*.67f, height*.90f);
    }
    if (saved)
    {
      text("New show "+title+" successfully added to collection.", width*.67f, height*.90f);
    }
    if (deleted)
    {
      text("Show "+title+ " was successfully deleted.", width*.67f, height*.90f);
    }
    if (notfound)
    {
      text("Show "+title+ " was not found.", width*.67f, height*.90f);
    }
    if (found)
    {
      text("Show "+title+ " was added to favourites.", width*.67f, height*.90f);
    }
    if (favoriteRemoved)
    {
      text("Favourite "+title+ " was successfully removed.", width*.67, height*.90f);
    }
  }
  // displaying text message promts when adding new show
  if (addDisplay)
  {
    addDisplayShow();
  }
  // calling selectInput function and displaying message with it
  if (addInput==6)
  {
    selectInput("Please select a poster file ", "fileSelected");
    addInput++;
  }

  // displayingcontrol buttons 
  animeButton.display();
  tvShowButton.display();
  helpButton.display();
  searchButton.display();
  // hiden buttons unless conditions are met
  if (toggle && overOne)
  {
    saveButton.display();
    clearStoredButton.display();
    clearLastStoredButton.display();
    removeFavoriteButton.display();
  }
  // hidden buttons until one collection is selected
  if (animeOn || tvShowOn)
  {
    deleteButton.display();
    addButton.display();
    // no longer used
    //storeSideButton.display();
    toggleButton.display();
  }
}
public void mouseReleased()
{
  // updating button drag condition
  if (animeOn)
  {
    // page button controls,  will control every page, no matter how many ofthem will be created
    for (int i=0; i<pageButtons.size(); i++)
    {
      if (pageButtons.get(i).clicked())
      {
        shows(animeShows, animeInfo, animePosters, i*20);
        hex=i*20;
      }
    }

    for (int i=0; i<animeShows.size() ;i++)
    {
      // releasing dragged object if right mouse button was pressed
      if ( animeShows.get(i).clicked()&& mouseButton==RIGHT)
      {
        animeShows.get(i).stopDragging();
        // adding show that was dragged into drag zone to secondary table, to enable storing shows while switching pages and show categories
        if (animeShows.get(i).getX()>= width/2.05f && animeShows.get(i).getX()<=width/1.65f)
        {
          sideInfo.addRow(animeInfo.getRow(hex+i));
          // decided to make favourites permament to make program more usable in daily life, without setting favourites every time
          saveTable(sideInfo, "data//favourites.csv");
        }
      }
    }
  }
  if (tvShowOn)
  {
    // page button controls,  will control every page, no matter how many ofthem will be created
    for (int i=0; i<pageButtons.size(); i++)
    {

      if (pageButtons.get(i).clicked())
      {
        shows(tvShows, tvInfo, tvPosters, i*20);
        hex=i*20;
      }
    }

    for (int i=0; i<tvShows.size() ;i++)
    {
      // releasing dragged object if right mouse button was pressed
      if ( tvShows.get(i).clicked()&& mouseButton==RIGHT)
      {
        tvShows.get(i).stopDragging();

        // adding show that was dragged into drag zone to secondary table, to enable storing shows while switching pages and show categories
        if (tvShows.get(i).getX()>= width/2.05f && tvShows.get(i).getX()<=width/1.65f)
        {
          sideInfo.addRow(tvInfo.getRow(hex+i));
          saveTable(sideInfo, "data//favourites.csv");
        }
      }
    }
  }
  // calling methods if assigned button is clicked
  if (animeButton.clicked())
  {
    // calling initial anime shows page
    shows(animeShows, animeInfo, animePosters, 0);
    tvShowOn=false;
    animeOn=true;
    hex=0;
  }

  if (tvShowButton.clicked())
  {
    // calling initial tv shows page
    animeOn=false;
    tvShowOn=true;
    shows(tvShows, tvInfo, tvPosters, 0);
    hex=0;
  }
  if (saveButton.clicked())
  {
    if (!addDisplay&&!deletionDisplay&&!searchDisplay&&!favouritesearch)
    {
      // clearing filename so user doesnt have to 
      fileName="";
      //changing states to display text promts and prevent other functions from firing
      textInput=true;
      printing=false;
    }
  }
  if (addButton.clicked())
  {
    if (!textInput&&!deletionDisplay&&!searchDisplay&&!favouritesearch)
    {
      //changing states to display text promts and enabling print to file function to be used
      printing=true;
      addDisplay=true;
    }
  }
  if (deleteButton.clicked())
  {
    if (!textInput&&!addDisplay&&!searchDisplay&&!favouritesearch)
    {
      //changing states to display text promts and prevent other functions from firing
      printing=false;
      deletionDisplay=true;
    }
  }
  if (searchButton.clicked())
  {
    if (!textInput&&!deletionDisplay&&!addDisplay&&!favouritesearch)
    {
      //changing states to call methods needed
      printing=false;
      searchDisplay=true;
      message="Enter title of a show to search: ";
    }
  }
  if (removeFavoriteButton.clicked())
  {
    if (!textInput&&!deletionDisplay&&!searchDisplay&&!addDisplay)
    {
      //changing states to call methods needed
      printing=false;
      favouritesearch=true;
    }
  }
  // made so shows are added on mouse right click, rendering this function redundant 
  /*if (storeSideButton.clicked())
   {
   if (animeOn)
   {
   saveSideInfo(animeShows, animeInfo);
   }
   if (tvShowOn)
   {
   saveSideInfo(tvShows, tvInfo);
   }
   }*/
  // clearing shows stored in sideInfo ( saved drag zone ) 
  if (clearStoredButton.clicked())
  {
    if (overOne)
    {
      sideInfo.clearRows();
      saveTable(sideInfo, "data//favourites.csv");
    }
  }
  // toggle buttom between dynimac drag and saved shows display
  if (toggleButton.clicked())
  {
    toggle=!toggle;
  }
  // clear last added item, 
  if (clearLastStoredButton.clicked())
  {
    if (overOne)
    {
      sideInfo.removeRow(sideInfo.getRowCount()-1);
      saveTable(sideInfo, "data//favourites.csv");
    }
  }
}

// side info method to display information about shows dragged to drag zone
public void sideInfo(ArrayList<Button> shows, Table infoTable)
{
  fill(text);
  textFont(textFont, fontSizeText);
  k=0;
  for (int i=0; i<shows.size() ;i++)
  {
    // checking if dragable item reached white space
    if (shows.get(i).getX()>= width/2.05f && shows.get(i).getX()<=width/1.65f) // use 1.65 to remove info once image leave white space
    {
      // getting string from table and displaying it on screen
      textLeading(20);
      text(infoTable.getString(i, 0), width/1.49f, 85+k, 120, 50);
      text(infoTable.getString(i, 1), width/1.31f, 85+k, 120, 50);
      text(infoTable.getString(i, 2), width/1.18f, 100+k);
      //text(info.getString(i, 3), width/1.20, 100+k,100,100);
      text(infoTable.getString(i, 4), width/1.14f, 100+k);
      text(infoTable.getString(i, 5), width/1.07f, 85+k, 70, 50);
      // increasing y coordinate between each loop
      if (infoTable.getString(i, 0).length()>20 ||infoTable.getString(i, 1).length()>20 ||infoTable.getString(i, 5).length()>12 )
      {
        k=k+40;
      }
      else 
      {
        k=k+20;
      }
    }
  }
}
/* not currently used method, made redundant by other implementation, can still be fully used but not much reason to use it now
 // method to store items dragged into sideInfo
 public  void saveSideInfo(ArrayList<Button> shows, Table infoTable)
 {
 for (int i=0; i<shows.size() ;i++)
 {
 // checking if dragable item reached white space
 if (shows.get(i).getX()>= width/2 && shows.get(i).getX()<=width/1.5f) // use 1.65 to remove info once image leave white space
 {
 // storing shows that were dragged into drag zone
 sideInfo.addRow(infoTable.getRow(i));
 }
 }
 }*/

// method to print items  to file in nicely formated format  (those that were dragged into drag zone and saved into sideInfo )
public void printToFile(ArrayList<Button> shows, Table infoTable)
{
  printing =true;
  // ease of use, user doesnt have  to input file format
  fileName=fileName+".doc";
  fileNameTemp=fileName;
  //creating new writers
  PrintWriter printWriter;
  printWriter= createWriter(fileName);

  for (int i=0; i<sideInfo.getRowCount(); i++)
  {
    // outputing info to file
    printWriter.println ("Title:              "+sideInfo.getString(i, 0));
    printWriter.println ("Produced by Studio: "+sideInfo.getString(i, 1));
    printWriter.println ("Number of Episodes: "+sideInfo.getString(i, 2));
    printWriter.println ("First Aired On:     "+sideInfo.getString(i, 3));
    printWriter.println ("Currently airs on:  "+sideInfo.getString(i, 4));
    printWriter.println ("Channel:            "+sideInfo.getString(i, 5));
    printWriter.println ("");
  }   
  textInput=false;
  // closing and flushing writer
  printWriter.flush();
  printWriter.close();
}
// method to get all user input via keyboard
public void keyPressed()
{
  // getting user input for new show m by assigning same string variable to different strings in rotation
  switch(addInput)
  {
  case 0: 
    title=fileName; 
    break;
  case 1: 
    studio=fileName; 
    break;
  case 2: 
    episodes=fileName; 
    break;
  case 3: 
    aired=fileName; 
    break;
  case 4: 
    airs=fileName; 
    break;
  case 5: 
    channel=fileName; 
    break;
  }  
  //processing keyboard input
  if (keyCode==BACKSPACE) 
  {
    if (fileName.length() > 0) 
    {
      fileName = fileName.substring(0, fileName.length()-1);
    }
  } 
  else if (keyCode==DELETE)
  {
    fileName= "";
  }
  else if (keyCode!=SHIFT && keyCode!=CONTROL && keyCode!=ALT && keyCode!=ENTER && keyCode!=RETURN) 
  {
    fileName=fileName+key;
  }
  if (keyCode==ENTER || keyCode==RETURN )
  {
    //increasing rotation number on enter 
    addInput++;
    // assigning title to filename , changing addInput to 20 so it will activate trigger in deletion method
    if (deletionDisplay|| searchDisplay || favouritesearch)
    {
      title=fileName;
      addInput=20;
      // disabling other text messages
      found=false;
      deleted=false;
      saved=false;
      favoriteRemoved=false;
      notfound=false;
      textInput=false;
    }
    // check if file has been saved already, to prevent multiple saves of same item and various other issues if user misbehaves
    if (!printing &&!(addInput==20))
    {
      //disabling other text messages 
      savedTimer = millis();
      textInput=false;
      deleted=false;
      found=false;
      notfound=false;
      saved=false;
      favoriteRemoved=false;
      if (animeOn)
      { 
        // passing anime info to print method
        printToFile(animeShows, animeInfo);
      }
      if (tvShowOn)
      {
        // passing tvshow info to print method
        printToFile(tvShows, tvInfo);
      }
    }
    // reseting filename after it was processed so it can be reused without making user to delete old entered info
    fileName="";
  }
}
// method to display stored shows in sideInfo
public void displayStored()
{
  fill(text);
  textFont(textFont, fontSizeText);
  k=0;
  for (int i=0; i<sideInfo.getRowCount(); i++)
  {
    // getting string from table and displaying it on screen
    textLeading(20);
    text(sideInfo.getString(i, 0), width/1.49f, 85+k, 120, 50);
    text(sideInfo.getString(i, 1), width/1.31f, 85+k, 120, 50);
    text(sideInfo.getString(i, 2), width/1.18f, 100+k);
    //text(info.getString(i, 3), width/1.20, 100+k,100,100);
    text(sideInfo.getString(i, 4), width/1.14f, 100+k);
    text(sideInfo.getString(i, 5), width/1.07f, 85+k, 70, 50);
    // increasing y coordinate between each loop
    if (sideInfo.getString(i, 0).length()>20 ||sideInfo.getString(i, 1).length()>20 ||sideInfo.getString(i, 5).length()>12 )
    {
      k=k+40;
    }
    else 
    {
      k=k+20;
    }
  }
}

public void update2(float x, float y)
{
  // check for locked states  if it matches, updates the buttons so highligh color can change back and forth
  if (locked == false) 
  {
    //enabling buttons based on variety of conditions such as which show is on, if any are on 
    if (animeOn)
    {
      for (int i=0; i<numberOfObjects ;i++)
      {
        animeShows.get(i).update();
        animeShows.get(i).drag(mouseX, mouseY);
      }
    }
    if (tvShowOn)
    {
      for (int i=0; i<numberOfObjects ;i++)
      {
        tvShows.get(i).update();
        tvShows.get(i).drag(mouseX, mouseY);
      }
    }
    for (int i=0; i<pageButtons.size();i++)
    {
      pageButtons.get(i).updatePages();
    }
    animeButton.update();
    tvShowButton.update();
    helpButton.update();
    searchButton.update();
    // disabled buttons unelss conditions are met
    if (toggle && overOne)
    {
      saveButton.update();
      clearStoredButton.update();
      clearLastStoredButton.update();
      removeFavoriteButton.update();
    }
    // buttons disabled untill one of tv collections are chosen
    if (animeOn || tvShowOn)
    {
      deleteButton.update();

      addButton.update();
      // no longer used
      // storeSideButton.update();
      toggleButton.update();
    }
  } 
  else 
  {
    // sets locked to false so buttons can be updated
    locked=false;
  }
  if (mousePressed)
  {
    if (animeOn)
    {
      for (int i=0; i<animeShows.size() ;i++)
      {
        animeShows.get(i);
        if (animeShows.get(i).clicked())
        {
          // empty on purpose to trigger dragging conditions
        }
      }
    }
    if (tvShowOn)
    {
      for (int i=0; i<tvShows.size() ;i++)
      {
        tvShows.get(i);
        if (tvShows.get(i).clicked())
        {
          // empty on purpose to trigger dragging conditions
        }
      }
    }
  }
}

// button class 
class Button
{
  // button class variables
  float x, y;
  int sizeX, sizeY, number;
  PImage image;
  float offsetx; 
  float offsety; 
  // state variables
  boolean over=false;
  boolean clicked=false;
  boolean locked=false;
  String title;

  // general constructor for images
  Button (float x, float y, int sizeX, int sizeY, PImage image, String title)
  {
    //assigning parameters to fields
    this.x=x;
    this.y=y;
    this.sizeX=sizeX;
    this.sizeY=sizeY;
    this.image=image;
    this.title=title;
    offsety = 0.0f; 
    offsetx = 0.0f;
  }
  // second constructor for pages buttons
  Button (float x, float y, int sizeX, int sizeY, int number)
  {
    //assigning parameters to fields
    this.x=x;
    this.y=y;
    this.sizeX=sizeX;
    this.sizeY=sizeY;
    this.number=number;
    offsety = 0.0f; 
    offsetx = 0.0f;
  }
  // display methodf or buttons
  public void display()
  {
    image(image, x, y, sizeX, sizeY);
  }
  // display method for page numbers/buttons
  public void displayPages()
  {
    fill(headerText);
    textFont(nameFont, 25);
    text(number, x+10, y+20);
  }
  // update method for anime/tv cards
  public void update() 
  {
    // when mouse is over button
    if ( overButton(x, y, sizeX, sizeY) ) 
    {  
      fill(dragArea);
      strokeWeight(1);
      stroke(0);
      // help button popup update
      if (title.length()>100)
      {
        rect(x-205, y-208, 265, 205, 10);
        fill(dragHeader);
        textFont(textFont, fontSizeText);
        textLeading(12);
        // text output
        text(title, x-200, y-208, 255, 205);
      }
      // all other buttons popup update
      else if (title.length()<99 )
      {
        textFont(textFont, fontSizeText);
        // creating background rectangle to make text more readable 
        rect(x-5, y-20, textWidth(title)+10, 17, 5);
        fill(dragHeader);
        // text output
        text(title, x, y-7);
      }
    }

    // when mouse is away from button
    else 
    {
    }
  }

  // necessary to make page buttons work
  public void updatePages() 
  {
    // when mouse is over button
    if ( overButton(x, y, sizeX, sizeY) ) 
    {
    } 

    // when mouse is away from button
    else 
    {
    }
  }



  public boolean  clicked()
  {
    // uses information from overButton method, and changes locked state
    if (over) 
    {
      locked = true;
      offsetx = x-mouseX; 
      offsety = y-mouseY; 

      return true;
    } 
    else 
    {
      locked = false;
      return false;
    }
  }
  // method used to check mouse position
  public boolean overButton(float x, float y, int width, int height) 
  {
    // mouse possition check, if it matches button dimensions, returns true
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) 
    {
      over = true;
      return true;
    } 
    // false if mouse isnt over buttons
    else {
      over = false;
      return false;
    }
  }
  // function to stop dragging when called
  public void stopDragging()
  {
    locked=false;
  }
  // drag function
  public void drag (float mouseX, float mouseY)
  {
    if (locked) 
    {
      // changing x and y values
      x=mouseX+offsetx; 
      y=mouseY+offsety;
    }
  }
  // accessor method to get x
  public float getX()
  {
    return x;
  }
}

// creating new show objects based on caller parameters
public void shows(ArrayList<Button> shows, Table infoTable, ArrayList<PImage> posters, int j)
{
  // clearing existing array list so new shows can be displayed
  shows.clear();
  pageButtons.clear();
  // counters to reset x and y positions
  int y=0; 
  int x=0;
  // coordinates
  float xpos=width*.01923f, ypos=height*.03571f;
  double numberOfPages=0;
  // creating new shows, based on which page called them, starting show value is passed as j
  for ( ; j<infoTable.getRowCount(); j++)
  {
    shows.add (new Button( xpos, ypos, Math.round(width*.0769f), Math.round(height*.2057), posters.get(j), infoTable.getString(j, 0)));
    xpos=xpos+width*.0961;
    y++;
    x++;
    // changing ypos and xpos values to  create new rows if 5 items were displayed
    if (y==5)
    {
      ypos+=height*.2414f;
      xpos=width*.01923f;
      y=0;
    }
    if (x==20)
    {
      ypos=height*.03571f;
      ;
      x=0;
    }
  }
  // getting number of pages , by calculating using ceil function
  numberOfPages=(int)Math.ceil(infoTable.getRowCount()/20.0f);  
  ypos=20;
  // creating new page buttons
  for (int i=0; i<numberOfPages; i++)
  {
    pageButtons.add(new Button (width*.4795f, ypos, 30, 30, i+1));
    ypos+=50;
  } 
  // getting number of objects displayed for proper page layout , 20 if there are more than 20 shows, or less if there isnt 20 in page range
  numberOfObjects=Math.min(20, shows.size());
}

// file selection method
public void fileSelected(File selection) 
{
  if (selection == null) 
  {
    // increasing addInput so add show can end and displaying error message if it was canceled
    fill(text);
    textFont(textFont, fontSizeText);
    text("Window was closed or the user hit cancel.", width*.37f, height*.44f);
    addInput++;
  } 
  else 
  {
    //loading image that was got by selection
    PImage temp = loadImage(selection.getAbsolutePath());
    //saving image to sketch data folder
    if (animeOn)
    {
      temp.save("data/animePosters/"+title+".jpg");
    }
    if (tvShowOn)
    {
      temp.save("data/tvPosters/"+title+".jpg");
    }
    // message to confirm that poster was added
    text("Poster Added", width*.37f, height*.44f);
    // increasing addInput so add show can end
    addInput++;
    //calling add show method and passing parameters
    if (animeOn)
    {
      addShow(animeInfo, "animeinfo.csv", animePosters);
    }
    if (tvShowOn)
    {
      addShow(tvInfo, "tvinfo.csv", tvPosters);
    }
  }
}

// method to display promts for user  when adding new show
public void addDisplayShow()
{
  //drawing frame
  fill(background); 
  stroke(1);
  rect(width*.35f, height*.35f, width*.3f, height*.1f, 5);
  fill(text);
  textFont(textFont, fontSizeText);
  text("Add new Series menu", width*.455f, height*.38f);
  //changing promts for user, information is gotten in keyPressed method by using addInput value
  switch(addInput)
  {
  case 0: 
    text("Title: "+fileName+(frameCount/10 % 2 == 0 ? "_" : ""), width*.37f, height*.44f); 
    break;
  case 1: 
    text("Studio: "+fileName+(frameCount/10 % 2 == 0 ? "_" : ""), width*.37f, height*.44f); 
    break;
  case 2: 
    text("Number of Episodes: "+fileName+(frameCount/10 % 2 == 0 ? "_" : ""), width*.37f, height*.44f); 
    break;
  case 3: 
    text("First Time Aired(date): "+fileName+(frameCount/10 % 2 == 0 ? "_" : ""), width*.37f, height*.44f); 
    break;
  case 4: 
    text("Curent Airing Time: "+fileName+(frameCount/10 % 2 == 0 ? "_" : ""), width*.37f, height*.44f); 
    break;
  case 5: 
    text("Channel airing on: "+fileName+(frameCount/10 % 2 == 0 ? "_" : ""), width*.37f, height*.44f); 
    break;
  case 6: 
    text("Please select a poster file", width*.37f, height*.44f); 
    break;
  }
  // closing promt display after went through all promts
  if (addInput==8)
  {
    addInput=0;
    addDisplay=false;
    printing=false;
  }
}

// method to write new show information to a file
public void addShow(Table table, String fileName, ArrayList<PImage> posters)
{ 
  // text promt boolean
  deleted=false;
  // creating new row and storing information in it that was gotten in keyPressed and addDisplay methods ( did i already mention how annoying is user input in processing )
  TableRow newRow= table.addRow();
  newRow.setString("Title", title);
  newRow.setString("Studio", studio);
  newRow.setString("Episodes", episodes);
  newRow.setString("Aired", aired);
  newRow.setString("Airs", airs);
  newRow.setString("Channel", channel);
  newRow.setString("Poster", title+".jpg");
  saveTable(table, "data/"+fileName);
  // calling timed message and passing boolean value to indicate which message to display
  savedTimer = millis();
  saved=true;  
  //loading new poster into ArrayList so it can be displayed
  if (animeOn)
  {
    posters.add(loadImage("animePosters/"+table.getString(table.getRowCount()-1, 6)));
  }
  if (tvShowOn)
  {
    posters.add(loadImage("tvPosters/"+table.getString(table.getRowCount()-1, 6)));
  }
}

// method to delete a show from file
public void deleteShow(Table table, String fileName, ArrayList<PImage> posters)
{
  saved=false;
  deleted=false;
  notfound=false;
  for (int i=0; i<table.getRowCount(); i++)
  {
    // search algorithm to find if show that user wans to delete actually exist and is stored, if it exist it will be deleted, if it doesnt error message will be displayed to let user know
    if (title.equalsIgnoreCase(table.getString(i, 0)))
    {
      table.removeRow(i);
      saveTable(table, "data/"+fileName);
      posters.remove(i);
      deleted=true;
      deletionDisplay=false;
      savedTimer = millis();
    }
  }
  // if show not found error message 
  if (!deleted)
  {
    notfound=true;
    savedTimer = millis();
    deletionDisplay=false;
  }
}

//method for displaying  deletion promts
public void deleteShowDisplay()
{
  fill(text);
  textFont(textFont, fontSizeText);
  // promt for user
  text("Enter title of a show to delete: "+fileName+(frameCount/10 % 2 == 0 ? "_" : ""), width*.67f, height*.88f);
  // calling methods once deleteShowDisplay was triggered by button press
  if (addInput==20)
  {
    if (animeOn)
    {
      deleteShow(animeInfo, "animeinfo.csv", animePosters);
    }
    if (tvShowOn)
    {
      deleteShow(tvInfo, "tvinfo.csv", tvPosters);
    }
    // reseting addinput from 20 to 0 to enable other user input from keyboad functions
    addInput=0;
    // disabling enter calling print to file method
    printing=false;
  }
}

// method to search for a show
public void findShow()
{
  notfound=false;
  found=false;
  // searching anime database
  for (int i=0; i<tvInfo.getRowCount(); i++)
  {
    // search algorithm 
    if (title.equalsIgnoreCase(animeInfo.getString(i, 0)))
    {
      sideInfo.addRow(animeInfo.getRow(i));
      saveTable(sideInfo, "data//favourites.csv");
      searchDisplay=false;
      savedTimer = millis();
      found=true;
    }
  }
  //searching tv databse
  for (int i=0; i<tvInfo.getRowCount(); i++)
  {
    // search algorithm 
    if (title.equalsIgnoreCase(tvInfo.getString(i, 0)))
    {
      sideInfo.addRow(tvInfo.getRow(i));
      saveTable(sideInfo, "data//favourites.csv");
      searchDisplay=false;
      savedTimer = millis();
      found=true;
    }
  }
  // if show not found error message 
  if (!found)
  {
    notfound=true;
    savedTimer = millis();
    searchDisplay=false;
  }
}

//method for displaying  search promts
public void findShowDisplay()
{
  fill(text);
  textFont(textFont, fontSizeText);
  // promt for user
  text("Enter title of a series to search: "+fileName+(frameCount/10 % 2 == 0 ? "_" : ""), width*.67f, height*.88f);
  // calling methods once deleteShowDisplay was triggered by button press
  if (addInput==20)
  {
    findShow();
    // reseting addinput from 20 to 0 to enable other user input from keyboad functions
    addInput=0;
    // disabling enter calling print to file method
    printing=false;
  }
}

//method for displaying  search promts
public void findFavoriteDisplay()
{
  fill(text);
  textFont(textFont, fontSizeText);
  // promt for user
  text("Enter title of a favourite to remove: "+fileName+(frameCount/10 % 2 == 0 ? "_" : ""), width*.67f, height*.88f);
  // calling methods once deleteShowDisplay was triggered by button press
  if (addInput==20)
  {
    removeFavorite();
    // reseting addinput from 20 to 0 to enable other user input from keyboad functions
    addInput=0;
    // disabling enter calling print to file method
    printing=false;
  }
}

// method to remove a favorite
public void removeFavorite()
{
  favoriteRemoved=false;
  notfound=false;
  for (int i=0; i<sideInfo.getRowCount(); i++)
  {
    // search algorithm to find if show that user wans to delete actually exist and is stored, if it exist it will be deleted, if it doesnt error message will be displayed to let user know
    if (title.equalsIgnoreCase(sideInfo.getString(i, 0)))
    {
      sideInfo.removeRow(i);
      saveTable(sideInfo, "data//favourites.csv");
      favoriteRemoved=true;
      favouritesearch=false;
      savedTimer = millis();
    }
  }
  // if show not found error message 
  if (!favoriteRemoved)
  {
    notfound=true;
    savedTimer = millis();
    favouritesearch=false;
  }
}



