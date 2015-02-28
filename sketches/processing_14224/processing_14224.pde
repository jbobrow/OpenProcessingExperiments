
// ****************** Notes on Coceptual Architecture: *************
//                           Towards a New Syntax
//
//  PAGE 3
//
//
// created by: Benzi Rodman
//
//   Unlike artists, architects are faced with the problem of physically
//   representing their concepts through modes of construction that 
//   allready have been assigned a set of semantic meanings. In other words,
//   society projects a set of cultural meanings and definitions onto things
//   like walls and columns presenting architects with a predetermined set of tools 
//   that may or may not convey their design intentions. Architects must approach this challenge 
//   by rearranging semantic objects in a way to create new relationships and new contextual meaning
//   for each aspect of an architectural project. Thus, for the contemporary architect, the truest
//   form of conceptual representation comes as a result of the laborious disection of all that has meaning
//   until all that is left are the most basic units of ideas. 


PImage ambasz;        //images
PImage curvey;
PImage archigram;
PImage superstudio;
PImage meyer;
PImage eisenman;

int x;                //intergers
int y;
int z;
int a;
int b;
int c;
int d;

PFont fontA;         // fonts

float xpos, ypos;    //floats
float xpos1, ypos1; 
float xpos2, ypos2; 

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  
float xspeed1 = 1.3;  
float yspeed1 = 1.2;
float xspeed2 = 1;  
float yspeed2 = .5;

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
int xdirection1 = 1;  
int ydirection1 = 1; 
int xdirection2 = 1;  
int ydirection2 = 1; 
 
int size = 60;       // Width of the shape

void setup() {
  
  size(500,647);
  smooth();
  
  fontA = loadFont ("Helvetica-18.vlw");
  ambasz = loadImage ("ambasz.png");
  curvey = loadImage ("curve.png");
  archigram = loadImage ("archigram_0.png");
  superstudio = loadImage ("superstudio.png");
  meyer = loadImage ("meyer.jpg");
  eisenman = loadImage ("eisenman.png");
  
  textAlign(CENTER);
  imageMode(CENTER);
  textFont (fontA, 14);
  
  xpos = 80;
  ypos = 110;
  xpos1= 110;
  ypos1= 80;
  
}

// However, meticulously grinding down various historical stles, cultural aesthetics and philosophical ideals
// to their purest concepts may not always be possible. Perhaps creating a framework in which a final architectural object
// presents ideas semantically, but as second fiddle to sytactical concepts is what architects must strive toward in order
// to avoid creating space that is either purely pragmatic or superfical in its representation of concepts. 
//
// In the comment margins of this computer code, I have attatched semantic explanations to the heavily sytactical arguments. 
// The nature of this programming language's syntax has caused the footnotes to be coded out of order, suggesting a primacy of the
// power of relationships rather than meanings to create a final object, in this case an interactive computer game.
// Ultimately, these explanations will completely dissapear and in fact have no affect on the final
// product. All of the work done to provide meaning for the code, and even the actual written code itself will disappear.
// The user will have the ability to break Eisenmen's footnotes even further down to the ideas they represent in an interactive
// field where all of the work that needs to be done is the click of a mouse. 
//
//
//


