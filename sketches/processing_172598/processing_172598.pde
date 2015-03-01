
/* @pjs preload="guitar.png, trumpet.png, violin.png, drums.png, trombone.png, saxophone.png, clarinet.png, frenchhorn.png"; font = "Armata-Regular.ttf"; */

PImage guitar;
PImage trumpet;
PImage violin;
PImage drums;
PImage trombone;
PImage saxophone;
PImage clarinet;
PImage frenchhorn;
PFont armata;
int myState = 0 ; 

void setup() {
  size(500, 500) ;
  guitar = loadImage("guitar.png");
  trumpet = loadImage("trumpet.png");
  violin = loadImage("violin.png");
  drums = loadImage("drums.png");
  trombone = loadImage("trombone.png");
  saxophone = loadImage("saxophone.png");
  clarinet = loadImage("clarinet.png");
  frenchhorn = loadImage("frenchhorn.png");
  armata = createFont("Armata-Regular.ttf", 100);
}


void draw() {
  background(0) ; 
  
//fill(255);
//text(mouseX + ", " + mouseY, 10, 10);

  switch(myState) {
  case 0:
  textFont(armata, 20);
    text("Do you know your instruments?", 90, 113) ;
    break ; 

  case 1:
  image(guitar, 120, 300, 294, 182);
  textFont(armata, 20);
    text("Guitar", 210, 100) ;
   textFont(armata, 16); 
    text("A guitar usually has 6 strings and is played by strumming with the right hand and fretting the notes with the left hand. An acoustic guitar projects sound using the sound hole in the middle, while an electric guitar requires amplification to project sound.", 47, 118, 430, 250); 
    break ;

  case 2:
  image(trumpet, 60, 360, 387, 120);
  textFont(armata, 20);
    text("Trumpet", 200, 100) ;
    textFont(armata, 16);
    text("The trumpet is the highest register brass instrument. It has 3 valves, and many notes can be played by pressing down any one combination of valves. The player uses his or her lips and air flow to control the pitch of notes. For example, an F can be played by pressing down the first valve. By tightening your lips to make the pitch higher, a Bb can also be played while pressing down the first valve.", 47, 118, 430, 250); 
    break ;

  case 3:
  image(violin, 15, 140, 243, 243);
  textFont(armata, 20);
    text("Violin", 225, 110) ; 
    textFont(armata, 14);
    text("The violin is also known as the fiddle, and it has 4 strings. It is the highest pitched instrument in the violin family, which also includes the viola and cello. The sound is produced by drawing a bow across the strings or by plucking the strings. The violin was first used to play Baroque music, but it is now used in a wide variety of other genres like classical, folk, and jazz.", 230, 140, 250, 300);
    break ;

  case 4:
  image(drums, 100, 250, 300, 222);
  textFont(armata, 20);
    text("Drum set", 210, 100) ; 
    textFont(armata, 14);
    text("A drum set is a collection of drums, cymbals, and other percussion instruments played by a single player. A standard drum kit contains a snare drum, a bass drum (played with a foot pedal), a hi-hat, one or more tom-toms, and one or more cymbals.", 47, 118, 430, 250);
    break ;
    
    case 5:
  image(trombone, 60, 300, 400, 122);
  textFont(armata, 20);
    text("Trombone", 210, 100) ; 
    textFont(armata, 14);
    text("The trombone is a member of the low brass family. Like the trumpet, the player uses his or her lips to buzz into the mouthpiece to create the sound. Trombones have a slide used to change the pitch instead of valves. Trombones have seven slide positions.", 47, 118, 430, 250);
    break ;
    
    case 6:
  image(frenchhorn, 100, 305, 300, 192);
  textFont(armata, 20);
    text("French horn", 210, 100) ; 
    textFont(armata, 14);
    text("The French horn is an instrument in the brass family that is made of tubing more than 20 feet long, wrapped into a coil with a flared bell. It is a descendant of the natural horn, and informally known as the French horn. This is actually an incorrect name, since the instrument is German in origin. It has three valves like the trumpet, but has a mellow, subdued sound in comparison to the more piercing sound of the trumpet.", 47, 118, 430, 250);
    break ;
    
    case 7:
  image(clarinet, 350, 130, 50, 298);
  textFont(armata, 20);
    text("Clarinet", 210, 100) ; 
    textFont(armata, 14);
    text("The clarinet is a member of the woodwind family. It has a single-reed mouthpiece, a straight tube and a flaring bell. Clarinets have 24 keys, as well as little spaces where the keys go down. Ther are several types of clarinets that differ in size and pitch, such as the soprano clarinet (the most common), bass clarinet, and contra bass clarinet.", 47, 130, 270, 250);
    break ;
    
    case 8:
  image(saxophone, 15, 145, 225, 225);
  textFont(armata, 20);
    text("Saxophone", 210, 100) ; 
    textFont(armata, 14);
    text("The saxophone is also a member of the woodwind family. However, they are actually made of brass. They are played with a single-reed mouthpiece like the clarinet. The saxophone was created to be the most vocal and powerful woodwind instrument and to fill the middle ground between the woodwind and brass families.", 250, 120, 230, 300);
    break ;
  }
}

void mousePressed() {
  myState = (myState + 1) % 9 ;
}



