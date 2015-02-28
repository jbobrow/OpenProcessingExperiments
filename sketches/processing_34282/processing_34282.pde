
/*
 * Genome Audio Visual
 * Reads in a genome, splits it into triplets and generates an audio-visual representation of the DNA decode.
 * 
 * Search for start code (ATG) and then output relevant amino acids as interconnected dots until 
 * a stop code is detected (TAG or TAA or TGA).
 * Each amino acid has its own audio tone. 
 * Each amino acid string take a different random colour. A string would normall code for a protein.
 * When a stop code is detected, search for next start code to begin next string. 
 * The quiet times occur while the softare skips througn the junk DNA.
 *
 * This program gives some feel for the complexity of Genomes.
 * The yeast is 2,624 codons (triplets) long, the sample virus (adenovirus - read about it on Wikipedia)
 * is 12,000.
 * Don't even think about loading the human genome at around 3 billion codons.
 * 
 * On the left hand side of the display is a list of the 20 amino acids. As the decoding progresses a barchart is 
 * updated showing their relative use for the particular genome.
 * 
 * Press UP/DOWN keys to speed up/slow down the display updates. 
 * 
 * There is a problem with the audio freezing sometimes and a buffer underrun error comes up when the program starts.
 * If anyone can shed light on this I would appreciate feedback. 
 *
 * Geo Meadows iss A 22 Aug 2011
 */
 
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
SineWave sine;
int i=0;
int num = 2;  // length of amino buffer 
int range = 30;
float[] ax = new float[num];
float[] ay = new float[num]; 
int[] c = new int[num];
int col=0;
int del = 145;

String[] lines;
String allcodes;
String start = "ATG";
String stop1 = "TAG";
String stop2 = "TAA";
String stop3 = "TGA";
int aminoflag=0, codelen=0;
String[] aminos = {"TTT","Phe","TCT","Ser","TAT","Tyr","TGT","Cys","TTC","Phe","TCC","Ser","TAC","Tyr","TGC","Cys","TTA","Leu","TCA","Ser","TAA","STOP","TGA","STOP","TTG","Leu","TCG","Ser","TAG","STOP","TGG","Trp","CTT","Leu","CCT","Pro","CAT","His","CGT","Arg","CTC","Leu","CCC","Pro","CAC","His","CGC","Arg","CTA","Leu","CCA","Pro","CAA","Gln","CGA","Arg","CTG","Leu","CCG","Pro","CAG","Gln","CGG","Arg","ATT","Ile","ACT","Thr","AAT","Asn","AGT","Ser","ATC","Ile","ACC","Thr","AAC","Asn","AGC","Ser","ATA","Ile","ACA","Thr","AAA","Lys","AGA","Arg","ATG","Met","ACG","Thr","AAG","Lys","AGG","Arg","GTT","Val","GCT","Ala","GAT","Asp","GGT","Gly","GTC","Val","GCC","Ala","GAC","Asp","GGC","Gly","GTA","Val","GCA","Ala","GAA","Glu","GGA","Gly","GTG","Val","GCG","Ala","GAG","Glu","GGG","Gly"};
String[] aminonames = {"Ala","Arg","Asn","Asp","Cys","Glu","Gln","Gly","His","Ile","Leu","Lys","Met","Phe","Pro","Ser","Thr","Trp","Tyr","Val"};
int[] aminocount;
int[] hz;
int minhz = 220;
int loaded = 0;
String fileIn = "";
boolean persist = true;

void setup() {
  colorMode(HSB, 100);
  size(800, 480);
   //set up pythagorean tones
  hz = new int[64]; 
  int F=minhz;
  for (int i=0; i<57; i+=7) {
  hz[i]=F; hz[i+1] = F*9/8; hz[i+2]=F*81/64; hz[i+3]=F*4/3; hz[i+4]=F*3/2; hz[i+5]=F*27/16; hz[i+6]=F*243/128;
  F+=minhz;
  }
  aminocount = new int[20];
  
   //set up display points with colors
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
    c[i] = 10;
  }
   minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
   out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
   sine = new SineWave(40, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator
   sine.portamento(50);
  // add the oscillator to the line out
   out.addSignal(sine);
}

