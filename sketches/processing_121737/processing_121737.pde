
// Family Tree
// This program has been tailor made for Iona's grandmother, Bunty. She uses email to keep up 
// to date with family as they all live far apart. We wanted to create a simple,
// interactive way for her to view recent messages/ pictures that her children and
// grandchildren had sent her all in one place as she finds herself having to print off emails 
// to keep herself organised. The project has been centered around one main "Family
// Tree" that enables Bunty to click on a named leaf that then brings her to a seperate
// page all about what that selected person has been up to (their most recent email) and this 
// then links on to a photo page. The program functions using only the mouse and up/ down arrow
// keys so it isn't too complicated to use. There's 3 buttons clearly situated down the side of each 
// page that can be clicked to take her back to either the home page or the page she was previously on.
// As email is the main form of contact, there's a mail icon that when clicked, will open up a new
// window in the internet browser that links to the Hotmail hompage. When Norman was creating
// the code he made sure to comment it out in a way that it will be easy for Iona to understand 
// where to insert updated information into in the future so that the program stays relevant. 
// There is room for expansion in the future by adding more leaves for extended family members
// or friends of Bunty. 
// In the code the naming used for variables and functions were kept to the design aspect 
// of the tailor made project, with seed used to represent family members as seeds from the tree,
// their pages represented as branches from the tree and whole idea of displaying the information 
// is to represent how the seeds have grown.


//    Delaring variables
//===========================
int keysScroll;// variable for key scroll action
int seed;  // variable use for creating pages

// Declaring Array carrying background pictures and banners to make up screens
//=============================================================================
String[] seeds = {"seed.jpg","tree.jpg"
            ,"jen_background.jpg","Jen Background Top Banner.jpg","Jen Background bottom banner.jpg"
            ,"Angus_background.jpg","Angus_top.jpg","Angus_bottom.jpg"
            ,"Iona_background.jpg","Iona_top.jpg","Iona_bottom.jpg"
            ,"Heather_background.jpg","Heather_top.jpg","Heather_bottom.jpg"
            ,"Aileen_background.jpg","Aileen_top.jpg","Aileen_bottom.jpg"
            ,"Rory_background.jpg","Rory_top.jpg","Rory_bottom.jpg"};
            
            
// Declaring Array carrying button pictures
//=================================================
String[] Buttons = {"mail_button.jpg","photo_button.jpg","leaf_button.jpg"
                    ,"text_button.jpg"};
                    
                    
// Declaring Array carrying picture for photo pages
//===================================================
String[] Photo_pages = {"angus_photos.jpg","iona_photos.jpg","heather_photos.jpg"
                        ,"aileen_photos.jpg","rory_photos.jpg","jen_photos.jpg"};
 
// Declaring Strings with personalised text
//===========================================
String[] Jen_text;
String[] Angus_text;
String[] Iona_text;
String[] Heather_text; // all names associated with the project text files
String[] Aileen_text;
String[] Rory_text;


// Declaring variables used to load images
//============================================
PImage Seed;
PImage Tree;
PImage Branch_;
PImage Buttons_;
PImage Photos;

// Declaring seed click positions
//================================
float[] Seed_btnX = { 225, 325 };
float[] Seed_btnY = { 600, 690 };

// Declaring positions for Buttons 
//===================================
float xpos_buttons = 435;
float[] ypos_buttons = {300, 405, 510};


// Declaring variables for co-ordinates to mouse actions
//========================================================

// Photo button which takes you to photo page
//--------------------------------------------
// These figures are also used for the mail button and the leaf button
float[] btnX = { 400, 550 };     // x- position as they are in the same line 
float[] P_btnY = { 430, 525 };   // y-pos for points

//text button ( to text from photo page )
//----------------------------------------
float[] T_btnX = { 120, 220 };// x-pos for points
float[] btnY = { 10, 100 }; // the Y- positions used here are also used for
                          // the leaf button ( links tree page from photo page
// mail button links to online sign in for email
float[] M_btnY = { 300, 400 };// y-pos for points
// leaf button links to tree from text
float[] L_btnY = { 530, 625 };// y-pos for points
// leaf2 button links tree from text page
float[] L2_btnX = {10, 110 };// x-pos points

