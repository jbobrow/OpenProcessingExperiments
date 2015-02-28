


/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/15259*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Frank Lloyd Wright Prairie House Plan Generator

// A sketch to test how to code for shape grammar, 
// using relational rules for locating fireplace, living room, service zone and ground floor 'extensions', simplified 
// from Koning, H, & Elizenberg, J, 'The language of the prairie: Frank Lloyd Wright's prairie houses' (1981)
// Note that proportions are not accurate

/*
Frank Lloyd Wright Prairie House Plan Generator
 
 A sketch to test how to code for shape grammar, using relational rules for locating fireplace (black), 
 living room (white), service zone (grey) and ground floor 'extensions' (red and blue) simplified from 
 Koning, H, & Elizenberg, J, 'The language of the prairie: Frank Lloyd Wright's prairie houses' (1981). 
 Note that proportions are not accurate!
 
 */

// key press 'n': generate new plan
// key press 'f': show floor plan


// import processing.opengl.*;

/** PeasyCam **/
import peasy.*;

// Camera
PeasyCam cam;

// these are the shapes / rooms / boxes 
ArrayList <ShapeClass> shapes;

// how high chimny / fire
int fire_height= 108;
// grass
final color lightGreen = color (2, 190, 2, 30 ) ;

// Show Floor Plan on / off
boolean booleanShowFloorPlan = false; 

void setup() {
  size (600, 600, P3D);
  cam = new PeasyCam(this, 1440);
  // Create an empty ArrayList
  shapes = new ArrayList();
  // put a house in 
  initNewHouse() ;
}

void draw() {
  background(255);
  drawHouse();
}

void keyPressed () {
  if (key=='n') {
    initNewHouse() ;
  } // if 
  else if (key=='f') {  
    booleanShowFloorPlan = !booleanShowFloorPlan;
  } // if
}

// ==============================================================


