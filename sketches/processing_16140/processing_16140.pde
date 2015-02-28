
/**
 "Every Paper: John F. Simon, Jr."
 By: Philippe Moore
 edit:November 12, 2009, 12:42 p.m.
 edit:11/29/10 changed pointer to "jfsjr", added text 
 
 I intend to generate every paper possible regarding the work 
 of John F. Simon, Jr.
 
 Simon's "Every Icon" inspired me to try my hand at this.
 
 Assuming 72 monospaced characters/line and 40 lines per page
 leaves us with 72*40=2,880 characters/page
 
 In a 6-page paper, that's 17,280 characters/paper
 
 using selections of ascii values 32-122 (SPACE through z)
 " '.,:;!?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
 Here goes nothing...
 
 
 **/
PFont font;
char potentialPaper[];
String potentialPString;
String pointer = "jfsjr";
String st = "";
//String pointer = "John F. Simon, Jr.";

void setup() {
  size(400, 400);
  font = loadFont("Calibri-48.vlw");
  textFont(font, 48); 
  potentialPaper = new char[17280]; 
  potentialPString = "";
}
int counter=0;
void draw() {
  text(counter, 100, 100);
  for (int i=0; i<potentialPaper.length-1; i++) {
    int n = (int)random(32, 122);
    if (n<34 || n==39 || n==46 || (58<=n && n<=59) || n==63 || (65<=n && n<=90) || (97<=n && n<=122)) {
      potentialPaper[i]=char(n);
    }
  }
  arrayToString(potentialPaper);
  
  //text(st,10, 10,4,4);
  potential(potentialPString);
}

void arrayToString(char[] ar) {
  st="";
  for (int i=0; i<ar.length-1; i++) {
    st=st+ar[i];
  }
  potentialPString=st;
  println(st);
  counter++;
  println(counter);
  
}

void potential(String st) {
  background(10);
  if (st.contains(pointer)) {
    text("FOUND ONE!!!", 50, 200);
    println("FOUND ONE!!!!");
    String[] potSt = split(st, ' ');
    saveStrings("Every Paper: " + st.indexOf(pointer), potSt);
    noLoop();
  }
  else{text("Looking for matches", 0, 80);text("to every paper on", 0, 180);text("John F. Simon, jr.", 0, 280);text("Attempt: " +counter,0, 380); }
  
}