// X and Y points for mouse actions on tree page
// Here more places can be added to tree to click on
//===================================================
// Angus 
//-------
float[] AnglfX = { 50, 125 };
float[] AnglfY = { 160, 300 };
// Iona
//------
float[] IonlfX = {240, 360 };
float[] IonlfY = { 50, 175 };
// Heather
//---------
float[] HealfX = { 390, 560 };
float[] HealfY = { 160, 230 };
// Aileen
//--------
float[] AillfX = { 30, 130 };
float[] AillfY = { 370, 480 };
// Rory
//------
float[] RorlfX = {300, 380 };
float[] RorlfY = { 300, 475 };
// Jennifer
//----------
float[] JenlfX = { 440, 580 };
float[] JenlfY = { 380, 435 };

// This is to place top and botton banners
// 0 in here is use for all screen pages (x and y points), these variables can be altered if required
float[] Ban = { 0, 635 };// these are both x an y point (x being called twice for x 
                      // and once for y)
                      
// Declaring variables for line spacing on text
//==============================================
float[] L_spc = { 20, 18 }; // fisrt number first space then spaces 
                          // after is the next numbers these can be edited to suit
                          // all text files                          
// Declaring positions for text
//==================================
float[] xpos_text = {18, 13, 16}; // sets different positions x-axis
float ypos_text = 100; // text position down from top

// Declaring text sizes
// ====================
float[] Txt_S = { 27, 50, 80, 29, 24 };// first size for body of text
                        // second for headline third for seed page
                     // 29 and 34 set different body text size for two 
                     /// members can be split up if needed
// Declaring font
//================
PFont Text_Type;
// Declaring scroll speed
//========================
float Scrl_sp = 14;// sets scroll speed

//  SETUP
//====================================
void setup() 
{  
  size(600, 690);
  // Setting up start page
  //========================  
  seed=0;  
  // Setting up the strings to be loaded to each page
  //===================================================
  Jen_text = loadStrings("Jen Message.txt");
  Iona_text = loadStrings("Iona message.txt");
  Aileen_text = loadStrings("Aileen.txt");
  Rory_text = loadStrings("Rory Message.txt");
  Heather_text = loadStrings("Heather message.txt");// each string loaded personalised names attached 
  Angus_text = loadStrings("Angus Message.txt");    // to both txt file and function attached
  Text_Type = loadFont("Gabriola-48.vlw");// loading font
  
}

void draw() 
{
  // Start screen
  //================
  if ( seed == 0 ) {   
    Seed();// Calling start page
  }   
  // The Tree Screen
  //==================
  if (seed == 1) {
   Tree(); // Calling tree page
  }  
  // Angus's Page
  //===============
  if (seed == 2) {
   Angus(); // Calling Angus's page  
  }  
  // Iona's Page
  //===============
  if (seed == 3){
    Iona(); // Calling Iona's page
  } 
  //Heather's Page
  //===============
  if (seed == 4){
    Heather(); // Calling Heather's page
  }  
  // Aileen's Page
  //================
  if (seed == 5){
    Aileen(); //Calling Aileen's page
  }  
  // Rory's Page
  //================
  if (seed == 6){
    Rory(); // Calling Rory's page
  }  
  // Jennifer's Page
  //=================
  if (seed == 7){
     Jen(); // Calling Jen's page
  } 
 // Here photo pages are called
//============================== 
  // Angus's Photo Page
  //====================
  if (seed == 8){
    Angus_photos(); // Calling Angus's photo page
  }  
  // Iona's Photo Page
  //====================
  if (seed == 9){
    Iona_photos(); // Calling Iona's photo page
  }  
  // Heather's Photo Page
  //====================
  if (seed == 10){
    Heather_photos();  // Calling Heather's photo page
  } 
  // Aileen's Photo Page
  //====================
  if (seed == 11){
    Aileen_photos();  // Calling Aileen's photo page
  }  
  // Rory's Photo Page
  //====================
  if (seed == 12){
    Rory_photos();  // Calling Rory's photo page
  }
  // Jennifer's Photo Page
  //====================
  if (seed ==13){
    Jen_photos();   // Calling Jennifer's photo page
  } 
}
// Creating screen with seed - Start screen
//===========================================
void Seed()
{
  // loading and position of image
  //================================
  Seed = loadImage(seeds[0]);  // loading seed image  
  image(Seed,Ban[0],Ban[0]);  // positioning picture 
  seedText ();  
}
// Creating text for seed screen
//================================
void seedText ()
{
  textFont(Text_Type);// loading font
  textSize(Txt_S[2]); // adjusting size can create control if needed
  fill(0,100,0); // text colour 
  text("Click Seed to Begin", 60, 200);// setting text and position  
}

