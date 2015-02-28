
/*
// Author Stefan Morley
// Sep 2010
// stefan.morley@gmail.com
*/

import processing.serial.*;
import guicomponents.*;

int myColorBackground = color(0,0,0);

public String[] strarray = new String[5];
private int pointer = 0;

GTextField status_port, input_port, analogue_port, relay_port;

GLabel JustLabel;
GButton b0, b3;
PApplet app = this;
GWinApplet newapp;
GWinData newdata;

LedClass green_led = new LedClass();
LedClass blue_led = new LedClass();
LedClass red_led = new LedClass();

GWindow[] window;

serial_port second_port = new serial_port();

// Timer setup and control parameters
int rate = 500;
int toggle = 0;

/*
Setup
*/
PImage titlebaricon; 
PFont font;
void setup() 
{
  size(540,480);
titlebaricon = new PImage(16, 16);
titlebaricon = loadImage("GreenLED_off.png");
frame.setIconImage(titlebaricon.getImage());
 
frame.setTitle("GPS NMEA String Parser");
  
  G4P.setTextMode(MODEL);  
  font = loadFont("SansSerif.plain-10.vlw"); 
  textFont(font, 10);
  GComponent.globalColor = GCScheme.getColor(this,  GCScheme.BLUE_SCHEME);    
  GComponent.globalFont = GFont.getFont(this, "ArialNarrow-12.vlw", 10);
  
  fill(0, 0, 240);
  text(">3 Satellites  Fix     DOP > 4.0", 200, 440);

  b0= new GButton(this, "Exit", 420,440,100,30);
  b0.setBorder(1);
  b0.fireAllEvents(true); 
  b0.tagNo = 2;
  b3= new GButton(this, "Open", 20,440,100,30);
  b3.setBorder(1);
  b3.fireAllEvents(true); 
  b3.tagNo = 3;  

  fill(0,0,0);
  rect(215, 445, 110, 20);
  green_led.display_led("GreenLED", 265, 450, 10, 10);
  blue_led.display_led("BlueLED", 225, 450, 10, 10);
  red_led.display_led("RedLED", 305, 450, 10, 10);  

  status_port = new GTextField(this, "Raw 1", 20, 20, 380, 20, true);
  input_port = new GTextField(this, "Raw 2", 20, 40, 380, 20, true);
  analogue_port = new GTextField(this, "Raw 3", 20, 60, 380, 20, true);  
  relay_port = new GTextField(this, "Raw 4", 20, 80, 380, 20, true);

  screen_setup();
}

void handleTextFieldEvents(GTextField textfield)
{
  
}

/**
 * Simple class that extends GWinData and holds the data that is specific
 * to a particular window.
 * 
 * @author Peter Lager
 *
 */
class MyWinData extends GWinData 
{
  public int sx,sy,ex,ey;
  public boolean done;
}

public void handlePanelEvents(GPanel panel)
{
  second_port.handlePanelEvents(panel);
}

void serialEvent(Serial Port) 
{
  second_port.serialEvent(Port);
}
/*
Handle the option event changes
 */
public void handleOptionEvents(GOption selected, GOption deselected)
{
  second_port.handleOptionEvents(selected, deselected);
}

/*
This routine callls  the calls routine to deal with the button press. Acts on the tagNo
 defined at setup to decide which button was pressed.
 */
void handleButtonEvents(GButton button)
{
  second_port.handleButtonEvents(button);
}

void draw()
{
  int pointer = 0;
  text("", 20, 100);

  for (pointer = 0; pointer < 4; pointer++)
  {
    if(strarray[pointer] != null)
    {
      fill(0, 0, 0);    
      status_port.setText(strarray[0]);
      input_port.setText(strarray[1]);
      relay_port.setText(strarray[2]);
      analogue_port.setText(strarray[3]);
    }

    if(strarray[0] != null)
    {
      String[] PARSE_NMEA = splitTokens(strarray[0], ",");
      if (PARSE_NMEA[0].equals("$PSNY"))
      {
        PSNY_FIELD.setText(strarray[0]);
      }
      else if (PARSE_NMEA[0].equals("$GPGSA"))
      {
        GPGSA_FIELD.setText(strarray[0]);
      }
      else if (PARSE_NMEA[0].equals("$GPRMC"))
      {
        GPRMC_FIELD.setText(strarray[0]);
      }        
      else if (PARSE_NMEA[0].equals("$GPZDA"))
      {
        GPZDA_FIELD.setText(strarray[0]);
      }
      else if (PARSE_NMEA[0].equals("$GPGLL"))
      {
        GPGLL_FIELD.setText(strarray[0]);
      } 
      else if (PARSE_NMEA[0].equals("$GPGGA"))
      {
        GPGGA_FIELD.setText(strarray[0]);
        GGA_PARSED(strarray[0]);
      }   
      else if (PARSE_NMEA[0].equals("$GPVTG"))
      {
        GPVTG_FIELD.setText(strarray[0]);
      }
      else if (PARSE_NMEA[0].equals("$GPGSV"))
      {
        GPGSV_FIELD.setText(strarray[0]);
      }        
      else if (PARSE_NMEA[0].equals("$GPALM"))
      {
        GPALM_FIELD.setText(strarray[0]);
      }   
      else if (PARSE_NMEA[0].equals("$GPRMB"))
      {
        GPRMB_FIELD.setText(strarray[0]);
      }
    }
  }
}


