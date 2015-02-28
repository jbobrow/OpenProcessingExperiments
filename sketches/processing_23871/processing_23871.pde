
String[] eofe;
String[]gofw;
int counter=0;
String delimiters=" ,.?!;:";
int x=0;
int y=0;
PFont font;



String gofwtitle = "Grapes of Wrath";
String eofetitle = "East of Eden";

void setup() {
 size(430,220);
 colorMode(HSB, 360,100,100);
 background(0);
 
 String[] origeofe = loadStrings("eofe.txt");
 String joinedeofe = join(origeofe,"");
 eofe = splitTokens(joinedeofe,delimiters);
 
 String[] origgofw = loadStrings("gofw.txt");
 String joinedgofw = join(origgofw,"");
 gofw = splitTokens(joinedgofw,delimiters);
 
 font = loadFont("Georgia-24.vlw");
 textFont(font);
 
 frameRate(5);
}

void draw() {
  
  //EAST OF EDEN
  String thewordtwo = eofe[counter];

  int ecolor=0;
  //Count number of times that word is used
  for (int i = 0; i < eofe.length; i ++ ) {
    if (thewordtwo.equals(eofe[i])) {
      ecolor ++;
      counter = (counter + 1) % eofe.length;
    }
  }
  //Draw a point for each word used and color it according of number of times used.
  color eofecolor= color (200,75,ecolor);
  if (x <290) {
    fill(eofecolor);
    rect(220,10,200,200);
    x+=1;
    
  } else if (x==290) {
    x=0;
    y+=1;
  }
  
  //GRAPES OF WRATH
  String theword = gofw[counter];
  int gcolor=0;
  //Count number of times that word is used
  for (int i = 0; i < gofw.length; i ++ ) {
    if (theword.equals(gofw[i])) {
      gcolor ++;
      counter = (counter + 1) % gofw.length;
    }
  }
  //Draw a point for each word used and color it according of number of times used.
  color gofwcolor= color (40,99,gcolor);
  if (x <290) {
    fill(gofwcolor);
    rect(10,10,200,200);
    x+=1;
    
  } else if (x==290) {
    x=0;
    y+=1;
  }
  
  //TYPE
  
    fill(255);
  text(eofetitle, 250, 100);
  text(gofwtitle, 20, 100);
  
  
}  

