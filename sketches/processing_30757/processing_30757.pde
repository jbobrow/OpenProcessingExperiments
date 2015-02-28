
/////////////////
// CL : O : CK //
// (original)  //
/////////////////

// Copyright (C) 2011 Dylan Powell
// dylpow.tumblr.com

// Last updated:   7 July 2011
// Initial version:  June 2010

///////////////////////////////////////////////////////////////////
// CREATIVE COMMONS ATTRIBUTION-SHARE ALIKE 3.0 LICENSE
// This sketch is licensed under the Creative Commons Attribution-
// Share Alike 3.0 License. See the License for the specific 
// language governing permissions limitations under the 
// License: http://creativecommons.org/licenses/by-sa/3.0/us/
// You are hereby encouraged to share, copy, distribute, and 
// otherwise transmit this Work, as well as to adapt it. However,
// you must attribute the Work to its author (me), and if you use
// any part of it for your own purposes or otherwise alter or 
// build on this Work you may distribute the resulting Work only
// under the same or similar license to this one.
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////
// CREATIVE COMMONS GNU GPL 2.0 LICENSE
// Copyright (C) 2011  Dylan Powell
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or any later version.
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// http://www.gnu.org/licenses/gpl-2.0.html
///////////////////////////////////////////////////////////////////


/*
********************
* GENERAL COMMENTS *
********************

No user input is required to run this clock. Sorry! 

Rather than the standard display of HOURS : MINUTES : SECONDS, 
CL : O : CK is organized the way time is actually experienced: 
SECONDS : MINUTES : HOURS. The movement of "CL" designates the 
passage of seconds, "O" of minutes, and "CK" of hours. The text 
starts and the horizontal center of the window and moves downwards
in the morning, and upwards in the afternoon/evening. Reflecting 
the change from day to night, the background changes from white 
during the day to black during the night. Mirroring the cyclical
nature of time, the display of the text at its new positions is
temporary before the text returns to its original position at the 
center of the screen.
*/


void setup() {
  size(500, 750);
  smooth();
}


void draw() {
  // ----- initial configuration -----
  
  // create the font for the clock
  PFont font;
  font = loadFont("Haettenschweiler-72.vlw");
  textFont(font);
  
  // remap the values for the clock to the values of the window
  float s = map(second(), 0, 60, 0, height);  // seconds (60)
  float m = map(minute(), 0, 60, 0, height);  // minutes (60)
  float h = map(hour(), 0, 24, 0, height);    // hours   (24)
  
  
  // ----- backgrounds and fills ------
  
  // make the bg white in the day & black at night
  if (hour() >= 6 && hour() <= 18) {
    background(255);
  } else {
    background(0);
  }
  
  // make the fill black during the day & white in the night
  if (hour() >= 6 && hour() <= 18) {
    fill(0);
  } else {
    fill(255);
  }
  
  
  // ----- clock positioning ------
  
  // position the display of the clock
  // the C
  String C = "C";
    if (hour() >= 12) {
      text(C, width*.1, height*.5 - s/2);
    }
    if (hour() < 12) {
      text(C, width*.1, height*.5 + s/2);
    }
    textAlign(CENTER);
    
  // the L
  String L = "L";
    if (hour() >=12) {
      text(L, width*.3, height*.5 - s/2);
    }
    if (hour() < 12) {
      text(L, width*.3, height*.5 + s/2);
    }
    textAlign(CENTER);
  
  // the O
  String O = "O";
    if (hour() >= 12) {
      text(O, width*.5, height*.5 - m/2);
    }
    if (hour() < 12) {
      text(0, width*.5, height*.5 + m/2);
    }
    textAlign(CENTER);
  
  // the second C
  String J = "C";
    if (hour() >= 12) {
      text(J, width*.7, height*.5 - h/2);
    }
    if (hour() < 12) {
      text(J, width*.7, height*.5 + h/2);
    }
    textAlign(CENTER);
  
  // the K
  String K = "K";
    if (hour() >= 12) {
      text(K, width*.9, height*.5 - h/2);
    }
    if (hour() < 12) {
      text(K, width*.9, height*.5 + h/2);
    }
    textAlign(CENTER);
  
  // features to be added in the future:
  // print the new text position briefly according to the time.
  // display the text at the new position for a bit longer for
  // the minutes, and even longer for the hours.
  
} // close draw()

