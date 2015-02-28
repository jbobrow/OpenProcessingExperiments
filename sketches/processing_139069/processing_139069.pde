
/* @pjs font="arial.ttf"; pauseOnBlur=true; preload="GraphBackground.png, plaingraduated.png, HeaterIcon.png, InfoIcon.png, PumpIcon.png, SettingsIcon.png, Snowflake.png, default.png"; */
// The above is a directive for processing to preload the graphics resources. It also includes a directive to pause the application if the current window loses the focus

/*
                        ***********************************************************************
                        *                                                                     *
                        *                     Solar Controller Monitor                        *
                        *                     (c) 7th March 2014                              *
                        *                     Chris Mears                                     *
                        *                                                                     *
                        *                     chrisjmears@googlemail.com                      *
                        *                                                                     *
                        ***********************************************************************
*/ 

/*
    Bugs & Release Notes

    V1.01e *** BETA Version
    - Completely new Graphical UI
    - Ported to JavaScript with videos
    - Ugly banding issue on PNG is just caused by the way some browsers renders it.
    - Need to sort out why when running from URL, videos arent loaded
    - Need to sort out retina display
    - Need to fix bug with MousePressed() not returning accurate location
                                                   
    - TO DO LIST
        - Need to sort out how to use JSON
        - I need nicer versions of the Settings and Info icon. preferably taken from SVG
        - I need to implement a palm tree icon for tropical mode
*/

import processing.video.*;                                                            // ENABLE FOR DESKTOP APP AND DELETE JAVASCRIPT LIBRARY Required for the Live Pool/Live Panel videos in Java mode
//import processing.video.Movie; // Deprecated                                                        // ENABLE FOR JAVASCRIPT MODE Required for the Live Pool/Live Panel videos

// Declare all variables here but don't initialise them. This will make them global
PFont ArialBold;                                                                       // Declare a PFont variable called ArialBold
PFont ArialSmall;                                                                      // Declare a PFont variable called ArialSmall
PFont ArialMedium;                                                                     // Declare a Pfont variable called ArialMedium
PFont ArialTiny;                                                                       // Declare a PFont variable called ArialTiny
PFont ArialLarge;                                                                      // Declare a PFont variable called ArialLarge
PFont ArialVLarge;                                                                     // Declare a PFont variable called ArialVLarge
String AppVersionNo;                                                                   // Declare a string to hold the version number
float PanelTemp;                                                                       // Declare a float to hold the Panel temperature         
float PoolTemp;                                                                        // Declare a float to hold the Pool temperature          
int EntryID;                                                                           // Declare into to hold the records Entry ID from thingspeak
int ControllerMode;                                                                    // Declare int to hold the Controller mode               
int StatusCode;                                                                        // Declare int to hold the Controller status code
float UserSetSpaTemp;                                                                  // Declare float to hold the User set spa temperature      
float UserSetPoolTemp;                                                                 // Declare float to hold the User set pool temperature     
int SetTempInc;                                                                        // Declare int to hold the Panel temperature increase    
String ControllerFirmwareVersion;                                                      // Declare String to hold the Contoller Firmware version 
int PanelCriticalTemp;                                                                 // Declare int to hold the Panel critical temperature    
long CumulativePumpRuntime;                                                            // Declare long to hold the Cumulative pump runtime      
int PumpsOnOff;                                                                        // Declare int to hold the Pump status                   
String StatusText;                                                                     // Declare String to hold the Status text                
String Aux[];                                                                          // Declare String Array to hold the Aux data
float PanelTempAdj;                                                                    // Declare float to hold the Panel Temperature Adjustment
float PoolTempAdj;                                                                     // Declare float to hold the Pool Temperature Adjustment
String Server;                                                                         // Declare a String to hold the Web Server address
String ChannelID;                                                                      // Declare a String to hold the ThingSpeak Channel ID                            
String inputString[];                                                                  // Declare a String Array to hold the Serial input
String data[];                                                                         // Declare a String Array to hold the individual data parsed from the Arduino 
String HeaderText;                                                                     // Declare a String to hold the current header text
String ServerDataChannel;                                                              // Declare a String to hold the Server data Channel
String TalkBackAPIWriteKey;                                                            // Declare a String to hold the TalkBack API Write Key
String DateEntryCreatedAt;                                                             // Declare a String to hold the Data Entry created at
String TimeEntryCreatedAt;                                                             // Declare a String to hold the Time Entry created at
String FullRecordTimeStamp;                                                            // Declare a String to hold the full timestamp
long lastTimeRun;                                                                      // Declare a long to hold the timer
float easing;                                                                          // Declare a float to hold the easing speed.
float xEase;                                                                           // Declare a float to hold the easing target
int AuxHeaterOnOff;                                                                    // Declare a int flag to hold the Auxilliary heater status
int AuxHeaterEnabled;                                                                  // Declare an int flag to hold if the Auxiliary heater is enabled or not
int ButtonPushed;                                                                      // Declare an int to hold which button has been pushed
int LastX;                                                                             // Declare an int to hold the last mouse X position
int LastY;                                                                             // Declare an int to hold the last mouse Y position
PImage desktop;                                                                        // Create a new object to hold the default desktop
PImage plaingraduated;                                                                 // Create a new object to hold a graduated backdrop
PImage Snowflake;                                                                      // Create a new object to hold the Snowflake image
PImage GraphBackground;                                                                // Create a new object to hold the Graph background
PImage HeaterIcon;                                                                     // Create a new object to hold the heater icon
PImage PumpIcon;                                                                       // Create a new object to hold the pump icon
PImage SettingsIcon;                                                                   // Create a new object to hold the Settings icon
PImage InfoIcon;                                                                       // Create a new icon to hold the Information icon
Movie SpaBubbles;                                                                      // Create a new object to hold the SpaBubbles animation
Movie PoolSwell;                                                                       // Create a new object to hold the PoolSwell animation
Movie Sun;                                                                             // Create a new object to hold the Sun animation

