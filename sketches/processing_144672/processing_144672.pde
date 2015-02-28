
//Faryal Khalid
//HW 10. CMU. Spring 2014
//ispiration by Zenna Koo
//Poetry credit: La Belle Dame sans Merci by John Keats
//Initiate program to see John Keats write about his evil hearted love in his love
//Press any key to put him out of the misery


PFont typewriter;
PImage bg;
String [] laBellePoem;
int pacer = 0;
int x, y;
String symbols = " ,.?!;:[]";
String words;
Title title;
IndWords indwords;

void setup() {
  size (850, 600);
  typewriter=loadFont("AmericanTypewriter-Light-13.vlw");
  bg=loadImage("belle.jpg");
  background(bg);
  

  String [] rawtext = loadStrings("la_belle_dame_sans_merci.txt");


  String everything = join(rawtext, " " );
  laBellePoem = splitTokens(everything, symbols);
  title = new Title();
  indwords = new IndWords();
  x= 40;
  y = 70;
  title.display();
  frameRate(2);
}              

void draw() {
  textFont(typewriter); 
  fill(#BF0202);
  textLeading(30);
  words = laBellePoem[pacer];

  indwords.display(); 
  textLeading(40);
  text(words, x, y);
  pacer = (pacer + 1) % laBellePoem.length;
  x+= 70; 
  if (x > width-70) { 
    x = 40; 
    y += 30;
  }
  
  }

  class IndWords {
    IndWords() {
    }
    void display() {
      textFont(typewriter);
      textLeading(30);
      textAlign(LEFT);
      fill(#BF0202);        
      text(words, x, y);
    }
  }


  class Title {
    String title = "La Belle Dame sans Merci- John Keats"; 

    Title() {
      textFont(typewriter);
      textAlign(CENTER);
    }

    void display() {
      fill(#BF0202); 
      text(title, width/2, 18);
    }
  }

void keyPressed()
{
   
    exit ();
     
}



