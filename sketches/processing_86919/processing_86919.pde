

import processing.pdf.*;

import ddf.minim.*;
import ddf.minim.ugens.*;
Minim       minim;
AudioOutput out;
int len = 128;
float tijd = 1.1;
float goRate = 0.25;//Hz
  int mutateRate = 11;
    int unpackDepth = 3;
int rulesExecuted = 0;
float theta = PI/6;
PFont f;
Dna myDna;
boolean go = true;
int untill = 0;

Shape eva;
Song adam;
//QGcode
import com.aos.zxing4processing.*;
ZXING4P zxing;
PImage QRCode;
Boolean savePdf = true;
int n = 0;
PGraphics pdf;

void setup()
{
  //smooth();
  frameRate(10);
  size(1000,700);

  f = createFont("courier",20,true);
  //println(current);
  myDna = new Dna();
  myDna.reset();
  

  minim = new Minim(this);
  out = minim.getLineOut();
  
  
  eva = new Shape();
  adam = new Song();
  
  zxing = new ZXING4P(this);
  
}


void draw()
{
  if(tijd > adam.songLength)
  {
  tijd=0;
   go = true; 
  eva.clear();
 adam.clear();
  }
 tijd += 0.1;
    
 if(go)
 {
  myDna.reset();
  
  myDna.setGene('A',"MMMMMWCUCUUCHI");
  myDna.setGene('C',"TFUUUUUFFUFTFTTFTTFTTTFUUU");
  myDna.setGene('H',"TFFUFUUUUUFTTTFUULFMTTTTTFUUUUUFFFTTTTTLFMF");
  myDna.setGene('I',"UUUUUFTTFTTFTLFMUUUUUUFUUFTTFFTFFUUUUUUUFTTTTTTTTTTTTFFFUFUUUUFTTTFUULF");
  for(int i=0; i<mutateRate;i++)
  {
    myDna.mutate();
  }
   for(int i=0; i<unpackDepth;i++)
  {
    myDna.unpackSeed();
  }
  go = false;
  
  background(100);
  //stroke(255);
  textFont(f);
  fill(255);
  rulesExecuted = 0;
 
  //directly record to Pdf when applying ruleset
  
  applyRuleset(myDna.seed);
  pushMatrix();
  translate(100,100);
  float ytemp = eva.dimentions.y-eva.origin.y;
  float xtemp = eva.dimentions.x-eva.origin.x;
  if(ytemp > xtemp)
  {
  scale((height-200)/(ytemp));
  }
  else
  {
    scale((width-200)/(xtemp));
  }
  translate(-eva.origin.x,-eva.origin.y);
  eva.display();

  adam.play();
  popMatrix();
  text("Duration (sec) : "+adam.songLength,20,height-100);
  text("Rules executed : "+rulesExecuted,20,height-80);
  text("RuleSet length : "+myDna.seed.length(),20,height-60);
  text("mutateRate     : "+mutateRate,20,height-40);
  text("unpackDepth    : "+unpackDepth,20,height-20);
 
 displayGenome();
 
 //do the QR code
 QRCode = zxing.generateQRCode(myDna.DNA,150,150);
 image(QRCode,width-150,0);
// saveToPdf();
 if(savePdf)
 {
   //saveToPdf();
   savePdf = false; 
 }
 }    
}

void displayGenome()
{
 // text("Framerate (Hz) : "+goRate,20,height-120);
 // text("Rules executed : "+rulesExecuted,20,height-100);
 // text("RuleSet length : "+myDna.seed.length(),20,height-80);
 // text("mutateRate     : "+mutateRate,20,height-60);
 // text("unpackDepth    : "+unpackDepth,20,height-40);
 // text("DNA            : "+myDna.DNA,20,height-20);
  int n,x1 = 110, x2=0,y1 = 40;
  String gene;
  char c;
 
  String[] commands = { "BLUE",
                        "BACKWARD",
                        "FORWARD" , 
                        "GREEN" , 
                        "LENGTH++" ,
                        "LENGTH--" ,
                        "GAMMA++",
                        "GAMMA--" , 
                        "RED" , 
                        "BLACK" ,
                        "TURN CC" ,
                        "UN-TURN" ,
                        "WHITE" ,
                        "SEED" ,
                      }; 
  for(n=0; n<26; n++)
  {
    fill(230);
    c = char(int('A')+n);
    gene = myDna.DNA.substring(myDna.DNA.indexOf(" "+c)+2, myDna.DNA.indexOf( "/" + char(int(c)) ) );
    text(c + ": " + gene,x1,20*n+y1);
      fill(50,130,130);
     if(n==0) text(commands[13],x2,20*n+y1);
    if(n==1) text(commands[0],x2,20*n+y1);
    if(n==4) text(commands[1],x2,20*n+y1);
    if(n==5) text(commands[2],x2,20*n+y1);
    if(n==6) text(commands[3],x2,20*n+y1);
    if(n==11) text(commands[4],x2,20*n+y1);
    if(n==12) text(commands[5],x2,20*n+y1);
    if(n==13) text(commands[6],x2,20*n+y1);
    if(n==14) text(commands[7],x2,20*n+y1);
    if(n==17) text(commands[8],x2,20*n+y1);
    if(n==18) text(commands[9],x2,20*n+y1);
    if(n==19) text(commands[10],x2,20*n+y1);
    if(n==20) text(commands[11],x2,20*n+y1);
    if(n==22) text(commands[12],x2,20*n+y1);
    
  }
}

