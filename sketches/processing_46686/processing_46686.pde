
PFont f;
String [] shelPoem;
//String ourString ="You Can't Take It With You by Shel Silverstein";                            // the string to hold our text           
int counter = 0;
int x, y;
String delimiters = " ,.?!;:[]";
String words;
Title title;
EachWord eachword;
//float sw = textWidth(words);

void setup() {
  size (500, 830);
  background (#FFE6D3);  //blush color
  f=loadFont("BrosseDemonstrator-13.vlw");     // load the font (make sure it's in the Data folder)
  hint(ENABLE_NATIVE_FONTS);              // add this to allow processing to use the native vector fonts

  String [] rawtext = loadStrings("you_cant_Shel Silverstein copy.txt");

  //String url = "http://m.kovideo.net/l/s/Shel-Silverstein/You-Cant-Take-It-With-You.html";
  //String [] rawtext = loadStrings(url);

  //String [] takeIttxt = loadStrings("you_cant_Shel Silverstein.txt");
  //println(takeIttxt[0]);
  // Join the big array together as one long string
  String everything = join(rawtext, " " );
  shelPoem = splitTokens(everything, delimiters);
  title = new Title();
  eachword = new EachWord();
  x= 40;
  y = 70;
  title.display();
  frameRate(7);
}              

void draw() {
  textFont(f); 
  fill(#7DCEA1);
  textLeading(50);
  words = shelPoem[counter];

  eachword.display(); 
  textLeading(40);
  text(words, x, y);
  counter = (counter + 1) % shelPoem.length;
  x+= 40; 
  if (x > width-70) {   //start new line of poem
    x = 40; 
    y += 20;
  }
  /*if (counter > 7) {
    x=40;
    y+=20;
    counter = (counter + 1) % shelPoem.length;
    x+= 40;
    counter++;
        counter = (counter + 1) % shelPoem.length;
  }*/
  }

  class EachWord {
    EachWord() {
    }
    void display() {
      textFont(f);
      textLeading(50);
      textAlign(LEFT);
      fill(#7DCEA1);        
      text(words, x, y);
    }
  }


  class Title {
    String title = "You Can't Take It With You\nby Shel Silverstein"; 

    Title() {
      textFont(f);
      textAlign(CENTER);
    }

    void display() {
      fill(#7DCEA1); 
      text(title, width/2, 18);
    }
  }