void initNewHouse() {

  // empty the rooms list
  shapes.clear();

  // insert a shape in it: Terrain / grass
  shapes.add(new ShapeClass(  30, 30, 630, 630, 2, lightGreen ) ) ;

  // - - - - orient fire place - - /

  float fire_x = 300;
  float fire_y = 300;
  float fire_w = 20;
  float fire_l = fire_w*2;

  float fire_w_draw;
  float fire_l_draw;

  int fire_var = int(random(2));
  println("fire var = " + fire_var);

  // orient fire place N-S
  if (fire_var == 0) { 
    fire_w_draw = fire_w;
    fire_l_draw = fire_l;
  } 
  // orient fire place E-W
  else { 
    fire_w_draw = fire_l;
    fire_l_draw = fire_w;
  }

  //fill(0);
  //stroke(0);
  //saveRect3D(fire_x, fire_y, fire_w_draw, fire_l_draw, fire_height, 0);

  // - - - - add living room  - - /

  float live_w = 90;
  float live_l = live_w/3*4;

  float live_x;
  float live_y;
  float live_w_draw;
  float live_l_draw;

  int live_var = int(random(2));
  println("live var = " + live_var);

  // if fire place oriented N-S
  if (fire_var == 0) {
    // add living room on E
    if (live_var == 0) {
      live_w_draw = live_l;
    }
    // add living room on W
    else {
      live_w_draw = -live_l;
    }     
    live_l_draw = live_w;
    live_x = fire_x + 0.5*fire_w;
    live_y = fire_y - 0.5*live_w + 0.5*fire_l;
  }
  // if fire place oriented E-W 
  else {
    // add living room on N
    live_w_draw = live_w;
    if (live_var == 0) {
      live_l_draw = live_l;
    } 
    // add living room on S
    else {
      live_l_draw = -live_l;
    }
    live_x = fire_x - 0.5*live_w + 0.5*fire_l;
    live_y = fire_y + 0.5*fire_w;
  }

  float live_height= random (70, 78);
  stroke(0);
  noFill();
  saveRect3D(live_x, live_y, live_w_draw, live_l_draw, live_height, 255);

  // - - - - add service zone to complete core  - - /

  float serve_w = live_w;
  float serve_l = live_l;

  float serve_x;
  float serve_y;
  float serve_w_draw = live_w_draw;
  float serve_l_draw = live_l_draw;

  int serve_var = int(random(3));
  println("serve var = " + serve_var);

  // add service zone on other side of fire place 
  if (serve_var == 0) {
    // if fire place oriented N-S, that is on the E or W 
    if (fire_var == 0) {
      serve_y = live_y;
      serve_x = live_x - live_w_draw;
    }
    // if fire place oriented E-W, that is on the N or S  
    else {
      serve_y = live_y - serve_l_draw;
      serve_x = live_x;
    }
  }
  // add service zone adjacent to living room, on RIGHT when facing fire place 
  else if (serve_var == 1) {
    // if fire place oriented N-S, that is on the N or S
    if (fire_var == 0) {
      if (live_var == 0) {
        serve_y = live_y - serve_l_draw;
      } 
      else {
        serve_y = live_y + serve_l_draw;
      }
      serve_x = live_x;
    } 
    // if fire place oriented E-W, that is on the E or W
    else {
      serve_y = live_y;
      if (live_var == 0) {
        serve_x = live_x + live_w_draw;
      } 
      else {
        serve_x = live_x - live_w_draw;
      }
    }
  }
  // add service zone adjacent to living room, on LEFT when facing fire place 
  else {
    // if fire place oriented N-S, that is on the N or S
    if (fire_var == 0) {
      if (live_var == 0) {
        serve_y = live_y + serve_l_draw;
      } 
      else {
        serve_y = live_y - serve_l_draw;
      }
      serve_x = live_x;
    } 
    // if fire place oriented E-W, that is on the E or W
    else {
      serve_y = live_y;
      if (live_var == 0) {
        serve_x = live_x - live_w_draw;
      } 
      else {
        serve_x = live_x + live_w_draw;
      }
    }
  }

  float serve_height = random (70, 78);
  fill(150);
  stroke(0);
  saveRect3D(serve_x, serve_y, serve_w_draw, serve_l_draw, serve_height, 150);

  // - - - - add extension to first long side (E or S)  - - /

  float ext_w = live_l/3*2;
  // with one of two potential lengths
  int ext_l_var = int(random(1, 3));
  float ext_l = live_l/3 + live_l/3*ext_l_var;

  float ext_x;
  float ext_y;
  float ext_w_draw;
  float ext_l_draw;

  int ext_pos_var = int(random(3));
  println("ext_pos var = " + ext_pos_var);

  // add extension in MIDDLE
  if (ext_pos_var == 0) {
    // if fire place oriented N-S
    if (fire_var == 0) {
      // if service zone on other side of fire place, add on S
      if (serve_var == 0) {
        ext_x = fire_x + 0.5*fire_w - 0.5*ext_w;
        ext_y = fire_y + 0.5*fire_l + 0.5*live_w;
        ext_w_draw = ext_w;
        ext_l_draw = ext_l;
        // if service zone adjacent to living room, add on E
      } 
      else {
        ext_x = fire_x + 0.5*fire_w;  
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext_w;
          } 
          else {
            ext_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext_w;
          } 
          else {
            ext_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext_w;
          }
        }
        if (live_var == 0) {
          ext_w_draw = -ext_l;
        } 
        else {
          ext_w_draw = ext_l;
        }
        ext_l_draw = ext_w;
      }
      // if fire place oriented E-W
    } 
    else {
      // if service zone on other side of fire place, add on E
      if (serve_var == 0) {
        ext_x = fire_x + 0.5*fire_l + 0.5*live_w;
        ext_y = fire_y + 0.5*fire_w - 0.5*ext_w;
        ext_w_draw = ext_l;
        ext_l_draw = ext_w;
        // if service zone adjacent to living room, add on S
      } 
      else {
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext_w;
          } 
          else {
            ext_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext_w;
          } 
          else {
            ext_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext_w;
          }
        }
        ext_y = fire_y + 0.5*fire_w;
        ext_w_draw = ext_w;
        if (live_var == 0) {
          ext_l_draw = -ext_l;
        } 
        else {
          ext_l_draw = ext_l;
        }
      }
    }
    // add extension on S or W or on LEFT
  } 
  else if (ext_pos_var == 1) {
    // if fire place oriented N-S
    if (fire_var == 0) {
      // if service zone on other side of fire place, add on S
      if (serve_var == 0) {
        ext_x = fire_x + 0.5*fire_w - 0.5*ext_w - 0.5*live_l;
        ext_y = fire_y + 0.5*fire_l + 0.5*live_w;
        ext_w_draw = ext_w;
        ext_l_draw = ext_l;
        // if service zone adjacent to living room, add on E
      } 
      else {
        ext_x = fire_x + 0.5*fire_w;  
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext_w + 0.5*live_w;
          } 
          else {
            ext_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext_w + 0.5*live_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext_w + 0.5*live_w;
          } 
          else {
            ext_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext_w + 0.5*live_w;
          }
        }
        if (live_var == 0) {
          ext_w_draw = -ext_l;
        } 
        else {
          ext_w_draw = ext_l;
        }
        ext_l_draw = ext_w;
      }
      // if fire place oriented E-W
    } 
    else {
      // if service zone on other side of fire place, add on E
      if (serve_var == 0) {
        ext_x = fire_x + 0.5*fire_l + 0.5*live_w;
        ext_y = fire_y + 0.5*fire_w - 0.5*ext_w + 0.5*live_l;
        ext_w_draw = ext_l;
        ext_l_draw = ext_w;
        // if service zone adjacent to living room, add on S
      } 
      else {
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext_w - 0.5*live_w;
          } 
          else {
            ext_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext_w - 0.5*live_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext_w - 0.5*live_w;
          } 
          else {
            ext_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext_w - 0.5*live_w;
          }
        }
        ext_y = fire_y + 0.5*fire_w;
        ext_w_draw = ext_w;
        if (live_var == 0) {
          ext_l_draw = -ext_l;
        } 
        else {
          ext_l_draw = ext_l;
        }
      }
    }
    // add extension on N or E or on RIGHT
  } 
  else {
    // if fire place oriented N-S
    if (fire_var == 0) {
      // if service zone on other side of fire place, add on S
      if (serve_var == 0) {
        ext_x = fire_x + 0.5*fire_w - 0.5*ext_w + 0.5*live_l;
        ext_y = fire_y + 0.5*fire_l + 0.5*live_w;
        ext_w_draw = ext_w;
        ext_l_draw = ext_l;
        // if service zone adjacent to living room, add on E
      } 
      else {
        ext_x = fire_x + 0.5*fire_w;  
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext_w - 0.5*live_w;
          } 
          else {
            ext_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext_w - 0.5*live_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext_w - 0.5*live_w;
          } 
          else {
            ext_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext_w - 0.5*live_w;
          }
        }
        if (live_var == 0) {
          ext_w_draw = -ext_l;
        } 
        else {
          ext_w_draw = ext_l;
        }
        ext_l_draw = ext_w;
      }
      // if fire place oriented E-W
    } 
    else {
      // if service zone on other side of fire place, add on E
      if (serve_var == 0) {
        ext_x = fire_x + 0.5*fire_l + 0.5*live_w;
        ext_y = fire_y + 0.5*fire_w - 0.5*ext_w - 0.5*live_l;
        ext_w_draw = ext_l;
        ext_l_draw = ext_w;
        // if service zone adjacent to living room, add on S
      } 
      else {
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext_w + 0.5*live_w;
          } 
          else {
            ext_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext_w + 0.5*live_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext_w + 0.5*live_w;
          } 
          else {
            ext_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext_w + 0.5*live_w;
          }
        }
        ext_y = fire_y + 0.5*fire_w;
        ext_w_draw = ext_w;
        if (live_var == 0) {
          ext_l_draw = -ext_l;
        } 
        else {
          ext_l_draw = ext_l;
        }
      }
    }
  }

  float ext_height=random (70, 78);
  fill(255, 0, 0);
  stroke(0);
  saveRect3D(ext_x, ext_y, ext_w_draw, ext_l_draw, ext_height, color(255, 0, 0));




  // - - - - add extension to second long side (W or N)  - - /

  float ext2_w = live_l/3*2;
  // with one of two potential lengths
  int ext2_l_var = int(random(1, 3));
  float ext2_l = live_l/3 + live_l/3*ext2_l_var;

  float ext2_x;
  float ext2_y;
  float ext2_w_draw;
  float ext2_l_draw;

  int ext2_pos_var = int(random(3));
  println("ext_pos var = " + ext_pos_var);

  // add extension in MIDDLE
  if (ext2_pos_var == 0) {  

    // if fire place oriented N-S
    if (fire_var == 0) {
      // if service zone on other side of fire place, add on N
      if (serve_var == 0) {
        ext2_x = fire_x + 0.5*fire_w - 0.5*ext2_w;
        ext2_y = fire_y + 0.5*fire_l - 0.5*live_w;
        ext2_w_draw = ext2_w;
        ext2_l_draw = -ext2_l;
        // if service zone adjacent to living room, add on W
      } 
      else {

        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext2_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w;
          } 
          else {
            ext2_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext2_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w;
          } 
          else {
            ext2_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w;
          }
        }
        if (live_var == 0) {
          ext2_x = fire_x + 0.5*fire_w + live_l;
          ext2_w_draw = ext2_l;
        } 
        else {
          ext2_x = fire_x + 0.5*fire_w - live_l; 
          ext2_w_draw = -ext2_l;
        }
        ext2_l_draw = ext2_w;
      }
      // if fire place oriented E-W
    } 
    else {
      // if service zone on other side of fire place, add on W
      if (serve_var == 0) {
        ext2_x = fire_x + 0.5*fire_l - 0.5*live_w;
        ext2_y = fire_y + 0.5*fire_w - 0.5*ext2_w;
        ext2_w_draw = -ext2_l;
        ext2_l_draw = ext2_w;
        // if service zone adjacent to living room, add on N
      } 
      else {
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext2_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w;
          } 
          else {
            ext2_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext2_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w;
          } 
          else {
            ext2_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w;
          }
        }
        ext2_w_draw = ext2_w;
        if (live_var == 0) {
          ext2_y = fire_y + 0.5*fire_w + live_l;
          ext2_l_draw = ext2_l;
        } 
        else {
          ext2_y = fire_y + 0.5*fire_w - live_l;
          ext2_l_draw = -ext2_l;
        }
      }
    }     

    // add extension on S or W or on LEFT
  } 
  else if (ext2_pos_var == 1) {

    // if fire place oriented N-S
    if (fire_var == 0) {
      // if service zone on other side of fire place, add on N
      if (serve_var == 0) {
        ext2_x = fire_x + 0.5*fire_w - 0.5*ext2_w - 0.5*live_l;
        ext2_y = fire_y + 0.5*fire_l - 0.5*live_w;
        ext2_w_draw = ext2_w;
        ext2_l_draw = -ext2_l;
        // if service zone adjacent to living room, add on W
      } 
      else { 
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext2_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w + 0.5*live_w;
          } 
          else {
            ext2_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w + 0.5*live_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext2_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w + 0.5*live_w;
          } 
          else {
            ext2_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w + 0.5*live_w;
          }
        }
        if (live_var == 0) {
          ext2_w_draw = ext2_l;
          ext2_x = fire_x + 0.5*fire_w + live_l;
        } 
        else {
          ext2_w_draw = -ext2_l;
          ext2_x = fire_x + 0.5*fire_w - live_l;
        }
        ext2_l_draw = ext2_w;
      }
      // if fire place oriented E-W
    } 
    else {
      // if service zone on other side of fire place, add on W
      if (serve_var == 0) {
        ext2_x = fire_x + 0.5*fire_l - 0.5*live_w;
        ext2_y = fire_y + 0.5*fire_w - 0.5*ext2_w + 0.5*live_l;
        ext2_w_draw = -ext2_l;
        ext2_l_draw = ext2_w;
        // if service zone adjacent to living room, add on N
      } 
      else {
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext2_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w - 0.5*live_w;
          } 
          else {
            ext2_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w - 0.5*live_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext2_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w - 0.5*live_w;
          } 
          else {
            ext2_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w - 0.5*live_w;
          }
        }
        ext2_w_draw = ext2_w;
        if (live_var == 0) {
          ext2_y = fire_y + 0.5*fire_w + live_l;
          ext2_l_draw = ext2_l;
        } 
        else {
          ext2_y = fire_y + 0.5*fire_w - live_l;
          ext2_l_draw = -ext2_l;
        }
      }
    }

    // add extension on N or E or on RIGHT
  } 
  else {

    // if fire place oriented N-S
    if (fire_var == 0) {
      // if service zone on other side of fire place, add on N
      if (serve_var == 0) {
        ext2_x = fire_x + 0.5*fire_w - 0.5*ext2_w + 0.5*live_l;
        ext2_y = fire_y + 0.5*fire_l - 0.5*live_w;
        ext2_w_draw = ext2_w;
        ext2_l_draw = -ext2_l;
        // if service zone adjacent to living room, add on W
      } 
      else {  
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext2_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w - 0.5*live_w;
          } 
          else {
            ext2_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w - 0.5*live_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext2_y = fire_y + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w - 0.5*live_w;
          } 
          else {
            ext2_y = fire_y + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w - 0.5*live_w;
          }
        }
        if (live_var == 0) {
          ext2_x = fire_x + 0.5*fire_w + live_l;
          ext2_w_draw = ext2_l;
        } 
        else {
          ext2_x = fire_x + 0.5*fire_w - live_l;
          ext2_w_draw = -ext2_l;
        }
        ext2_l_draw = ext2_w;
      }
      // if fire place oriented E-W
    } 
    else {
      // if service zone on other side of fire place, add on W
      if (serve_var == 0) {
        ext2_x = fire_x + 0.5*fire_l - 0.5*live_w;
        ext2_y = fire_y + 0.5*fire_w - 0.5*ext2_w - 0.5*live_l;
        ext2_w_draw = -ext2_l;
        ext2_l_draw = ext2_w;
        // if service zone adjacent to living room, add on N
      } 
      else {
        // if service zone on RIGHT when facing fire place
        if (serve_var == 1) {
          if (live_var == 0) {
            ext2_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w + 0.5*live_w;
          } 
          else {
            ext2_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w + 0.5*live_w;
          }
          // if service zone on LEFT when facing fire place
        } 
        else {
          if (live_var == 0) {
            ext2_x = fire_x + 0.5*fire_l - 0.5*live_w - 0.5*ext2_w + 0.5*live_w;
          } 
          else {
            ext2_x = fire_x + 0.5*fire_l + 0.5*live_w - 0.5*ext2_w + 0.5*live_w;
          }
        }
        ext2_w_draw = ext2_w;
        if (live_var == 0) {
          ext2_y = fire_y + 0.5*fire_w + live_l;
          ext2_l_draw = ext2_l;
        } 
        else {
          ext2_y = fire_y + 0.5*fire_w - live_l;
          ext2_l_draw = -ext2_l;
        }
      }
    }
  }

  float ext2_height=random (70, 78);
  fill(0, 0, 255);
  stroke(0);
  saveRect3D(ext2_x, ext2_y, ext2_w_draw, ext2_l_draw, ext2_height, color(0, 0, 255));

  // - - - - draw fire place (so on top)  - - /

  saveRect3D(fire_x, fire_y, fire_w_draw, fire_l_draw, fire_height, color(0) );
  /*
  fill(0);
   stroke(0);
   saveRect3D(fire_x, fire_y, fire_w_draw, fire_l_draw, fire_height, 0);
   */
}
//
// ==========================================================