void stop()
 {
 // the AudioPlayer you got from Minim.loadFile()
// player.close();
 // the AudioInput you got from Minim.getLineIn()
// input.close();
 minim.stop();

 // this calls the stop method that
 // you are overriding by defining your own
 // it must be called so that your application
 // can do all the cleanup it would normally do
 super.stop();
 }
 
 
void saveToPdf()
{
  int pdfWidth = 1000;
  int pdfHeight = 1000;
  n++;
  PGraphics pdf = createGraphics(pdfWidth, pdfHeight, PDF, "test "+n+".pdf");
  println("Printing " + "test "+n+".pdf");
  pdf.beginDraw();
  pdf.background(255);
  //pdf.line(50, 50, 250, 250);
  
  
  //then the stuf we want to write to PDF
  pdf.pushMatrix();
  pdf.translate(100,100);
  pdf.scale((pdfHeight-200)/(eva.dimentions.y-eva.origin.y));
  pdf.translate(-eva.origin.x,-eva.origin.y);

  for(int a = 0; a < eva.paths.size(); a++)
  { 
    for(int b = 1; b < eva.paths.get(a).size(); b++)
    { 
      color nC = (color)(Integer) eva.colors.get(a) ;
      //make all white black to print on white paper
      if (nC == color(255))
      {
       nC =  color(0);
      }
      pdf.noFill();
      pdf.stroke(nC);
      pdf.strokeWeight((eva.dimentions.y-eva.origin.y) /( pdfHeight) );
      PVector loc_o_Node_A = eva.paths.get(a).get(b-1).getLoc();
      PVector loc_o_Node_B = eva.paths.get(a).get(b).getLoc();
      pdf.line(loc_o_Node_A.x, loc_o_Node_A.y,loc_o_Node_B.x, loc_o_Node_B.y);
     
    }
  } 

  pdf.popMatrix();
  pdf.fill(255);
  pdf.rect(pdfWidth-200,pdfHeight-200,200,200);
  pdf.image(QRCode,pdfWidth-200,pdfHeight-200);
  //close record channel
  pdf.dispose();
  pdf.endDraw();
    
}


