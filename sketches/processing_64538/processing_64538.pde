
//TODO: figure out why random() sucks so hard. 
/**Updated 6/20/12
@Author Anna Novikova
@Version 0.2
@Since  6/20/12
*/

import java.lang.Math;
import java.util.HashSet;
import java.util.Scanner;
//reader to take file input to populate collection of words. TAKES TAB DELIMMITED FILE. 
InputStream input;
String filename= "input.txt";

//the x coordinates of the ends of the spectrum
int leftaxisbound;
int rightaxisbound;
//the length of the spectrum
int axiswidth;

//the coordinates of the middle pixels of the canvass
float ycenter;
float xcenter;

//names of the poles
String leftPole= "pole";
String rightPole= "otherpole";

//global collection of words
HashSet<Word> words= new HashSet<Word>();

void setup(){
  size( 750, 375 );
  leftaxisbound=50;
  rightaxisbound= width-50;
  ycenter=height/2.0;
  xcenter=width/2.0;
  axiswidth=rightaxisbound-leftaxisbound;
  input=createInput(filename);
  Scanner file= new Scanner(input);
  while(file.hasNextLine()){
    String curLine=file.nextLine();
    Scanner s= new Scanner(curLine).useDelimiter("\\t\\s*");
    String thisword= s.next();
    Float thisfloat= s.nextFloat();
    int thisint= s.nextInt();
    Word w= new Word(thisword, thisfloat, thisint);
    //Word w= new Word(s.next(), s.nextFloat(), s.nextInt());
    words.add(w); 
  }
  
}
//void mousePressed(){
  //redraw();
//}

void draw(){
  background(0);
  stroke(255,0,0);
  line(leftaxisbound, 5.0*height/6, leftaxisbound , height/6);
  stroke(0,0,255); 
  line(rightaxisbound, 5.0*height/6, rightaxisbound , height/6); 
  for(Word word: words){
    word.draw();
    word.adjust();
  }
  textSize(20);
  textAlign(CENTER);
  pushMatrix();
  fill(255, 0, 0);
  float tx= leftaxisbound-10;
  float ty= ycenter;
  translate(tx, ty);
  rotate(-PI/2);
  text(leftPole,0, 0);
  popMatrix();
 
  fill(0, 0, 255);
  pushMatrix();
  tx= rightaxisbound+10;
  ty= ycenter;
  translate(tx,ty);
  rotate(PI/2);
  text(rightPole, 0, 0);
  popMatrix();
  //saveFrame();
  //delay(1000);
}

class Word{
  String word;
  int freq;
  float xscore;
  float ypos;
  float xpos;
  
 public Word(String w, int frequency, float xscore){
    this.word=w;
    this.xscore=xscore;
    int upperbound= height;
    int lowerbound= frequency;
    this.ypos=random(lowerbound,upperbound);
    println("initial y position is: " + this.ypos);
    this.freq=frequency;
    this.xpos=0;
  }
  public Word(String w, float xscore, int frequency){
    this.word=w;
    this.xscore=xscore;
    int upperbound= height;
    int lowerbound= frequency;
    this.ypos=random(lowerbound,upperbound);
    this.freq=frequency;
    this.xpos=0;
  }
  public Word(Word w){
    this.word=w.word;
    this.xscore=w.xscore;
    this.ypos=w.ypos;
    this.freq=w.freq;
    this.xpos=w.xpos;
  }
 public void draw(){
   if(this.freq>0){
     textSize(this.freq);
   }
   if(xscore>0){
     textAlign(RIGHT);
   }
   else if(xscore<0){
     textAlign(LEFT);
   }
   else{
     textAlign(CENTER);
   }   
   float scaled;
   float rval= (xscore*-127)+127;
   float bval= (xscore*127)+ 127;
   fill(rval, 0, bval);
   if(this.xpos==0){
     this.xpos=(xscore+1)*((axiswidth)/2) + leftaxisbound;
   }
   text(this.word, this.xpos, this.ypos);
 }
 
 //Returns True if this Word overlaps a given word (w). 
 Boolean overlap(Word w){
   if (((this.rightbound()> w.leftbound() && this.rightbound()< w.rightbound()) 
                   || (this.leftbound()> w.leftbound() && this.leftbound()< w.rightbound()))//){
                    // println("Either " + this.rightbound() + " or "+ this.leftbound() + " is between " + w.rightbound() +" and " + w.leftbound());
                   
           &&
           //if
           ((this.topbound()>w.topbound() && this.topbound()<w.bottombound()) 
                  || (this.bottombound()>w.topbound() && this.bottombound()<w.bottombound())))
             {
               println("Overlap confirmed. Either " + this.topbound() + " or "+ this.bottombound() + " is between " + w.topbound() +" and " + w.bottombound());
               println("overlap found: " + this.word + " and " + w.word);
                return true;
         
    }
    else{
      //println("No overalps here:" + this.rightbound()+" and " + this.leftbound()+ " are not between " +w.leftbound() + " and " + w.rightbound());
      //println("In additon, " + this.topbound()+" and "+ this.bottombound()+ " are not between "+ w.topbound()+" and "+ w.bottombound());
      return false;
    }
 }
 
 float leftbound(){
   if(this.xscore<0){
     return this.xpos;
   }
   else if(this.xscore>0){
     return this.xpos-textWidth(this.word);
   }
   else{
     return this.xpos- (textWidth(this.word)/2.0);
   }
 }
 
 float rightbound(){
   if(this.xscore<0){
     return this.xpos+textWidth(this.word);
   }
   else if(this.xscore<0){
     return this.xpos;
   }
   else{
     return this.xpos+(textWidth(this.word)/2);
   }
 }
 
 float topbound(){
   return this.ypos-this.freq;
 }
 
 float bottombound(){
   return this.ypos;
 }
 
 void adjust(){
   HashSet<Word> newwords= new HashSet<Word>();
   for(Word w: words){
     if(!this.equals(w) && this.overlap(w)){
       Word neww= new Word(w);
       //if(this.ypos < ycenter){
       if(random(1)>.5){
         if(w.topbound() >= 0){this.ypos= w.topbound();}
       }
       else {//if(this.ypos> ycenter){
         if(w.bottombound()+this.freq < height){this.ypos=w.bottombound()+this.freq;}
       }
       redraw();
       //newwords.add();
     }
    else{
      newwords.add(w);
    }
   }
  }
}

