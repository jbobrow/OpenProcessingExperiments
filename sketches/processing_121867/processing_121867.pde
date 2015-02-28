
//ASSIGNMENT AC21010.5
//Tailor Made Project
//Group 4
//"The Central Pub"

//preventing the buttons, screen backgrounds and information boxes from being active at the start of the program
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;
boolean mapScreen = false;
boolean gigScreen = false;
boolean ArtbarPage = false;
boolean BraesPage = false;
boolean CerberusPage = false;
boolean ClarksPage = false;
boolean NetherPage = false;
boolean TicketyPage = false;
boolean UnionPage = false;
boolean VictoriaPage = false;


//the font, buttons, screen backgrounds and information boxes that are used for the program
PImage HomeScreen;
PImage MapScreen;
PImage EventScreen;
PImage MapOn;
PImage MapOff;
PImage EventOn;
PImage EventOff;
PImage Artbar;
PImage ArtbarInfo;
PImage Braes;
PImage BraesInfo;
PImage Cerberus;
PImage CerberusInfo;
PImage Clarks;
PImage ClarksInfo;
PImage Nether;
PImage NetherInfo;
PImage Tickety;
PImage TicketyInfo;
PImage Union;
PImage UnionInfo;
PImage Victoria;
PImage VictoriaInfo;
PImage TicketButton;
PImage TicketOn;
PFont maintext;

//referencing the "pins" tab which contains style and co-ordinates of pub location pins
pins pins; 


void setup() {
    
    //the dimensions of the display window
    size(1000,563);
    
    //to load the images and font into the program
    HomeScreen = loadImage("mainscreen.png");
    MapScreen = loadImage("mapscreen.png");
    EventScreen = loadImage("eventscreen.png");
    MapOn = loadImage("MapbuttonOn.png");
    MapOff = loadImage("MapbuttonOff.png");
    EventOn = loadImage("EventbuttonOn.png");
    EventOff = loadImage("EventbuttonOff.png");
    Artbar = loadImage("Artbarsquare.png");
    ArtbarInfo = loadImage("Artbarinfo.png");
    Braes = loadImage("Braessquare.png");
    BraesInfo = loadImage("Braesinfo.png");
    Cerberus = loadImage("Cerberussquare.png");
    CerberusInfo = loadImage("Cerberusinfo.png");
    Clarks = loadImage("Clarkssquare.png");
    ClarksInfo = loadImage("Clarksinfo.png");
    Nether = loadImage("Netherinnsquare.png");
    NetherInfo = loadImage("Netherinninfo.png");
    Tickety = loadImage("Ticketyboossquare.png");
    TicketyInfo = loadImage("Ticketyboosinfo.png");
    Union = loadImage("Unionsquare.png");
    UnionInfo = loadImage("Unioninfo.png");
    Victoria = loadImage("Victoriabarsquare.png");
    VictoriaInfo = loadImage("Victoriainfo.png");
    TicketButton = loadImage("TicketbuttonOff.png");
    TicketOn = loadImage("TicketbuttonOn.png");
    maintext = loadFont("Avenir-Book-48.vlw");
    
    pins = new pins();
     
}


void draw() {
  
  //load the main menu screen when the program is started 
  startScreen();
  
}


void startScreen () {
    
    //the background image for the main menu is displayed
    //the "off state" of each button is initially visible on the main menu screen
    image(HomeScreen, 0, 0);
    image(MapOff, 300, 177);
    image(EventOff, 300, 305);
    
    //defining the button parameters
    //the buttons change to the "on state" when mouse rolls into parameter
    if (mouseX > 300 && mouseX < 700 && mouseY > 177 && mouseY < 257) {
      button1 = true;
  }
    
    //buttons remain in "off state" when mouse does not enter button parameter
    else {
      button1 = false;
  }
    
    if (button1 == true) {
      image(MapOn, 300, 177);
  } 
    
    //user is taken to map screen when button 1 is clicked
    if(gigScreen == false){
    if (mouseX > 300 && mouseX < 700 && mouseY > 177 && mouseY < 257 && mousePressed == true) {
      mapScreen = true;
      }
    }
    if (mapScreen == true) {
      mapScreen();
  }
    
    
    //defining the button parameters
    //the buttons change to the "on state" when mouse rolls into parameter
    if (mouseX > 300 && mouseX < 700 && mouseY > 305 && mouseY < 387 && mapScreen == false) {
      button2 = true;
  }
    
    //buttons remain in "off state" when mouse does not enter button parameter
    else {
      button2 = false;
  }
    
    if (button2 == true) {
      image(EventOn, 300, 305);
  }
    if(mapScreen == false){
    //user is taken to gigs and events screen when button 2 is clicked
    if (mouseX > 300 && mouseX < 700 && mouseY > 305 && mouseY < 387 && mousePressed == true) {
      gigScreen = true;
  }

}
    
    if (gigScreen == true) {
      gigs();
  }
  
}


