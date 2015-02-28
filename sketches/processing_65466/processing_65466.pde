
/* Code for Generating Music from Phrase Structure Rules.
The current rules are based entirely on "Mary Had a Little Lamb"
by Adam Meyers. Please feel free to copy, redistribute and change
this code. This software is licensed under the CC-GNU LGPL.
See http://creativecommons.org/licenses/LGPL/2.1/
*/

import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;



AudioOutput out;

TriangleWave myWave; // Create triangle waveform
float pitch = 20;
int NotePause = 174; // pause between notes
int counter=0;
int quarterNoteDuration = 100; // Duration of each quarter note
int maxSongLength = 6000; 
/* Allows a total of 6000 notes
For example, 6000 .3 second quarter notes would generate 30 minutes of music  */      
int songLength = 0;  // Not used
boolean OnOrOff = true;  // Not used
String[] terminalNodeArray = new String[maxSongLength];
                           

int numberOfTerminalRules = 7;
int numberOfNonTerminalRules = 7;
int numberOfTerminals = 3;
int numberOfNonTerminals = 5;

int NumberOfNotes;
String startSymbol = "Song";
boolean Done = false;

// FactoredMetaGrammar is in Backusâ€“Naur Form (BNF)
// This means that rules with the same left hand side
// are merged together to represent a disjunction.
// For example, X --> AB and X ---> CD become X --> AB | CD
//
FactoredGrammar FactoredMetaGrammar1;

    
class NotePair {float freq; float relTime; 
      NotePair(float frequency, float relativeTime){
        freq = frequency; 
        relTime = relativeTime;
      }
    }
    
class TerminalRule {String NonTerminal; NotePair value;
// Rule of the form Nonterminal --> terminal
// Note this style of Context-free rules is Chomsky Normal form (without the empty string)
 TerminalRule(String NonTerm, NotePair val){
   NonTerminal = NonTerm;
   value = val;
 }
}

class NonTerminalRule {String NonTerminal; String[] value;
// Rule of the form NonTerminalRule --> sequence of Nonterminals
 NonTerminalRule(String NonTerm, String[] val){
   NonTerminal = NonTerm;
   value = val;
 }
}
   
class TerminalRuleSet {String NonTerminal; NotePair[] value; int numberOfVals;
// Disjunctive Grouping of possible right hand sides for a given left hand side (terminal rules)
 TerminalRuleSet(String NonTerm, NotePair[] val, int number){
   NonTerminal = NonTerm;
   value = val;
   numberOfVals = number;
 }
}

class NonTerminalRuleSet {String NonTerminal; String[][] value; int numberOfVals;
// Disjunctive Grouping of possible right hand sides for a given left hand side (NonTerminal rules)
 NonTerminalRuleSet(String NonTerm, String[][] val, int number){
   NonTerminal = NonTerm;
   value = val;
   numberOfVals = number;
 }
}

class Grammar {NonTerminalRule[] NonTerminalRules; TerminalRule[] TerminalRules;
 Grammar(NonTerminalRule[] NTRules, TerminalRule[] TRules){
  NonTerminalRules = NTRules;
  TerminalRules = TRules;
 }
}

class FactoredGrammar {NonTerminalRuleSet[] NonTerminalRules; TerminalRuleSet[] TerminalRules;
 FactoredGrammar(NonTerminalRuleSet[] NTRules, TerminalRuleSet[] TRules){
  NonTerminalRules = NTRules;
  TerminalRules = TRules;
 }
}