void setup()
{
        size(320, 460, "processing.core.PGraphicsRetina2D");                          // Set the size to 320 wide by 460 high. Use the experimental Retina Graphics renderer (Slower with grey screen at startup)
        //smooth(4);     Deprecate once I get retina working                                                   // Enable 4 x anti aliasing. Looks better on Mac Javascript version
        //hint(ENABLE_OPENGL_4X_SMOOTH);                                                 // ENABLE FOR JAVASCRIPT MODE. A hint to enable 4x AA on supported hardware
        //hint(DISABLE_OPENGL_ERROR_REPORT);                                             // ENABLE FOR JAVACRIPT MODE. A hint to speeds up the OPENGL renderer setting by not checking for errors while running.

        // Initialise the variables here but nowhere else          
        AppVersionNo="v1.01e";                                                         // Initialise the version number
        PanelTemp=0;                                                                   // Initialise the PanelTemp variable to 0
        PoolTemp=0;                                                                    // Initialise the PoolTemp variable to 0
        EntryID=0;                                                                     // Initialise the EntryID variable to 0
        ControllerMode=0;                                                              // Initialise the ControllerMode variable to 0 which is Pool mode, 1 for Spa Mode or 2 for Winter Mode
        StatusCode=0;                                                                  // Initialise the StatusCode variable to 0
        UserSetSpaTemp=0;                                                              // Initialise the UserSetSpaTemp variable to 0
        UserSetPoolTemp=0;                                                             // Initialise the UserSetPoolTemp variable to 0
        SetTempInc=0;                                                                  // Initialise the SetTempInc variable to 0
        ControllerFirmwareVersion="Unknown";                                           // Initialise the ControllerFirmwareVersion variable with a Unknown                      
        PanelCriticalTemp=0;                                                           // Initialise the PanelCriticalTemp variable to 0
        CumulativePumpRuntime=0;                                                       // Initialise the CumulativePumpRuntime variable to 0
        PumpsOnOff=0;                                                                  // Initialise the PumpsOnOff variable to 0 which is off
        StatusText="";                                                                 // Initialise the StatusText variable with a blank string
        Aux=null;                                                                      // Initialise the Aux String Array to be null
        PanelTempAdj=0;                                                                // Initialise the PanelTempAdj variable to 0
        PoolTempAdj=0;                                                                 // Initialise the PoolTempAdj variable to 0
        Server="api.thingspeak.com";                                                   // Initialise the Server variable with the address of the web server
        ChannelID="5384";                                                              // Initialise the Channel ID to be 5384
        inputString=null;                                                              // Initialise the inputString Array variable to be null
        data=null;                                                                     // Initialise the data String Array variable to be null
        HeaderText="My Controller Status";                                             // Initialise the data String with "My Controller Status"
        ServerDataChannel="";                                                          // Initialise the ServerDataChannel variable with a blank string
        TalkBackAPIWriteKey="";                                                        // Initialise the TalkBack API write key variable with a blank string
        DateEntryCreatedAt="";                                                         // Initialise the Date Entry created at with a blank string
        TimeEntryCreatedAt="";                                                         // Initialise the Time Entry created at with a blank string
        FullRecordTimeStamp="";                                                        // Initialise the Full record timestamp with a blank string
        lastTimeRun=0;                                                                 // Initialise the lastTimeRun variable with 0
        easing=0.1;                                                                    // Initialise the easing float with 0.0045 (This is a slow easing value)
        xEase=0;                                                                       // Initialise the xEase float with 0
        AuxHeaterOnOff=0;                                                              // Initialise the flag with false
        AuxHeaterEnabled=0;                                                            // Initialise the flag with false
        ButtonPushed=0;                                                                // Initialise the ButtonPushed int with 0
        LastX=0;                                                                       // Initialise the LastX int with 0
        LastY=0;                                                                       // Initialise the LastY int with 0

        ArialSmall = createFont("arial",14,true);                                      // Create a font called ArialSmall. Make it 14 point with anti-aliasing true
        ArialMedium = createFont("arial",12,true);                                     // Create a font called ArialMedium. Make it 12 point with anti-aliasing true
        ArialTiny = createFont("arial",10,true);                                       // Create a font called ArialTiny. Make it 10 point with anti-aliasing true
        ArialBold = createFont("arial",16,true);                                       // Create a font called Arial. Make it 16 point with anti-aliasing true
        ArialLarge = createFont("arial",26,true);                                      // Create a font called ArialLarge. Make it 26 point with anti-aliasing true
        ArialVLarge = createFont("arial",39,true);                                     // Create a font called ArialVLarge. Make it 49 point with anti-aliasing true

//        frame.setTitle("Solar Controller Monitor "+AppVersionNo);                    // DISABLE FOR JAVASCRIPT MODE Change the title of the application window and output the version number.
        desktop = requestImage("default.png");                                         // Asyncronously load an image into the desktop object
        plaingraduated = requestImage("plaingraduated.png");                           // Asyncronously load an image into the plaingraduated object
        Snowflake = requestImage("Snowflake.png");                                     // Asyncronously load an image into the Snowflake object
        HeaterIcon = requestImage("HeaterIcon.png");                                   // Asyncronously load an image into the Heatericon object
        PumpIcon = requestImage("PumpIcon.png");                                       // Asyncronously load and image into the Pumpicon object
        GraphBackground = requestImage("GraphBackground.png");                         // Asyncronously load an image into the GraphBackground object
        SettingsIcon = requestImage("SettingsIcon.png");                               // Asyncronously load an image into the SettingsIcon object
        InfoIcon = requestImage("InfoIcon.png");                                       // Asyncronously load an image into the InfoIcon object
        SpaBubbles = new Movie(this, "Bubbles.mp4");                                   // Load the SpaBubbles movie into the object
        PoolSwell = new Movie(this, "PoolSwell.mp4");                                  // Load the PoolSwell movie into the object
        Sun = new Movie(this, "Sun.mp4");                                              // Load the Sun movie into the object
        SpaBubbles.loop();                                                             // Instruct the object to loop when called
        PoolSwell.loop();                                                              // Instruct the object to loop when called
        Sun.loop();                                                                    // Instruct the object to loop when called
        SpaBubbles.play();                                                             // Begin playing the object
        PoolSwell.play();                                                              // Begin playing the object
        Sun.play();                                                                    // Begin playing the object        
}

