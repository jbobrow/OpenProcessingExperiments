

String [] poem = new String[17]; // input text
String [] words = new String[1]; // empty 0 len array for words

void setup() {
  size(800, 800);
  background(100);
  noStroke();
  fill(102);
 
  poem[0]="the cold metal bites my fingertips ";
  poem[1]="their teeth are a keystone in parched archways";
  poem[2]="convoluted adolescence stamped by black boot machinery";
  poem[3]="illusion hologram artificial reality";
  poem[4]="3-d fog surrounds humanity unwavering";
  poem[5]="we cannot see";
  poem[6]="we wander blinded by greed";
  poem[7]="seeking delusions of grandeur in tucked away places";
  poem[8]="finding warmth in cotton beds and other galaxies";
  poem[9]="her planetary alignment begs my brain to supernova";
  poem[10]="im stuck trying to make out the shapes from far away";
  poem[11]="cutting my eyes out of their sockets to screw microscopes over black holes";
  poem[12]="the technology never gave me glimpses into souls";
  poem[13]="her voice was easier to make out, I could pick up telekenetic radio waves";
  poem[14]="but over the distance they travelled they changed";
  poem[15]="scrambled by light years of lonely stirrings";
  poem[16]="shot into oblivion frequencies";


  // iterate over data by line
  for (int i=0;i<poem.length;i++)
  {
    // extract words by splitting at any punctuation or space
    // combine results as string arrays concatenating results with prior results
    words = (String[])concat(words, splitTokens(poem[i++], "a z .,()-"));
  }
  for (int i = 0; i < words.length; i++) {
    float r = random(800);
    stroke(r*5);
    line(500, i, 50+r, i);
  }
  println(words);
}

void draw() {
}



