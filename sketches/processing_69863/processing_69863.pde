
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
color c;
int curSwirl = 0;

float kickSize, hatSize;

ArrayList<Drop> drops = new ArrayList<Drop>();

Swirl tree[] ;
int swirlSize = 100;
float splitFact = 0.75;

void setup() {
  c = color(0,0,255);
  size(800,480);
  smooth();
  background(0);
  
  minim = new Minim(this);
  song = minim.loadFile("righthere.mp3", 2048);
  song.play();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(300);
  bl = new BeatListener(beat, song);
  
  Swirl s1 = new Swirl(true,1,width/2-swirlSize,height,swirlSize);
  Swirl s2 = new Swirl(true,0,width/2+swirlSize,height,swirlSize);
  
  tree = new Swirl[]{s1,s2};

 }

void draw(){
  fill(0,30);
  rect(0,0,width,height);
  
  stroke(0);
  strokeWeight(2);
  
  if (beat.isKick()) {
    if (drops.size() < 5) {   
      Drop d = new Drop(3);
      drops.add(d);
    }    
  }
  
  if (beat.isHat()) {
    if (drops.size() < 5) {   
      Drop d = new Drop(4,color(255,020,147));
      drops.add(d);
    }    
  }  
  
  for(int i=0; i<drops.size(); i++){
    drops.get(i).moveBall();
    drops.get(i).draw();
    if(drops.get(i).y>height+drops.get(i).r) {
      drops.remove(i);
      i = i-1;      
    }
  }
  drawTree();  
}

void mousePressed(){
  Drop d = new Drop(2,color(148,0,211));
  d.x = mouseX;
  d.y = -1*d.r;
  drops.add(d); 
}

void drawTree() {
  stroke(255);
  strokeWeight(2);
  
  float max_mix = 0;
  float[] mix = song.mix.toArray();
  for(int i = 0; i < mix.length; i++){
    max_mix = max(abs(mix[i]),max_mix);
  }

  max_mix = max_mix * 100;
  max_mix = max_mix * max_mix; 
  
  float growth = map(max_mix,0,10000,0,PI/90);
  
  Swirl[] splitted = new Swirl[0];
  
  for (int i = 0; i < curSwirl; i++) 
  {
    tree[i].draw();    
  }
  
  tree[curSwirl].draw();
  tree[curSwirl].grow(growth);
    
  Swirl[] tmp = tree[curSwirl].split(splitFact);
  
  if (tmp.length > 0) {
    curSwirl++;    
    for (int j = 0; j < tmp.length; j++) 
      splitted = (Swirl[])append(splitted,tmp[j]);
    
    for (int i = 0; i < splitted.length; i++)
      tree = (Swirl[])append(tree,splitted[i]);
  }
}



