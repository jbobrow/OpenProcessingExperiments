
String[] eofe;
String[]gofw;
int counter=0;
String delimiters=" ,.?!;:";
  
  int x=0;
  int y=0;



void setup() {
  size (618,350);
  colorMode (HSB, 360,100,100);

 String[] origeofe = loadStrings("eofe.txt");
 String joinedeofe = join(origeofe,"");
 eofe = splitTokens(joinedeofe,delimiters);

  String[] origgofw = loadStrings("gofw.txt");
  String joinedgofw = join(origgofw,"");
  gofw = splitTokens(joinedgofw,delimiters);
}

void draw() {
  translate(10,50);
  //GRAPES OF WRATH
  //Find a word
  String theword = gofw[counter];
  int gcolor=0;
  //Count number of times that word is used
  for (int i = 0; i < gofw.length; i ++ ) {
    if (theword.equals(gofw[i])) {
      gcolor ++;
    }
  }
  //Draw a point for each word used and color it according of number of times used.
  color gofwcolor= color(40,99,gcolor);
  if (x <290) {
    stroke(gofwcolor);
    point(x, y);
    x+=1;
    
  } else if (x==290) {
    x=0;
    y+=1;
  }
  counter = (counter + 1) % gofw.length;

/*
translate(309,0);
  //EAST OF EDEN
  //Find a word
  String thewordtwo = eofe[counter];
  int ecolor=0;
  //Count number of times that word is used
  for (int i = 0; i < eofe.length; i ++ ) {
    if (thewordtwo.equals(eofe[i])) {
      gcolor ++;
    }
  }
  //Draw a point for each word used and color it according of number of times used.
  color eofecolor= color (200,75,ecolor);
  if (x <290) {
    stroke(eofecolor);
    point(x, y);
    x+=1;
    
  } else if (x==290) {
    x=0;
    y+=1;
  }
  counter = (counter + 1) % eofe.length;
*/
}