// Creating Tree Page
//====================
void Tree()
{
  // loading and position of image
  //================================
  Tree=loadImage(seeds[1]); // loading tree image   
  image(Tree,Ban[0],Ban[0]);// positioning picture     
}

// Creating Angus's Page
//========================
void Angus()
{
  // loading and position of image
  //================================
  Branch_= loadImage(seeds[5]); // Loadimg Angus's page image 
  image(Branch_,Ban[0],Ban[0]); // positioning picture   
  Keyscrl();   // Calling keyscroll fuction
  AngusText(); // Call angus text
  Button (); // Calling buttons 
  AngusBan(); // Calling banners
    
}
// Creating angus banners
//=======================
void AngusBan()
{
 // Loading and positioning banners to cover text at top and bottom
  //==================================================================
  for (int i=6; i<=7; i++){
    for (int j=0; j<2; j++){
      Branch_= loadImage(seeds[i]);// loading banners
      image(Branch_,Ban[0],Ban[j]);// positioning of banners
      i++;  
      }
    } 
}
// Creating text for angus's page
//================================
void AngusText()
{
 // loading text to page
  //------------------------------------------------------------
  fill(0);                                    // declaring colour of text 
  textFont(Text_Type);
  textSize(Txt_S[1]);
  text(""+Angus_text[0], xpos_text[0],ypos_text+keysScroll);
  textSize(Txt_S[3]);                               // declaring size of text
  for ( int i = 1; i < Angus_text.length; i++){ // loop to drag edited file from loop
    text(""+Angus_text[i], xpos_text[1],ypos_text+(i*L_spc[0]+L_spc[1])+keysScroll);// numbers here for file line spacing
  } 
}
// Creating Angus's Photo page
//===============================
void Angus_photos()
{
  // loading and position of image
  //================================
  Photos= loadImage(Photo_pages[0]);// Loadimg Angus's photo page image  
  image(Photos,Ban[0],Ban[0]);     // positioning picture  
}

// Creating Iona's Page
//========================
void Iona()
{
  // loading and position of image
  //================================
  Branch_= loadImage(seeds[8]);  // Loadimg Iona's page image 
  image(Branch_,Ban[0],Ban[0]); // positioning picture    
  Keyscrl();  // Calling keyscroll fuction
  IonaText(); // Calling text  
  Button (); // Calling buttons 
  IonaBan(); // Calling banners
 
}
// creating iona banners
//=======================
void IonaBan()
{
 // Loading and positioning banners to cover text at top and bottom
  //==================================================================
  for (int i=9; i<=10; i++){
    for (int j=0; j<2; j++){
      Branch_= loadImage(seeds[i]);// loading banners
      image(Branch_,Ban[0],Ban[j]);// positioning banners
      i++;  
      }
    } 
}
// Creating iona text
//====================
void IonaText()
{
 // loading text to page
  //=======================================================
  fill(0);                                              // declaring colour of text
  textFont(Text_Type);
  textSize(Txt_S[1]);
  text(""+Iona_text[0], xpos_text[0],ypos_text+ keysScroll);
  textSize(Txt_S[0]);          // declaring size of text  
  for ( int i = 1; i < Iona_text.length; i++){ // loop to drag edited file from loop
    text(""+Iona_text[i], xpos_text[1],ypos_text+(i*L_spc[0]+L_spc[1])+keysScroll);// numbers here for file line spacing
  } 
}
// Creating Iona's photo Page
//============================
void Iona_photos()
{
  // loading and position of image
  //================================
  Photos= loadImage(Photo_pages[1]); // Loadimg Iona's photo page image   
  image(Photos,Ban[0],Ban[0]);      // positioning picture 
}

