
import java.io.FileWriter;
import java.io.BufferedWriter;


import ddf.minim.*;

Minim minim;
AudioSample butonSample;
AudioSample butonSample2;


//AudioSnippet dingdong; 
AudioSample fx0;
AudioPlayer intro;
AudioPlayer title;
AudioPlayer menu_music;
AudioSample gamemecanic;


Player player= new Player(new PVector(100,200));

AudioPlayer win;
AudioPlayer loose;


PrintWriter pw = null;
String[] storys ;
String story ;


String[] dialogues ;
String dialogue ;
String diagbox ;

String[] map_level ;
String map ;
String mapbox ;

PImage[] background1_sprit=new PImage[10];
PImage[] character_sprit=new PImage[5];
PImage[]  fx_sprit=new PImage[12];
PImage fx1_sprit=new PImage();
PImage[]  sign_sprit=new PImage[5];

PImage  strike_sprit=new PImage();
PImage  action_sprit=new PImage();
PImage  exit_sprit=new PImage();
