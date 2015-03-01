
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/141083*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

// PlayBifurc
/* Starting from a bifurcation implementation, we want to ear its sound as each r-value
  define a specific set of frequencies. So if we have only one accumulation point of the logistic
  map we ear only a frequency, after a bifurcation the sound is composed of two harmonics and so on.
  Project is under developement so suggestion and contributions are very welcome!
  Sometimes the Waver crashes (once every ten minutes of playing, average):
  there is a problem on disconnectig oscils (I didn't find precisely where it is)
  
  by Christian Lovato (2015)
*/

// exporting in jscript is only allowed when window size is
// determined by values in the size() command
int image_sizex; // = 800;
int image_sizey; // = 600;
float rmin=2,rmax=4;

int nbins; // = image_sizey;
int[] count; //  = new int[nbins];
float[] xvals,last_xvals;


float logistic(float r, float x){
  return r * x * (1 - x);
}

Waver waver;
PGraphics pg;

void setup(){

  // test for js
 // size(image_sizex+150, image_sizey,P2D);
  size(950,600,P2D);
  image_sizex = width-150;
  image_sizey = height;
  nbins = image_sizey;
  count =  new int[nbins];
  
  textFont(createFont("Consolas", 14));
  
  // CREATE IMAGE
  pg = createGraphics(image_sizex, image_sizey,P2D);
  pg.beginDraw();
  pg.stroke(254,32);
  pg.background(0);
 
  int i, j;
  int iteration_num = 400;
  float step_size = 0.001;
  float initial_value = 0.1;
  float r = 0;
  float x;
  
  for(j = 0; j < (4.0 / step_size); j++){
    r += step_size;
    x = initial_value;
    
    for(i = 0; i < iteration_num; i++){
      x = logistic(r, x);
      if(i > 100 && r > rmin){
//        pg.point(((r * (image_sizex / 4)) - (image_sizex / 2)) * 2,
//              image_sizey - (x * image_sizey));
          pg.point((r-rmin)*image_sizex/(rmax-rmin),image_sizey*(1-(x)));
      }
    } 
  }
  pg.endDraw();
  image(pg,0,0);
  
  
  waver = new Waver(100);

}

void draw(){

}

void mouseMoved(){
  int i;
  for (i=0;i<nbins;i++) count[i]=0;
    
  // target value of r
  float r=map(mouseX,0,image_sizex,rmin,rmax);
  fill(0); noStroke();
  rect(image_sizex+1,0,image_sizex+150,image_sizey);
  if (mouseX > image_sizex) return;
  stroke(255);
  int iteration_num=400;
  float x=0.1;
  // println(); println("mousex " + mouseX); 
  for( i = 0; i < iteration_num; i++){
    x = logistic(r, x);
    if(i > 100 && r > rmin){
      //point(900,image_sizey - (x * image_sizey));
      // println("updating: " +x + "  "+ floor(x*nbins));
      count[floor(x*nbins)]++; //  because x is in range 0-1
    }
  }
  for (i=0;i<image_sizey;i++){
    if(count[i]>0)
      line(image_sizex+75-min(count[i]/2,74),image_sizey-i,image_sizex+75+min(count[i]/2,74),image_sizey-i);
  }
  
  // Trova i massimi, Numero di massimi nmax, ultimi nmax valori nelle iterazioni
  int nmax=0;
  for (i=1; i<nbins-1;i++){
    if(count[i]>=count[i-1] && count[i]>count[i+1]) // max condition
      nmax++;
  } 
  last_xvals=xvals;
  xvals=new float[nmax];
  int[] xcount=new int[nmax];
  
  for(i=0;i<nmax;i++){
      xvals[i]=x;
      x = logistic(r, x);
      xcount[i]=count[floor(x*nbins)];  
  }
 
  stroke(0);fill(0);
  rect(0,0,220,30);
  //textSize(32);
  stroke(255); fill(255);
  text("r = " + r,2,12);
  text("Nmax : " + nmax,2,24);
  
  waver.update(xvals,xcount);
  
}

void keyTyped(){
  if(key==' '){
  
  }
  

}

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;


class Waver{
  
  int nOscils = 20;
  Summer sum;
  Oscil[] oscils; // oscillators #nOscils
  IntList freeOscils; // list of unused oscillators;
  float[] xvals;  // Oscilling vals #activeOscils (set in update())
  int[]   xosc;   // "pointers" from xvals to oscillators #xvals.length
  
  float fmin=0,fmax=5000;
  
  
  Waver(int nOscils){
    this.nOscils = nOscils;
    oscils = new Oscil[nOscils];
    freeOscils=new IntList();
    xvals= new float[0];
    
    minim = new Minim(this);
    out = minim.getLineOut();   

    sum = new Summer();
    sum.patch( out );
    
    for(int i=0;i<nOscils;i++){
      oscils[i]=new Oscil(440,1,Waves.SINE);
      freeOscils.append(i); // set as unassigned
    }
    println("Waver initialized. #Oscils = " + nOscils);
  }
  
