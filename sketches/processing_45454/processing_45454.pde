
//Based on Danial Shiffman's Analyzing King Lear


PFont reg;
PFont number;
String[] origtext;
int counter= 2477;

String delimiters =" ,.?!;:[]><-";

void setup() {
  size (300,600);
  
  reg = loadFont("AkzidenzGroteskBE-Light-24.vlw");
  number = loadFont("AkzidenzGroteskBE-Bold-48.vlw");
  
  String[]rawtext = loadStrings("http://www.gutenberg.org/cache/epub/2264/pg2264.txt");
  
  String all = join(rawtext,"");
  
  origtext=splitTokens(all,delimiters);
  frameRate(3);
  
  noStroke();
}

void draw() {
  background(#AD2525);
  
  String theword = origtext[counter];
  
  int total = 0;
  for (int i =0; i < origtext.length; i++) {
    if (theword.equals(origtext[i])) {
      total ++;
    }
  }
  
  noStroke();
  fill(255);
  rect(0,0,width,height-total);
  
  textFont(reg);
  fill(0);
  text(theword, 20, 380);
  textFont(number);
  text(total,20,480);
  
  //ellipse(20,320,theword.length(),theword.length());
  
  counter = (counter + 1)%origtext.length;
  

}

