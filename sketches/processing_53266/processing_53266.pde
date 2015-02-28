
//During this screen, the program tries to connect to the server. 
class ConnectingScreen {
  //The Client object that we will bind to the server.
  Client potential;

  //The address info that we will use to accomplish such a thing.
  Place placeToConnectTo;
  
  //The PApplet parent used for setting the context of the Client.
  PApplet parent;
  
  //The frame any state finishes. Used in animation.
  int frameFinished;
  
  //The state of the screen.
  int state;
  //State key:
  //0: Fast fade in
  //1: Interactive (Are you sure?) --> 2 | 4
  //2: Clicked no and returning side buttons. --> 3
  //3: Clicked no/unsuccessful and returning prompt. --> 9
  //4: Clicked yes and returning side buttons. --> 5
  //5: Connecting. --> 6 | 7
  //6: Unsuccessful connection. --> 9
  //7: Successful connection. --> 8
  //8: Going to control panel and returning prompt --> 9
  //9: Waiting.

  //The unit of change of opacity.
  float fadeUnit;

  //The font of the screen.
  PFont font;

  //Craps used for the animation.
  float rad;
  PVector yesCurrent, yesStart, yesFinish;
  PVector noCurrent, noStart, noFinish;
  PVector promptCurrent, promptStart, promptFinish;
  PVector buttonSize, promptSize;
  PVector prompt;
  float currentAlpha;
  float alphaChange;
  
  //Fade time.
  int fadeTime;
  
  //Booleans representing when the screen is done, and whether a connection was established.
  boolean done;
  boolean passed;

  //Constructor for the screen.
  public ConnectingScreen(PApplet parent) {

    //Load the screen's font. This does duplicate it in memory, but it allows
    //for the easy use of two different fonts.
    font = loadFont("generalText.vlw");
    textSize(20);
    
    //Read in the parent.
    this.parent = parent;

    //Initialize the screen to start at state 0.
    state = 0;
    
    //Initialize the booleans.
    done = false;
    passed = false;
    
    //Initialize the fading stuff.
    currentAlpha = 255;
    alphaChange = 10;
    
    //Initialize the frame marker.
    frameFinished = frameCount;
    
    //Initialize the element sizes.
    buttonSize = new PVector(66, 33);
    promptSize = new PVector(275, 200);
    
    //Initialize the animated element locations.
    yesStart = new PVector(-buttonSize.x, (height/2)-(buttonSize.y/2)); //Off the left of the screen.
    yesCurrent = new PVector(-buttonSize.x, (height/2)-(buttonSize.y/2));
    yesFinish = new PVector(buttonSize.x, (height/2)-(buttonSize.y/2));
    
    noStart = new PVector(width, (height/2)-(buttonSize.y/2)); //Off the right of the screen.
    noCurrent = new PVector(width, (height/2)-(buttonSize.y/2));
    noFinish = new PVector(width-(2*buttonSize.x), (height/2)-(buttonSize.y/2));
    
    promptStart = new PVector((width/2)-(promptSize.x/2), -promptSize.y); //Off the top of the screen.
    promptCurrent = new PVector((width/2)-(promptSize.x/2), -promptSize.y);
    promptFinish = new PVector((width/2)-(promptSize.x/2), (height/2)-(promptSize.y/2));

    //And initialize the radius.
    rad = width/1.5;
  }