void applyRuleset(String ref)  // the meaning of the characters and their actions are implemented here
{
  String current = ref;
  /*In order to make vector graphics, wee need to keep track of our position on the screen
  since we work with turtle graphics in generating the images, and vector graphics does not.
  Turtle graphics commands: 
  - forward
  - backward
  - rotate ++
  - rotate --
  - set color to green
  - set color to blue
  - set color to red
  Make sure these commands work in the same way as the vector output, in that they round
  in the same manner, etc.
  We also need to store the nuber theta and stepSize inside our genome somehow.
  Maybe create a "struct" in A genome, since it is starting point for reading. So the first 
  commands could be set theta to 8 and set length to 20. use some sort of binary addition
  way to construct these numbers out of letters.
  */
  boolean colorChange = false;

//shape features
  float direction = -PI/2;
  float gamma = theta;
  int stepSize = len;
  PVector pos = new PVector(0,0);//maybe initialise to midpoint of screen?
  PVector tempPos = new PVector(0,0);
  color nC = color(0);
//song features
  int semiTone = 0; //equals top in chromatic circle, the Tonic
  float time = 0.0;
  float duration = 4;

  //begin making the path
  
  eva.addNode(pos);
  eva.setColor(nC);
  
  for(int n=0; n< current.length(); n++)
  {
   
     char c = current.charAt(n); 
     
     switch(c)
     {
                 //A is reserved for "main" so no operand
                 
       case 'B': //BLUE
       nC = color(0,0,255);
       colorChange = true;
       rulesExecuted++;
       break;
       case 'C': //BACKWARD deleted for now, no need just turn
       
       break;
       case 'D': //DRAW dont add time
       tempPos.x = pos.x + cos(direction) * stepSize;
       tempPos.y = pos.y + sin(direction) * stepSize;
       eva.addNode(tempPos);
       eva.addNode(pos);
       //NOTE STUFF
       adam.addNote(time, duration, semiTone);
       rulesExecuted++;
       break;
       case 'E': //BACKWARD and DRAW and back in time
       pos.x -= cos(direction) * stepSize;
       pos.y -= sin(direction) * stepSize;
       eva.addNode(pos);
       //NOTE STUFF
       //adam.addNote(time, duration, semiTone);
       time -= duration;
       rulesExecuted++;
       break;
       case 'F': //FORWARD and DRAW add time
       pos.x += cos(direction) * stepSize;
       pos.y += sin(direction) * stepSize;
       eva.addNode(pos);
       //NOTE STUFF
       adam.addNote(time, duration, semiTone);
       time += duration;
       rulesExecuted++;
       break;
       case 'G': //GREEN
       nC = color(0,255,0);
       colorChange = true;
       rulesExecuted++;
       break;
       case 'H':
       
       break;
       case 'I':
       
       break;
       case 'J':
       
       break;
       case 'K':
              
       break;
       case 'L': //LENGTH x2
       stepSize *= 2;
       //NOTE STUFF
       duration *= 2;
       rulesExecuted++;
       break;
       case 'M': //LENGTH /2
       stepSize /= 2;
       //NOTE STUFF
       duration /= 2;
       rulesExecuted++;
       break;
       case 'N': 
       
       break;
       case 'O':
       
       break;
       case 'P':
       
       break;
       case 'Q':
       
       break;
       case 'R': //RED
       nC = color(255,0,0);
       colorChange = true;
       rulesExecuted++;
       break;
       case 'S': //BLACK
       nC = color(0);
       colorChange = true;
       rulesExecuted++;
       break;
       case 'U': //TURN C and SemiTone UP
       direction += gamma;
       //NOTE STUFF
       semiTone = (semiTone + 1);
       if(semiTone > 11) semiTone = 0;
       rulesExecuted++;
       break;
       case 'T': //UN-TURN CC and SemiTone DOWN
       direction -= gamma;
       //NOTE STUFF
       semiTone = (semiTone - 1);
       if(semiTone < -12) semiTone = 11;     
       rulesExecuted++;
       break;
       case 'V':
       
       break;
       case 'W': //WHITE
       nC = color(255);
       colorChange = true;
       rulesExecuted++;
       break;
       case 'X':
       
       break;
       case 'Y':
       
       break;
       case 'Z':
       
       break;
       
     }
      //execute commands to save a line to the complete shape when a new color is selected
    if(colorChange)
    {
      if(eva.writingList.size()>1 ) //only add paths that have more than one point
      {
        eva.addPath(); 
        eva.addNode(pos);        
      } 
      eva.setColor(nC);
      colorChange = false;
    }
  }//end of for loop
  /*
  Now we might still have a path in writinglist that needs to be added
  */

  if(eva.writingList.size()>1 ) //only add paths that have more than one point
    {
      eva.addPath();             
    } 

}

void keyPressed() {
  if (key == 'r') {
    mutateRate --;
  }
  if (key == 't') {
    mutateRate ++;
  }
   if (key == 'f') {
    unpackDepth --;
  }
  if (key == 'g') {
    unpackDepth ++;
  }
  if (key == 'v') {
    if (goRate <= 1)
    {
      goRate = goRate*2;
    }
      else
      {
        goRate ++;
      }
  }
  if (key == 'b') {
    if (goRate <= 1)
    {
      goRate = goRate/2;
    }
      else
      {
        goRate --;
      }
  }
}

void mousePressed()
{
  //savePdf = true;
  go = !go;
  eva.clear();
  adam.clear();
  //
//saveFrame("nice.gif");
}
/*
DNA is constructed with only char commands.
space is seperator, any char following represents the name of the gene
/ is end of the gene
example: AG/A GGB/G BC/B
would makeRuleset() as:
0-G
1-GB
2-GBC
3-GBCC
etc.
*/
class Dna{
  