void draw() {
 
  background (255); 

//  FOOTNOTE 12
//  
//  "For an example of this, see the Superstudio project fur kalabrien, the Trigon '69. catalogue, Kunstlerhaus, Graz, 4 Oktober bis 15 November, 1969"
//
//  Clicking on this footnote reveals a side scrolling image of Hennan Meyer's Palais Des Nations. Eisenman goes through great lengths to
//  dethrown practices like the Superstudio who have produced what is widely understood as conceptual architecture in that it has not been
//  built. However, the project refrenced here is claimed by Eisenmen in a later published version of "Notes on Conceptual Architecture to be a rehashing 
//  of Meyer's Palais. It is therefore only conceptual on the surface and semantic in its refrence to past ideologies.

  fill(c);
  
  if (mouseX>230 & mouseX<250 & mouseY>440 & mouseY<463 & mousePressed) { c=255; }
  
  text (".12", 241, 458);
  
  if (c==255) { if (z>=width) {z=0;} image (meyer, z++, 456, 300,300);}


//    FOOTNOTE 10
//    
//    "This taxonomy has been criticized by Emilio Ambasz as failing to take into account another aspect: the discourse between matter and process..."
//
//    Clicking on this footnote uncovers a straught line, curvey line and a portait of Emilio Ambasz. The two lines refrence the point 
//    Eisenmen makes which spawns the footnote about how these differences in the concept of line create different relationships to how they are precieved.
//    
 
  fill(a);
    
  if (mouseX>80 & mouseX<110 & mouseY>80 & mouseY<110 & mousePressed) { a=255;} 
  
  text (".10", 99, 95);
  
  if (a==255) {
    
    fill(0);
     xpos = xpos + ( xspeed * xdirection );
     ypos = ypos + ( yspeed * ydirection );
     xpos1 = xpos1 + ( xspeed1 * xdirection1 );
     ypos1 = ypos1 + ( yspeed1 * ydirection1 );
     xpos2 = xpos2 + ( xspeed2 * xdirection2 );
     ypos2 = ypos2 + ( yspeed2 * ydirection2 );
     if (xpos > width-size || xpos < 0) {
     xdirection *= -1;
     }
     if (ypos > height-size || ypos < 0) {
     ydirection *= -1;
     } 
     rect(xpos+size/2, ypos+size/2, 300, 1);
     
     if (xpos1 > width || xpos1 < 0) {xdirection1 *= -1;
     }
     if (ypos1 > height || ypos1 < 0) {
     ydirection1 *= -1;
     }
     image (ambasz, xpos1, ypos1, 90, 90);
     
     if (xpos2 > width || xpos2 < 0) {xdirection2 *= -1;
     }
     if (ypos2 > height || ypos2 < 0) {
     ydirection2 *= -1;
     }
     image (curvey, xpos2, ypos2);
 }
     
//    FOOTNOTE 11
//
//    "This it is possible to suggest a re-evaluation of the work of such groups as Archigram and Superstudio in this context to see which aspects
//     are truly conceptual and which aspects are merely perceptual semantic, and thus possibly not concpetual at all"
//
//     This footnote breaks down into two spinning images created by the above mentioned studios. These two studios, known
//     for creating highly conceptual works might not be as conceptual as they think. As mentioned in footnote 12, many of these projects
//     represent collages of previously established ideas and forms. In order to become truley conceptual they must somehow convey the process
//     through which the ideas were brought together.

  fill(b); 
  
  if (mouseX>418 & mouseX<435 & mouseY>140 & mouseY<160 & mousePressed) { b=255; } 
  
  text (".11", 427, 150);
  
  if (b==255) { pushMatrix();
                translate (389, 169);
                rotate (radians(frameCount));
                image (archigram, 0, 0);
                popMatrix ();
  
                pushMatrix();
                translate (265, 153);
                rotate (radians(-12*frameCount));
                image (superstudio, 0, 0);
                popMatrix ();
  
  }
  
//  FOOTNOTE 13  
//
// "This is a revised form of this compsrison which was first made in my[Eisenmen] forthcoming article..."
//
// Clicking on this footnote releases an undulating photo of Eisenmens's head. By including himself as one of many
// refrences creating his thesis on conceptual archiecture, Eisenmen both removes himself form his own work at the same
// time he makes himself a part of it. In refrencing himself he is presenting himself as one of many refrenced used to make up his
// paper. However, this footnote also reveals the influence Eisenmen has in how we interpret his changing views even of
// himself. Ideas can always be reinterpreted, perhaps this is all we currently have the ability to do.

  
  fill(d);
  
  if (mousePressed & mouseX>150 & mouseX<163 & mouseY>480 & mouseY<510) { d=255; }
  
  text (".13", 157, 502);
  
  if(d==255) { if(x>=750) {x=0; y=0;} image(eisenman, 155, 506,x+=5, y+=5);}

}


void keyPressed () {
  a=0;
  b=0;
  c=0;
  d=0;
  
}

//press any key to reset
// Feel free to recombine how you click through the footnotes. As the images move aruond the screen try and see 
// new relationships forming between the ideas presented on page 3 of the text.

//HAVE FUN
      

  