void mapScreen() {
  
  //the background image for the map screen is displayed
  //the "off state" of each location pin is initially visible on the map screen
  image(MapScreen,0,0);
  pins.artBar();
  pins.braesBar();
  pins.cerberusBar();
  pins.clarksBar();
  pins.netherBar();
  pins.ticketyBar();
  pins.unionBar();
  pins.victoriaBar();
  
  //REPEAT THIS CODE STRUCTURE FOR EACH LOCATION PIN
  //when the mouse rolls inside diameter of each location pin they change to their "on state"
  //an information box relating to each location pin appears when mouse rolls over pin
  //Art Bar location pin
   if (mouseX > pins.artBarX - pins.pinWidth/2 && mouseX < pins.artBarX + pins.pinWidth/2 && 
       mouseY > pins.artBarY - pins.pinHeight/2 && mouseY < pins.artBarY + pins.pinHeight/2) {
         //the information box that pops up when mouse rolls over location pin
         pins.artBarbox();    
  }
  
  //when each location pin is clicked an pub quiz information screen pops up
   if (mouseX > pins.artBarX - pins.pinWidth/2 && mouseX < pins.artBarX + pins.pinWidth/2 && 
       mouseY > pins.artBarY - pins.pinHeight/2 && mouseY < pins.artBarY + pins.pinHeight/2 && mousePressed == true) {
         //the information screen that is displayed when location pin is clicked
         ArtbarPage = true;
  }
    
  
   //Braes location pin
   if (mouseX > pins.braesBarX - pins.pinWidth/2 && mouseX < pins.braesBarX + pins.pinWidth/2 && 
       mouseY > pins.braesBarY - pins.pinHeight/2 && mouseY < pins.braesBarY + pins.pinHeight/2) {
         pins.braesBarbox();
  }
  
   if (mouseX > pins.braesBarX - pins.pinWidth/2 && mouseX < pins.braesBarX + pins.pinWidth/2 && 
       mouseY > pins.braesBarY - pins.pinHeight/2 && mouseY < pins.braesBarY + pins.pinHeight/2 && mousePressed == true) {
         BraesPage = true;
  }
  
  
   //Cerberus location pin
   if (mouseX > pins.cerberusBarX - pins.pinWidth/2 && mouseX < pins.cerberusBarX + pins.pinWidth/2 && 
       mouseY > pins.cerberusBarY - pins.pinHeight/2 && mouseY < pins.cerberusBarY + pins.pinHeight/2) {
         pins.cerberusBarbox();
  }
  
   if (mouseX > pins.cerberusBarX - pins.pinWidth/2 && mouseX < pins.cerberusBarX + pins.pinWidth/2 && 
       mouseY > pins.cerberusBarY - pins.pinHeight/2 && mouseY < pins.cerberusBarY + pins.pinHeight/2 && mousePressed == true){
         CerberusPage = true;
  }
  
  
   //Clarks location pin
   if (mouseX > pins.clarksBarX - pins.pinWidth/2 && mouseX < pins.clarksBarX + pins.pinWidth/2 && 
       mouseY > pins.clarksBarY - pins.pinHeight/2 && mouseY < pins.clarksBarY + pins.pinHeight/2) {
         pins.clarksBarbox();
  }
  
   if (mouseX > pins.clarksBarX - pins.pinWidth/2 && mouseX < pins.clarksBarX + pins.pinWidth/2 && 
       mouseY > pins.clarksBarY - pins.pinHeight/2 && mouseY < pins.clarksBarY + pins.pinHeight/2 && mousePressed == true) {
         ClarksPage = true;
  }
  
  
   //Nether Inn location pin
   if (mouseX > pins.netherBarX - pins.pinWidth/2 && mouseX < pins.netherBarX + pins.pinWidth/2 && 
       mouseY > pins.netherBarY - pins.pinHeight/2 && mouseY < pins.netherBarY + pins.pinHeight/2) {
         pins.netherBarbox();
  }
  
   if (mouseX > pins.netherBarX - pins.pinWidth/2 && mouseX < pins.netherBarX + pins.pinWidth/2 && 
       mouseY > pins.netherBarY - pins.pinHeight/2 && mouseY < pins.netherBarY + pins.pinHeight/2 && mousePressed == true) {
         NetherPage = true;
  }
  
  
   //Tickety Boos location pin
   if (mouseX > pins.ticketyBarX - pins.pinWidth/2 && mouseX < pins.ticketyBarX + pins.pinWidth/2 && 
       mouseY > pins.ticketyBarY - pins.pinHeight/2 && mouseY < pins.ticketyBarY + pins.pinHeight/2) {
         pins.ticketyBarbox();
  }
  
   if (mouseX > pins.ticketyBarX - pins.pinWidth/2 && mouseX < pins.ticketyBarX + pins.pinWidth/2 && 
       mouseY > pins.ticketyBarY - pins.pinHeight/2 && mouseY < pins.ticketyBarY + pins.pinHeight/2 && mousePressed == true) {
         TicketyPage = true;
  }
  
  
   //Dundee Uni Union location pin
   if (mouseX > pins.unionBarX - pins.pinWidth/2 && mouseX < pins.unionBarX + pins.pinWidth/2 && 
       mouseY > pins.unionBarY - pins.pinHeight/2 && mouseY < pins.unionBarY + pins.pinHeight/2) {
         pins.unionBarbox();
  }
  
   if (mouseX > pins.unionBarX - pins.pinWidth/2 && mouseX < pins.unionBarX + pins.pinWidth/2 && 
       mouseY > pins.unionBarY - pins.pinHeight/2 && mouseY < pins.unionBarY + pins.pinHeight/2 && mousePressed == true) {
         UnionPage = true;
  }
  
  
   //Victoria Bar location pin
   if (mouseX > pins.victoriaBarX - pins.pinWidth/2 && mouseX < pins.victoriaBarX + pins.pinWidth/2 && 
       mouseY > pins.victoriaBarY - pins.pinHeight/2 && mouseY < pins.victoriaBarY + pins.pinHeight/2) {
         pins.victoriaBarbox();
  }
  
   if (mouseX > pins.victoriaBarX - pins.pinWidth/2 && mouseX < pins.victoriaBarX + pins.pinWidth/2 && 
       mouseY > pins.victoriaBarY - pins.pinHeight/2 && mouseY < pins.victoriaBarY + pins.pinHeight/2 && mousePressed == true) {
         VictoriaPage = true;
  }

  
  //the information screens that will be displayed in relation to each location pin
   if(ArtbarPage == true) {
       ArtbarPage();
  }

   if(BraesPage == true) {
       BraesPage();
  }

   if(CerberusPage == true) {
       CerberusPage();
  }

   if(ClarksPage == true) {
       ClarksPage();
  }

   if(NetherPage == true) {
       NetherPage();
  }

   if(TicketyPage == true) {
       TicketyPage();
  }
  
   if(UnionPage == true) {
       UnionPage();
  }

   if(VictoriaPage == true) {
       VictoriaPage();
  }
    
   //all information screens are cleared when box at bottom section of screen is clicked
   if(mouseX > 0 && mouseX < 1000 &&
      mouseY > 480 && mouseY < 563 && mousePressed == true) {
        
        ArtbarPage = false;
        BraesPage = false;
        CerberusPage = false;
        ClarksPage = false;
        NetherPage = false;
        TicketyPage = false;
        UnionPage = false;
        VictoriaPage = false;
      }
    
  
    
  if(mapScreen == true){
    
   gigScreen = false;
    
  }

}