void draw()                                                                            // The main program draw loop
{       
        background(0);                                                                 // Set the background colour to black
        if(ButtonPushed==1)                                                            // If the Settings button was pushed then display the Controller Settings Screen
        {
                image(plaingraduated,0,0);                                             // Draw the plaingraduated image at position 0,0  
                textFont(ArialLarge);                                                  // Set the font to ArialLarge
                textAlign(LEFT);                                                       // Set the font alignment to left
                fill(255);                                                             // Set the colour to white
                HeaderText="New Controller Settings";                                  // Change the heading to New Controller settings
                text(HeaderText,20,36);                                                // Write the current header text at the top of the screen

                fill(57,243,90);                                                       // Set the appropriate button colour. Red would be 239,40,24. Green would be 57,243,90
                rect(16, 378, 136, 66, 7);                                             // Draw a rounded rectangle at the bottom of the screen for the Accept button
                fill(255);                                                             // Set the fill to white
                textFont(ArialLarge);                                                  // Set the font to ArialLarge
                textAlign(CENTER);                                                     // Set the font alignment to left        
                text("Accept",84,420);                                                 // Write the word Accept
                if(LastX >=16 && LastX <= 152 && LastY >=378 && LastY <= 444)          // If the area of the Accept button is pushed
                {                       
                        ButtonPushed=0;                                                // Set the flag to show clear the screen and resume normal drawing
                }
                                
                fill(239,40,24);                                                       // Set the appropriate button colour. Red would be 239,40,24. Green would be 57,243,90
                rect(168, 378, 136, 66, 7);                                            // Draw a rounded rectangle at the bottom of the screen for the Cancel button
                fill(255);                                                             // Set the fill to white
                textFont(ArialLarge);                                                  // Set the font to ArialLarge
                textAlign(CENTER);                                                     // Set the font alignment to left        
                text("Cancel",236,420);                                                // Write the word Cancel
                if(LastX >=168 && LastX <= 304 && LastY >=378 && LastY <= 444)         // If the area of the Cancel button is pushed
                {
                        ButtonPushed=0;                                                // Set the flag to show clear the screen and resume normal drawing
                }
        }
        
        if(ButtonPushed==2)                                                            // If the Information button was pushed then display the More Information screen
        {
                image(plaingraduated,0,0);                                             // Draw the plaingraduated image at position 0,0         
                textFont(ArialLarge);                                                  // Set the font to ArialLarge
                textAlign(LEFT);                                                       // Set the font alignment to left
                fill(255);                                                             // Set the colour to white
                HeaderText="Current System Settings";                                  // Change the heading to current settings
                text(HeaderText,20,36);                                                // Write the current header text at the top of the screen

                textFont(ArialMedium);                                                 // Change the font to ArialMedium
                text("App Software version",20,74);                                    // Write the words App Software version
                text("Controller firmware version",20,94);                             // Write the words Controller firmware version
                text("Last data record number",20,114);                                // Write the words Last data record number
                text("Last data received at",20,134);                                  // Write the words Last data record timestamp
                if(ControllerMode==0 || ControllerMode==2)                             // If we are in Pool or Winter mode
                {
                        text("Pool sensor trim adjustment",20,154);                    // Write the words Pool sensor trim adjustment
                }
                
                if(ControllerMode==1)                                                  // If we are in Spa mode
                {
                        text("Spa sensor trim adjustment",20,154);                     // Write the words Spa sensor trim adjustment
                }
                
                text("Panel sensor trim ajustment",20,174);                            // Write the words Panel sensor trim ajustment
                text("Auxiliary heater status",20,194);                                // Write the words Auxiliary heater status
                text("Heater will maintain water at",20,214);                          // Write the words Heater will maintain water at
                text("Server data channel",20,234);                                    // Write the words Server data channel
                text("Controller secret key",20,254);                                  // Write the words Controller command key
                textAlign(RIGHT);                                                      // Set the font alignment to right
                text(AppVersionNo,299,74);                                             // Output the App version number on the right       
                text(ControllerFirmwareVersion, 299,94);                               // Output the Controller firmware version on the right

                if(EntryID==0)                                                         // If there is no data available
                {
                       text("Unknown",299,114);                                        // Output "Unknown" for Last data record number on the right
                       text("Unknown",299,134);                                        // Output "Unknown" for Last data record timestamp on the right
                       text("Unknown",299,154);                                        // Output "Unknown" for the Pool/Spa Temperature ajustment on the right
                       text("Unknown",299,174);                                        // Output "Unknown" for the Panel Temperature ajustment on the right  
                       text("Unknown",299,194);                                        // Output "Unknown" for the Auxiliary heater status the right  
                       text("Unknown",299,214);                                        // Output "Unknown" for the maintainance temperature                    
                }                       
                
                else                                                                   // If there is data available
                {
                        text(EntryID,299,114);                                         // Output the last data record entry number on the right       
                        text(FullRecordTimeStamp,302,134);                             // Output the full last data record timestamp on the right       
                        text(PoolTempAdj+"°C",298,154);                                // Output the Pool/Spa Temperature ajustment on the right
                        text(PanelTempAdj+"°C",298,174);                               // Output the Panel Temperature ajustment on the right

                        if (AuxHeaterEnabled==1)                                       // if the Auxiliary heater is enabled
                        {
                                text("Enabled",301,194);                               // Output Enabled on the right
                                
                                if (ControllerMode == 0)                               // If the Controller is in Pool mode
                                {        
                                        text(UserSetPoolTemp - 1.5 + "°C",299,214);    // Output UserSetPoolTemp - 1.5 °C on the right       
                                }
                
                                if (ControllerMode == 1)                               // If the controller is in Spa mode   
                                {
                                        text(UserSetSpaTemp - 1.5 + "°C",299,214);     // Output UserSetSpaTemp - 1.5 °C on the right       
                                }     
                        
                                if (ControllerMode == 2)                               // If the Controller is in Winter mode
                                {
                                        text("N/A",295,214);                           // Output N/A on the right       
                                }      
                        }
                        
                        
                        if (AuxHeaterEnabled==0)                                       // if the Auxiliary heater is enabled
                        {
                                text("Disabled",301,194);                              // Output Disabled on the right
                                text("N/A",295,214);                                   // Output N/A on the right       
                        }             
                }
                
                if(ServerDataChannel !="")                                             //  If there is some text in the ServerDataChannel
                {
                        text(ServerDataChannel,299,234);                               // Output the server data channel on the right hand side
                }
                
                else
                {
                        text("Unknown",299,234);                                       // Output "Unknown" for the server data channel on the right hand side 
                }
                
                if(TalkBackAPIWriteKey !="")                                           // If there is some text in the TalkBackAPIWriteKey
                {
                        text(TalkBackAPIWriteKey,299,254);                             // Output the TalkBackAPIWriteKey on the right
                }
                
                else
                {
                        text("Unknown",299,254);                                       // Output "Unknown" for the TalkBackAPIWriteKey on the right          
                }

                fill(239,40,24);                                                       // Set the appropriate button colour. Red would be 239,40,24. Green would be 57,243,90
                rect(16, 378, 288, 66, 7);                                             // Draw a rounded rectangle at the bottom of the screen for the Cancel button
                fill(255);                                                             // Set the fill to white
                textFont(ArialLarge);                                                  // Set the font to ArialLarge
                textAlign(CENTER);                                                     // Set the font alignment to left        
                text("Cancel",160,420);                                                // Write the word Cancel
                if(LastX >=16 && LastX <= 304 && LastY >=378 && LastY <= 444)          // If the area of the Cancel button is pushed
                {
                        ButtonPushed=0;                                                // Set the flag to show clear the screen and resume normal drawing
                }
        } 
        
        if(ButtonPushed==0)                                                            // If no button was pushed then
        {       
                drawMain();                                                            // Draw the main screen
                drawLiveTemps(xEase,54);                                               // Call the routine to drawLiveTemps.
        }
        //thread("GetandParseData");                                                   // GetandParseData with threading. Used for Desktop App
        //GetandParseData();          // GetandParseData without threading. Used for JavaScript Mode    
}

