
String[] data; // creates a string array called data
String mode = "meanCompare"; // sets a default mode

ArrayList Content = new ArrayList(); // creates a "bucket" array for the Content class called into the sketch
ArrayList Sent = new ArrayList(); // allows for the storage of the sent emails
ArrayList Received = new ArrayList(); // allows for the storage of the recieved emails



float xmargin = 20; // sets up a standard distance from the left hand side of the screen
float textheading = 18; // text heading variable
float textbody = 12; // body heading variable
float textheadingy = 240; // text heading y position variable
float textbodyy = 210; // text body y position variable
float space = 5; // variable of spaces between categories
float sentypos = 20; // variable for the y position of the sent category
float receivedypos = 105; // variable for the x position of the sent category
float scale = 2.5; //sets up a scale
float h = 80; //creates a height variable

float SUNI = 1; // creates a sent Uni category counter
float SSOCIAL = 1; // creates a sent Social category counter
float SWORK = 1;// creates a sent work category counter
float SBAND = 1;// creates a sent band category counter
float SACCOM = 1; // creates a sent accomodation category counter
float SFINANCE = 1; //creates a sent finance category counter
float SADVERT = 1; // creates a sent advertising category counter

float RUNI = 1; // creates a Recieved Uni category counter
float RSOCIAL = 1; // creates a Recieved social category counter
float RWORK = 1; // creates a Recieved work category counter
float RBAND = 1;// creates a Recieved band category counter
float RACCOM = 1; // creates a Recieved accommodation category counter
float RFINANCE = 1; // creates a Recieved finance category counter
float RADVERT = 1;// creates a Recieved advert category counter