void gigs () {
  
  //the background image for the event screen is displayed
  image(EventScreen, 0, 0);
  image(TicketButton, 298, 451);
   
   //information is sourced from an RSS feed on the website "www.nme.com/tickets/city/dundee"
   
   XML xml = loadXML("http://www.nme.com/tickets/city/dundee/alt/rss");
   //the child "channel" from the xml document is selected
    XML[] channel = xml.getChildren("channel"); 
    //the child "item" is selected
    XML[] item = channel[0].getChildren("item");
   
   //the first four events are printed
   for (int i = 0 ; i < 5 ;i++) {
     //the for loop pulls out the information for the first 5 titles
     //the child "title" is selected and giving the name "tmp"
    XML[] tmp = item[i].getChildren("title");
    //pulls out the content in the title tags
    println(tmp[0].getContent());
    fill(249, 222, 173);
    textFont(maintext);
    textSize(28);
    //prints the first 5 titles
    text(tmp[0].getContent(), 70, (150+(i*60)), 1000, 563);
    }
        
     //this is the ticket button at the bottom of the events page
     if (mouseX > 300 && mouseX < 700 && mouseY > 450 && mouseY < 530) {
      button3 = true;
  }
    
    //button remains in "off state" when mouse does not enter button parameter
    else {
      button3 = false;
  }
    
    if (button3 == true) {
      image(TicketOn, 298, 451);
  } 
}  


