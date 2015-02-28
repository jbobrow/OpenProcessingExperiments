
/*This sketch is to explore something a little more
 functional.
 It's a visual representation of our current Studio
 project's program and something I actually did do by 
 hand & CAD! It would be handy to use again!
 */

//SUMMARY OF FUNCTIONAL SPACE REQUIREMENTS

String[] Data; //new String[]
String[] HeadingLetter; //letter given to each functional space (collection of rooms)
String[] Headings; //name of functional space (collection of rooms)
String[] LinkedSpaces; //which spaces need to have connecting circulation routes
String[] Public; //if the public need access to
String[] Judicery; //if the judicery need access to
String[] Jury; //if the jury need access to
String[] Defendent; //if the defendent needs access to
String[] Sheriff; //if the sheriff needs access to
String[] ProtectedWitness; //if protected witnesses need access to
int[] Area; //area of each functional space (m2)

int f1 = 1; //fill colour 1
int f2 = 80; //fill colour 2
int f3 = 150; //fill colour 3
int f4 = 200; //fill colour 4
int st = 50; //border stroke colour
int Ll = 200; //length of legend border
int Lh = 150; //height of legend border
int Ls = 30; //legend border dist in from sides
int Rs = 20; //size of rectangles in legend

void setup() {
  size(1350,600);
  colorMode(HSB); //hue, saturation, brightness
  noLoop(); //only loop draw once
  Data = loadStrings("space_requirements.txt"); //loading in data which was setup from contatiner above
  HeadingLetter = new String[Data.length]; //sets up first array
  Headings = new String[Data.length];
  Area = new int[Data.length]; //int because a whole number
  LinkedSpaces = new String[Data.length];
  Public = new String[Data.length];
  Judicery = new String[Data.length];
  Jury = new String[Data.length];
  Defendent = new String[Data.length];
  Sheriff = new String[Data.length];
  ProtectedWitness = new String[Data.length];

  for (int i=0; i<Data.length; i++) { //length --> when the data has an unknown length
    println(Data[i]); //will print lines of data as runs through
    String row = Data[i]; //get one row
    String[] rowbits = split(row, ","); //used a "," to spilt the data 

    //where to put all the row bits correctly
    String eachheadingletter = rowbits[0]; //get the heading letter - first slot = 0
    HeadingLetter[i] = eachheadingletter; //store the heading letter in the array

    String eachheadings = rowbits[1]; //get the heading - second slot = 1
    Headings[i] = eachheadings;    

    int eacharea = int(trim(rowbits[2]));
    Area[i] = eacharea;

    String eachlinkedspaces = rowbits[3];
    LinkedSpaces[i] = eachlinkedspaces;

    String eachpublic = rowbits[4];
    Public[i] = eachpublic;

    String eachjudicery = rowbits[5];
    Judicery[i] = eachjudicery;

    String eachjury = rowbits[6];
    Jury[i] = eachjury;

    String eachdefendent = rowbits[7];
    Defendent[i] = eachdefendent;

    String eachsheriff = rowbits[8];
    Sheriff[i] = eachsheriff;

    String eachprotectedwitness = rowbits[9];
    ProtectedWitness[i] = eachprotectedwitness;
  }
}

void draw() {
  background(255); //white background
  rectMode(CENTER); //draw rectangles from Centre
  noStroke();
  for(int i=0; i<Data.length; i++) { //will loop the legnth of the data
    fill(0); //so text is black

    String l = HeadingLetter[i]; //get the heading letter out
    text(l, 145+(i*95),30); //write the text --> text, x pos, y pos

    String s = LinkedSpaces[i]; 
    text(s, 140+(i*95),180); //*95 is the spacing between

    String p = Public[i];
    text(p, 140+(i*95), 210); 

    String j = Judicery[i];
    text(j, 140+(i*95), 240);

    String y = Jury[i];
    text(y,140+(i*95), 270);

    String d = Defendent[i];
    text(d, 140+(i*95), 300);

    String h = Sheriff[i];
    text(h, 140+(i*95), 330);

    String w = ProtectedWitness[i];
    text(w, 140+(i*95), 360);

    int a = Area[i];
    if (a<=300) {
      fill (f1,255,255); //if area less than or equal to 300m2
    }
    else if (a<=500) {
      fill(f2,255,255); //if area is less than or equal to 500m2
    }
    else if (a<=1500) {
      fill(f3,255,255); //if area is less than or equal to 1500m2
    }
    else {
      fill(f4,255,255); //if area is above 1500m2
    }
    rect(150+(i*95), 100, 2*(sqrt(a)), 2*(sqrt(a))); //draw sqares, *2 to scale up
  }
  Legend(); //draw legend
  Table(); //draw table
  Names(); //draw names
}

void keyPressed() {
  save("program.jpg"); //when key is pressed jpeg image will be saved
}

void Legend() { //legend for the corresponding fill colour & m2
  rectMode(CORNER); //draw rectangles from corner (setup states center)
  noFill();
  stroke(0,st); //st --> int set above
  rect(Ls,height-(Lh+Ls),Ll,Lh); //xpos, y pos, width, height

  noStroke();
  fill(0); //text fill black
  text("area less than 300m2",80,height-(Lh+Ls-35));
  fill(f1,255,255); //same as above for a<=300
  rect(Ls+10, height-(Lh+Ls-20),Rs,Rs);

  fill(0);
  text("area less than 500m2", 80, height-(Lh+Ls-65));
  fill(f2, 255,255); //same as above for a<=500
  rect(Ls+10, height-(Lh+Ls-50),Rs,Rs);

  fill(0);
  text("area less than 1500m2", 80, height-(Lh+Ls-95));
  fill(f3,255,255); //same as above for a<=1500
  rect(Ls+10, height-(Lh+Ls-80),Rs,Rs);

  fill(0);
  text("area above 1500m2",80,height-(Lh+Ls-125));
  fill(f4,255,255); //same as above to a>1500
  rect(Ls+10, height-(Lh+Ls-110),Rs,Rs);
}

void Names() { //Headings were too long to fit in table, so legend for Heading Letters & corresponding Heading
  for(int z=0; z<Data.length; z++) {
    fill(0); //text is black
    String l = HeadingLetter[z]; //get the heading out
    text(l, 300, (height-(Lh+Ls+25))+z*15); //write the text
    String h = Headings[z];
    text(h, 350, (height-(Lh+Ls+25))+z*15);
  }
  stroke(0,st);
  noFill();
  rect(270,(height-(Lh+Ls+40)),270,200);
}

void Table() { //table to visually organise information
  int rl = width-20;//rectangle length
  int rh = height-20; //rectangle width
  fill(0); //text black
  noFill(); //so rectangles don't fill
  stroke(0,st); //st --> int set above
  rect(10,10,width-20,height-20); 

  line(10,45,width-10,45);
  text("SPACE",20, 35); //heading letter
  line(10,160,width-10,160);
  text("AREA m2",20,110);
  line(10,190,width-10,190);
  text("LINKED", 20, 180);
  line(10,220,width-10,220);
  text("PUBLIC", 20, 210);
  line(10,250,width-10,250);
  text("JUDICERY", 20, 240);
  line(10,280,width-10,280);
  text("JURY",20,270);
  line(10,310,width-10,310);
  text("DEFENDENT",20,300);
  line(10,340,width-10,340);
  text("SHERIFF",20,330);  
  line(10,370,width-10,370);
  text("WITNESS",20,360);
  line(100,10,100,370);
}