void saveRect3D ( float x1, float y1, float width1, float height1Depth, float heightUp, color fillColor ) {
  // insert a shape in shapes
  shapes.add(new ShapeClass(  
  x1, y1, 
  width1, height1Depth, heightUp, 
  fillColor ));
}

void drawHouse() {
  // loop over shapes / rooms 
  noStroke();
  for (ShapeClass currentShape : shapes) {
    currentShape.display();
  }
}
// -----------------------------------------------------------------------------------
// Simple shape class

class ShapeClass {

  // its name 
  // String shapeName = "";
  // id 
  // int id;
  // data
  float x1; 
  float y1; 
  float width1; 
  float height1Depth; 
  float heightUp; 
  color fillColor;

  // constructor
  ShapeClass ( float _x1, float _y1, float _width1, 
  float _height1Depth, float _heightUp, color _fillColor ) {
    x1           =_x1;
    y1           =_y1;
    width1       =_width1;
    height1Depth =_height1Depth;
    heightUp     =_heightUp ;
    fillColor    =_fillColor;
    // create name 
    // shapeName = "shapeName"+currentShapeNo;
    // give id 
    // id = currentShapeNo;
  }  // constructor
  //

  void display() {
    pushMatrix();
    translate(-300, -300);
    // show room 
    showRoomViaBoxes ();
    // show room
    showRoomViaShapes ();
    // show the floor plan on the ground -----------------
    if (booleanShowFloorPlan) {
      if (fillColor!=lightGreen) {
        showFloorPlan ();
      } // if
    } // if
    popMatrix();
  } // method