  void update(float[] vals, int[] count){
    //println(vals);
    int i,j;
    
    if (vals.length>nOscils){ // reduce number of vals, choosing most represented
      //println("Too many Oscils!");
      int[] ocount = reverse(sort(count));
      //print("ocount "); println(ocount);
      int thr = ocount[nOscils]; // threshold
      //println("thr= " + thr);
      float[] vals_=new float[nOscils];
      int[] count_ = new int[nOscils];
      for(i = 0,j=0; i<vals.length; i++){
        if(count[i]>thr){
          vals_[j]=vals[i]; count_[j]=count[i]; j++;
        }
      }
      //print("vals_ "); println(vals_);
      //println("upd vals&count");
      vals=subset(vals_,0,j);
      count=subset(count_,0,j);
    } // (vals.length>nOscils)
    
    // compute volume of generators
    float csum=0.0; for(i=0;i<count.length;i++) csum+=count[i];
    float[] xvols=new float[count.length];
    for(i=0;i<count.length;i++) xvols[i]=float(count[i])/csum;
    
    //println("match");
    // update xvals,xosc and oscils properties (patching and unpatching)
    // vals-> xvals
    //println("match"):
    int[] xmatch= match(vals,xvals);
    //print("XMATCH >"); println(xmatch);
    
    // difference between number of values and active oscillators
    int freev=vals.length-xvals.length; //println("freev= "+ freev);
    // there are three cases:
    // A) freev>0 vals>xvals, so we need more oscillators
    // B) freev=0 same number of old and new vals, we need only 
    //    to match oscillators and setting the new values
    // C) freev<0 vals<xvals, there are some oscillators to exclude
    //
    
    int[] special = new int[abs(freev)]; // list of oscillators to patch/unpatch
    int[] nxosc = new int[vals.length]; // new xosc (nxosc->xosc)
    
    //println("Special> " + special.length);
 
    if(freev==0){
      for(i=0;i<vals.length;i++){ //--
        nxosc[i]=xosc[xmatch[i]];
      }
    } else if(freev>0){ // need more oscillators
      //println("#freeOscils: "+freeOscils.size());
      for(i=0;i<special.length;i++){
        special[i]=freeOscils.remove(0);
      }
      //print("Add Special> ");  println( special);
      for(i=0,j=0;i<vals.length;i++){ //--
        if(xmatch[i]>=0) nxosc[i]=xosc[xmatch[i]];
        else nxosc[i]=special[j++];
      }
      //println("nosc updated");
    }else if (freev<0) { // surplus of oscillators
      for(i=0;i<vals.length;i++){ //--
        nxosc[i]=xosc[xmatch[i]];
        xosc[xmatch[i]]=-1;
      }
      for(i=0,j=0;i<xosc.length;i++)
        if(xosc[i]>=0){ 
          special[j++]=xosc[i];
          freeOscils.append(xosc[i]);
        }
        //println("Removed Special> " + special);
    }
        
    //println("Update Oscils values");
    float freq;
    for(i=0;i<vals.length;i++){
      freq=map(vals[i],0,1,0,fmax);
      oscils[nxosc[i]].setFrequency(freq);
      //println("freq> " + freq);
      oscils[nxosc[i]].setAmplitude(xvols[i]);
    }
    //println("Patch/Unpatch");
    if(freev>0){
      for(i=0;i<special.length;i++){
        oscils[special[i]].reset();
        oscils[special[i]].patch(sum);
      }
    } else if(freev<0){
      for(i=0;i<special.length;i++){
        oscils[special[i]].unpatch(sum);
      }
    }    
    //println("Oscils updated");

     xosc=nxosc;
     xvals=vals;
  };
  
  // find a match between val1 and val2
  // results an integer vector of same dimension of val1
  // each element is the match (val2 position) of val1 element
  // matching of non-unique elements is not properly managed
  int[] match(float[] val1, float[] val2){ 
    //print("MATCH; val1");println(val1);println(val2);
    int i,j;
    int[] matching=new int[val1.length];
    int[] invmatch=new int[val2.length];
    
    if(val1.length==0) return new int[0];
    else if(val2.length==0){
      for(i=0;i<val1.length;i++) matching[i]=-1;
      return matching;
    }
    
    for(i=0;i<val2.length;i++) invmatch[i]=-1;
    float mindiff=1e20,diff;
    // look for matching beween old vals and new ones. 
    // For each match, oscil is reassigned 
    for(i=0;i<val1.length;i++){
      mindiff=1e20;
      for(j=0;j<val2.length;j++){
        diff = abs(val1[i]-val2[j]);
        if (diff<mindiff){
          matching[i]=j; mindiff=diff;
        }
      }
      invmatch[matching[i]]=i;
    }
    //print("match before undounble:"); println(matching);  
    // ho tutti i vicini, elimino i doppioni
    for (i=0;i<val1.length-1;i++){
      if(matching[i]<0) continue;
      for (j=i+1;j<val1.length;j++){
        if(matching[j]<0) continue;
        if(matching[i]==matching[j]){
          if(abs(val1[i]-val2[matching[i]])<=
            abs(val1[j]-val2[matching[j]])){
              matching[j]=-1;
              invmatch[matching[i]]=i;
          } else {
            matching[i]=-1;
            invmatch[matching[j]]=j;
          }
            // not perfectly efficient, in the last case further controls 
            // on matching[i] are unnecessary
        }
      }
    }
    
    // occupy all free slots
    // is possible to reimplement this part on a val diff basis
    int freev1=0,freev2=0,freev;
    for(i=0;i<val1.length;i++) if(matching[i]<0) freev1++;
    for(i=0;i<val2.length;i++) if(invmatch[i]<0) freev2++;
    j=0;
    if(freev1<freev2){
      for(i=0;i<val1.length;i++){
        if(matching[i]>=0) continue;
        while(invmatch[j]>=0) j++;
        matching[i]=j;
        invmatch[j]=i;  
      }
    } else { // freev2<freev1
       for(i=0;i<val2.length;i++){
        if(invmatch[i]>=0) continue;
        while(matching[j]>=0) j++;
        invmatch[i]=j;
        matching[j]=i;  
      }   
    }
     
    return matching;
  } 
  
  void stop(){ // untested function
    update(new float[0],new int[0]);
  }
  
}