void setup() 
{
  // initialize grammar
  /* 
  metaGrammar1.TerminalRules[0] = new TerminalRule("Quarter",new NotePair(62,1));
  metaGrammar1.TerminalRules[1] = new TerminalRule("Quarter",new NotePair(60,1));
  metaGrammar1.TerminalRules[2] = new TerminalRule("Quarter",new NotePair(64,1));
  metaGrammar1.TerminalRules[3] = new TerminalRule("Quarter",new NotePair(67,1));
  metaGrammar1.TerminalRules[4] = new TerminalRule("Half",new NotePair(67,2));
  metaGrammar1.TerminalRules[5] = new TerminalRule("Half",new NotePair(62,2));
  metaGrammar1.TerminalRules[6] = new TerminalRule("Whole",new NotePair(60,4));
  metaGrammar1.NonTerminalRules[0] = new NonTerminalRule("FinalMeasure",{"Whole");
  metaGrammar1.NonTerminalRules[1] = new NonTerminalRule("Measure",{"Quarter", "Quarter", "Quarter", "Quarter");
  metaGrammar1.NonTerminalRules[2] = new NonTerminalRule("Measure",{"Quarter", "Quarter", "Half");
  metaGrammar1.NonTerminalRules[3] = new NonTerminalRule("Group",{"Measure", "Group"});
  metaGrammar1.NonTerminalRules[4] = new NonTerminalRule("Group",{"Measure", "Measure", "Measure", "Measure"});
  metaGrammar1.NonTerminalRules[5] = new NonTerminalRule("SuperGroup",{"Group", "Group", "Group", "Group"});
  metaGrammar1.NonTerminalRules[6] = new NonTerminalRule("Song",{"SuperGroup", "SuperGroup", "FinalMeasure"});
  */
  
   numberOfTerminals = 3;
   numberOfNonTerminals = 5;
   TerminalRuleSet[] TR;
   NonTerminalRuleSet[] NR;    
   TR = new TerminalRuleSet[numberOfTerminals];
   NR = new NonTerminalRuleSet[numberOfNonTerminals];
   
   NotePair[]NP;
   String[][] RightSideOfRules;
   NP = new NotePair[4];
   NP[0] = new NotePair(62,1);
   NP[1] = new NotePair(60,1);
   NP[2] = new NotePair(64,1);
   NP[3] = new NotePair(67,1);
   TR[0] = new TerminalRuleSet("Quarter",NP,4);
   NP = new NotePair[2];
   NP[0] = new NotePair(67,2);
   NP[1] = new NotePair(62,2);
   TR[1] = new TerminalRuleSet("Half",NP,2);
   NP = new NotePair[1];
   NP[0] = new NotePair(60,4);
   TR[2] = new TerminalRuleSet("Whole",NP,1);
   
   RightSideOfRules = new String[1][4];
   RightSideOfRules[0][0] = "SuperGroup";
   RightSideOfRules[0][1] = "SuperGroup";
   RightSideOfRules[0][2] = "FinalMeasure";
   RightSideOfRules[0][3] = "Done";
   NR[0] = new NonTerminalRuleSet("Song",RightSideOfRules,1);
   
   RightSideOfRules = new String[1][5];
   RightSideOfRules[0][0] = "Group";
   RightSideOfRules[0][1] = "Group";
   RightSideOfRules[0][2] = "Group";
   RightSideOfRules[0][3] = "Group";   
   RightSideOfRules[0][4] = "Done";
   NR[1] = new NonTerminalRuleSet("SuperGroup",RightSideOfRules,1);
   
   RightSideOfRules = new String[2][5];
  RightSideOfRules[0][0] = "Group";
  // RightSideOfRules[0][0] = "Measure";
   RightSideOfRules[0][1] = "Measure";
   //RightSideOfRules[0][2] = "Group";
   RightSideOfRules[0][2] = "Measure";
   RightSideOfRules[0][3] = "Done";
   RightSideOfRules[0][4] = "Done";
   RightSideOfRules[1][0] = "Measure";
   RightSideOfRules[1][1] = "Measure";
   RightSideOfRules[1][2] = "Measure";
   RightSideOfRules[1][3] = "Measure";
   RightSideOfRules[1][4] = "Done";
   NR[2] = new NonTerminalRuleSet("Group",RightSideOfRules,2);
   
   RightSideOfRules = new String[2][5];
   RightSideOfRules[0][0] = "Quarter";
   RightSideOfRules[0][1] = "Quarter";
   RightSideOfRules[0][2] = "Quarter";
   RightSideOfRules[0][3] = "Quarter";
   RightSideOfRules[0][4] = "Done";
   RightSideOfRules[1][0] = "Quarter";
   RightSideOfRules[1][1] = "Quarter";
   RightSideOfRules[1][2] = "Half";
   RightSideOfRules[1][3] = "Done";
   RightSideOfRules[1][4] = "Done";
   NR[3] = new NonTerminalRuleSet("Measure",RightSideOfRules,2);
   
   RightSideOfRules = new String[1][2];
   RightSideOfRules[0][0] = "Whole";
   RightSideOfRules[0][1] = "Done";
   NR[4] = new NonTerminalRuleSet("FinalMeasure",RightSideOfRules,1);
   
   FactoredMetaGrammar1 = new FactoredGrammar(NR,TR);
   
  songLength = 0;
   size(512, 200);
   frameRate(4000);
  // always start Minim before you do anything with it
  // Minim.start(this); old code
  Minim minim;
  minim = new Minim(this);
  // get a line out from Minim, default sample rate is 44100, bit depth is 16
  // out = Minim.getLineOut(Minim.STEREO, 512); old code
   out = minim.getLineOut();
  
  // create a Triangle wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate 44100 to match the line out
  for (int i = 0; i < 3; i = i+1) {
    println(i);
    // myWave = new TriangleWave(440*i, 0.2, 44100);
    myWave = new TriangleWave(23*(pow(2,i)), 0.2, 44100);
    out.addSignal(myWave);
  }
  for (int i = 0; i < maxSongLength; i = i+1)
  {
    terminalNodeArray[i] = "Done";
  }
  FillTerminalNodeArray(startSymbol,FactoredMetaGrammar1);
  songLength=0;
}