// Creating Heather's Page
//========================
void Heather()
{
  // loading and position of image
  //================================
  Branch_= loadImage(seeds[11]);// Loadimg Heather's page image
  image(Branch_,Ban[0],Ban[0]);// positioning picture   
  Keyscrl();  // Calling keyscroll fuction
  HeathText();// Calling text    
  Button (); // Calling buttons 
  HeathBan();// calling banners  
}
// creating heather banners
//==========================
void HeathBan()
{
 // Loading and positioning banners to cover text at top and bottom
  //==================================================================
  for (int i=12; i<=13; i++){
    for (int j=0; j<2; j++){
      Branch_= loadImage(seeds[i]);// loading banners 
      image(Branch_,Ban[0],Ban[j]);// positioning banners
      i++;  // adding one 
      }
    } 
}
// Creating heather text
//=======================
void HeathText()
{
 // loading text to page
  //=======================================================
  fill(0);                             // declaring colour of text
  textFont(Text_Type);
  textSize(Txt_S[1]);// Enlarging text for welcome message
  text(""+Heather_text[0], xpos_text[0],ypos_text+ keysScroll);
  textSize(Txt_S[4]);                        // declaring size of text
  for ( int i = 1; i < Heather_text.length; i++){ // loop to drag edited file from loop
    text(""+Heather_text[i], xpos_text[2],ypos_text+(i*L_spc[0]+L_spc[1])+keysScroll);// numbers here for file line spacing
  } 
}
// Creating Heather's photo Page
//===============================
void Heather_photos()
{
  // loading and position of image
  //================================
  Photos= loadImage(Photo_pages[2]);// Loadimg Heather's photo page image  
 image(Photos,Ban[0],Ban[0]);      // positioning picture 
}

// Creating Aileen's Page
//===============================
void Aileen()
{
  // loading and position of image
  //================================
  Branch_= loadImage(seeds[14]);// Loadimg Aileen's page image
  image(Branch_,Ban[0],Ban[0]); // positioning picture   
  Keyscrl();  // Calling keyscroll fuction
  AilText(); // calling text  
  Button (); // Calling buttons 
  AilBan(); // calling banners 
}
// creating aileen banners
//=========================
void AilBan()
{
  // Loading and positioning banners to cover text at top and bottom
  //==================================================================
  for (int i=15; i<=16; i++){
    for (int j=0; j<2; j++){
      Branch_= loadImage(seeds[i]);// loading banners 
      image(Branch_,Ban[0],Ban[j]);// positioning banners
      i++;  // adding one 
      }
    } 
}
// creating aileen's text
//========================
void AilText()
{
 // loading text to page
  //=======================================================
  fill(0);   // declaring colour of text
  textFont(Text_Type);
  textSize(Txt_S[1]);
  text(""+Aileen_text[0], xpos_text[0],ypos_text+ keysScroll);
  textSize(Txt_S[4]);   // declaring size of text
  for ( int i = 1; i < Aileen_text.length; i++){ // loop to drag edited file from loop
    text(""+Aileen_text[i], xpos_text[0], ypos_text+( i*L_spc[0]+L_spc[1]) + keysScroll);// numbers here for file line spacing
  } 
}
// Creating Aileen's photo Page
//===============================
void Aileen_photos()
{
  // loading and position of image
  //================================
  Photos= loadImage(Photo_pages[3]);// Loadimg Aileen's photo page image  
  image(Photos,Ban[0],Ban[0]);     // positioning picture 
}

// Creating Rory's Page
//===============================
void Rory()
{
  // loading and position of image
  //================================
  Branch_= loadImage(seeds[17]);// Loadimg Rory's page image
   image(Branch_,Ban[0],Ban[0]);// positioning picture  
  
  Keyscrl();  // Calling keyscroll fuction
  RoryText(); // Calling rory's text  
  Button (); // Calling buttons 
  RoryBan(); // Calling rory's banners  
}
// creating Rory's text
//======================
void RoryText()
{
 // loading text to page
  //=======================================================
  fill(0);                                             // declaring colour of text
  textFont(Text_Type);
  textSize(Txt_S[1]);
  text(""+Rory_text[0], xpos_text[0],ypos_text+ keysScroll);
  textSize(Txt_S[4]);                                        // declaring size of text
  for ( int i = 1; i < Rory_text.length; i++){ // loop to drag edited file from loop
    text(""+Rory_text[i], xpos_text[1], ypos_text+( i*L_spc[0]+L_spc[1]) + keysScroll);// numbers here for file line spacing
  } 
}
// creating rory banners
//=======================
void RoryBan()
{
 // Loading and positioning banners to cover text at top and bottom
  //==================================================================
  for (int i=18; i<=19; i++){
    for (int j=0; j<2; j++){
      Branch_= loadImage(seeds[i]);// loading banners
      image(Branch_,Ban[0],Ban[j]);// positioning banners
      i++;  // adding one 
      }
    } 
}
// Creating Rory's photo Page
//===============================
void Rory_photos()
{
  // loading and position of image
  //================================
  Photos= loadImage(Photo_pages[4]);// Loadimg Rory's photo page image  
  image(Photos,Ban[0],Ban[0]);     // positioning picture 
}

