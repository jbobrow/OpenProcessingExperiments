

//Imported 'minim.js' library file
import ddf.minim.*;

//Declared global variables
PImage Project3;
Minim minim;
AudioSample Audiofile1;

//Created image size and loaded image file and audio file 
void setup() {
  size(1200, 799);
  Project3 = loadImage("Project3.jpg");
  minim = new Minim(this);
  Audiofile1 = minim.loadSample("Audiofile1.mp3");
 
  
 }

//Draw code block to reduce the image
void draw() {
 image(Project3, 0, 0, 1200, 700);


//Created title of each image as a string  
   
 String a = "A 20 Object Sketch";
 String v = "(Week 2, Assignment 1)";
 String c = "A Dynamic Sketch";
 String d = "(Week 3, Assignment 2)";
 String e = "An Interactive Sketch";
 String f = "(Week 4, Assignment 3)";
 String g = "Setting up a document";
 String h = "(Week 5, Assignment 4)";
 String i = "Optimize a Black & White Image";
 String j = "(Week 6, Assignment 5)";
 String k = "Image & Text";
 String l = "(Week 8, Assignment 7)";
 String m = "(Project 1)";
 String x = "A 5-7 Minute Presentation";
 String o = "w/Multimedia Elements";
 String r = "Color Image Optimization &";
 String s = "Collage (Week 7, Assignment 6)";
 String t = "Bohemian Rhapsody Score";
 String u = "(Week 12, Assignment 10)";
 if (mousePressed && (mouseButton == RIGHT)) {
   background(255);
String w = "To enter 'instructions file' click and HOLD the right mouse button on the image at any time.  Release to exit.";
String y = "Click and HOLD the left mouse button on the image to view titles.";
String z = "Once you have clicked on the image, press the '1' key to print 'sample triggered' within processing.";
String q = "Press the '2' key to run the audio with voice-over and music.";
String p = "Thanks for your time, hope you enjoy.";
String n = "Wishing you a happy Holiday and a healthy and successful New Year.";

fill(#13761E);
 text (w, 100, 100);
fill(#13761E);
 text (y, 100, 200);
fill(#13761E);
 text (z, 100, 300);
fill(#13761E);
 text (q, 100, 400);
fill(#13761E);
 text (p, 100, 500);
fill(#13761E);
 text (n, 100, 600);
          
}


 textSize(20);//text size added for the image titles
 if (mousePressed && (mouseButton == LEFT))
 {//click and HOLD the left mouse button
 //to reveal the assignment details
//alongside each image

 
 //Added colour and positioning
//for each image title
 
 fill(#13761E);
 text (a, 220, 050);
 text (v, 220, 070);
 fill(#FA7814);
 text (c, 460, 270);
 text (d, 460, 290); 
 fill(#763907);
 text (e, 790, 400);
 text (f, 790, 420);
 fill(#0F0802);
 text (g, 790, 135);
 text (h, 790, 155);
 fill(#050200);
 text (i, 890, 635);
 text (j, 890, 655);
 fill(#FCB352);
 text (k, 480, 635);
 text (l, 480, 655);
 fill(#87D0E3);
 text (m, 735, 025);
 fill(#91A1F0);
 text (x, 245, 400);
 text (o, 245, 420);
 fill(#FF4D4D);
 text (r, 890, 250);
 text (s, 890, 270);
 fill(#337122);
 text (t, 275, 480);
 text (u, 275, 500);
 
 
 }
}

//Included key presses
//for print line and audio file trigger


void keyPressed(){

 if(keyPressed) {
 
 if( key == '1' ) println("sample triggered");
 if( key == '2' ) Audiofile1.trigger(); 
 

}
}