  void showRoomViaBoxes () {
    // doesn't work right 
    /*
    pushMatrix();
     translate (x1-(width1/2), 420-(heightUp/2), y1-(height1Depth/2));
     fill(fillColor);
     if (!keyPressed) {
     box(width1, heightUp, height1Depth);
     }
     popMatrix();
     */
  } // method

  void showRoomViaShapes () {

    // draw room via shape  ---------------------------------------

    fill(fillColor);    
    beginShape();
    vertex(x1, 420, y1); // Start
    vertex(x1, 420, y1+height1Depth); // back
    vertex(x1, 420-heightUp, y1+height1Depth); // towards ceiling  
    vertex(x1, 420-heightUp, y1);    // front  
    vertex(x1, 420, y1);    
    endShape();

    beginShape();
    vertex(x1, 420, y1); // Start
    vertex(x1, 420-heightUp, y1); // towards ceiling  
    vertex(x1+width1, 420-heightUp, y1); 
    vertex(x1+width1, 420, y1);          // go down 
    vertex(x1, 420, y1); 
    endShape();

    beginShape();
    vertex(x1, 420, y1+height1Depth); // Start
    vertex(x1, 420-heightUp, y1+height1Depth); // towards ceiling  
    vertex(x1+width1, 420-heightUp, y1+height1Depth); // 
    vertex(x1+width1, 420, y1+height1Depth); // go down 
    vertex(x1, 420, y1+height1Depth);                 
    endShape();    

    // 
    beginShape();
    vertex(x1+width1, 420, y1); // Start
    vertex(x1+width1, 420, y1+height1Depth); // back
    vertex(x1+width1, 420-heightUp, y1+height1Depth); // towards ceiling 
    vertex(x1+width1, 420-heightUp, y1);    // front 
    vertex(x1+width1, 420, y1);    
    endShape();

    beginShape(); // floor
    vertex(x1, 420, y1); // Start
    vertex(x1, 420, y1+height1Depth); // back
    vertex(x1+width1, 420, y1+height1Depth); // 
    vertex(x1+width1, 420, y1);    // front 
    endShape();

    beginShape(); // ceiling
    vertex(x1, 420-heightUp, y1); // Start
    vertex(x1, 420-heightUp, y1+height1Depth); // 
    vertex(x1+width1, 420-heightUp, y1+height1Depth); // 
    vertex(x1+width1, 420-heightUp, y1);    // 
    endShape();
  } // method 

  void showFloorPlan () {
    // show the floor plan on the ground -----------------
    stroke(0);
    fill(fillColor);
    final int offsetX=-500;
    beginShape(); // 
    vertex(x1+offsetX, 420, y1); // Start
    vertex(x1+offsetX, 420, y1+height1Depth); // 
    vertex(x1+offsetX+width1, 420, y1+height1Depth); // 
    vertex(x1+offsetX+width1, 420, y1);    //  
    endShape();
  } // method
} // class