// Creating Jennifers's Page
//===============================
void Jen()
{
  JensScrn (); // Calling jen's screen   
  Keyscrl();   // Calling keyscroll fuction
  JensTxt (); // Calling Jens text
  Button (); // Calling buttons 
  JensBan(); // Calling Jen's banners 
}
// creating jens screen
//======================
void JensScrn ()
{
 // loading and position of image
  //================================
  Branch_= loadImage(seeds[2]); // Loadimg Jen's page image 
  image(Branch_,Ban[0],Ban[0]);// positioning picture  
}
// creating jens text
//=======================
void JensTxt ()
{
  // loading text to page
  //=======================================================
  fill(0);                                               // declaring colour of text  
  textFont(Text_Type);
  textSize(Txt_S[1]);
  text(""+Jen_text[0], xpos_text[0],ypos_text+ keysScroll);
  textSize(Txt_S[4]);                                          // declaring size of text
  for ( int i = 1; i < Jen_text.length; i++){ // loop to drag edited file from loop
    text(""+Jen_text[i], xpos_text[1], ypos_text+( i*L_spc[0]+L_spc[1]) + keysScroll);// numbers here for file line spacing
  } 
}
//creating jen banners
//======================
void JensBan()
{
 // Loading and positioning banners to cover text at top and bottom
  //==================================================================
  for (int i=3; i<=4; i++){
    for (int j=0; j<2; j++){
      Branch_= loadImage(seeds[i]);// loading banners 
      image(Branch_,Ban[0],Ban[j]);// positioning banners
      i++;  // adding one 
      }
    } 
}
// Creating Jennifers's photo Page
//=================================
void Jen_photos()
{
  // loading and position of image
  //================================
  Photos= loadImage(Photo_pages[5]);// Loadimg Jen's photo page image   
  image(Photos,Ban[0],Ban[0]);     // positioning picture 
}
// generating button lay out for screens
//======================================
void Button ()
{
 // loop to place three buttons in order
  //======================================
  for ( int i=0; i<3; i++){  // choosing first three buttons from array
    for (int j=0; j<3; j++){// placing them with co-ordinates from array
  Buttons_ = loadImage(Buttons[i]);  // images loaded from array
  image(Buttons_, xpos_buttons, ypos_buttons[j]);// placing images y-axis points in array
  i++;
    }
  } 
}
// Keyscroll function
//======================
void Keyscrl()
{
 // Creating keypressed to scroll text
  //===================================
  if (keyPressed){
    if (keyCode==UP) { // setting key to scroll up
      keysScroll+=Scrl_sp;  // setting speed of scroll
    } 
    else if (keyCode==DOWN) { // setting key to scroll down
      keysScroll-=Scrl_sp;         // setting scroll speed
    }
  } 
}

// Mouseclicked functions created for various elements in the program
//====================================================================
void mouseClicked()
{
  //Calling mouse actions for tree page links to member pages
  mouseleaf1();
  
  // Calling mouse actions for member pages to photo page 
  mousePhoto (); 
  
  // Calling mouse action for linking back to text pages from photo page
  mouseText ();  
  
}