PFont font; // creates a font variable called "font" 

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
void setup() { // setup frunction. occurs
  size(1200, 280); // creates the sketch window size
  background(255); // makes the background white
  smooth(); // smooths out the shapes
  data = loadStrings("index.csv");  // loads the email data into the sketch
  font = createFont("FFScala-32.vlw", 12); // creates a default font
  for (int i=0; i<data.length; i++) { // run through the data
    Content newContent = new Content(data[i]); // calls the Content function and it attributes
    Content.add(newContent); // stroes the Content objects in the Content ArrayList
  }

  for (int i = 0; i<Content.size(); i++) { // runs throught the Content ArrayList
    Content c = (Content) Content.get(i); // gets a Content Object



    if (c.sender.equals("Timothy Dyer <timothyjamesdyer@gmail.com>")) { // if the content sender property is equal to my email address.
      Sent.add(c);// it is added to the "send" array list
      if (c.category.equals("UNI")) { //if its category is UNI
        SUNI ++;// add one to the sent uni variable
      }
      if (c.category.equals("SOCIAL")) {//if its category is Social
        SSOCIAL ++;// add one to the sent social variable
      }
      if (c.category.equals("WORK")) {//if its category is work
        SWORK ++;// add one to the sent work variable
      }
      if (c.category.equals("BAND")) {//if its category is band
        SBAND ++;// add one to the sent band variable
      }
      if (c.category.equals("FINANCE")) {//if its category is finance
        SFINANCE ++;// add one to the sent finance variable
      }
      if (c.category.equals("ACCOM")) {// //if its category is accommodation
        SACCOM ++;// add one to the sent accommodation variable
      }
      if (c.category.equals("ADVERT")) {// if its category is advertisement
        SADVERT ++;// add one to the sent advertisement variable
      }
    }
    else {

      Received.add(c);
      if (c.category.equals("UNI")) {//if its category is UNI
        RUNI ++;// add one to the sent uni variable
      }
      if (c.category.equals("SOCIAL")) {//if its category is Social
        RSOCIAL ++;// add one to the sent social variable
      }
      if (c.category.equals("WORK")) {//if its category is work
        RWORK ++;// add one to the sent work variable
      }
      if (c.category.equals("BAND")) {//if its category is band
        RBAND ++;// add one to the sent band variable
      }
      if (c.category.equals("FINANCE")) {//if its category is finance
        RFINANCE ++;// add one to the sent finance variable
      }
      if (c.category.equals("ACCOM")) {// //if its category is accommodation
        RACCOM ++;// add one to the sent accommodation variable
      }
      if (c.category.equals("ADVERT")) {// if its category is advertisement
        RADVERT ++; // add one to the recieved advertisement variable
      }
    }
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------

void draw() { // draw loop, loops continually 

  noStroke();// no boarding lines arround the objects


  //------------------Mean Compare--------------------------------------------------------------------------------------------------------------------------------------------------
  if (mode.equals("meanCompare")) { // if the mode equals meanCompare continue with the info below

    background(255); // set the background to white

    textFont(font, textheading); // set s the font size to the textheight variable
    text("COMPARE TOTAL", xmargin, textheadingy); // draws a heading 

    //--------------Sent emails-------------------
    textFont(font, textbody); // sets the text to a body text style

    //UNI - draws the university sent bar
    fill(0);// colours the rectangle
    rect(xmargin, sentypos, SUNI*scale, h); //creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin && mouseX < xmargin + SUNI*scale && mouseY > sentypos && mouseY < sentypos + h ) { //tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("UNIVERSITY " + nf(SUNI, 0, 0) + " SENT " + nf(RUNI, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

    //SOCIAL - draws the social sent bar
    fill(20);// colours the rectangle
    rect(xmargin+SUNI*scale+space, sentypos, SSOCIAL*scale, h); //creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+SUNI*scale+space && mouseX < xmargin + SUNI*scale + SSOCIAL*scale && mouseY > sentypos && mouseY < sentypos + h ) { //tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("SOCIAL " + nf(SSOCIAL, 0, 0) + " SENT " + nf(RSOCIAL, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

    //WORK - draws the work sent bar
    fill(60);// colours the rectangle
    rect(xmargin+SUNI*scale+space+SSOCIAL*scale+space, sentypos, SWORK*scale, h); //creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+SUNI*scale+space+SSOCIAL*scale && mouseX < xmargin + SUNI*scale + SSOCIAL*scale+SWORK*scale && mouseY > sentypos && mouseY < sentypos + h ) { //tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("WORK " + nf(SWORK, 0, 0) + " SENT " + nf(RWORK, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }


    //BAND - draws the band sent bar
    fill(100);// colours the rectangle
    rect(xmargin+SUNI*scale+space+SSOCIAL*scale+space+SWORK*scale+space, sentypos, SBAND*scale, h); //creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+SUNI*scale+space+SSOCIAL*scale+space+SWORK*scale+space && mouseX < xmargin + SUNI*scale +space+ SSOCIAL*scale+space+SWORK*scale+SBAND*scale && mouseY > sentypos && mouseY < sentypos + h ) { //tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("BAND " + nf(SBAND, 0, 0) + " SENT " + nf(RBAND, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

    //FINANCE - draws the finance sent bar    
    fill(140);// colours the rectangle
    rect(xmargin+SUNI*scale+space+SSOCIAL*scale+space+SWORK*scale+space+SBAND*scale+space, sentypos, SFINANCE*scale, h); //creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+SUNI*scale+space+SSOCIAL*scale+space+SWORK*scale+space+SBAND*scale+space && mouseX < xmargin + SUNI*scale +space+ SSOCIAL*scale+space+SWORK*scale+SBAND*scale+space+SFINANCE*scale+space && mouseY > sentypos && mouseY < sentypos + h ) { //tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("FINANCE " + nf(SFINANCE, 0, 0) + " SENT " + nf(RFINANCE, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

    //ACCOM - draws the accommodation sent bar
    fill(180);// colours the rectangle
    rect(xmargin+SUNI*scale+space+SSOCIAL*scale+space+SWORK*scale+space+SBAND*scale+space+SFINANCE*scale+space, sentypos, SACCOM*scale, h); //creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+SUNI*scale+space+SSOCIAL*scale+space+SWORK*scale+space+SBAND*scale+space+SFINANCE*scale+space && mouseX < xmargin + SUNI*scale +space+ SSOCIAL*scale+space+SWORK*scale+SBAND*scale+space+SFINANCE*scale+space+SACCOM*scale && mouseY > sentypos && mouseY < sentypos + h ) { //tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("ACCOM " + nf(SACCOM, 0, 0) + " SENT " + nf(RACCOM, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

    //ADVERT - draws the advertisement sent bar
    fill(220);// colours the rectangle
    rect(xmargin+SUNI*scale+space+SSOCIAL*scale+space+SWORK*scale+space+SBAND*scale+space+SFINANCE*scale+space+SACCOM*scale+space, sentypos, SADVERT*scale, h); //creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+SUNI*scale+space+SSOCIAL*scale+space+SWORK*scale+space+SBAND*scale+space+SFINANCE*scale+space+SACCOM*scale+space && mouseX < xmargin + SUNI*scale +space+ SSOCIAL*scale+space+SWORK*scale+SBAND*scale+space+SFINANCE*scale+space+SACCOM*scale+space+SADVERT*scale+space && mouseY > sentypos && mouseY < sentypos + h ) { //tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("ADVERT " + nf(SADVERT, 0, 0) + " SENT " + nf(RADVERT, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }
  }


  //------------------Category Compare--------------------------------------------------------------------------------------------------------------------------------------------------
  if (mode.equals("catCompare")) {

    background(255);

    textFont(font, textheading);
    text("COMPARE BY CATEGORY", xmargin, textheadingy);

    //--------------Sent emails-------------------
    textFont(font, textbody);

    //UNI - draws the university sent bar
    fill(0);// colours the rectangle
    rect(xmargin, sentypos, SUNI*scale, h);//creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin && mouseX < xmargin + SUNI*scale && mouseY > sentypos && mouseY < sentypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("UNIVERSITY " + nf(SUNI, 0, 0) + " SENT " + nf(RUNI, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }    

    //SOCIAL - draws the social sent bar
    fill(20);// colours the rectangle
    rect(xmargin+RUNI*scale+space, sentypos, SSOCIAL*scale, h);//creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+RUNI*scale+space && mouseX < xmargin + RUNI*scale + RSOCIAL*scale && mouseY > sentypos && mouseY < sentypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("SOCIAL " + nf(SSOCIAL, 0, 0) + " SENT " + nf(RSOCIAL, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

    //WORK - draws the work sent bar
    fill(60);// colours the rectangle
    rect(xmargin+RUNI*scale+space+RSOCIAL*scale+space, sentypos, SWORK*scale, h);//creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+RUNI*scale+space+RSOCIAL*scale && mouseX < xmargin + RUNI*scale + RSOCIAL*scale+RWORK*scale && mouseY > sentypos && mouseY < sentypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("WORK " + nf(SWORK, 0, 0) + " SENT " + nf(RWORK, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

    //BAND - draws the band sent bar
    fill(100);// colours the rectangle
    rect(xmargin+space+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale, sentypos, SBAND*scale+space, h);//creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space && mouseX < xmargin + RUNI*scale +space+ RSOCIAL*scale+space+RWORK*scale+RBAND*scale && mouseY > sentypos && mouseY < sentypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("BAND " + nf(SBAND, 0, 0) + " SENT " + nf(RBAND, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

    //FINANCE - draws the finance sent bar
    fill(140);// colours the rectangle
    rect(xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space, sentypos, SFINANCE*scale, h);//creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space && mouseX < xmargin + RUNI*scale +space+ RSOCIAL*scale+space+RWORK*scale+RBAND*scale+space+RFINANCE*scale+space && mouseY > sentypos && mouseY < sentypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("FINANCE " + nf(SFINANCE, 0, 0) + " SENT " + nf(RFINANCE, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

    //ACCOM - draws the accommodation sent bar
    fill(180);// colours the rectangle
    rect(xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space+RFINANCE*scale+space, sentypos, SACCOM*scale, h);//creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space+RFINANCE*scale+space && mouseX < xmargin + RUNI*scale +space+ RSOCIAL*scale+space+RWORK*scale+RBAND*scale+space+RFINANCE*scale+space+RACCOM*scale && mouseY > sentypos && mouseY < sentypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("ACCOMMODATION " + nf(SACCOM, 0, 0) + " SENT " + nf(RACCOM, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

    //ADVERT - draws the advertisement sent bar
    fill(220);// colours the rectangle
    rect(xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space+RFINANCE*scale+space+RACCOM*scale+space, sentypos, SADVERT*scale, h);//creates a rectangle based of the corresponding vairables of its category.
    if ( mouseX > xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space+RFINANCE*scale+space+RACCOM*scale+space && mouseX < xmargin + RUNI*scale +space+ RSOCIAL*scale+space+RWORK*scale+RBAND*scale+space+RFINANCE*scale+space+RACCOM*scale+space+RADVERT*scale+space && mouseY > sentypos && mouseY < sentypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("ADVERTISEMENT " + nf(SADVERT, 0, 0) + " SENT " + nf(RADVERT, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }
  }
  //--------------Recieved emails-------------------
  fill(0);// colours the rectangle
  rect(xmargin, receivedypos, RUNI*scale, h); //creates a rectangle based of the corresponding vairables of its category.  
if ( mouseX > xmargin && mouseX < xmargin + RUNI*scale && mouseY > receivedypos && mouseY < receivedypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("UNIVERSITY " + nf(SUNI, 0, 0) + " SENT " + nf(RUNI, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }      

  fill(20);// colours the rectangle
  rect(xmargin+RUNI*scale+space, receivedypos, RSOCIAL*scale, h); //creates a rectangle based of the corresponding vairables of its category.
  if ( mouseX > xmargin+RUNI*scale+space && mouseX < xmargin + RUNI*scale + RSOCIAL*scale && mouseY > receivedypos && mouseY < receivedypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("SOCIAL " + nf(SSOCIAL, 0, 0) + " SENT " + nf(RSOCIAL, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

  fill(60);// colours the rectangle
  rect(xmargin+RUNI*scale+space+RSOCIAL*scale+space, receivedypos, RWORK*scale, h); //creates a rectangle based of the corresponding vairables of its category.
   if ( mouseX > xmargin+RUNI*scale+space+RSOCIAL*scale && mouseX < xmargin + RUNI*scale + RSOCIAL*scale+RWORK*scale && mouseY > receivedypos && mouseY < receivedypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("WORK " + nf(SWORK, 0, 0) + " SENT " + nf(RWORK, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

  fill(100);// colours the rectangle
  rect(xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space, receivedypos, RBAND*scale, h); //creates a rectangle based of the corresponding vairables of its category.
if ( mouseX > xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space && mouseX < xmargin + RUNI*scale +space+ RSOCIAL*scale+space+RWORK*scale+RBAND*scale && mouseY > receivedypos && mouseY < receivedypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("BAND " + nf(SBAND, 0, 0) + " SENT " + nf(RBAND, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

  fill(140);// colours the rectangle
  rect(xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space, receivedypos, RFINANCE*scale, h); //creates a rectangle based of the corresponding vairables of its category.
 if ( mouseX > xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space && mouseX < xmargin + RUNI*scale +space+ RSOCIAL*scale+space+RWORK*scale+RBAND*scale+space+RFINANCE*scale+space && mouseY > receivedypos && mouseY < receivedypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("FINANCE " + nf(SFINANCE, 0, 0) + " SENT " + nf(RFINANCE, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }


  fill(180);// colours the rectangle
  rect(xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space+RFINANCE*scale+space, receivedypos, RACCOM*scale, h); //creates a rectangle based of the corresponding vairables of its category.
 if ( mouseX > xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space+RFINANCE*scale+space && mouseX < xmargin + RUNI*scale +space+ RSOCIAL*scale+space+RWORK*scale+RBAND*scale+space+RFINANCE*scale+space+RACCOM*scale && mouseY > receivedypos && mouseY < receivedypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("ACCOMMODATION " + nf(SACCOM, 0, 0) + " SENT " + nf(RACCOM, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }


  fill(220);// colours the rectangle
  rect(xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space+RFINANCE*scale+space+RACCOM*scale+space, receivedypos, RADVERT*scale, h); //creates a rectangle based of the corresponding vairables of its category.
 if ( mouseX > xmargin+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space+RFINANCE*scale+space+RACCOM*scale+space && mouseX < xmargin + RUNI*scale +space+ RSOCIAL*scale+space+RWORK*scale+RBAND*scale+space+RFINANCE*scale+space+RACCOM*scale+space+RADVERT*scale+space && mouseY > receivedypos && mouseY < receivedypos + h ) {//tests to see if the mouse is in the same location as the rectangle
      fill(60);// if so fill the text below dark grey
      text("ADVERTISEMENT " + nf(SADVERT, 0, 0) + " SENT " + nf(RADVERT, 0, 0) + " RECIEVED", xmargin, 265);// write some text which displays the sent and the recieved count on the category.
    }

  //--------------Category Text-------------------
  textFont(font, textbody);// sets body text font type
  fill(60); // colours dark grey
  text("UNIVERSITY", xmargin, textbodyy); // Draws text under the University column
  text("SOCIAL", xmargin+space+RUNI*scale, textbodyy); // Draws text under the Social column
  text("WORK", xmargin+space+RUNI*scale+space+RSOCIAL*scale, textbodyy); // Draws text under the work column
  text("BAND", xmargin+space+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale, textbodyy); // Draws text under the band column
  text("FINANCE", xmargin+space+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale, textbodyy); // Draws text under the finance column
  text("ACCOM", xmargin+space+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space+RFINANCE*scale, textbodyy);// Draws text under the accommodation column
  text("ADVERT", xmargin+space+RUNI*scale+space+RSOCIAL*scale+space+RWORK*scale+space+RBAND*scale+space+RFINANCE*scale+space+RACCOM*scale, textbodyy);// Draws text under the advertisement column
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------

void keyPressed() { // functions which loops when a key is pressed - in this case it controls the modes of the sketch
  if (keyCode == RIGHT) { // if the "Coded" arrow key which points right is pressed
    mode = "catCompare"; // set the mode to "catCompare" to  compare data by category.
   }
  if (keyCode == LEFT) {// if the "Coded" arrow key which points left is pressed
    mode = "meanCompare";// set the mode to "meanCompare" to  compare the data as a whole.
  }
}


