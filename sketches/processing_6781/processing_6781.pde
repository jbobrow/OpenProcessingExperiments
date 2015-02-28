
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

float magnetx ,magnety;

String notes[] = { 
  "c","e","g","a","bb"};
//note order in notes
int seq[] = {0,1,2,3,4,3,2,1};

HashSet muns = new HashSet();

int boogienote = 0;

HashMap noteletters = new HashMap();

boolean oldenize;

//AudioSnippet bam;

void setup(){
  size(500,500);
  magnetx = width/2;
  magnety = height/2;
    textFont(loadFont("Arial-Black-100.vlw"));

  
  Minim.debugOn();
  Minim.start(this);
  for(int g = 0; g < notes.length;g++){  
    for(char v = 'a'; v <= 'z'; v++){
      String notename = notes[g]+"_"+v;
      noteletters.put(notename,Minim.loadSnippet(notes[g]+"/"+v+".mp3"));
    }
  }
}
void draw(){
  background(64);

   Iterator i = muns.iterator();
   while(i.hasNext()){
      mun m = (mun)i.next(); 
    m.move();
    m.draw();   
    //i was kind or worried about having two iterators
    //over the smae collection if one was removing thigns, so 
    //i useda global variable
    if(oldenize){
      m.oldenize();
      if(m.kill()){
         i.remove(); 
      }
    }
 }
  if(oldenize){
       
     oldenize = false; 
    }
 
}
int MAXAGE = 5;
class mun{
   float origr, origg, origb;
     String s;
     int age = MAXAGE; 
     boolean moving;
     float xs,ys,x,y,tx,ty;
     
     
     
     void  move(){
     tx = magnetx;
     ty = magnety;
       if(moving){
      if(x < tx) xs += .1; 
      if(x > tx) xs -= .1; 
      if(y < ty) ys += .1;
      if(y > ty) ys -= .1;
      x += xs;
     y += ys; 
       }
     }
     
  mun(String ps){
     origr = random(64,255);
     origg = random(64,255);
     origb = random(64,255);
     s = ps;
     x = random(width/4,width*3/4);
     y =  random(width/4,width*3/4);
    // tx = width / 2;
    /// ty =width / 2;
     moving = false;
  } 
  void letgo(){
     moving = true; 
  }
  void draw(){
    if(age <= 0) age = 0;
    /*
    fill(
     ((origr*age) + 64*(10-age))/10 ,
     ((origg*age) + 64*(10-age))/10 ,
     ((origb*age) + 64*(10-age))/10 );
     */
     fill(origr,origg,origb, age*(250/MAXAGE));
    pushMatrix();
    translate(x,y);
    rotate((xs)/2);
    
     text(s,-textWidth(s)/2,30); 
     popMatrix();
    
  }
  void oldenize(){
     age--; 
  }
  
  boolean kill(){
     if(age <= 0){
        return true;
     } 
     return false;
  }
}

void mousePressed(){
    magnetx = mouseX;
    magnety = mouseY;
}


void keyReleased(){
   Iterator i = muns.iterator();
  while(i.hasNext()){
     mun m = (mun)i.next();
     m.letgo();
  } 
  skipkey = false;
}
boolean skipkey = false;
void keyPressed(){
  Character c = new Character(key);
     c = c.toLowerCase(c);
  
  if(c.charValue() >= 'a' && c.charValue() <= 'z'){
    if(skipkey) return;
skipkey = true;

    String   notelettername = notes[seq[boogienote]]+"_"+ c.charValue();
  AudioSnippet a = (AudioSnippet)noteletters.get(notelettername);
  a.rewind(); 
  a.play();
  boogienote++;
  if(boogienote >= seq.length){
      boogienote = 0;
  }

 
  
  muns.add(new mun((new Character(key)).toString()));
  oldenize = true;  
  }
}

//  bam.rewind();      
//  bam.play();


void stop()
{
  Iterator i = noteletters.keySet().iterator();
  while(i.hasNext()){
    AudioSnippet a = (AudioSnippet) noteletters.get(i.next());
    a.close(); 
  }
  Minim.stop();
  super.stop();
}