  String seed;


  String DNA = " ";
  StringBuffer next = new StringBuffer(1000);
  
  Dna()
  {
  
  }
void set(String a)
/*
Sets the DNA to the A seed /A and B to Z as empty genes
*/
{
 DNA = a;
}
void reset()
{
  seed="A";
  DNA = " A";
  DNA += seed;
  DNA += "/A";
  for(int n = 1; n<26; n++)//set B to Z as empty commands
  {
    DNA += " "; //SPACE separator
    DNA += char(int('A')+n); //gene name
    DNA += char(int('A')+n); //initial command, only itself
    DNA += "/" + char(int('A')+n);   //endsign is / + gene name
  }

}


void setGene(char a, String g)
{
  /*set a gene into the specified letter
  */
  String piece = "";
  String now = "";
  char c = a;
  String gene = g;
   now += DNA.substring(0,DNA.indexOf(" "+c)+2);
   //pick out the old gene
   piece = DNA.substring(DNA.indexOf(" "+c)+2, DNA.indexOf( "/" + char(int(c)) ) );
   //replace with the new gene 
   piece = gene;
   //put the string back together
   now += piece;
   now += DNA.substring(DNA.indexOf( "/" + char(int(c)) ));
   DNA = now;  
}


void mutate()
/*
Randomly selects a charcter between B and Z and picks this part of the DNA.
Then adds a random character at the end of the piece.
A is out because it holds the seed
*/
{
  String piece = "";
  String now = "";
   char c = char(round(random(int('B'),int('Z')))); 
   now += DNA.substring(0,DNA.indexOf(" "+c)+2);
   piece = DNA.substring(DNA.indexOf(" "+c)+2, DNA.indexOf( "/" + char(int(c)) ) );
  //evolve the piece, add random character
   piece += char(round(random(int('B'),int('Z'))));
   //put the string back together
   now += piece;
   now += DNA.substring(DNA.indexOf( "/" + char(int(c)) ));
   DNA = now;  
}

void unpackSeed()
{
  /*
This walks through the seed, as stored in A, 
and looks at rest of the DNA for the rules to
apply for the characters.
It then stores the grown seed back into itself.
*/

  for(int n=0; n< seed.length(); n++)
  {
   char c = seed.charAt(n); 
   next.append(  DNA.substring(DNA.indexOf(" "+c)+2, DNA.indexOf( "/" + char(int(c)) ) )  );
  }
  seed = next.toString();
  next.delete(0,next.length());
}


}//eoc



class Note{

float time, length;
int semitone;
//Maybe make frequancy semitone for implementing the chromatic circle
/////////////////////////////////////////////constructors
  Note(float t, float l, int s)
  {
     time = t;
     length = l;
     semitone = s;
  }
  
  Note(Note a)
  {
   time = a.time;
   length = a.length;
   semitone = a.semitone;
  }
  
  /////////////////////////////////////////////accessors
  float getTime()
  {
    return time;
  }
  float getLength()
  {
    return length;
  }
  int getSemitone()
  {
    return semitone;
  }
  /////////////////////////////////////////////mutators
 


}//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////end node;




class Node{

PVector location;
/////////////////////////////////////////////constructors
  Node(int x, int y)
  {
    location = new PVector(x, y);
  }
  Node(PVector loc)
  {
    location = loc;
  }
  
  /////////////////////////////////////////////accessors
  PVector getLoc()
  {
    return location;
  }
  /////////////////////////////////////////////mutators
  void setLoc(int x, int y)
  {
    location = new PVector(x, y); 
  }


}//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////end node;



class Shape{

ArrayList<ArrayList<Node>> paths = new ArrayList<ArrayList<Node>>(); 
ArrayList<Node> writingList = new ArrayList<Node>();
ArrayList colors = new ArrayList();
color c = color(0);
PVector origin = new PVector(0,0); //keep track of size for scaling display
PVector dimentions = new PVector(0,0);


  Shape()
  {
    
  }

  void setColor(color a)
  {
    c = a;
  }
//wrinting to the writing list containing the points
  void addNode(PVector a)
  {
    PVector pos = new PVector(a.x,a.y);
    Node nuNode = new Node(pos);
    writingList.add(nuNode);
    //add info to the origin and dimentions
    //origin X
    
    if(pos.x<origin.x)
    {
      origin.x = pos.x;
    }
    //origen Y
    if(pos.y<origin.y)
    {
      origin.y = pos.y;
    }
    //dimentions X
    if(pos.x>dimentions.x)
    {
      dimentions.x = pos.x;
    }
    //dimentions Y
    if(pos.y>dimentions.y)
    {
      dimentions.y = pos.y;
    }
  }
  