  //Will not run without calling setPlace().
  public void handle() {
    String promptString;
    switch(state) {
      case 0://Just fading in at this point.
            promptString = "Are you sure you want to connect to\n"+
            "the " + placeToConnectTo.getBankName()+ " bank"+
            "\non\n"+
            placeToConnectTo.getName()+
            "\nat the address\n"+
            placeToConnectTo.getAddress();
            handleAnim(promptString, "yes", "no");
            break;
            
      case 1://Testing for input.
            promptString = "Are you sure you want to connect to\n"+
            "the " + placeToConnectTo.getBankName()+ " bank"+
            "\non\n"+
            placeToConnectTo.getName()+
            "\nat the address\n"+
            placeToConnectTo.getAddress();
            handleAnim(promptString, "yes", "no");
            break;
      case 2://Have recieved a no. Side buttons are being dragged out.
            promptString = "Returning to the Region\n"+
                           "Select screen to choose a new\n"+
                           "L.E.D. bank.";
            handleAnim(promptString, "yes", "no");
            break;
            
      case 3://Now the prompt is being pulled out because of the no.
            promptString = "Returning to the Region\n"+
                           "Select screen to choose a new\n"+
                           "L.E.D. bank.";
            handleAnim(promptString, "yes", "no");
            break;
            
      case 4://Have recieved a yes and now going to attempt to connect.
            promptString = "Attempting to connect to your\n"+
                           "chosen L.E.D. bank.\n"+
                           "(Note: a significantly long\n"+
                           "connecting time while on\n"+
                           "ethernet usually causates\n"+
                           "an unsuccessful attempt.";
            handleAnim(promptString, "", "");
            break;
            
      case 5://Now we try to forge the connection.
            promptString = "Attempting to connect to your\n"+
                           "chosen L.E.D. bank.\n"+
                           "(Note: a significantly long\n"+
                           "connecting time while on\n"+
                           "ethernet usually causates\n"+
                           "an unsuccessful attempt.";
            handleAnim(promptString, "", "");
            //To avoid issues when server(s) obtain new IP addresses,
            //we use a socket to bind the client to a domain name.
            try{
              Socket s = new Socket(placeToConnectTo.getAddress(), 5000);
              potential = new Client(parent, s);
              state = 7; //If the connection is successful go to the success retract.
              frameFinished = frameCount;
            }
            catch(Exception e){
              state = 6;
              frameFinished = frameCount;
            }
            break;
            
      case 6://Connection unsuccessful. Aww shit.
            promptString = "Connection unsuccessful.\n"+
                           "Returning to the Region Select\n"+
                           "Screen to select another\n"+
                           "L.E.D. bank.";
            handleAnim(promptString, "", "");
            break; 
            
      case 7://Connection successful. Hell yeah!
            promptString = "Connection Successful!";
            handleAnim(promptString, "", "");
            break;
            
      case 8://Alert that we are going to the control panel.
            promptString = "Connection Successful!\n"+
                           "Preparing to go to the\n"+ 
                           "lighting control panel.";
            handleAnim(promptString, "", "");
            break;
      case 9:
              
              
              
    }
  }                

