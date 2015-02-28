
float x;
float y;
int numCircles;
float dmeter;
String [] poem = new String[62]; // input text
String [] words = new String[0]; // empty 0 len array for words
PFont font;
  


void setup() {
  size(1000, 750);
  background(0);

font = loadFont("Monospaced-16.vlw");
textFont(font);
fill(155);

  for (float rCount = 0; rCount < 255; rCount++) {
    rectMode(CORNER);
    noStroke();
    fill(0+rCount);
    rect(((1.82*rCount)+550), 0, (1.82), height);
    
    
  }


  PImage don; 
  noStroke();
  don = loadImage("bigger2.jpg");
  int duc = don.width*1;
  int huc = don.height*1;
  image (don, 318, 0, duc/1, huc/1);



  numCircles = int( random(100, 175));
  for (int l = 0; l < numCircles; l++) {
    fill(255, 240, 240, 150);
    smooth();
    noStroke();
    x = random(0, width);
    y = random(565, 640);
    dmeter = random(20, 75);
    ellipse(x, y, dmeter, dmeter);
  }



  fill(255);
  rect(0, 630, 1000, 630);



  stroke(#D33A3A);
  strokeWeight(3);
  line(0, 665, 1000, 665);
  stroke(#AF2727);
  strokeWeight(1.25);
  line(0, 650, 1000, 650);
  strokeWeight(1);
  line(0, 640, 1000, 640);
  strokeWeight(.75);
  line(0, 635, 1000, 635);
  stroke(#6A0909);
  strokeWeight(.50);
  line(0, 630, 1000, 630);


  PImage con;
  smooth();
  con = loadImage("legs and mirror b and w.png");
  int m = con.width/1;
  int n = con.height/1;
  image (con, 420, 50, m/1, n/1);

  fill(155);
  poem[0]="i love you much(most beautiful darling)";
  poem[1]="i love you much(most beautiful darling)";
  poem[2]="more than anyone on the earth and i";
  poem[3]="like you better than everything in the sky";
  poem[4]="-sunlight and singing welcome your coming";
  poem[5]="although winter may be everywhere";
  poem[6]="with such a silence and such a darkness";
  poem[7]="noone can quite begin to guess";
  poem[8]="(except my life)the true time of year-";
  poem[9]="and if what calls itself a world should have";
  poem[10]="the luck to hear such singing(or glimpse such";
  poem[11]="sunlight as will leap higher than high";
  poem[12]="through gayer than gayest someone's heart at your each";
  poem[13]="nearness)everyone certainly would(my";
  poem[14]="most beautiful darling)believe in nothing but love";
  poem[15]="i have found what you are like";
  poem[16]="the rain,";
  poem[17]=" (Who feathers frightened fields";
  poem[18]="with the superior dust-of-sleep. wields";
  poem[19]="easily the pale club of the wind";
  poem[20]="and swirled justly souls of flower strike";
  poem[21]="the air in utterable coolness";
  poem[22]="deeds of green thrilling light";
  poem[23]="with thinned";
  poem[24]="newfragile yellows";
  poem[25]="lurch and.press";
  poem[26]="-in the woods";
  poem[27]="which";
  poem[28]="stutter";
  poem[29]="and";
  poem[30]="sing";
  poem[31]="And the coolness of your smile is";
  poem[32]="stirringofbirds between my arms;but";
  poem[33]="i should rather than anything";
  poem[34]="have(almost when hugeness will shut";
  poem[35]="quietly)almost,";
  poem[36]="your kiss";
  poem[37]="dying is fine)but Death";
  poem[38]="?o";
  poem[39]="baby";
  poem[40]="i";
  poem[41]="wouldn’t like";
  poem[42]="Death if Death";
  poem[43]="were";
  poem[44]="good:for";
  poem[45]="when(instead of stopping to think)you";
  poem[46]="begin to feel of it,dying";
  poem[47]="’s miraculous";
  poem[48]="why?be";
  poem[49]="cause dying is";
  poem[50]="perfectly natural;perfectly";
  poem[51]="putting";
  poem[52]="it mildly lively(but";
  poem[53]="Death";
  poem[54]="is strictly";
  poem[55]="scientific";
  poem[56]="& artificial &";
  poem[57]="evil & legal)";
  poem[58]="we thank thee";
  poem[59]="god";
  poem[60]="almighty for dying";
  poem[61]="(forgive us,o life!the sin of Death";


  // iterate over data by line
  for (int i=0;i<poem.length;i++) {

    // extract words by splitting at any punctuation or space
    // combine results as string arrays concatenating results with prior results
    words = (String[])concat(words, splitTokens(poem[i], " .,()-"));
  
  }


  textFont(font);
  fill(0);
  String ba = "l(a";
  text (ba, 850, 638, 250, 350);
  String ca = "le";
  text (ca, 905, 665, 250, 350);
  String da = "af";
  text (da, 945, 665, 250, 350);
  String ea = "fa";
  text (ea, 910, 680, 250, 350);
  String fa = "ll";
  text (fa, 925, 690, 300, 300);
  String ga = "s)";
  text (ga, 895, 705, 400, 400);
  String ha = "one";
  text (ha, 905, 720, 500, 500);
  String ia = "l";
  text (ia, 880, 735, 600, 600);
  String ja = "iness";
  text (ja, 925, 735, 800, 800);
  


}