void keyPressed() {
  //user can return to main menu by pressing key "r"
  println("keypressedfunction");
  
  if(key == 'r') {
   reset("startScreen"); 
  }

}


void mouseClicked() {
  //this allows the user to click on a button taking them to a ticket purchasing website
   if(gigScreen == true && mouseX > 300 && mouseX < 700 &&
      mouseY > 450 && mouseY < 530 ) {
  //opens the link in a new tab on the web browser
  link("http://www.nme.com/tickets/city/dundee","_new");
  }
 
}


//REPEAT FUNCTIONS FOR EACH INFORMATION SCREEN
void ArtbarPage () {
 
 //the image that is used for the information screen
 image(ArtbarInfo, 0, 0); 
  
}

void BraesPage () {
  
  image(BraesInfo, 0, 0);
}

void CerberusPage () {
  
  image(CerberusInfo, 0, 0);
}

void ClarksPage () {
  
  image(ClarksInfo, 0, 0);
}

void NetherPage () {
  
  image(NetherInfo, 0, 0);
}

void TicketyPage () {
  
  image(TicketyInfo, 0, 0);
}

void UnionPage () {
  
  image(UnionInfo, 0, 0);
}

void VictoriaPage () {
  
  image(VictoriaInfo, 0, 0);
}


void reset (String Fred){
  
  //all buttons and pop ups are reset when the user is on the main menu
  if(Fred == "startScreen") {

   button1 = false;
   button2 = false;
   mapScreen = false;
   gigScreen = false;
   ArtbarPage = false;
   BraesPage = false;
   CerberusPage = false;
   ClarksPage = false;
   NetherPage = false;
   TicketyPage = false;
   UnionPage = false;
   VictoriaPage = false;
   
   }  
  
}

 

//location pins for map screen

class pins {
  
  //the co-ordinates of each location pin
  int artBarX;
  int artBarY;
  int braesBarX;
  int braesBarY;
  int cerberusBarX;
  int cerberusBarY;
  int clarksBarX;
  int clarksBarY;
  int netherBarX;
  int netherBarY;
  int ticketyBarX;
  int ticketyBarY;
  int unionBarX;
  int unionBarY;
  int victoriaBarX;
  int victoriaBarY;
  int pinHeight;
  int pinWidth;
 

  pins() {
    //a standard height and width is used for each location pin
    pinHeight = 20;
    pinWidth = 20;
  }
  
  //REPEAT FUNCTIONS FOR EACH LOCATION PIN AND POP UP INFORMATION BOX
  //Art Bar
  void artBar() {
  
  //the co-ordinates of the location pin
  artBarX = 230;
  artBarY = 467;
  
  //the attributes of the location pin in its "off state"
  strokeWeight(2);
  stroke(0); 
  fill(37, 64, 143);
  //the co-ordinates and dimensions of the location pin
  ellipse(artBarX, artBarY, pinHeight, pinWidth);
 }
 
