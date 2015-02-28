

//----------------------------------------------------------
//     file:  PG_SkyboxViewer2.pde
//  version:  v1.0   2010-08-02   
//            v2.0   2011-06-05  added: 'n' load next skybox, 
//                                      F10 help, 
//                                      alternate key commands 
//                                      mouse wheel zooming 
//            v2.1   2011-06-07  calling skybox.drawCube();
//            v2.2   2011-11-25  corrected description 
//   author:  Ing. Gerd Platl   
//   tested:  with processing 1.5.1
//    needs:  OpenGL (do not work with P3D)
//     note:  at the moment it seems to work only offline
//  purpose:  interactive view of different skyboxes
//----------------------------------------------------------
/*
 * Demonstrates use of u/v coords in vertex() and effect on texture(). 
 * The textures get distorted using the P3D renderer, but looks great using OPENGL.
 * 
 * Please read a detailed description about how skyboxes works at Friedrich A.Lohmuellers page
 *   http://www.f-lohmueller.de/pov_tut/backgrnd/p_sky9.htm
 * There you can also find my standalone Skybox-Viewer for downloading.
 *
 * How to view skyboxes with this sketch:
 * - download a skybox examples (6 texture images) e.g. from
 *     http://www.f-lohmueller.de/pov_tut/skyboxer/skyboxer_3.htm 
 * - create subdirectory 'skyboxes' for this project
 * - copy texture images to the SkyboxViewer/skyboxes subdirectory 
 * - for using other skybox textures see naming conventions at 
 *     http://www.f-lohmueller.de/pov_tut/skyboxer/skyboxer_1.htm
 * - start this SkyboxViewer 
 * - and feel free to look around wherever you want...
 *
 *  mouse input:
 *      left mouse button   rotate skybox 
 *     right mouse button   zoom skybox
 *            mouse wheel   zoom skybox
 *
 *  key input:  
 *                   0 .. 9   select skybox 0..9 
 *             up/down, W/S   scroll up/down
 *   F1, left, A              auto scroll to left
 *   F2, right, D             auto scroll to right
 *                         Q  stop horizontal scrolling
 *   F3 / F4,          + / -  zoom in/out
 *   F5, blanc, return,    N  load next skybox
 *   F6, back, pageUp,     P  load previous skybox  
 *                         J  save "snapshoot.jpg"
 *   F7,                   V  set vertical angle = 0
 *                         H  set horizontal angle = 0
 *   F8,                   Z  zoom reset 
 *   F9,                   R  reset all
 *   F10,                  I  help on/off
 *                         C  senter window
 *                         L  Re-Load current skybox
 *                       Esc  quit             
 */
//----------------------------------------------------------

import processing.opengl.*;   // otherwise you get an error message!
//import javax.media.opengl.*; 
import java.awt.event.*;      // import for mouse wheel event handling 

boolean debugKeys = false;    // show key values
boolean showWindowed = true;  // false: start fullscreen
boolean showHelp = false;     // true: show command keys 
boolean loadSkybox = true;    // true: load skybox textures
int skyboxCount = 0;          // number of skyboxes 

skyboxViewer skybox = new skyboxViewer();

//----------------------------------------------------------
void setup() 
{
  if (showWindowed)
  { size(800, 600, OPENGL);
    //size(1024, 768, OPENGL);
    frame.setLocation(0, 0);
  }
  else              //  start fullscreen
  { size(screenWidth, screenHeight, OPENGL);  
    frame.setLocation(-3, -32);
  }  

  background(55,145,255);
  textSize(24);
  showText("loading skybox... (press F10 for Help)",12,30); 
  frameRate(60);

  println(">>> SkyboxViewer v2.2 <<<");
  skyboxCount = skybox.getSkyboxFileNames();
  loadSkybox = (skyboxCount > 0);
  println("HINT:  press [F10] to get help!");
  
  frame.addMouseWheelListener(new MouseWheelInput());   // add mouse wheel listener
}
//----------------------------------------------------------
void draw() 
{
  if (skyboxCount == 0)
  {
    String errorMsg = "Sorry, no skybox image files found at '"+skyboxesDir+"'";
    println(errorMsg);
    showText(errorMsg,22,66);
    noLoop();
    return;
  }

  if (loadSkybox)    // load next skybox ?
  { 
    skybox.loadCurrentSkybox();
    loadSkybox = false;
  }

  // println ("pic: " + frameCount);
  skybox.drawCube();
  
  if (showHelp)                          // F10: show help  
    showText("v2.0: a/d/q, w/s/v, h,l,p,r,z/r,s,+/-,<cursorKeys>,<esc>",12,30);  
}
//----------------------------------------------------------
// show 2d help information
//----------------------------------------------------------
void showText(String infoText, int x, int y) 
{
  perspective();
  fill(255);
  text(infoText, x,y);  
}
//----------------------------------------------------------
void centerWindow() 
{
  frame.setLocation((screenWidth - width) / 2
                   ,(screenHeight - height) / 2);
}

