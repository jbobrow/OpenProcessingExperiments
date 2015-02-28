
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.*;

ArrayList<Integer> list;
ArrayList<Float> list2;
ArrayList<Integer> list3;
ArrayList<Integer> radiusThing;
Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
int counter;
int x1;
void setup(){
  strokeWeight(2);
  int x1 = 0;
  size(600, 600);
  background(0,0,0);
  counter = 0;
  minim = new Minim(this);
  frameRate( 30 );
  smooth();
  song = minim.loadFile("Pokemon Theme Song.mp3");
  list = new ArrayList<Integer>();
  list2 = new ArrayList<Float>();
  list3 = new ArrayList<Integer>();
  radiusThing = new ArrayList<Integer>();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  //beat = new BeatDetect();
  beat.setSensitivity(0);
  bl = new BeatListener(beat, song); 
  song.play();
  fill(0);
  noStroke();
}
 
void draw(){
  noFill();

  boolean kick = beat.isKick();
  boolean hat = beat.isHat();
  boolean snare = beat.isSnare();
  
  if(x1<360){
    addCircle(x1);
    x1+=3;
  } else{
    x1 = 0;
    background(0,0,0);
  }
  
  pushMatrix();
    translate(300,300);
    background(0,0,0);
    stroke(255, 255, 255);
    ellipse(0,0,400,400);
    for(int i = 0; i < list.size(); i++){
      //ellipse(200*cos(radians(list.get(i))), 200*sin(radians(list.get(i))), song.mix.level()*600, song.mix.level()*600);
      stroke(list3.get(i), 100*i/40);
      ellipse((radiusThing.get(i))*cos(radians(list.get(i))), (radiusThing.get(i))*sin(radians(list.get(i))), list2.get(i)*200, list2.get(i)*200);
      if(i>0){
        if(list2.get(i) > list2.get(i-1)){
          radiusThing.set(i, radiusThing.get(i)+1);
        } else{
          radiusThing.set(i, radiusThing.get(i)-1);
        }
      } else{
        if(list2.get(i) > list2.get(list2.size()-1)){
          radiusThing.set(i, radiusThing.get(i)+1);
        } else{
          radiusThing.set(i, radiusThing.get(i)-1);
        }
      }
      //ellipse((200)*cos(radians(list.get(i))), (200)*sin(radians(list.get(i))), list2.get(i)*200, list2.get(i)*200);
      //ellipse(0,0, list2.get(i)*400, list2.get(i)*400);

      list2.set(i, list2.get(i)-.001);
  }
  popMatrix();
  
  counter++;
  
  
}
 
void stop(){
  song.close();
  
  minim.stop();
  super.stop();
}

void addCircle(int x){
  list.add(x);
  list2.add(song.mix.level());
  radiusThing.add(200);
  if(beat.isKick()){
    list3.add(color(255, 0, 0));
  } else if(beat.isSnare()){
    list3.add(color(0, 255, 0));
  }else if(beat.isHat()){
    list3.add(color(0, 0, 255));
  } else{
    list3.add(color(100, 100, 100));
  }
  if(list.size()>40){
    list.remove(0);
    list2.remove(0);
    list3.remove(0);
    radiusThing.remove(0);
  }
  System.out.println(list.get(0));
}
 
class BeatListener implements AudioListener{
  private BeatDetect beat;
  private AudioPlayer source;
 
  BeatListener(BeatDetect beat, AudioPlayer source){
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
 
  void samples(float[] samps){
    beat.detect(source.mix);
  }
 
  void samples(float[] sampsL, float[] sampsR){
    beat.detect(source.mix);
  }
}