void drawMain()
{
        HeaderText="My Controller Status";                                             // Reset the header text  
        image(desktop,0,0);                                                            // Draw the desktop background image at position 0,0
        textFont(ArialLarge);                                                          // Set the font to ArialLarge
        textAlign(LEFT);                                                               // Set the font alignment to left
        fill(255);                                                                     // Set the colour to white
        text(HeaderText,20,36);                                                        // Write the current header text at the top of the screen
        textFont(ArialBold);                                                           // Set the font to be ArialBold
        textAlign(LEFT);                                                               // Set the font alignment to left
        
        if (ControllerMode == 0 || ControllerMode == 2)                                // If the controller is in Pool or Winter mode     
        {
                text("Keep my pool at",20,214);                                        // Write Keep my Pool at on the left
        }

        if (ControllerMode == 1)                                                       // If the controller is in Spa mode   
        {
                text("Keep my spa at",20,214);                                         // Write Keep my Spa at on the left
        }

        text("Pump water if panel hotter by",20,258);                                  // Write Pump water if panel hotter by on the left
        text("Panel safety limit is",20,302);                                          // Write Panel safety limit on left
        text("Total pumping time",20,346);                                             // Write Total pumping time on left       
        text("Status",20,390);                                                         // Write Status on left
        textAlign(RIGHT);                                                              // Set the font alignment to right
        textFont(ArialBold);                                                           // Set the font to be ArialBold

        if (ControllerMode == 0)                                                       // If the Controller is in Pool mode
        {        
                text(UserSetPoolTemp+"°C",299,214);                                    // Output UserSetPoolTemp and °C on the right       
        }

        if (ControllerMode == 1)                                                       // If the controller is in Spa mode   
        {
                text(UserSetSpaTemp+"°C",299,214);                                     // Output UserSetSpaTemp and °C on the right       
        }     
        
        if (ControllerMode == 2)                                                       // If the Controller is in Winter mode
        {
                text("n/a",299,214);                                                   // Output n/a on the right 
                text("n/a",299,214);                                                   // Output n/a on the right
                text("n/a",299,258);                                                   // Output n/a on the right
                text(PanelCriticalTemp+"°C",299,302);                                  // Output PanelCriticalTemp and °C on the right

                if (CumulativePumpRuntime <=60)                                        // If CumulativePumpRuntime <= 60                  
                {
                        text(CumulativePumpRuntime+" second(s)",299,346);              // Output the number of seconds and seconds on the right
                }
        
                else if (CumulativePumpRuntime >60 && CumulativePumpRuntime <3600)     // If CumulativePumpRuntime between 60 and 3600
                {  
                        text(CumulativePumpRuntime/60+" minute(s)",299,346);           // Output the number of minutes on the right
                }
        
                else if (CumulativePumpRuntime >=3600)                                 // If CumulativePumpRuntime between 3600 and 86400
                {
                        text(CumulativePumpRuntime/3600+" hour(s)",299,346);           // Output the number of hour(s) on the right
                }
                text(StatusText,299,390);                                              // Output Status text on the right. Please note. The maximum length of status messages is 30 characters      
        } 
        
        if (ControllerMode == 0 || ControllerMode == 1)                                // If the Controller is in Pool or Spa mode
        {          
                text(SetTempInc+"°C",299,258);                                         // Output SetTempInc and °C on the right
                text(PanelCriticalTemp+"°C",299,302);                                  // Output PanelCriticalTemp and °C on the right
                
                if (CumulativePumpRuntime <=60)                                        // If CumulativePumpRuntime <= 60                  
                {
                        text(CumulativePumpRuntime+" second(s)",299,346);              // Output the number of seconds and seconds on the right
                }
        
                else if (CumulativePumpRuntime >60 && CumulativePumpRuntime < 3600)    // If CumulativePumpRuntime between 60 and 3600
                {  
                        text(CumulativePumpRuntime/60+" minute(s)",299,346);           // Output the number of minutes and minutes on the right
                }
        
                else if (CumulativePumpRuntime >=3600)                                 // If CumulativePumpRuntime > 3600
                {
                        text(CumulativePumpRuntime/3600+" hour(s)",299,346);           // Output the number of hours and hour(s) on the right
                }
                
                text(StatusText,299,390);                                              // Output Status text on the right. Please note. The maximum length of status messages is 30 characters
        }
        
        if(ButtonPushed == 0 )
        {
                fill(15,15,15);                                                                // Set the fill colour to just off black
                rect(0,406,320,54);                                                            // Draw a black bar for the buttons at the bottom of the screen
                image(SettingsIcon,68,416,24,24);                                              // Draw the Settings Icon
                image(InfoIcon,227,415,26,26);                                                 // Draw the Information Icon
        
                fill(255);                                                                     // Set the colour to white
                textFont(ArialTiny);                                                           // Set the font to ArialTiny
                textAlign(CENTER);                                                             // Set the font alignment to left        
                text("Change Settings",80,455);                                                // Write the words Change Settings
                text("More Information",240,455);                                              // Write the words More Information
 
                if (LastX >=0 && LastX <=160 && LastY >=406 && LastY <=460)                    // If the settings button was pressed
                {
                        ButtonPushed=1;                                                        // Set the flag to show the Settings Screen
                }
 
                if (LastX >=161 && LastX <=320 && LastY >=406 && LastY <=460)                  // If the info button was pressed
                {
                        ButtonPushed=2;                                                        // Set the flag to show the More Information screen
                }
        }
}