// Mousepressed functions created for various elements in the program
//====================================================================
void mousePressed()
{
  // mousepressed action on start screen with seed
  //===============================================
  if (seed == 0){  // declaring the screen as first seed from array
    if (pmouseX > Seed_btnX[0] && pmouseX < Seed_btnX[1] && pmouseY > Seed_btnY[0] && pmouseY < Seed_btnY[1]){
    seed = 1;      // where the mouse action takes you- tree page
    }
  }  
  // mail button action taken from each members page linking to sign in page for email
  //===================================================================================
  if (seed >= 2 && seed <= 7){// declaring the page and mouse action within it
    if (pmouseX > btnX[0] && pmouseX < btnX[1] && pmouseY > M_btnY[0] && pmouseY < M_btnY[1]){// states the co-ordinates for the area to action mouse
    // where the mouse action takes you
      link("https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=11&ct=1384898849&rver=6.1.620.0&wp=MBI&wreply=http:%2F%2Fmail.live.com%2Fdefault.aspx&lc=2057&id=64855&mkt=en-gb&cbcxt=mai&snsc=1");
    }
  }  
  // leaf button action taken on family member pages linking back to tree
  //=====================================================================
  if (seed >= 2 && seed <= 7){// declaring the member pages and mouse action within it
    if (pmouseX > btnX[0] && pmouseX < btnX[1] && pmouseY > L_btnY[0] && pmouseY < L_btnY[1]){// states the co-ordinates for the area to action mouse
      seed = 1;// where the mouse action takes you
    }
  }  
  // leaf button action taken from photo pages linking back to tree
  //=================================================================
  if (seed >= 8 && seed <= 13){// declaring the photo pages and mouse action within it
    if (pmouseX > L2_btnX[0] && pmouseX < L2_btnX[1] && pmouseY > btnY[0] && pmouseY < btnY[1]){// states the co-ordinates for the area to action mouse
      seed = 1;// where the mouse action takes you
    }
  }    
}
// creating mouse actions to link back to text from photo pages
//=============================================================
void mouseText ()
{
  // text button action used to link back to text from Angus's photo page
  //=======================================================================
  if (seed == 8){ // declaring the page and mouse action within it
   if (pmouseX > T_btnX[0] && pmouseX < T_btnX[1] && pmouseY > btnY[0] && pmouseY < btnY[1]){// states the co-ordinates for the area to action mouse
       seed = 2;// where the mouse action takes you
    } 
  }
  // text button action used to link back to text from Iona's photo page
  //==============================================================
  if (seed == 9){ // declaring the page and mouse action within it
     if (pmouseX > T_btnX[0] && pmouseX < T_btnX[1] && pmouseY > btnY[0] && pmouseY < btnY[1]){// states the co-ordinates for the area to action mouse
         seed = 3;// where the mouse action takes you
      } 
  }  
  // text button action used to link back to text from Heather's photo page
  //========================================================================
  if (seed == 10){ // declaring the page and mouse action within it
     if (pmouseX > T_btnX[0] && pmouseX < T_btnX[1] && pmouseY > btnY[0] && pmouseY < btnY[1]){// states the co-ordinates for the area to action mouse
         seed = 4;// where the mouse action takes you
      } 
  }
  // text button action used to link back to text from Aileen's photo page
  //=======================================================================
  if (seed == 11){// declaring the page and mouse action within it 
     if (pmouseX > T_btnX[0] && pmouseX < T_btnX[1] && pmouseY > btnY[0] && pmouseY < btnY[1]){// states the co-ordinates for the area to action mouse
         seed = 5;// where the mouse action takes you
      } 
  }
  // text button action used to link back to text from Rory's photo page
  //=====================================================================
  if (seed == 12){// declaring the page and mouse action within it 
     if (pmouseX > T_btnX[0] && pmouseX < T_btnX[1] && pmouseY > btnY[0] && pmouseY < btnY[1]){// states the co-ordinates for the area to action mouse
         seed = 6;// where the mouse action takes you
      } 
  }  
  // text button action used to link back to text from Jen's photo page
  //====================================================================
  if (seed == 13){ // declaring the page and mouse action within it
     if (pmouseX > T_btnX[0] && pmouseX < T_btnX[1] && pmouseY > btnY[0] && pmouseY < btnY[1]){// states the co-ordinates for the area to action mouse
         seed = 7;// where the mouse action takes you
      } 
  } 
}
// mouse actions for member pages to photo page
//===============================================
void mousePhoto ()
{  
  // button action declared for mouse action
  if (seed == 2){// declaring the page and mouse action within it
    if (pmouseX > btnX[0] && pmouseX < btnX[1] && pmouseY > P_btnY[0] && pmouseY < P_btnY[1]){// states the co-ordinates for the area to action mouse
       seed = 8;// where the mouse action takes you
    }
  }  
  // photo button action used to link to Iona's photo page 
  //=======================================================
  if (seed == 3){// declaring the page and mouse action within it
    if (pmouseX > btnX[0] && pmouseX < btnX[1] && pmouseY > P_btnY[0] && pmouseY < P_btnY[1]){// states the co-ordinates for the area to action mouse
       seed = 9;// where the mouse action takes you
    }
  }  
  // photo button action used to link to Heather's photo page 
  //===========================================================
  if (seed == 4){// declaring the page and mouse action within it
    if (pmouseX > btnX[0] && pmouseX < btnX[1] && pmouseY > P_btnY[0] && pmouseY < P_btnY[1]){// states the co-ordinates for the area to action mouse
       seed = 10;// where the mouse action takes you
    }
  }  
  // photo button action used to link to Aileen's photo page 
  //=========================================================
  if (seed == 5){// declaring the page and mouse action within it
    if (pmouseX > btnX[0] && pmouseX < btnX[1] && pmouseY > P_btnY[0] && pmouseY < P_btnY[1]){// states the co-ordinates for the area to action mouse
       seed = 11;// where the mouse action takes you
    }
  }  
  // photo button action used to link to Rory's photo page 
  //=======================================================
  if (seed == 6){// declaring the page and mouse action within it
    if (pmouseX > btnX[0] && pmouseX < btnX[1] && pmouseY > P_btnY[0] && pmouseY < P_btnY[1]){// states the co-ordinates for the area to action mouse
       seed = 12;// where the mouse action takes you
    }
  }  
  // photo button action used to link to Jen's  photo page 
  //=======================================================
  if (seed == 7){// declaring the page and mouse action within it
    if (pmouseX > btnX[0] && pmouseX < btnX[1] && pmouseY > P_btnY[0] && pmouseY < P_btnY[1]){// states the co-ordinates for the area to action mouse
       seed = 13;// where the mouse action takes you
    }
  }   
}
//mouse actions for tree page links to member pages
//==================================================
void mouseleaf1()
{
  // the dimentions names are related to associated members
 if (seed == 1){// declaring the tree page and stating various mouse actions within it
    if (pmouseX > AnglfX[0] && pmouseX < AnglfX[1] && pmouseY > AnglfY[0] && pmouseY< AnglfY[1]){// states the co-ordinates for the area to action mouse
      seed = 2;// where the mouse action takes you
    }
    if (pmouseX > IonlfX[0] && pmouseX < IonlfX[1] && pmouseY > IonlfY[0] && pmouseY < IonlfY[1]){// states the co-ordinates for the area to action mouse
      seed = 3;// where the mouse action takes you
    }
    if (pmouseX > HealfX[0] && pmouseX < HealfX[1] && pmouseY > HealfY[0] && pmouseY < HealfY[1]){// states the co-ordinates for the area to action mouse
      seed = 4;// where the mouse action takes you
    }
    if (pmouseX > AillfX[0] && pmouseX < AillfX[1] && pmouseY > AillfY[0] && pmouseY < AillfY[1]){// states the co-ordinates for the area to action mouse
      seed = 5;// where the mouse action takes you
    }
    if (pmouseX > RorlfX[0] && pmouseX < RorlfX[1] && pmouseY > RorlfY[0] && pmouseY < RorlfY[1]){// states the co-ordinates for the area to action mouse
      seed = 6;// where the mouse action takes you
    }
    if (pmouseX > JenlfX[0] && pmouseX < JenlfX[1] && pmouseY > JenlfY[0] && pmouseY < JenlfY[1]){// states the co-ordinates for the area to action mouse
      seed = 7;// where the mouse action takes you
    }
  } 
}
// Generating a grid to help with positioning text and buttons
//=============================================================
void Grid()
{
  for ( int i = 0; i < 60; i++ ) { // creating loop to generate lines
    line( i*25, 0, i*25, height );// setting verticle lines every 25
  }
  for ( int i =0; i < 70; i++ ) {  // creating loop to generate lines
    line ( 0, i*25, width, i*25 ); // setting horizontal lines every 25
  }
}

