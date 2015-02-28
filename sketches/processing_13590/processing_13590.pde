
import java.util.Iterator;

import arb.soundcipher.*;
import arb.soundcipher.constants.*;

SoundCipher sc = new SoundCipher(this);

color[] palette = new color[]{
  color(255,0,0),
  color(255,255,0),
  color(0,255,0),
  color(0,255,255),
  color(0,0,255),
  color(255,255,255)
};

// campanology
// bell-ringing simulator
// by Steven Kay, Oct 2010

class SJT implements Iterator {
  
  // this class returns a successive series of
  // unique combinations of numbers in the set 1..N
  // each combination differs from the previous by exactly one number swap, and each
  // combination will only be returned once.
  // This means the sequence of numbers (representing notes) follow 'change ringing' rules
  //
  // The number of combinations for N bells is N! (N factorial)
  // The algorithm is the Steinhaus-Johnson-Trotter algorithm
  //
  // algorithm defined here
  // http://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm
  //
  // but a much better explanation here :)
  // http://tropenhitze.wordpress.com/2010/01/25/steinhaus-johnson-trotter-permutation-algorithm-explained-and-implemented-in-java/
  //
  
  int[] nums; // numbers
  int[] dirs; // direction of mobility (-1=left, +1=right)
  int BELLS; // number of bells
  boolean finished; // set to true once exhausted all permutations
  
  int L=-1;
  int R=+1;
  
  public SJT(int bells) {
    BELLS=bells;
    nums=new int[bells];
    dirs=new int[bells];
    for (int i=0;i<bells;i++) {
      dirs[i]=L;
      nums[i]=i+1;
    }
  }
  
  // get largest value <= c
  // return int[2] [value,position]
  // if none, return [-1,-1]
  
  int[] getLargest(int c) {
    
    int k=-1;
    int kix=-1;
    
    for (int i=0;i<BELLS;i++) {
      if (nums[i]>k && nums[i]<=c) {
        k=nums[i];
        kix=i;
      }
    }
    
    return new int[]{k,kix};
      
  }
  
  // return an integer array, giving the bell numbers to ring on this occasion.
 
  public int[] next() {
        
    // find k, the largest mobile integer, and its position kix
    int k=0;
    int kix=0;
    
    int[] res=new int[2];
    int bellmax=BELLS;
    res=getLargest(bellmax);
    
    k=res[0];
    kix=res[1];
        
    // swap max mobile integer with the slot to its left/right according to direction
    // but only if that value is less than current value, and not on the edges
    
    int swapwith=0;
    for (int j=0;j<BELLS;j++) {
      swapwith=kix+dirs[kix];
      // if it's not mobile, keep trying with successively smaller numbers
      if(swapwith<0 || swapwith>BELLS-1 || (nums[kix+dirs[kix]]>k) ) {
        res=getLargest(bellmax--);
        k=res[0];
        kix=res[1];
      }
    }
    
    // done?
    if (swapwith==-1) {
    	finished=true;
    	return null;
    }
    
    // swap values
    int temp;
    temp=(int)nums[swapwith];
    nums[swapwith]=nums[kix];
    nums[kix]=temp;    
    
    //swap directions too
    temp=dirs[swapwith];
    dirs[swapwith]=dirs[kix];
    dirs[kix]=temp;
    
    // reverse direction of all integers > k
    for (int i=0;i<BELLS;i++) {
      if (nums[i]>k) {
        dirs[i]*=-1;
      }
    }
   
    return nums;
  }
  
  public boolean hasNext() {
    return !finished;
  }
  
  public void remove() {
    ;
  }
  
  public String toString() {
    StringBuffer sb=new StringBuffer();
    for (int i=0;i<BELLS;i++) {
      sb.append(nums[i]);
      if (dirs[i]==-1) sb.append("<");
      if (dirs[i]==1) sb.append(">");
      sb.append(" ");  
    }
    sb.append("");
    return sb.toString();
  }
}

SJT seq;
int i=1;

int ix=0; // cursor
int maxix=0; // last note index
int phrase_start=0; // current note cursor

// used to draw bell patterns
int x=0;
int y=0;
int columnx=0; // start of column x coord

int xw=4; // size of cells
int yw=18;
int xs=5; // spacing of cells
int ys=19;

ArrayList pitches;

void setup() {
  seq=new SJT(6); // number of bells
  size(512,512);
  frameRate(8);
  sc.instrument(sc.PIANO);
  pitches=new ArrayList(); // store an array of Double of bell numbers (0..N)
  int ii=1;
  while (seq.hasNext()) {
    //print(seq.toString()+"\n");
    int[] nums=seq.next();
    if (nums!=null) {
      for (int j=0;j<nums.length;j++) {
        pitches.add(new Double(nums[j]));
      }
    }
    ii++;
  }
  maxix=i;
  ix=0;
  print("maxix="+maxix+", pitches has "+pitches.size());
  print ("Done!\n");
  background(0);
}

void draw() {
  //background(0);
  if (phrase_start==pitches.size()) return; // finished
  Double note=(Double)(pitches.get(phrase_start));
  double n=note.doubleValue();
  int notei=(int)n;
  color filler=palette[notei-1];
  fill(filler);
  noStroke();
  // start new column?
  if (y>height-ys) {
    y=0;
    columnx+=((seq.BELLS+1)*xs);
    x=columnx;
  }
  rect(x,y,xw,yw);
  x=x+xs;
  n=60.0+(double)(sc.DIATONIC_MINOR[notei]);
  sc.playNote(n,127,1);
  //print (String.format("%02d ",notei)+"");
  phrase_start++;
  if (phrase_start%seq.BELLS==0) {
    // new phrase
    //print("\n");
    x=columnx;
    y+=ys;
    filter(BLUR,1);
  }
  
}