void drawLiveTemps(float x, float y)                                                   // Function to display the live Pool/Spa temperatures
{
        mouseOut();                                                                    // Call to function to check if the mouse has left the screen
        image(GraphBackground,(x-320),(y+0));                                          // Draw the GraphBackGroundimage
        // The graph display code will go here
  
        if (ControllerMode == 1)                                                       // If the controller is in Spa mode     
        {
                image(SpaBubbles,x,y,160,132);                                         // Draw the Spa Bubbles video at the specified coordinates. Make the video 160 wide x 132 high                
                if(AuxHeaterOnOff == 1)                                                // If the Auxilliary heater is on.
                {
                        image(HeaterIcon, (x+142), (y+4), 14, 20);                     // Draw the Heater icon on the right of the panel 2 pixels in and 2 pixels down
                }
                
                if (PoolTemp > -40 && PoolTemp <100)                                   // If the temperature is in normal operating range
                {
                        fill(255);                                                     // Set the fill colour back to white before we draw the text
                        textAlign(LEFT);                                               // Set the font alignment to left
                        textFont(ArialBold);                                           // Set the font to be ArialBold    
                        text("Spa",(x+14),(y+40));                                     // Write the word Spa                  
                        textFont(ArialVLarge);                                         // Set the font to ArialVLarge 
                        textAlign(CENTER,CENTER);                                      // Set the font alignment to centre
                        text(PoolTemp+"°C",(x+80),(y+59));                             // ENABLE FOR DESKTOP MODE. Print the current Spa Temperature and °C
                        //text(PoolTemp.toFixed(1)+"°C",(x+80),(y+59));                  // ENABLE FOR JAVASCRIPT MODE. Print the current Spa Temperature and °C

                        if (PoolTemp <=34.5)                                           // If the Spa Temperature is <= 34.5°C its too cold so blue
                        {
                                fill(0,0,255,100);                                     // Set fill colour for the box to be blue with 39% opacity
                                noStroke();                                            // Don't draw a border
                                rect((x+0),(y+108),160,24);                            // Draw a box at the bottom
                                fill(255);                                             // Set the fill colour back to white before we draw the text
                                textAlign(CENTER);                                     // Set the font alignment to centre
                                textFont(ArialSmall);                                  // Set the font to be small    
                                text("Temperature too low",(x+80),(y+125));            // Write Temperature too low in the box
                        }
       
                        if (PoolTemp >=35 && PoolTemp <=36.5)                          // If the Spa Temperature is >=35°C and <=36.5°C its amber
                        {
                                fill(255,180,0,165);                                   // Set fill colour for the box to be amber with 65% opacity
                                noStroke();                                            // Don't draw a border
                                rect((x+0),(y+108),160,24);                            // Draw a box at the bottom
                                fill(255);                                             // Set the fill colour back to white before we draw the text
                                textAlign(CENTER);                                     // Set the font alignment to centre
                                textFont(ArialSmall);                                  // Set the font to be small    
                                text("Temperature is cool",(x+80),(y+125));            // Write Temperature is cool in the box               
                        }
                        
                        if (PoolTemp >=37 && PoolTemp <=40)                            // If the Spa Temperature is >=37°C and <=40°C its green
                        {
                                fill(0,255,0,165);                                     // Set fill colour for the box to be green with 65% opacity
                                noStroke();                                            // Don't draw a border
                                rect((x+0),(y+108),160,24);                            // Draw a box at the bottom
                                fill(255);                                             // Set the fill colour back to white before we draw the text
                                textAlign(CENTER);                                     // Set the font alignment to centre
                                textFont(ArialSmall);                                  // Set the font to be small    
                                text("Spa is ready for use",(x+80),(y+125));           // Write Spa is ready for use in the box                        
                        }
                        if (PoolTemp >=40.5)                                           // If the Spa Temperature is >=40.5°C it's too hot so red
                        {
                                fill(255,0,00,165);                                    // Set fill colour for the box to be red with 65% opacity
                                noStroke();                                            // Don't draw a border
                                rect((x+0),(y+108),160,24);                            // Draw a box at the bottom
                                fill(255);                                             // Set the fill colour back to white before we draw the text
                                textAlign(CENTER);                                     // Set the font alignment to centre
                                textFont(ArialSmall);                                  // Set the font to be small    
                                text("Temperature is too high",(x+80),(y+125));        // Write Temperature is too high in the box                          
                        }
                }
        }

        if (ControllerMode == 0 || ControllerMode == 2)                                // If the controller is in Pool or Winter mode     
        {
                image(PoolSwell,x,y,160,132);                                          // Draw the Pool Swell video at the specified coordinates. Make the video 160 wide x 132 high
                if(AuxHeaterOnOff == 1)                                                // If the Auxilliary heater is on.
                {
                        image(HeaterIcon, (x+142), (y+4), 14, 20);                     // Draw the Heater icon on the right of the panel 2 pixels in and 2 pixels down  
                }
                
                if (ControllerMode ==2)                                                // If the controller is in Wintermode
                {
                        tint(255, 192);                                                // Set the tint to white and 75% opacity
                        image(Snowflake, (x+28), y, 108, 108);                         // Draw the snowflake icon
                        noTint();                                                      // Turn off the tint
                }

                if (PoolTemp > -40 && PoolTemp <100)                                   // If the temperature is in normal operating range
                {
                        fill(255);                                                     // Set the fill colour back to white before we draw the text
                        textAlign(LEFT);                                               // Set the font alignment to left
                        textFont(ArialBold);                                           // Set the font to be ArialBold

                        if (ControllerMode ==0)                                        // If the controller is in Pool Mode
                        {
                                text("Pool",(x+14),(y+40));                            // Write Pool                
  
                        }

                        if (ControllerMode ==2)                                        // If the controller is in Wintermode
                        {
                                tint(255, 192);                                        // Set the tint to white and 75% opacity
                                image(Snowflake, (x+28), y, 108, 108);                 // Draw the snowflake icon
                                noTint();                                              // Turn off the tint
                                text("Winter Mode",(x+14),(y+40));                     // Write Winter Mode                  
                        }                                            
                            
                        textFont(ArialVLarge);                                         // Set the font to ArialVLarge 
                        textAlign(CENTER,CENTER);                                      // Set the font alignment to centre
                        //text(PoolTemp.toFixed(1)+"°C",(x+80),(y+59));                  // ENABLE FOR JAVASCRIPT MODE. Print the current PoolTemp and °C
                        text(PoolTemp+"°C",(x+80),(y+59));                             // ENABLE FOR DESKTOP MODEPrint the current PoolTemp and °C
                        
                        if (PoolTemp <=25.5)                                           // If the Pool Temperature is <= 25.5°C its too cold so blue
                        {
                                fill(0,0,255,100);                                     // Set fill colour for the box to be blue with 39% opacity
                                noStroke();                                            // Don't draw a border
                                rect((x+0),(y+108),160,24);                            // Draw a box at the bottom
                                fill(255);                                             // Set the fill colour back to white before we draw the text
                                textAlign(CENTER);                                     // Set the font alignment to centre
                                textFont(ArialSmall);                                  // Set the font to be small    
                                text("Temperature too low",(x+80),(y+125));            // Write Temperature too low in the box
                        }
       
                        if (PoolTemp >=26 && PoolTemp <=27.5)                          // If the Pool Temperature is >=26°C and <=27.5°C its amber
                        {
                                fill(255,180,0,165);                                   // Set fill colour for the box to be amber with 65% opacity
                                noStroke();                                            // Don't draw a border
                                rect((x+0),(y+108),160,24);                            // Draw a box at the bottom
                                fill(255);                                             // Set the fill colour back to white before we draw the text
                                textAlign(CENTER);                                     // Set the font alignment to centre
                                textFont(ArialSmall);                                  // Set the font to be small    
                                text("Temperature is cool",(x+80),(y+125));            // Write Temperature is cool in the box               
                        }
                        
                        if (PoolTemp >=28 && PoolTemp <=30)                            // If the Pool Temperature is >=28.5°C and <=30°C its green
                        {
                                fill(0,255,0,165);                                     // Set fill colour for the box to be green with 65% opacity
                                noStroke();                                            // Don't draw a border
                                rect((x+0),(y+108),160,24);                            // Draw a box at the bottom
                                fill(255);                                             // Set the fill colour back to white before we draw the text
                                textAlign(CENTER);                                     // Set the font alignment to centre
                                textFont(ArialSmall);                                  // Set the font to be small    
                                text("Pool is ready for use",(x+80),(y+125));          // Write Spa is ready for use in the box                        
                        }
                        if (PoolTemp >=30.5)                                           // If the Pool Temperature is >=30.5°C it's too hot so red
                        {
                                fill(255,0,00,165);                                    // Set fill colour for the box to be red with 65% opacity
                                noStroke();                                            // Don't draw a border
                                rect((x+0),(y+108),160,24);                            // Draw a box at the bottom
                                fill(255);                                             // Set the fill colour back to white before we draw the text
                                textAlign(CENTER);                                     // Set the font alignment to centre
                                textFont(ArialSmall);                                  // Set the font to be small    
                                text("Temperature is too high",(x+80),(y+125));        // Write Temperature is too high in the box                          
                        }
                }
        }
                        
        if (PoolTemp <= -40)                                                           // If the temperature is <= -40, we have an electronics fault
        {
                fill(255,0,00,165);                                                    // Set fill colour for the box to be red with 65% opacity
                noStroke();                                                            // Don't draw a border
                rect(x,y,160,132);                                                     // Draw a box covering this portion of the display
                fill(255);                                                             // Set the fill colour back to white before we draw the text
                textFont(ArialVLarge);                                                 // Set the font to ArialVLarge 
                textAlign(CENTER,CENTER);                                              // Set the font alignment to centre
                text("Error",(x+80),(y+59));                                           // Output Error
                textAlign(CENTER);                                                     // Set the font alignment to centre
                textFont(ArialSmall);                                                  // Set the font to be small
                text("Electronics fault",(x+80),(y+125));                              // Write Electronics fault
        }

        if (PoolTemp >= 100)                                                           // If the temperature is >= 100, no sensor is connected
        {
                fill(255,0,00,165);                                                    // Set fill colour for the box to be red with 65% opacity
                noStroke();                                                            // Don't draw a border
                rect(x,y,160,132);                                                     // Draw a box covering this portion of the display
                fill(255);                                                             // Set the fill colour back to white before we draw the text
                textFont(ArialVLarge);                                                 // Set the font to ArialVLarge 
                textAlign(CENTER,CENTER);                                              // Set the font alignment to centre
                text("Error",(x+80),(y+59));                                           // Output Error
                textAlign(CENTER);                                                     // Set the font alignment to centre
                textFont(ArialSmall);                                                  // Set the font to be small

                if (ControllerMode == 1)                                               // If the controller is in Spa mode     
                {
                        text("Spa sensor",(x+80),(y+125));                             // Write Spa sensor
                }  
        
                if (ControllerMode == 0 || ControllerMode == 2)                        // If the controller is in Pool or Winter mode
                {
                        text("Pool sensor",(x+80),(y+125));                            // Write Pool sensor
                }     
        }                
        image(Sun,(x+160),y,160,132);                                                  // Draw the Sun video at the specified coordinates. Make the video 160 wide x 132 high                
        
        if(PumpsOnOff == 1)                                                            // If the Pump(s) are on.
        {                        
                image(PumpIcon, (x+295), (y+4), 23, 20);                               // Draw the Pump icon on the right of the panel 2 pixels in and 2 pixels down
        }
        
        if (PanelTemp > -40 && PanelTemp <100)                                         // If the temperature is in normal operating range
        {
                fill(255);                                                             // Set the fill colour back to white before we draw the text
                textAlign(LEFT);                                                       // Set the font alignment to left
                textFont(ArialBold);                                                   // Set the font to be ArialBold    
                text("Panel",(x+174),(y+40));                                          // Write the word Panel                  
                textFont(ArialVLarge);                                                 // Set the font to ArialVLarge 
                textAlign(CENTER,CENTER);                                              // Set the font alignment to centre
                //text(PanelTemp.toFixed(1)+"°C",(x+240),(y+59));                        // ENABLE FOR JAVASCRIPT MODE. Print the current Panel Temperature and °C
                text(PanelTemp+"°C",(x+240),(y+59));                                   // ENABLE FOR DESKTOP MODE. Print the current Panel Temperature and °C
                
                if (PanelTemp <=24.5)                                                  // If the Panel Temperature is <= 24.5°C its too cold so blue
                {
                        fill(0,0,255,100);                                             // Set fill colour for the box to be blue with 39% opacity
                        noStroke();                                                    // Don't draw a border
                        rect((x+160),(y+108),160,24);                                  // Draw a box at the bottom
                        fill(255);                                                     // Set the fill colour back to white before we draw the text
                        textAlign(CENTER);                                             // Set the font alignment to centre
                        textFont(ArialSmall);                                          // Set the font to be small    
                        text("Panel is cool",(x+240),(y+125));                         // Write Panel is cool
                }
 
                if (PanelTemp >=25 && PanelTemp <=55)                                  // If the Panel Temperature is >=25°C and <=54°C its green
                {
                        fill(255,180,0,165);                                           // Set fill colour for the box to be amber with 65% opacity
                        noStroke();                                                    // Don't draw a border
                        fill(0,255,0,165);                                             // Set fill colour for the box to be green with 65% opacity
                        noStroke();                                                    // Don't draw a border
                        rect((x+160),(y+108),160,24);                                  // Draw a box at the bottom
                        fill(255);                                                     // Set the fill colour back to white before we draw the text
                        textAlign(CENTER);                                             // Set the font alignment to centre
                        textFont(ArialSmall);                                          // Set the font to be small    
                        text("Panel in normal range",(x+240),(y+125));                 // Write Panel in normal range          
                }
                
                if (PanelTemp >=55.5 && PanelTemp <=65)                                // If the Panel Temperature is >=55°C and <=65°C its amber
                {
                        fill(255,180,0,165);                                           // Set fill colour for the box to be amber with 65% opacity
                        noStroke();                                                    // Don't draw a border
                        rect((x+160),(y+108),160,24);                                  // Draw a box at the bottom
                        fill(255);                                                     // Set the fill colour back to white before we draw the text
                        textAlign(CENTER);                                             // Set the font alignment to centre
                        textFont(ArialSmall);                                          // Set the font to be small    
                        text("Panel is hot",(x+240),(y+125));                          // Write Panel is hot                      
                }

                if (PanelTemp >=65.5)                                                  // If the Panel Temperature is >=65°C it's too hot so red
                {
                        fill(255,0,00,165);                                            // Set fill colour for the box to be red with 65% opacity
                        noStroke();                                                    // Don't draw a border
                        rect((x+160),(y+108),160,24);                                  // Draw a box at the bottom
                        fill(255);                                                     // Set the fill colour back to white before we draw the text
                        textAlign(CENTER);                                             // Set the font alignment to centre
                        textFont(ArialSmall);                                          // Set the font to be small    
                        text("Panel is overheating",(x+240),(y+125));                  // Write Panel is overheating                       
                }
        }      
                 
        if (PanelTemp <= -40)                                                          // If the temperature is <= -40, we have an electronics fault
        {
                fill(255,0,00,165);                                                    // Set fill colour for the box to be red with 65% opacity
                noStroke();                                                            // Don't draw a border
                rect((x+160),y,160,132);                                               // Draw a box covering this portion of the display
                fill(255);                                                             // Set the fill colour back to white before we draw the text
                textFont(ArialVLarge);                                                 // Set the font to ArialVLarge 
                textAlign(CENTER,CENTER);                                              // Set the font alignment to centre
                text("Error",(x+240),(y+59));                                          // Output Error
                textAlign(CENTER);                                                     // Set the font alignment to centre
                textFont(ArialSmall);                                                  // Set the font to be small
                text("Electronics fault",(x+240),(y+125));                             // Write Electronics fault
        }

        if (PanelTemp >= 100)                                                          // If the temperature is >= 100, no sensor is connected
        {
                fill(255,0,00,165);                                                    // Set fill colour for the box to be red with 65% opacity
                noStroke();                                                            // Don't draw a border
                rect((x+160),y,160,132);                                               // Draw a box covering this portion of the display
                fill(255);                                                             // Set the fill colour back to white before we draw the text
                textFont(ArialVLarge);                                                 // Set the font to ArialVLarge 
                textAlign(CENTER,CENTER);                                              // Set the font alignment to centre
                text("Error",(x+240),(y+59));                                          // Output Error
                textAlign(CENTER);                                                     // Set the font alignment to centre
                textFont(ArialSmall);                                                  // Set the font to be small
                text("Panel sensor",(x+240),(y+125));                                  // Write Panel sensor
        }

        if (mouseX >=0 && mouseX <=320 && mouseY >=56 && mouseY <=190)                 // If the mouse cursor is within the canvas
        {
                float dx = mouseX - xEase;                                             // Do some complicated stuff to allow smooth physics scolling between the screens
        
                if(abs(dx) > 0)
                {
                        xEase += dx * easing;
                }               
        }        
}