//=== event handling ===

//----------------------------------------------------------
// handle mouse input
//----------------------------------------------------------
void mouseDragged() 
{
  if (mouseButton == LEFT)
  { skybox.addRotationX ((pmouseY-mouseY) * 0.01);     // LEFT
    skybox.addRotationY ((mouseX-pmouseX) * 0.01);
  }
  else skybox.addViewAngle ((mouseY-pmouseY) * 0.005);  // RIGHT
  //println ("mouseDragged: " + mouseButton + "  x=" + rotx + "  y=" + roty + "  field of view: " + fov); 
}
//----------------------------------------------------------
// listen for MouseWheelEvent
//----------------------------------------------------------
class MouseWheelInput implements MouseWheelListener
{ void mouseWheelMoved(MouseWheelEvent e) 
  { skybox.multViewAngle (1.0 + 0.01 * e.getWheelRotation()); } 
}
//----------------------------------------------------------
// handle mouse button pressed
//----------------------------------------------------------
void mousePressed() 
{
  if (mousePressed && (mouseButton == CENTER)) 
    skybox.resetRotation();
}
//----------------------------------------------------------
// handle key input
//----------------------------------------------------------
void keyPressed() 
{ 
  if (debugKeys) print (keyCode + " '" + key + "'    ");
  if       (key     ==   'c')  centerWindow();                    // c: center window
  else if ((key     >=   '1') 
        && (key     <=   '9')) skybox.selectSkybox(keyCode-49);   // 1..9: select skybox
  else if ((key     ==   'r') 
        || (keyCode ==   120)) skybox.resetRotation();            // r, F9: reset all
  else if ((key     ==   'a')
        || (keyCode ==   112)                                     // a, F1
        || (keyCode ==  LEFT)) skybox.addRotationSpeed (-0.001);  // <- auto scroll to left 
  else if ((key     ==   'd')
        || (keyCode ==   113)                                     // d, F2
        || (keyCode == RIGHT)) skybox.addRotationSpeed (+0.001);  // -> auto scroll to right
  else if ((key     ==   'q')
        || (keyCode ==   127)) skybox.setRotationSpeed (0.0);   // Q: stop scrolling
  else if  (key     ==   'h')  skybox.setRotationY (0.0);       // H: set horizontal angle = 0 
  else if ((keyCode ==   118) 
        || (key     ==   'v')) skybox.setRotationX (0.0);       // F7, V: set vertical angle = 0 
  else if ((key     ==   'w') 
        || (keyCode ==    UP)) skybox.addRotationX (0.01);     // W: scroll up
  else if ((key     ==   's')
        || (keyCode ==  DOWN)) skybox.addRotationX (-0.01);    // S: scroll down
  else if ((keyCode ==   114)  
        || (key     ==   '+')) skybox.multViewAngle (1/1.01);  // F3, +  zoom in
  else if ((keyCode ==   115)                    
        || (key     ==   '-')) skybox.multViewAngle (1.01);  // F4, -  zoom out
  else if  (key     ==   'z')  skybox.setViewAngle(1.8);     // zoom reset
  else if ((keyCode ==   116)                                // F5
        || (keyCode ==    10)                                // return
        || (keyCode ==    32)                                // blanc
        || (keyCode ==    34)                                // pageDown
        || (key     ==   'n')) skybox.loadNextSkybox();      // N:  load next skybox
  else if  (key     ==   'l')  skybox.loadCurrentSkybox();   // L:  re-load skybox
  else if ((keyCode ==   117)                                // F6, 
        || (keyCode ==     8)                                // backSpace
        || (keyCode ==    33)                                // pageUp
        || (key     ==   'p')) skybox.loadPreviousSkybox();  // P:
  else if  (key     ==   'j')  save ("snapshoot.jpg");  // save current view as JPeg picture
  else if ((key     ==   'i')
        || (keyCode ==   121)) showHelp = !showHelp;    // F10,  I: toggle help text
  else if  (keyCode ==    27);                          // ESC
  else println ("unhandled key input");      
}


