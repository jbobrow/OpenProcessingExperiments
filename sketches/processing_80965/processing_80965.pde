
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim miaudio;

AudioPlayer miReproductor;
miaudio=new Minim(this);
miReproductor=miaudio.loadFile("CATMEOW.mp3");
miReproductor.play();
miaudio.stop();