 void artBarbox() {
 
  //the function that defines what happens when the pin is rolled over
  //the attributes of the location pin in its "on state"
  stroke(255);
  fill(37, 64, 143);
  ellipse(artBarX, artBarY, pinHeight, pinWidth);
  //the pop up information box and its co-ordinates when location pin is rolled over
  image(Artbar, artBarX+15, artBarY-155);
 }
 
 
 //Braes
 void braesBar() {
   
   braesBarX = 310;
   braesBarY = 450;
    
   stroke(0); 
   fill(37, 64, 143);
   ellipse(braesBarX, braesBarY, pinHeight, pinWidth);
 }
 
 void braesBarbox() {
    
   stroke(255);
   fill(37, 64, 143);
   ellipse(braesBarX, braesBarY, pinHeight, pinWidth);
   image(Braes, braesBarX+15, braesBarY-155);
 }
 
 
 //Ceberus
 void cerberusBar() {
   
   cerberusBarX = 437;
   cerberusBarY = 176;
   
   stroke(0);
   fill(65, 173, 73);
   ellipse(cerberusBarX, cerberusBarY, pinHeight, pinWidth);
 }
 
 void cerberusBarbox() {
   
   stroke(255);
   fill(65, 173, 73);
   ellipse(cerberusBarX, cerberusBarY, pinHeight, pinWidth);
   image(Cerberus, cerberusBarX+15, cerberusBarY+5);
 }
 
 
 //Clarks
 void clarksBar() {
   
   clarksBarX = 346;
   clarksBarY = 263;
   
   stroke(0);
   fill(37, 64, 143);
   ellipse(clarksBarX, clarksBarY, pinHeight, pinWidth);
 }
 
 void clarksBarbox() {
   
   stroke(255);
   fill(37, 64, 143);
   ellipse(clarksBarX, clarksBarY, pinHeight, pinWidth);
   image(Clarks, clarksBarX+15, clarksBarY-155);
 }
 
 
 //Nether Inn
 void netherBar() {
   
   netherBarX = 416;
   netherBarY = 392;
   
   stroke(0);
   fill(37, 64, 143);
   ellipse(netherBarX, netherBarY, pinHeight, pinWidth);
 }
 
 void netherBarbox() {
   
   stroke(255);
   fill(37, 64, 143);
   ellipse(netherBarX, netherBarY, pinHeight, pinWidth);
   image(Nether, netherBarX+15, netherBarY-155);
 }
 
 
 //Tickety Boos
 void ticketyBar() {
   
   ticketyBarX = 535;
   ticketyBarY = 252;
   
   stroke(0);
   fill(37, 64, 143);
   ellipse(ticketyBarX, ticketyBarY, pinHeight, pinWidth);
 }
 
 void ticketyBarbox() {
   
   stroke(255);
   fill(37, 64, 143);
   ellipse(ticketyBarX, ticketyBarY, pinHeight, pinWidth);
   image(Tickety, ticketyBarX+15, ticketyBarY-155);
 }
 
 
 //Dundee Uni Union
 void unionBar() {
   
   unionBarX = 238;
   unionBarY = 390;
   
   stroke(0);
   fill(65, 173, 73);
   ellipse(unionBarX, unionBarY, pinHeight, pinWidth);
 }
 
 void unionBarbox() {
   
   stroke(255);
   fill(65, 173, 73);
   ellipse(unionBarX, unionBarY, pinHeight, pinWidth);
   image(Union, unionBarX+15, unionBarY-155);
 }
 
 
 //Victoria Bar
 void victoriaBar() {
   
   victoriaBarX = 635;
   victoriaBarY = 25;
   
   stroke(0);
   fill(189, 0, 0);
   ellipse(victoriaBarX, victoriaBarY, pinHeight, pinWidth);
 }
 
 void victoriaBarbox() {
   
   stroke(255);
   fill(189, 0, 0);
   ellipse(victoriaBarX, victoriaBarY, pinHeight, pinWidth);
   image(Victoria, victoriaBarX+15, victoriaBarY+5);
 }
 
}

//end of code


