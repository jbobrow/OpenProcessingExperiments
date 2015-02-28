
/* litmus3_cover
   Version: 1.0, 2012-06-15
   
   Code to generate the cover image for Litmus Paper issue 3, 15 June 2012
   
   Written by Phillip Kent for Litmus Paper at the Cheltenham Science Festival
   
   http://design-science.org.uk/litmus-paper/
   http://www.openprocessing.org/collection/1676

   Acknowledgements:
   Code to display text is borrowed from ASCII-fication by James Hobin 
   [http://www.openprocessing.org/sketch/6702]
   
   PRESS ANY KEY TO CHANGE THE TEXT DISPLAYED AROUND THE 'FIGURE'
*/

//Uncomment next line to get PDF output
//import processing.pdf.*;

String[] lines;
String replacestring1,replacestring2;
boolean outputLeonardo;
PFont f;
int char_w; //# characters wide
int char_h; //# characters high
int pt = 10;
int startPoint;
int replacecount;

void setup() {
  //Use next line to make PDF output and comment out the other size(...)
  //size(700, 680, PDF, "vitruvianman.pdf");
  size(700,680);
  background(255);
  f = loadFont("f.vlw");
  
  char_w = width/pt;
  char_h = height/pt;
  
  outputLeonardo=false;
  startPoint = 0;
  replacestring1 = "01";
  replacestring2=join(loadStrings("leonardo-extract-string.txt")," ");
  lines = loadStrings("vitruvian-ascii-hollow.txt");
}

void draw() {
   String[] newlines={};
   
   if (startPoint< replacestring2.length()) { startPoint++; }
  
   if (outputLeonardo) {
     replacecount = startPoint;
     for (int i=0; i< lines.length; i++) {
        char[] thisline = lines[i].toCharArray(); 
        for (int j=0; j < thisline.length; j++) {
          if (thisline[j] == 'Q' ) {   // if this character is Q, replace it
            thisline[j] = replacestring2.charAt(replacecount%replacestring2.length()); 
          replacecount++;
          }
        }
     newlines = append(newlines,String.valueOf(thisline));
     }
      
   } else {
     for (int i=0; i< lines.length; i++) {
       char[] thisline = lines[i].toCharArray(); 
       for (int j=0; j < thisline.length; j++) {
        if (thisline[j] == 'Q' ) {   // if this character is Q, replace it
          int b = int(random(replacestring1.length())); // random integer
          thisline[j] = replacestring1.charAt(b);
        }
     }
    newlines = append(newlines,String.valueOf(thisline)); 
    }
   }
  
  //Next line will give purple background
  //fill(128,60,128);
  fill(255);
  rectMode(CORNERS);
  rect(0,0,width, height);
  fill(162,102,158);
  for(int i = 0; i < char_w; i++) {
    for(int j = 0; j < char_h; j++) {
      text(newlines[j].charAt(i), ((i)*width/char_w), (j+1)*height/char_h);
    }
  }
  
  //If you want PDF output, uncomment the next line
  //exit();  
  
  delay(500);
}

void keyPressed() {
   outputLeonardo = !outputLeonardo;
}
 

  



