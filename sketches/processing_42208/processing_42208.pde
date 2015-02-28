
//this code requires rita wordnet library

/***********************************************************************

 cc non commercial share alike 2011 Tom Schofield tsArt

  * All rights reserved.

 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 

 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 

 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE

 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE

 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES

 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS 

 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY

 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 

 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED

 * OF THE POSSIBILITY OF SUCH DAMAGE. 

 *

 * ***********************************************************************/ 








//import libraries
import rita.wordnet.*;

RiWordnet wordnet;

//global variables. we will use these all through the program
String word;
String searchWord;
ArrayList display;
int myLimit=0;

PFont font;

int limiter=16;

//setup happens once and only once at the beginning
void setup() {
  //set the size of the screen
  size(800,600);
  //an arraylist is a data structure for holding variable quantities of data
  display=new ArrayList();
  frameRate(20);
  //font=loadFont("MicrosoftSansSerif-36.vlw");
  font=loadFont("Courier-Bold-36.vlw");
  textFont(font,36);
  
  //make a wordnet object
  wordnet = new RiWordnet(this);
  //get a random word (a verb) from the wordnet dictionary
  searchWord=wordnet.getRandomWord("v");
  
}


void draw() {
  background(0);
  text(searchWord, width-textWidth(searchWord)-50, height/2);
  if(frameCount%60==0) {
    display=new ArrayList();
    recur(1,searchWord);
  }
    for(int i=0;i<display.size();i++) {
      String displayMe=(String)display.get(i);
      fill(255,50+(map(cos(map(i,0,limiter,-PI/2,PI/2)),0,1,0,150)));
      text(displayMe,50+(i*10),36+(i*36));
      println(i+" "+cos(map(i,0,limiter,-PI/2,PI/2)));
  }
}


void recur( int level, String thisWord) {
  

  String [] syns=wordnet.getSynonyms(thisWord, "v");
  try {
    thisWord=syns[0];
  }
  catch(Exception e) {
    println(e);
  }

  // text("I will "+thisWord,50+(level*10),(level*36));
  String temp="I will "+thisWord;
  display.add(temp);
  println(display.size());
  if(level<limiter) {
    level++;
    recur( level, thisWord);
  }
}

void keyPressed() {
  searchWord=wordnet.getRandomWord("v");
   display=new ArrayList();
  recur(1,searchWord);
}


