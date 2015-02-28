
float x;
float y;
int numCircles;
int stripes;
float dmeter;
float pmeter;
String [] poem = new String[62]; // input text
String [] words = new String[0]; // empty 0 len array for words
PFont font;
PImage con;
PImage gon;
PImage ion;
PImage jon;
PImage kon;

void setup() {
  size(1000, 750);
  noLoop();
  font = loadFont("Monospaced-16.vlw");
  textFont(font);


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
    words = (String[])concat(words, splitTokens(poem[i], " .,()-?"));
  }

  //println(words);

  ion = loadImage("da_vinci.png");
  gon = loadImage("mcqueen.png");
  con = loadImage("kiddo.png"); 
  jon = loadImage("girl_with_pearl.png");
  kon = loadImage("courbet.png");
  
  smooth();
  textFont(font);
}

void draw() {
  background(0);
  
  kiddo(random(0, width), random(0, height), random(0.5, 2), random(0, TWO_PI));
  
  stripes(int(random(3, 7)), 1, 3);
  
  vinci(random(0, width), random(0, height), random(0.5, 2), random(0, TWO_PI));
  
  mcqueen(random(0, width), random(0, height), random(0.5, 2), random(0, TWO_PI));
    
  courbet(random(0, width), random(0, height), random(0.5, 2), random(0, TWO_PI));
    
  pearl(random(0, width), random(0, height), random(0.5, 2), random(0, TWO_PI));
  
  
  
//  mirrorImage(random(0, width), random(0, height), random(0.5, 2), random(0, TWO_PI));


int xmin = int( random(-200, width));
int xmax = int( xmin+height* random(.5,0.75));
int ymin = int( random(-100, height));
int ymax = int( ymin+height* random(.5,0.75));

  circles(int( random(25, 100)), xmin, xmax, ymin, ymax);
 
 
  fill(240, 240, 240);
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

  drawPoem(4, 16);
}



// every time the mouse is pressed
void mousePressed() {
  redraw();
  // mouse click function to show how this works with different characters
  }


//void mirrorImage(float xx, float yy, float ss, float rr) {
  //println("here");
  //imageMode(CENTER);
  //pushMatrix();
  //translate(xx, yy);
  //scale(ss);
 // rotate(rr);
  //image (con, 0, 0);
  //popMatrix();
//}




void pearl(float oo, float po, float qo, float ro) {
 println("here");
 imageMode(CENTER);
 pushMatrix();
 translate(oo, po);
 scale(qo);
 rotate(ro);
 image (jon, 0, 0);
 popMatrix();
 }  
 
 void courbet(float bo, float co, float fo, float go) {
 println("here");
 imageMode(CENTER);
 pushMatrix();
 translate(bo, co);
 scale(fo);
 rotate(go);
 image (kon, 0, 0);
 popMatrix();
 }  
 
 void vinci(float mo, float no, float oo, float po) {
 println("here");
 imageMode(CENTER);
 pushMatrix();
 translate(mo, no);
 scale(oo);
 rotate(po);
 image (ion, 0, 0);
 popMatrix();
 }  
 
 void mcqueen(float aa, float ee, float ii, float uu) {
 println("here");
 imageMode(CENTER);
 pushMatrix();
 translate(aa, ee);
 scale(ii);
 rotate(uu);
 image (gon, 0, 0);
 popMatrix();
 }  
 
 void kiddo(float br, float pr, float tr, float sr) {
 println("here");
 imageMode(CENTER);
 pushMatrix();
 translate(br, pr);
 scale(tr);
 rotate(sr);
 image (con, 0, 0);
 popMatrix();
 }  
  
void drawPoem(int minLines, int maxLines) {
  int x = int(random(5, width/16));
  int y = 16;
  for (int j=0;j<int(random(minLines, maxLines));j++) {
    String newPoem=""; // empty string for new poem
    // choose some random length and loop that many times
    for (int i=0;i<int(random(3,6));i++) {
      // add new word to string with a space in between - pick at random from array
      newPoem += words[int(random(words.length))] + " ";
    }
    //print result
    //println(newPoem);
    textFont(font);
    fill(255, 240, 240, 170);
    text (newPoem, x, y);
    x = int(random(5, width/12));
    y += 35;
  }
}

void circles(int numCircles, int xmin, int xmax, int ymin, int ymax) {
  for (int l = 0; l < numCircles; l++) {
    fill(255, 255, 255, 50);
    smooth();
    noStroke();
    x = random(xmin, xmax);
    y = random(ymin, ymax);
    dmeter = random(20, 75);
    ellipse(x, y, dmeter, dmeter);
    
  }
}

void stripes(int stripes, int minWeight, int maxWeight) {
  stroke(139, 50, 17); 
  for (int i = 0; i < stripes; i++) {
  strokeWeight(random(minWeight, maxWeight));
  line(0, random(height), 1000, random(height));
  }
}

 
void keyPressed() {
  //println("pressed");

  if (key=='s') {
    save("lynn-frame"+year() + month()+ day()+hour()+minute()+second()+".png");
    println("saved ");
  }
}