  //Draws the background of the screen. The prompt will bounce gently, while the buttons fly in
  //with a sprial motion.
  public void handleAnim(String promptString, String yesString, String noString) {
    //We have access to state, radius, and the locations/sizes.
    //speed is what we multiply frameCount by.
    //Set the font.
    textFont(font);
    //no stroke.
    noStroke();
    //Color mode to RGB
    colorMode(RGB);
    //strokeWeight(8);
    //Draw the ghetto blur.
    fill(255, 255, 255, 100);
    rect(0, 0, width, height);
    switch(state){
      //Starting shits.
      case 0://Draw the boxes.
             fill(0);
             rect(noCurrent.x, noCurrent.y, buttonSize.x, buttonSize.y, 5);
             rect(yesCurrent.x, yesCurrent.y, buttonSize.x, buttonSize.y, 5);
             rect(promptCurrent.x, promptCurrent.y, promptSize.x, promptSize.y, 5);
             //Draw the lines.
             stroke(0);
             strokeWeight(8);
             line(noCurrent.x+(buttonSize.x/2), noCurrent.y+(buttonSize.y/2), noStart.x, noStart.y+(buttonSize.y/2));
             line(yesCurrent.x+(buttonSize.x/2), yesCurrent.y+(buttonSize.y/2), yesStart.x, yesStart.y+(buttonSize.y/2));
             line(promptCurrent.x+(promptSize.x/2), promptCurrent.y+(buttonSize.y/2), promptStart.x+(promptSize.x/2), promptStart.y+(buttonSize.y/2));
             //Draw the text.
             noStroke();
             fill(255);
             text(noString, noCurrent.x+10, noCurrent.y+20);
             text(yesString, yesCurrent.x+10, yesCurrent.y+20);
             text(promptString, promptCurrent.x+10, promptCurrent.y+20);
             //Increment values.
             noCurrent.x+=(noFinish.x-noCurrent.x)/12;
             yesCurrent.x+=(yesFinish.x-yesCurrent.x)/12;
             promptCurrent.y+=(promptFinish.y-promptCurrent.y)/12;
             //Since they are all traveling the same fraction of the intended distance each frame,
             //We can test for completion using only one element.
             if(noCurrent.x<noFinish.x+(noStart.x-noFinish.x)/96){
               state = 1;
             }
             
     //Interactive shits.       
     case 1: fill(0);
             rect(noCurrent.x, noCurrent.y, buttonSize.x, buttonSize.y, 5);
             rect(yesCurrent.x, yesCurrent.y, buttonSize.x, buttonSize.y, 5);
             rect(promptCurrent.x, promptCurrent.y, promptSize.x, promptSize.y, 5);
             //Draw the lines.
             stroke(0);
             strokeWeight(8);
             line(noCurrent.x+(buttonSize.x/2), noCurrent.y+(buttonSize.y/2), noStart.x, noStart.y+(buttonSize.y/2));
             line(yesCurrent.x+(buttonSize.x/2), yesCurrent.y+(buttonSize.y/2), yesStart.x, yesStart.y+(buttonSize.y/2));
             line(promptCurrent.x+(promptSize.x/2), promptCurrent.y+(buttonSize.y/2), promptStart.x+(promptSize.x/2), promptStart.y+(buttonSize.y/2));
             //Draw the text.
             noStroke();
             fill(255);
             text(noString, noCurrent.x+10, noCurrent.y+20);
             text(yesString, yesCurrent.x+10, yesCurrent.y+20);
             text(promptString, promptCurrent.x+10, promptCurrent.y+20);
             if(mousePressed){
               //Test for no.
               if(mouseX > noCurrent.x && mouseX < noCurrent.x+buttonSize.x){
                 if(mouseY > noCurrent.y && mouseY < noCurrent.y+buttonSize.y){
                   //Go to the no state.
                   state = 2;
                 }
               }
               if(mouseX > yesCurrent.x && mouseX < yesCurrent.x+buttonSize.x){
                 if(mouseY > yesCurrent.y && mouseY < yesCurrent.y+buttonSize.y){
                   //Go to the yes state.
                   state = 4;
                 }
               }
             }
             break;
             
     //Clicked no and returning side buttons.
     case 2: fill(0);
             rect(noCurrent.x, noCurrent.y, buttonSize.x, buttonSize.y, 5);
             rect(yesCurrent.x, yesCurrent.y, buttonSize.x, buttonSize.y, 5);
             rect(promptCurrent.x, promptCurrent.y, promptSize.x, promptSize.y, 5);
             //Draw the lines.
             stroke(0);
             strokeWeight(8);
             line(noCurrent.x+(buttonSize.x/2), noCurrent.y+(buttonSize.y/2), noStart.x+10, noStart.y+(buttonSize.y/2));
             line(yesCurrent.x+(buttonSize.x/2), yesCurrent.y+(buttonSize.y/2), yesStart.x, yesStart.y+(buttonSize.y/2));
             line(promptCurrent.x+(promptSize.x/2), promptCurrent.y+(buttonSize.y/2), promptStart.x+(promptSize.x/2), promptStart.y+(buttonSize.y/2));
             //Draw the text.
             noStroke();
             fill(255);
             text(noString, noCurrent.x+10, noCurrent.y+20);
             text(yesString, yesCurrent.x+10, yesCurrent.y+20);
             text(promptString, promptCurrent.x+10, promptCurrent.y+20);
             noCurrent.x+=(noStart.x-noCurrent.x)/8;
             yesCurrent.x+=(yesStart.x-yesCurrent.x)/8;
             //Once again we only need to test one element.
             if(noCurrent.x >= noStart.x - ((noStart.x-noFinish.x)/4096)){
               state = 3;
             }
             break;
             
     //Previously clicked no, side buttons recalled, and now the prompt is being recalled.
     case 3: fill(0);
             rect(promptCurrent.x, promptCurrent.y, promptSize.x, promptSize.y, 5);
             //Draw the lines.
             stroke(0);
             strokeWeight(8);
             line(promptCurrent.x+(promptSize.x/2), promptCurrent.y+(buttonSize.y/2), promptStart.x+(promptSize.x/2), promptStart.y+(buttonSize.y/2));
             //Draw the text.
             noStroke();
             fill(255);
             text(promptString, promptCurrent.x+10, promptCurrent.y+20);   
             promptCurrent.y+=(promptStart.y-promptCurrent.y)/15;
             //Now there's only one element to test.
             if(promptCurrent.y <= promptStart.y - ((promptStart.y-promptFinish.y)/128)){
               done = true;
               state = 9;
             }
             break; 
     
     //Clicked yes and now returning side buttons.
     case 4: fill(0);
             rect(noCurrent.x, noCurrent.y, buttonSize.x, buttonSize.y, 5);
             rect(yesCurrent.x, yesCurrent.y, buttonSize.x, buttonSize.y, 5);
             rect(promptCurrent.x, promptCurrent.y, promptSize.x, promptSize.y, 5);
             //Draw the lines.
             stroke(0);
             strokeWeight(8);
             line(noCurrent.x+(buttonSize.x/2), noCurrent.y+(buttonSize.y/2), noStart.x+10, noStart.y+(buttonSize.y/2));
             line(yesCurrent.x+(buttonSize.x/2), yesCurrent.y+(buttonSize.y/2), yesStart.x, yesStart.y+(buttonSize.y/2));
             line(promptCurrent.x+(promptSize.x/2), promptCurrent.y+(buttonSize.y/2), promptStart.x+(promptSize.x/2), promptStart.y+(buttonSize.y/2));
             //Draw the text.
             noStroke();
             fill(255);
             text(noString, noCurrent.x+10, noCurrent.y+20);
             text(yesString, yesCurrent.x+10, yesCurrent.y+20);
             text(promptString, promptCurrent.x+10, promptCurrent.y+20);
             noCurrent.x+=(noStart.x-noCurrent.x)/10;
             yesCurrent.x+=(yesStart.x-yesCurrent.x)/10;
             if(noCurrent.x >= noStart.x - ((noStart.x-noFinish.x)/4096)){
               state = 5;
             }
             break;
             
     //Actually connecting to host at this moment.
     case 5: fill(0);
             rect(promptCurrent.x, promptCurrent.y, promptSize.x, promptSize.y, 5);
             //Draw the lines.
             stroke(0);
             strokeWeight(8);         
             line(promptCurrent.x+(promptSize.x/2), promptCurrent.y+(buttonSize.y/2), promptStart.x+(promptSize.x/2), promptStart.y+(buttonSize.y/2));
             //Draw the text.
             noStroke();
             fill(255);
             text(promptString, promptCurrent.x+10, promptCurrent.y+20);
             break; 
             
     //Attempt to connect was unsuccessful. Retract the prompt. Slowly.
     case 6: fill(0);
             rect(promptCurrent.x, promptCurrent.y, promptSize.x, promptSize.y, 5);
             //Draw the lines.
             stroke(0);
             strokeWeight(8);
             line(promptCurrent.x+(promptSize.x/2), promptCurrent.y+(buttonSize.y/2), promptStart.x+(promptSize.x/2), promptStart.y+(buttonSize.y/2));
             //Draw the text.
             noStroke();
             fill(255);
             text(promptString, promptCurrent.x+10, promptCurrent.y+20);   
             if(frameCount - frameFinished > 120){
               promptCurrent.y-=(promptCurrent.y - promptStart.y)/4;
             }
             //Now there's only one element to test.
             if(promptCurrent.y <= promptStart.y - ((promptStart.y-promptFinish.y)/128)){
               state = 9;
               done = true;
             }
             break;
             
      //Attempt to connect was successful.
      case 7:fill(0);
             rect(promptCurrent.x, promptCurrent.y, promptSize.x, promptSize.y, 5);
             //Draw the lines.
             stroke(0);
             strokeWeight(8);
             line(promptCurrent.x+(promptSize.x/2), promptCurrent.y+(buttonSize.y/2), promptStart.x+(promptSize.x/2), promptStart.y+(buttonSize.y/2));
             //Draw the text.
             noStroke();
             fill(255);
             text(promptString, promptCurrent.x+10, promptCurrent.y+20);   
             if(frameCount - frameFinished > 30){
               state = 8;
               frameFinished = frameCount;
               passed = true;
             }
             
      //We're going to the control panel.
      case 8:fill(0);
             rect(promptCurrent.x, promptCurrent.y, promptSize.x, promptSize.y, 5);
             //Draw the lines.
             stroke(0);
             strokeWeight(8);
             line(promptCurrent.x+(promptSize.x/2), promptCurrent.y+(buttonSize.y/2), promptStart.x+(promptSize.x/2), promptStart.y+(buttonSize.y/2));
             //Draw the text.
             noStroke();
             fill(255);
             text(promptString, promptCurrent.x+10, promptCurrent.y+20);   
             if(frameCount - frameFinished > 30){
               promptCurrent.y-=(promptCurrent.y - promptStart.y)/8;
             }
              if(promptCurrent.y <= promptStart.y - ((promptStart.y-promptFinish.y)/128)){
               state = 9;
               done = true;
             }
             
      //Just a waiting, idle, state.
      case 9: break;      
    }
    
    //Handle the fade-int/out.
     //If we are in an intro state, fade in.
//    if(state < 2 && currentAlpha > 0+alphaChange){
//      fill(255, 255, 255, currentAlpha);
//      rect(0, 0, width, height);
//      currentAlpha-=alphaChange;
//    }
//    //If we are in an outro state, fade out.
//    if(state == 8 || state == 9 || state == 6){
//      if(currentAlpha < 255){
//        fill(255, 255, 255, currentAlpha);
//        rect(0, 0, width, height);
//        currentAlpha+=alphaChange;
//      }
//    }
  }

  //Read in the Place.  
  public void setPlace(Place placeToConnectTo) {
    this.placeToConnectTo = placeToConnectTo;
  }
  
  //Is the screen done?
  public boolean isDone(){
    return done;
  }
  
  //Was connecting successful?
  public boolean hasConnected(){
    return passed;
  }
  
  //Returns the Place object used to bind to a server.
  public Place getConnectedPlace(){
    return placeToConnectTo;
  }
  
  //Returns the client object.
  public Client getConnectedClient(){
    return potential;
  }
} 