  void display()
  {
    float ytemp = eva.dimentions.y-eva.origin.y;
    float xtemp = eva.dimentions.x-eva.origin.x;
    if(ytemp > xtemp)
    {
      strokeWeight((eva.dimentions.y-eva.origin.y) /( height-200)*10 );
    }
    else
    {
      strokeWeight((eva.dimentions.x-eva.origin.x) /( width-200)*10 );
    }
    
    //draw a dot where the shape begins
    PVector loc_o_Node_A = paths.get(0).get(0).getLoc();
    point(loc_o_Node_A.x, loc_o_Node_A.y);
    if(ytemp > xtemp) //stupidly complicated for correct scaling purposes
    {
      strokeWeight((eva.dimentions.y-eva.origin.y) /( height-200) );
    }
    else
    {
      strokeWeight((eva.dimentions.x-eva.origin.x) /( width-200) );
    }
 
  noFill();
       
  for(int a = 0; a < paths.size(); a++)
  { 
    for(int b = 1; b < paths.get(a).size(); b++)
    { 
      color nC = (color)(Integer) colors.get(a) ;
     
      stroke(nC);
      
      loc_o_Node_A = paths.get(a).get(b-1).getLoc();
      PVector loc_o_Node_B = paths.get(a).get(b).getLoc();
      line(loc_o_Node_A.x, loc_o_Node_A.y,loc_o_Node_B.x, loc_o_Node_B.y);
    }
  } 
  }

void addPath()
{
   paths.add(writingList);//add the written list to the ArrayList!
   colors.add(c);
   writingList = null;
   writingList = new ArrayList<Node>();
}
//to draw into the list

void clear()
{
paths.clear();
writingList.clear();
colors.clear();
origin = new PVector(0,0); 
dimentions = new PVector(0,0);
}
}




class Song{

ArrayList<Note> writingList = new ArrayList<Note>();
float tonic = 200; //Hz
float songLength; //for keeping track of the duration of the song


  Song()
  {
    //maybe set Tonic here
  }

//wrinting to the writing list containing the points
  void addNote(float t, float l, int s)
  {
    Note in = new Note(t, l, s);
    Note nuNote = new Note(in);
    writingList.add(nuNote);
    //keep track of the song length
    float now = in.time + in.length;
    if(now > songLength) songLength = now;
  }
  

  void play()
  {
  out = minim.getLineOut();
  float t, l, s=tonic;
  int angle;
  for(int a = 0; a < writingList.size(); a++)
  { 
      t = writingList.get(a).getTime();
      l = writingList.get(a).getLength();
      angle = writingList.get(a).getSemitone();
      //adapt the scales to fit base frequency of 261.63 C4 and 130.81 C3
      //and rewrite the error of the sharps resulting in wrong notes being played 
      if(angle == 0) { s= 261.63 ;}
       if(angle == 1) {s=277.19 ;}
       if(angle == 2) {s=293.67 ; }
       if(angle == 3) {s=311.13 ; }
       if(angle == 4) {s=329.63 ; }
       if(angle == 5) {s=349.23 ; }
       if(angle == 6) {s=370.00 ; }
       if(angle == 7) {s=392.00 ; }
       if(angle == 8) {s=415.31 ; }
       if(angle == 9) {s=440.01 ; }
       if(angle == 10) {s=466.17 ; }
       if(angle == 11) {s=493.89 ; }
       if(angle == -1) {s=246.94 ;}
       if(angle == -2) {s=233.08 ; }
       if(angle == -3) {s=219.99 ; }
       if(angle == -4) {s=207.65 ; }
       if(angle == -5) {s=195.99 ; }
       if(angle == -6) {s=184.99 ; }
       if(angle == -7) {s=174.61 ; }
       if(angle == -8) {s=164.81 ; }
       if(angle == -9) {s=155.56 ; }
       if(angle == -10) {s=146.83 ; }
       if(angle == -11) {s=138.59 ; }
        if(angle == -12) {s=130.81 ; }
      out.playNote( t, l, s );
    }
  } 
  

void clear()
{
writingList.clear();
songLength = 0.0;
out.close();
}
}





