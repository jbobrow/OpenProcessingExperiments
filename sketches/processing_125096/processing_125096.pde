
// Import Minim library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


// Global variable declarations
// Set up the array list of circles
ArrayList circles = new ArrayList();

// Set up the color for small ellipses
color[] dot = {#42EBF5, #3ADCE0, #37C3CC, #2E9199, #92F9FF};

// Set up the color for each musical note
color[] cKey = {#0A7B83, #2AA876, #FFD265, #F19C65, #CE4D45};
color[] dKey = {#592643, #C24C39, #E0C785, #005055, #292959};
color[] eKey = {#D80056, #FE6A37, #FAD63E, #079D8F, #65B147};
color[] fKey = {#2B405C, #A9C9CB, #FFF2BE, #F38A69, #F9F6EF};
color[] gKey = {#F32D33, #127185, #FAE5B8, #282D30, #7BA390};
color[] aKey = {#1B4175, #C9B291, #F09F30, #00686E, #8C0C24};
color[] bKey = {#3C3658, #3EC8B7, #7CD0B4, #B9D8B1, #F7E0AE};
color[] csKey = {#F45571, #46BEB2, #B9D7BD, #F3F2DE, #F49A99};
color[] dsKey = {#3C3658, #6B616E, #9A8B83, #C8B699, #F7E0AE};
color[] fsKey = {#A3D7C1, #98BCAE, #F3E4C7, #D7CEC7, #F4F3F1};
color[] gsKey = {#2E0145, #CF0452, #EE4348, #EA6146, #E68044};
color[] asKey = {#003157, #005395, #6093BF, #F2B705, #F28705};

// Set the radius and alpha
float radius = 15;

// Create an instance of mimim
Minim minim;

//  Create audio sample of each note
AudioSample cNote;
AudioSample dNote;
AudioSample eNote;
AudioSample fNote;
AudioSample gNote;
AudioSample aNote;
AudioSample bNote;
AudioSample csNote;
AudioSample dsNote;
AudioSample fsNote;
AudioSample gsNote;
AudioSample asNote;

// Create ambient sound
AudioPlayer ambient;

// Create image
PImage bokeh;



void setup()
{
  // Set screen resolution
  size(1024, 720);
  smooth();
  
  // Remove cursor
  noCursor();
  
  // Load image
  bokeh = loadImage("final_project_background_png.png");
  
  // Create an instance of minim
  minim = new Minim(this);
  
  // Load notes sound
  cNote = minim.loadSample("c_note.mp3");
  dNote = minim.loadSample("d_note.mp3");
  eNote = minim.loadSample("e_note.mp3");
  fNote = minim.loadSample("f_note.mp3");
  gNote = minim.loadSample("g_note.mp3");
  aNote = minim.loadSample("a_note.mp3");
  bNote = minim.loadSample("b_note.mp3");
  csNote = minim.loadSample("c#_note.mp3");
  dsNote = minim.loadSample("d#_note.mp3");
  fsNote = minim.loadSample("f#_note.mp3");
  gsNote = minim.loadSample("g#_note.mp3");
  asNote = minim.loadSample("a#_note.mp3");
  
  // Load and play ambient sound
  ambient = minim.loadFile("crystal_ambient.mp3");
  ambient.play();
}

void draw()
{
   // Draw image as background  
   background(bokeh);
   
   // Add circles to array
   for (int i = 0; i < circles.size(); i++)
   {
        FadingCircle fc = (FadingCircle) circles.get(i);
        fc.run();
   } 
   strokeWeight(2);
}


// Create FadingCircle class for fading out circles
class FadingCircle
{
  int x,y;
  int transparency;
  color c;
  float r;
  
  FadingCircle(int x, int y, color c, float r)
  {
     this.x = x;
     this.y = y;
     this.c = c;
     this.r = r;
     transparency = 255;
  }
  
  void run()
  {
     if (transparency <= 10)
     {
         transparency = 0;  
     }
     else
     {
         transparency -= 10;
     } 
    fill(#81CDF5, transparency - 235);
    strokeWeight(3);
    stroke(this.c,transparency);
    ellipse(x, y, this.r, this.r);    
  }
}


// Draw smaller circles on mouse move
void mouseMoved()
{
    ellipse(mouseX, mouseY, radius + 20, radius + 20);
    fill(#A7E1FF, 40);
    stroke(dot[int(random(0, 4))], 80);
}


// Draw circles with corresponding sound on key press
void keyPressed()
{
    // Press g or h to play C note
    if (key == 'g' || key == 'G' || key == 'h' || key == 'H')
    {
       cNote.trigger();
       while (radius <= 130)
       {
       float rand = random(1, 4);
       circles.add(new FadingCircle(mouseX, mouseY, cKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    
    // Press g or h to play D note
    if (key == 'f' || key == 'j' || key == 'F' || key == 'J')
    {
       dNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, dKey[int(rand)], radius));
       radius += 30;
       
       } 
       radius = 15;
    }
    
    // Press d or k to play E note
    if (key == 'd' || key == 'D' || key == 'k' || key == 'K')
    {
       eNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, eKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    
    // Press s or l to play F note
    if (key == 's' || key == 'S' || key == 'l' || key == 'L')
    {
       fNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, fKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    
    // Press a or ; to play G note
    if (key == 'a' || key == 'A' || key == ';' || key == ':')
    {
       gNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, gKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    
    // Press q or p to play A note
    if (key == 'q' || key == 'Q' || key == 'p' || key == 'P')
    {
       aNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, aKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    
    // Press w or o to play B note
    if (key == 'w' || key == 'W' || key == 'o' || key == 'O')
    {
       bNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, bKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    
    // Press t or y to play C# note
    if (key == 't' || key == 'T' || key == 'y' || key == 'Y')
    {
       csNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, csKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    
    // Press r or u to play D# note
    if (key == 'r' || key == 'R' || key == 'u' || key == 'U')
    {
       dsNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, dsKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    
    // Press e or i to play F# note
    if (key == 'e' || key == 'E' || key == 'i' || key == 'I')
    {
       fsNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, fsKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    
    // Press v or b to play G# note
    if (key == 'v' || key == 'V' || key == 'b' || key == 'B')
    {
       gsNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, gsKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    
    // Press c or n to play A# note
    if (key == 'c' || key == 'C' || key == 'n' || key == 'N')
    {
       asNote.trigger();
       while (radius <= 130)
       {
       float rand = random(0, 4);
       circles.add(new FadingCircle(mouseX, mouseY, asKey[int(rand)], radius));
       radius += 30;
       } 
       radius = 15;
    }
    

} 

