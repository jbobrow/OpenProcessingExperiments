
PFrame f;
secondApplet sec;

import interfascia.*;
GUIController control;
IFTextField tfield;
IFLabel label;
IFButton saveKey, savedKey; // saveCode; Currently saveKey button is used to save both a key file and a code file
String s;
char[] d;
String[] sb;
int[] si;
int gen;
int[] rand_vals;
int[] encode1;
String joinedkey;
String joinedmessage;

PFont font;
PFont font2;

void setup(){
size(500,500);

font = loadFont("ArialMT-12.vlw");
font2 = loadFont("ArialMT-24.vlw");
textFont(font);
noSmooth();

control = new GUIController(this);
  tfield = new IFTextField("Text Field", 25, 50, 400);
  label = new IFLabel("Enter message Above", 25, 80);
  saveKey = new IFButton ("Save", 62, 105, 40, 17);
  //savedKey = new IFButton ("Save Code", 150, 326, 40, 17);
 
  control.add(tfield);
  control.add(label);
  tfield.addActionListener(this);
  
  saveKey.addActionListener(this);
  //saveCode.addActionListener(this);

  control.add (saveKey);
  //control.add (saveCode);
  

//maybe there is a better way to do the data-conversions...my method seems a bit long-winded
s = tfield.getValue();  //get text
d = s.toCharArray(); //convert text string to an array of characters
sb = str(byte(d)); //convert bytedata of characters into a string representation
si = int(sb);  //convert the string representations into intergers 
for (int i = 0; i < si.length; i++){
si[i]=si[i]-31; // the numeric values of the ASCII characters start at 32 and go to 126 here I've have simply subtracted down so as to start at 1...not sure this was actually needed
}


//produce an array of random values the length of the si array and add these values to the integer values of the si array to produce an array of integers representing an encoding of the original text
gen = si.length;
rand_vals = new int[gen];
encode1 = new int[gen];

for(int i=0; i < gen; i++) {
rand_vals[i] = int(random(1,96));
encode1[i] = (si[i]+rand_vals[i])%95;  
  }
//println(si);
//println(rand_vals);
//println(encode1);

noLoop();
}


void draw(){
//println(tfield.getValue());  
background(150);

s = tfield.getValue();
d = s.toCharArray(); 
sb = str(byte(d)); 
si = int(sb);  
for (int i = 0; i < si.length; i++){
si[i]=si[i]-31;
}

gen = si.length;
rand_vals = new int[gen];
encode1 = new int[gen];

for(int i=0; i < gen; i++) {
rand_vals[i] = int(random(1,96));
encode1[i] = (si[i]+rand_vals[i])%95;  
  }
println(rand_vals);

fill(250);
text("Clicking", 16, 120);
text("saves KEY and CODE, creating/overwriting Key.txt, EncodedMessage.txt",110,120);
text("KEY:", 25,160);
joinedkey = join(nf(rand_vals,0), ", ");
text(joinedkey,25,180,475,180);
text("CODE:", 25,360);
joinedmessage = join(nf(encode1,0), ", ");
text(joinedmessage,25,380,475,180);
textFont(font2);
text("Daniel's Encryption Program",25,30);
textFont(font);
}



void keyPressed(){
  redraw();
}

//output the key and the encryption to txt files

void actionPerformed(GUIEvent e) {
  if (e.getMessage().equals("Completed")) {
    label.setLabel(tfield.getValue()); }
  if (e.getSource() == saveKey) {
    saveStrings("Key.txt", str(rand_vals));
    saveStrings("EncodedMessage.txt", str(encode1));
    
    //delay(3000); 
    PFrame f = new PFrame();
    //sec.background(40,242,247);
    
    sec.textSize(48);
    sec.text("Saved",5,70);
    sec.noLoop();
  }
}

public class PFrame extends Frame {
    public PFrame() {
        setBounds(100,100,150,150);
        sec = new secondApplet();
        add(sec);
        sec.init();
        show();
    }
}
public class secondApplet extends PApplet {
    public void setup() {
        size(150, 150);
        noLoop();
    }
    public void draw() {
    }
}


