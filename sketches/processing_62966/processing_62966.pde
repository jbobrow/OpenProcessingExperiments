
import ddf.minim.*;

Minim minim;
AudioSample[] sounds;
ArrayList <Drop>drops;
float z;

void setup() {
  size(400, 400);
  smooth();
  drops = new ArrayList <Drop>();
  minim = new Minim(this);
  sounds = new AudioSample[9];
  sounds[0] = minim.loadSample("kick_01.wav", 512);
  sounds[1] = minim.loadSample("kick_02.wav", 512);
  sounds[2] = minim.loadSample("kick_03.wav", 512);
  sounds[3] = minim.loadSample("kick_04.wav", 512);
  sounds[4] = minim.loadSample("kick_05.wav", 512);
  sounds[5] = minim.loadSample("kick_07.wav", 512);
  sounds[6] = minim.loadSample("kick_08.wav", 512);
  sounds[7] = minim.loadSample("kick_09.wav", 512);
  sounds[8] = minim.loadSample("kick_10.wav", 512);
}

void draw() {
  background(100);
  for (int i = 0; i < drops.size();i++) {
    Drop drop = drops.get(i);

    //if (drops !=null) {
    drop.update();
    drop.display();
    if (drop.s>255) drops.remove(i);
  }
}

void mousePressed() {
  drops.add(new Drop());
  int arrayIndex = (int)(mouseY*sounds.length);
  arrayIndex /= height;
  sounds[arrayIndex].trigger();
}