void draw() { 
  PFont font;
  font = loadFont("ComicSansMS-48.vlw");
  textFont(font, 16);  
  if (loaded == 0) {
     background(20);
     text ("Select GENOME type:  1-yeast, 2-virus", 10, 18);
     if ((keyPressed) && ((key=='1')||(key=='2')||(key=='3'))) {
        if (key == '1') {fileIn = "yeast-yeP24.txt"; } 
        if (key == '2') {fileIn = "adenovirus.txt"; }
    //    if (key == '3') {fileIn = "tb-bact.txt";}  
        lines = loadStrings(fileIn);
        allcodes = join(lines,"");
        codelen = allcodes.length(); 
        background(20);
        textAlign(CENTER);
        String s1 = str(codelen/3) + " CODONS loaded - ESC to exit"; 
        textFont(font, 16);
        text (s1, width/2, 18);
        textAlign(LEFT);
        for (i=0; i<20; i++) {       
          text (aminonames[i], 4, 80+i*16);
        }
        loaded = 1;   
     }
   }
 
 else {
    
    if (aminoflag == 1) { drawAmino(); }
    nextCodeSound();
    //show progress bar
    fill(0,0,255);
    textAlign(LEFT);
    text ("Progress", 2, height-14);
    stroke(50,255,255);
    rect(0,height-8,i*width/codelen,8); 
    if (i > codelen-4) { stop(); }
    if (keyPressed) {
      if (key == CODED) {
        if ((keyCode == UP) && (del>5)) {del -=10; } 
        if (keyCode == DOWN) {del +=10; }
        if (keyCode == ESC) { exit(); } 
      } 
    }
  }
} 

void nextCodeSound() {
    String code = allcodes.substring(i,i+3);  
    if ( start.equals(code) == true) {
      aminoflag=1;    
      float freq = hz[0];
      sine.setFreq(freq); 
      aminocount[12] += 1;
    }
    else if ((stop1.equals(code) == true) || (stop2.equals(code) == true) || (stop3.equals(code) == true) ) {
      aminoflag=0; 
      col=int(random(0,100));
      sine.setFreq(10);
    }
     else if (aminoflag==1) {
         for (int j=0; j<128; j+=2) {
         if (aminos[j].equals(code) == true) {
           for (int n=0; n<20; n++) {
             if (aminonames[n].equals(aminos[j+1]) == true) {
               aminocount[n] +=1;
      //        println("ptr = " + i +  "  Hz = " + hz[j/8] + " " + aminos[j+1] + " count = " + aminocount[n] );
             }
           }
         float freq = hz[j/4]/2; // select frequency related to amino acid
         sine.setFreq(freq);  
      }
    }     
  } 
  i+=3;
}

 void drawAmino() {
//  if (!persist) background(20);    
  for(int k = 1; k < num; k++) {      // Shift all point elements 1 place to the left
      ax[k-1] = ax[k];
      ay[k-1] = ay[k];
      c[k-1] = c[k];
      }
      
    // Put a new value at the end of the array
      ax[num-1] += random(-range, range);
      ay[num-1] += random(-range, range);
      c[num-1] = col;
    
     // Constrain points 
      ax[num-1] = constrain(ax[num-1], 40, width-5);
      ay[num-1] = constrain(ay[num-1], 30, height-28);    
     
     // add barchart
      stroke(0,0,0);
      fill(50,30,130);
      for(int k=0; k<20; k++) {
        rect(34, 80+k*16-12, aminocount[k],10);
        } 
     
      // Draw a line connecting the points
      for(int k=1; k<num; k++) {    
        stroke(c[k],255,255);
        line(ax[k-1], ay[k-1], ax[k], ay[k]);
        fill(c[k],255,255);
        ellipse(ax[k], ay[k], 6,6);
      }  

      delay(del);
}

void stop()
{
  out.close();
  minim.stop();  
  super.stop();
  exit();
}