void movieEvent(Movie m)                                                               // ENABLE FOR JAVASCRIPT MODE Required for playing the video files
{
        m.read();
}

void mouseOut()                                                                        // Function to check if the mouse has left the extremities of the screen and set the target border to 0 or 320 respectively. This is required because otherwise quick mouse movements means 
{                                                                                      // the last mouse positon is several pixels inside the canvas. It also ensures that if the last mouse position was on the left of the screen the scroll target is the left hand side and vice versa 
        if (mouseX <=160)                                                              // If when the mouse leaves the canvas if the last mouse position was the left hand side of the screen
        {
                mouseX=0;                                                              // Set the target to be 0
        }

        if (mouseX >160)                                                               // If when the mouse leaves the canvas if the last mouse position was the right hand side of the screen
        {
                mouseX=320;                                                            // Set the target to be 320
        }
}

void mousePressed()                                                                    // Function to determine which areas of the screen are being selected
{
        LastX = mouseX;                                                                // Get the X & Y Coordinates of the last mouse press
        LastY= mouseY;
}

void GetandParseData()    
{
        if (millis() - lastTimeRun > 5000)                                             // If its been 5 seconds since we last requested the data
        { 
                inputString = loadStrings("https://api.thingspeak.com/channels/5384/feed.csv?status=true&results=1\n");       // Get new data using secure https
                if (inputString !=null)                                                // Check if there is something in the inputString
                {                        
                        data = split(inputString[1],',');                              // Split the input string into seperate pieces based on the delimeter
                        DateEntryCreatedAt = (data[0].substring(8,10)) + "-" + (data[0].substring(5,7)) + "-" + (data[0].substring(0,4)); // Get the date component of the substring and reformat it to UK date format                        
                        TimeEntryCreatedAt = (data[0].substring(11,19));               // Get the time component of the substring
                        FullRecordTimeStamp = DateEntryCreatedAt + " " + TimeEntryCreatedAt; // Create a full timestamp out fo the two parts
                        EntryID = int(data[1]);                                        // Convert String to int and put it in the EntryID variable
                        PanelTemp = float(trim(data[2]));                              // Convert String to float and put it in the PanelTemp variable
                        PoolTemp = float(trim(data[3]));                               // Convert String to float and put it in the PoolTemp variable
                        ControllerMode = int(data[4]);                                 // Convert String to int and put it in the ControllerMode variable
                        SetTempInc = int(trim(data[5]));                               // Convert String to int and put it in the SetTempInc variable
                        PanelCriticalTemp = int(data[6]);                              // Convert String to int and put it in the PanelCriticalTemp variable
                        AuxHeaterOnOff = int(data[7]);                                 // Convert String to int and put it in the AuxHeaterOnOff variable
                        PumpsOnOff = int(data[8]);                                     // Convert String to int and put it in the PumpsOnOff variable
                        StatusCode = int(data[10]);                                    // Put the text in the StatusText variable
                        Aux = split(data[9],'/');                                      // Split the Aux field input string into seperate pieces based on the '/'delimeter
                        PanelTempAdj = float(Aux[0]);                                  // Convert String to float and put it in the PanelTempAdj variable
                        PoolTempAdj = float(Aux[1]);                                   // Convert String to float and put it in the PoolTempAdj variable
                        UserSetPoolTemp = float(Aux[2]);                               // Convert String to float and put it in the UserSetPoolTemp variable
                        UserSetSpaTemp = float(Aux[3]);                                // Convert String to float and put it in the UserSetSpaTemp variable
                        CumulativePumpRuntime = int(trim(Aux[4]));                     // Convert String to int and put it in the CumulativePumpRuntime variable
                        AuxHeaterEnabled = int(Aux[5]);                                // Convert String to int and put it in the AuxHeaterOnOff variable                      
                        ControllerFirmwareVersion = Aux[6];                            // Put the text in the ControllerFirmwareVersion variable                              
                        // The following code takes the status code output by the controller and converts it into meaninful text
                
                        //    code 1 = "Panels are too hot. Pump(s) on"
                        //    code 2 = "It's very cold. Protect pipes"
                        //    code 3 = "Pumping to stop pipes bursting"
                        //    code 4 = "Freezing point. Pump(s) off"
                        //    code 5 = "Tropical mode. Pump(s) on"
                        //    code 6 = "Hot water available. Pumping"
                        //    code 7 = "Collecting heat. Pump(s) off"
                        //    code 8 = "Winter mode. Waiting"
                        //    code 9 = "Winter mode. Pumping"
                        //    code 10 = "Pool sensor - error"
                        //    code 11 = "Spa sensor - error"
                        //    code 12 = "Panel sensor - error"
                        //    code 13 = "Both sensors - error"                                  
               
                        if(StatusCode == 1)
                        {
                                StatusText = "Panels are too hot. Pump(s) on";
                        }
                
                        if(StatusCode == 2)
                        {
                                StatusText = "It's very cold. Protect pipes";
                        }
                
                        if(StatusCode == 3)
                        {   
                                StatusText = "Pumping to stop pipes bursting";
                        }
                
                        if(StatusCode == 4)
                        {
                                StatusText = "Freezing point. Pump(s) off";
                        }
                
                        if (StatusCode == 5)
                        {
                                StatusText = "Tropical mode. Pump(s) on";
                        }
                
                        if (StatusCode == 6)
                        {
                                StatusText = "Hot water available. Pumping";
                        }
                
                        if (StatusCode == 7)
                        {
                                StatusText = "Collecting heat. Pump(s) off";
                        }
                
                        if (StatusCode == 8)
                        {
                                StatusText = "Winter mode. Waiting";
                        }
                
                        if (StatusCode == 9)
                        {
                                StatusText = "Winter mode. Pumping";
                        }
                
                        if (StatusCode == 10)
                        {
                                StatusText = "Pool sensor - error";
                        }
                
                        if (StatusCode == 11)
                        {                              
                                StatusText = "Spa sensor - error";
                        }
                
                        if (StatusCode == 12)
                        {
                                StatusText = "Panel sensor - error";
                        }
                
                        if (StatusCode == 13)
                        {
                                StatusText = "Both sensors - error";
                        }      
                }
                lastTimeRun = millis();                                                // Reset the timer                        
        }
}