void draw() {
  background(0);
  if (terminalNodeArray[songLength] == "Done")
  {
 stop(); 
 Done = true; 
println("Done");
  }
  else
{ 
  playSymbol(terminalNodeArray[songLength],FactoredMetaGrammar1);
 songLength++;
 }   
  } // Plays song
  

public boolean playTerminal (String NonTerminal, TerminalRuleSet TerminalRules[]) {
// Different symbols could be linked to different playback functions.
// Thus it should be possible to extend this to snippets, rests, etc.
// Initially, however, we will assume that all terminals expand to NotePairs
  for (int i = 0; i < numberOfTerminals; i++){
  if (TerminalRules[i].NonTerminal == NonTerminal) 
  {
    playNotePair(TerminalRules[i].value[int(random(TerminalRules[i].numberOfVals))]);
    println("" +TerminalRules[i].NonTerminal + " --> some note");
    return true;
  }}
  println("false");
  return false;
}

public void playSymbol(String NonTerminal,FactoredGrammar Grammar)
{ println("Notes: " + songLength);
  if (NonTerminal != "Done") {
    playTerminal(NonTerminal, Grammar.TerminalRules);
      } 
  }

public boolean FillTerminalNodeArray(String NonTerminal,FactoredGrammar Grammar)
{ int rulePosition;
  int symbolPosition;
  if (!(recordTerminal(NonTerminal,Grammar.TerminalRules)))
  {  
  for (int i = 0; i<= numberOfNonTerminals; i++){
  if (Grammar.NonTerminalRules[i].NonTerminal == NonTerminal){
    rulePosition = int(random(Grammar.NonTerminalRules[i].numberOfVals));
    symbolPosition = 0;
    print("" + NonTerminal + " -->");
    while (Grammar.NonTerminalRules[i].value[rulePosition][symbolPosition] != "Done") {
     print(" " + Grammar.NonTerminalRules[i].value[rulePosition][symbolPosition]);
     symbolPosition++;
    }
    println();
   symbolPosition = 0;
    while (Grammar.NonTerminalRules[i].value[rulePosition][symbolPosition] != "Done") {
      FillTerminalNodeArray(Grammar.NonTerminalRules[i].value[rulePosition][symbolPosition], Grammar);
      symbolPosition++;
    }
    return true;
}}}
  return false;
}


public boolean recordTerminal (String NonTerminal, TerminalRuleSet TerminalRules[]) {
  for (int i = 0; i < numberOfTerminals; i++){
  if (TerminalRules[i].NonTerminal == NonTerminal) 
  {
    terminalNodeArray[songLength] = NonTerminal;
    songLength++;
    println("" +TerminalRules[i].NonTerminal + " --> some note");
    return true;
  }}
  println("false");
  return false;
}

public void playNotePair (NotePair pair){
  int delayTime;
  songLength++;
  out.noSound();
  delay(NotePause);
  out.sound();
  myWave.setFreq(midiToFreq(pair.freq));
  delayTime = int(pair.relTime * quarterNoteDuration);
    // println("Delay: " + delayTime);
    delay(int(pair.relTime * quarterNoteDuration));
}

/* Sam Pluta's midi to freq function 
*/
public float midiToFreq(float midi) {
  float freq = (8.1758 * pow(2, midi/12.0));
  // println("freq: "+freq);
  return freq;
}

  
void stop() 
{
  out.close();
  super.stop();
}


