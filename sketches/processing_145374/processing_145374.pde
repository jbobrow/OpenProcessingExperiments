
import ddf.minim.*;
import controlP5.*;
Minim minim;
ControlP5 cp5;
DropdownList drumPresets;
DropdownList bassPresets;
DropdownList chordsPresets;
Textarea myTextarea;


//slider volumes
int Volume0;
int Volume1;
int Volume2;
int Volume3;
int Volume4;
int Volume5;
int Volume6;

//empty preset deffine
IntList empty = new IntList();

//drum presets deffine
IntList kickSnare = new IntList();
IntList kickSnareCut  = new IntList();
IntList kickSnareHighHat = new IntList();
IntList kickSnareEnd = new IntList();
IntList clave = new IntList();
IntList complexClave = new IntList();
ArrayList<String> drumNames = new ArrayList<String>();
HashMap<Integer,IntList> drumMap = new HashMap();
int drumDropDown=0;

//bass presets
IntList simple14 = new IntList();
IntList complex14  = new IntList();
IntList bossaNova = new IntList();
IntList jazz = new IntList();
IntList funk = new IntList();
IntList rock = new IntList();
ArrayList<String> bassNames = new ArrayList<String>();
HashMap<Integer,IntList> bassMap = new HashMap();
int bassDropDown=0;

//chords presets
IntList popChords = new IntList();
IntList latinChords  = new IntList();
IntList jazzChords = new IntList();
IntList reggaeChords = new IntList();
IntList funkChords = new IntList();
IntList rockChords = new IntList();
ArrayList<String> chordsNames = new ArrayList<String>();
HashMap<Integer,IntList> chordsMap = new HashMap();
int chordsDropDown=0;

//audio samples deffine
ArrayList<AudioSample> lead = new ArrayList<AudioSample>();
ArrayList<AudioSample> harmony = new ArrayList<AudioSample>();
ArrayList<AudioSample> crunch = new ArrayList<AudioSample>();
ArrayList<AudioSample> background = new ArrayList<AudioSample>();
ArrayList<AudioSample> chords = new ArrayList<AudioSample>();
ArrayList<AudioSample> bass = new ArrayList<AudioSample>();
ArrayList<AudioSample> drums = new ArrayList<AudioSample>();
ArrayList<Track> tracks = new ArrayList<Track>();

//universal constants deffine
int end;
int loopStart;
int loopEnd;
boolean loop;
boolean play;
int i=0;
int quantize;

//loop button settup
int loopButtonX = 750;
int loopButtonY = 270;
int loopButtonWidth = 40;
int loopButtonHeight = 50;

//play button settup
int playButtonX = 850;
int playButtonY = 270;
int playButtonWidth = 40;
int playButtonHeight = 50;

//quantize button setup
int quantButtonX = 800;
int quantButtonY = 270;
int quantButtonWidth = 40;
int quantButtonHeight = 50;

void setup(){
  
  //presets setup
  for(int i=0; i<64;i++){
  empty.append(0);
  //drum presets setup
  if(i==0){
   kickSnare.append(1);
   kickSnareCut.append(1);
   kickSnareHighHat.append(1); 
   kickSnareEnd.append(10);  
   clave.append(0);
   complexClave.append(1);  
  }
  else{
    if(i%16==0){
     kickSnare.append(1);
     kickSnareCut.append(1);
     kickSnareHighHat.append(1);
     kickSnareEnd.append(1);
    }
    else if(i%8==0){
      kickSnare.append(1);
      kickSnareCut.append(2);
      kickSnareHighHat.append(1); 
      kickSnareEnd.append(1); 
    }
    else if(i%4==0){
      kickSnare.append(2);
      kickSnareCut.append(0);
      kickSnareHighHat.append(2); 
      kickSnareEnd.append(2); 
    }
    else if(i%2==0){
      kickSnare.append(0);
      kickSnareCut.append(0);
      kickSnareHighHat.append(3); 
      kickSnareEnd.append(3); 
    }
    else{
      kickSnare.append(0);
      kickSnareCut.append(0);
      kickSnareHighHat.append(0); 
      kickSnareEnd.append(0); 
    }
    
    if(i%16==2){
      clave.append(2);
      complexClave.append(2);
    }
    else if(i%16==4){
      clave.append(2);
      complexClave.append(2);
    }
    else if(i%16==8){
      clave.append(2);
      complexClave.append(2);
    }
     else if(i%16==8){
      clave.append(2);
      complexClave.append(2);
    }
    else if(i%16==8){
      clave.append(2);
      complexClave.append(2);
    }
    else if(i%16==11){
      clave.append(2);
      complexClave.append(2);
    }
     else if(i%16==14){
      clave.append(2);
      complexClave.append(2);
    }
    else{
      clave.append(0);
  if(i%16==0){
    complexClave.append(1);
  }
    else if(i%16==6){
      complexClave.append(1);
    }
    else if(i%16==10){
    complexClave.append(3);
  }
  else if(i%16==13){
    complexClave.append(3);
  }
  else{
    complexClave.append(0);
  }
}
  }
  //bass presets setup
  for(int j=0;j<4;j++){
   simple14.append(4);
   simple14.append(0);
   simple14.append(0);
   simple14.append(0);
   simple14.append(0);
   simple14.append(0);
   simple14.append(4);
   simple14.append(0);
   simple14.append(3);
   simple14.append(0);
   simple14.append(0);
   simple14.append(0);
   simple14.append(0);
   simple14.append(0);
   simple14.append(3);
   simple14.append(0);

   bossaNova.append(4);
   bossaNova.append(0);
   bossaNova.append(0); 
   bossaNova.append(0); 
   bossaNova.append(0); 
   bossaNova.append(0); 
   bossaNova.append(11); 
   bossaNova.append(0); 
   bossaNova.append(11);
   bossaNova.append(0);
   bossaNova.append(0); 
   bossaNova.append(0); 
   bossaNova.append(0); 
   bossaNova.append(0); 
   bossaNova.append(4); 
   bossaNova.append(0); 
  }
  for(int k=0;k<2;k++){
   complex14.append(4);
   complex14.append(0); 
   complex14.append(0);
   complex14.append(0);
   complex14.append(0);
   complex14.append(0);
   complex14.append(4);
   complex14.append(0);
   complex14.append(3);
   complex14.append(0); 
   complex14.append(0);
   complex14.append(0);
   complex14.append(0);
   complex14.append(0);
   complex14.append(3);
   complex14.append(0);
   complex14.append(2);
   complex14.append(0); 
   complex14.append(0);
   complex14.append(0);
   complex14.append(0);
   complex14.append(0);
   complex14.append(2);
   complex14.append(0);
   complex14.append(1);
   complex14.append(0); 
   complex14.append(0);
   complex14.append(0);
   complex14.append(0);
   complex14.append(0);
   complex14.append(1);
   complex14.append(0);
  
   jazz.append(4);
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(4); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(6);
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(6); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(7);
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(7); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(9);
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(9); 
   jazz.append(0); 
   jazz.append(0); 
   jazz.append(0); 

   funk.append(4); 
   funk.append(0);
   funk.append(4);
   funk.append(0);
   funk.append(0);
   funk.append(0); 
   funk.append(4);
   funk.append(0);
   funk.append(7);
   funk.append(0);
   funk.append(6);
   funk.append(0); 
   funk.append(0);
   funk.append(0);
   funk.append(4);
   funk.append(0);
   funk.append(0);
   funk.append(0);
   funk.append(4);
   funk.append(0);
   funk.append(0);
   funk.append(0);
   funk.append(4);
   funk.append(0);
   funk.append(3);
   funk.append(0);
   funk.append(0);
   funk.append(0);
   funk.append(4);
   funk.append(0);
   funk.append(0);
   funk.append(0);
   
   rock.append(4);
   rock.append(0); 
   rock.append(3);
   rock.append(0);
   rock.append(3);
   rock.append(0);
   rock.append(11);
   rock.append(0);
   rock.append(0);
   rock.append(0);
   rock.append(3);
   rock.append(0);
   rock.append(4);
   rock.append(0);
   rock.append(5);
   rock.append(0);
   rock.append(6);
   rock.append(0);
   rock.append(0);
   rock.append(0);
   rock.append(4);
   rock.append(0);
   rock.append(0);
   rock.append(0);
   rock.append(5);
   rock.append(0);
   rock.append(0);
   rock.append(0);
   rock.append(3);
   rock.append(0);
   rock.append(0);
   rock.append(0);
  }
  
  //chords presets setup
   popChords.append(7);
   popChords.append(0);
   popChords.append(0);
   popChords.append(0);
   popChords.append(7);
   popChords.append(0);
   popChords.append(0);
   popChords.append(0);
   popChords.append(3);
   popChords.append(0);
   popChords.append(0);
   popChords.append(0);
   popChords.append(3);
   popChords.append(0);
   popChords.append(0);
   popChords.append(0);
   popChords.append(4);
   popChords.append(0);
   popChords.append(0);
   popChords.append(0);
   popChords.append(4);
   popChords.append(0);
   popChords.append(0);
   popChords.append(0);
   popChords.append(2);
   popChords.append(0);
   popChords.append(0);
   popChords.append(0);
   popChords.append(2);
   popChords.append(0);
   popChords.append(0);
   popChords.append(0);
   
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(5);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(5);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(5);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(6);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(9);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(0);
   latinChords.append(9);
   latinChords.append(0);
   
   jazzChords.append(4);
   jazzChords.append(0);
   jazzChords.append(4);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(4);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(7);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(7);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(9);
   jazzChords.append(0);
   jazzChords.append(9);
   jazzChords.append(0);
   jazzChords.append(9);
   jazzChords.append(0);
   jazzChords.append(11);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(0);
   jazzChords.append(11);
   jazzChords.append(0);
   
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(4);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(4);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(8);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(8);
   reggaeChords.append(0);
   reggaeChords.append(0);
   reggaeChords.append(0);
   
   funkChords.append(0);
   funkChords.append(0);
   funkChords.append(11);
   funkChords.append(11);
   funkChords.append(11);
   funkChords.append(0);
   funkChords.append(11);
   funkChords.append(0);
   funkChords.append(12);
   funkChords.append(0);
   funkChords.append(11);
   funkChords.append(0);
   funkChords.append(1);
   funkChords.append(0);
   funkChords.append(3);
   funkChords.append(0);
   funkChords.append(4);
   funkChords.append(0);
   funkChords.append(0);
   funkChords.append(0);
   funkChords.append(4);
   funkChords.append(0);
   funkChords.append(4);
   funkChords.append(0);
   funkChords.append(3);
   funkChords.append(0);
   funkChords.append(5);
   funkChords.append(0);
   funkChords.append(0);
   funkChords.append(0);
   funkChords.append(5);
   funkChords.append(0);
   
   rockChords.append(4);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(4);
   rockChords.append(0);
   rockChords.append(4);
   rockChords.append(0);
   rockChords.append(3);
   rockChords.append(0);
   rockChords.append(3);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(2);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(2);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(2);
   rockChords.append(0);
   rockChords.append(1);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(1);
   rockChords.append(0);
   rockChords.append(0);
   rockChords.append(0);
   
  
  
  
  }
  

//drum presets names
drumMap.put(0,empty);
drumNames.add("Empty");
drumMap.put(1,kickSnare);
drumNames.add("Kick and Snare");
drumMap.put(2,kickSnareCut);
drumNames.add("K+S (cut)");
drumMap.put(3,kickSnareHighHat);
drumNames.add("K+S (w/ High Hat)");
drumMap.put(4,kickSnareEnd);
drumNames.add("K+S (ending)");
drumMap.put(5,clave);
drumNames.add("Clave");
drumMap.put(6,complexClave);
drumNames.add("Complex Clave");

//bass presets names
bassMap.put(0,empty);
bassNames.add("Empty");
bassMap.put(1,simple14);
bassNames.add("Simple 1+4");
bassMap.put(2,complex14);
bassNames.add("Complex 1+4");
bassMap.put(3,bossaNova);
bassNames.add("Bossa Nova");
bassMap.put(4,jazz);
bassNames.add("Jazz Bass");
bassMap.put(5,funk);
bassNames.add("Funk Bass");
bassMap.put(6,rock);
bassNames.add("Rock Bass");

//chords presets names
chordsMap.put(0,empty);
chordsNames.add("Empty");
chordsMap.put(1,popChords);
chordsNames.add("Pop Chords");
chordsMap.put(2,latinChords);
chordsNames.add("Latin Chords");
chordsMap.put(3,jazzChords);
chordsNames.add("Jazz Chords");
chordsMap.put(4,reggaeChords);
chordsNames.add("Reggae Chords");
chordsMap.put(5,funkChords);
chordsNames.add("Funk Chords");
chordsMap.put(6,rockChords);
chordsNames.add("Rock Chords");

//controller setup
  cp5 = new ControlP5(this);
  minim = new Minim(this);
  
 //instructions setup
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(730,50)
                  .setSize(200,200)
                  .setFont(createFont("arial",14))
                  .setLineHeight(14)
                  .setColor(color(255))
                  .setColorBackground(color(100))
                  .setColorForeground(color(200,0,0));
                  ;
                  
   myTextarea.setText("1.) Click somewhere on a track to place a note\n"
                   +"2.) Right click on the note to remove it\n"
                   +"3.) Press space or the blue button to pause\n"
                   +"4.) Press the purple button to allow placing off of the lines\n"
                   +"5.) Click and drag the green dots at the top of the screen to change the loop area\n"
                   +"6.) Click the yellow button to the left to clear a track\n"
                   +"7.) Click the loop button to loop\n\n"
                   +"\nTips and Tricks:\n"
                   +"\n1.) Less is more\n"
                   +"Don't go overboard. You don't need to use every instrument, and in some tracks you may only want one or two notes. Things are more powerful the less you use them. Your background track is probably not as important as your drums.\n"
                   +"\n2.) Put stuff on the beats\n"
                   +"There are big thick lines. If you put a note on one these, that note will be on the beat. The thicker the line, the more important the beat is.\n"
                   +"\n3.) Build from the bottom up\n"
                   +"Make your drum track first, then the bass, then chords, etc. As a general rule, your beat will sound better if the bass is bassed on the rythem of the drums, and the chords are bassed on the notes of the bass\n"
                   +"\n4.) Pay atention to the note names\n"
                   +"If the bass note is an A then an A chord will probably sound good. Use the mouse-over text to work out what note something is.\n"
                   +"");
  
  //dropdown list setup
  drumPresets = cp5.addDropdownList("Drum Presets")
    .setPosition(720,620)
    ;
  customize(drumPresets);
    for (int i=0;i<drumNames.size();i++) {
    drumPresets.addItem(drumNames.get(i), i);
  }
  
  bassPresets = cp5.addDropdownList("Bass Presets")
    .setPosition(720,520)
    ;
  customize(bassPresets);
    for (int i=0;i<bassNames.size();i++) {
    bassPresets.addItem(bassNames.get(i), i);
  
    }
    
    chordsPresets = cp5.addDropdownList("Chords Presets")
    .setPosition(720,420)
    ;
  customize(chordsPresets);
    for (int i=0;i<chordsNames.size();i++) {
    chordsPresets.addItem(chordsNames.get(i), i);
  
    }
  
  //volume slider setup
  cp5.addSlider("Volume0")
     .setPosition(80,33)
     .setSize(10,50)
     .setRange(-50,50)
     ;
  cp5.getController("Volume0").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(10000);
  cp5.getController("Volume0").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(-15).setPaddingX(0);
  
  cp5.addSlider("Volume1")
     .setPosition(80,33+100)
     .setSize(10,50)
     .setRange(-50,50)
     ;
     cp5.getController("Volume1").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(10000);
     cp5.getController("Volume1").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(-15).setPaddingX(0);
     
   cp5.addSlider("Volume2")
     .setPosition(80,33+200)
     .setSize(10,50)
     .setRange(-50,50)
     ;
     cp5.getController("Volume2").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(10000);
     cp5.getController("Volume2").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(-15).setPaddingX(0);
     
      cp5.addSlider("Volume3")
     .setPosition(80,33+300)
     .setSize(10,50)
     .setRange(-50,50)
     ;
     cp5.getController("Volume3").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(10000);
     cp5.getController("Volume3").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(-15).setPaddingX(0);
     
      cp5.addSlider("Volume4")
     .setPosition(80,33+400)
     .setSize(10,50)
     .setRange(-50,50)
     ;
     cp5.getController("Volume4").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(10000);
     cp5.getController("Volume4").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(-15).setPaddingX(0);
     
      cp5.addSlider("Volume5")
     .setPosition(80,33+500)
     .setSize(10,50)
     .setRange(-50,50)
     ;
     cp5.getController("Volume5").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(10000);
     cp5.getController("Volume5").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(-15).setPaddingX(0);
     
   cp5.addSlider("Volume6")
     .setPosition(80,33+600)
     .setSize(10,50)
     .setRange(-50,50)
     ;
     cp5.getController("Volume6").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(10000);
     cp5.getController("Volume6").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(-15).setPaddingX(0);
     
    //import lead instrument audio files
   lead.add(minim.loadSample("F4(bright).mp3",512));
   lead.add(minim.loadSample("G4(bright).mp3",512));
   lead.add(minim.loadSample("A4(bright).mp3",512));
   lead.add(minim.loadSample("B4(bright).mp3",512));
   lead.add(minim.loadSample("C5(bright).mp3",512));
   lead.add(minim.loadSample("D5(bright).mp3",512));
   lead.add(minim.loadSample("E5(bright).mp3",512));
   lead.add(minim.loadSample("F5(bright).mp3",512));
   lead.add(minim.loadSample("G5(bright).mp3",512));
   lead.add(minim.loadSample("A5(bright).mp3",512));
   lead.add(minim.loadSample("B5(bright).mp3",512));
   lead.add(minim.loadSample("C6(bright).mp3",512));
    //import harmony instrument audio files
   harmony.add(minim.loadSample("D4(smooth).mp3",512));
   harmony.add(minim.loadSample("E4(smooth).mp3",512));
   harmony.add(minim.loadSample("F4(smooth).mp3",512));
   harmony.add(minim.loadSample("G4(smooth).mp3",512));
   harmony.add(minim.loadSample("A4(smooth).mp3",512));
   harmony.add(minim.loadSample("B4(smooth).mp3",512));
   harmony.add(minim.loadSample("C5(smooth).mp3",512));
   harmony.add(minim.loadSample("D5(smooth).mp3",512));
   harmony.add(minim.loadSample("E5(smooth).mp3",512));
   harmony.add(minim.loadSample("F5(smooth).mp3",512));
   harmony.add(minim.loadSample("G5(smooth).mp3",512));
   harmony.add(minim.loadSample("A5(smooth).mp3",512));
    //import crunch instrument audio files
   crunch.add(minim.loadSample("E2(crunch).mp3",512));
   crunch.add(minim.loadSample("F2(crunch).mp3",512));
   crunch.add(minim.loadSample("G2(crunch).mp3",512));
   crunch.add(minim.loadSample("A2(crunch).mp3",512));
   crunch.add(minim.loadSample("B2(crunch).mp3",512));
   crunch.add(minim.loadSample("C3(crunch).mp3",512));
   crunch.add(minim.loadSample("D3(crunch).mp3",512));
   crunch.add(minim.loadSample("E3(crunch).mp3",512));
   crunch.add(minim.loadSample("F3(crunch).mp3",512));
   crunch.add(minim.loadSample("G3(crunch).mp3",512));
   crunch.add(minim.loadSample("A3(crunch).mp3",512));
   crunch.add(minim.loadSample("B3(crunch).mp3",512));
    //import background instrument audio files
   background.add(minim.loadSample("Cmaj3.mp3",512));
   background.add(minim.loadSample("Dmin3.mp3",512));
   background.add(minim.loadSample("Emin3.mp3",512));
   background.add(minim.loadSample("E4.mp3",512));
   background.add(minim.loadSample("Fmaj3.mp3",512));
   background.add(minim.loadSample("Gmaj3.mp3",512));
   background.add(minim.loadSample("Amin3.mp3",512));
   background.add(minim.loadSample("A4.mp3",512));
   background.add(minim.loadSample("A5.mp3",512));
   background.add(minim.loadSample("Amin6.mp3",512));
   background.add(minim.loadSample("Amin7.mp3",512));
   background.add(minim.loadSample("Aoct.mp3",512));
    //import chords instrument audio files
   chords.add(minim.loadSample("Em.mp3",512));
   chords.add(minim.loadSample("F.mp3",512));
   chords.add(minim.loadSample("G.mp3",512));
   chords.add(minim.loadSample("Am.mp3",512));
   chords.add(minim.loadSample("Am7.mp3",512));
   chords.add(minim.loadSample("Bm.mp3",512));
   chords.add(minim.loadSample("C.mp3",512));
   chords.add(minim.loadSample("Dm.mp3",512));
   chords.add(minim.loadSample("D.mp3",512));
   chords.add(minim.loadSample("Em^.mp3",512));
   chords.add(minim.loadSample("F^.mp3",512));
   chords.add(minim.loadSample("G^.mp3",512));
    //import bass instrument audio files
   bass.add(minim.loadSample("E1.mp3",512));
   bass.add(minim.loadSample("F1.mp3",512));
   bass.add(minim.loadSample("G1.mp3",512));
   bass.add(minim.loadSample("A1.mp3",512));
   bass.add(minim.loadSample("B1.mp3",512));
   bass.add(minim.loadSample("C2.mp3",512));
   bass.add(minim.loadSample("D2.mp3",512));
   bass.add(minim.loadSample("E2.mp3",512));
   bass.add(minim.loadSample("F2.mp3",512));
   bass.add(minim.loadSample("G2.mp3",512));
   bass.add(minim.loadSample("A2.mp3",512));
   bass.add(minim.loadSample("B2.mp3",512));
    //import drums instrument audio files
   drums.add(minim.loadSample("kick.mp3",512));
   drums.add(minim.loadSample("snare.mp3",512));
   drums.add(minim.loadSample("highHat.mp3",512));
   drums.add(minim.loadSample("tom.mp3",512));
   drums.add(minim.loadSample("tom2.mp3",512));
   drums.add(minim.loadSample("tom3.mp3",512));
   drums.add(minim.loadSample("tom4.mp3",512));
   drums.add(minim.loadSample("scratch.mp3",512));
   drums.add(minim.loadSample("cowBell.mp3",512));
   drums.add(minim.loadSample("cymbol.mp3",512));
   drums.add(minim.loadSample("lowSweep.mp3",512));
   drums.add(minim.loadSample("highSweep.mp3",512));
   
//universal constans setup
size(1000,700);
end=16*4-1;
loopStart=0;
loopEnd=end;
loop=false;
play=true;
quantize=2;

//tracks setup
tracks.add(new Track(end,0));  //lead
tracks.add(new Track(end,1));  //harmony
tracks.add(new Track(end,2));  //crunch
tracks.add(new Track(end,3));  //background
tracks.add(new Track(end,4));  //chords
tracks.add(new Track(end,5));  //bass
tracks.add(new Track(end,6));  //drums

}

void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(255,0,0));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  ddl.setColorBackground(color(100));
  ddl.setColorActive(color(100, 50,50));
  ddl.setScrollbarWidth(20);
}

//takes a note and plays the coresponding audio file
void play(int track, int note){
  if(track == 6){
    if(note!=0){
    drums.get(note-1).trigger();
    }
  }
  if(track == 5){
    if(note!=0){
    bass.get(note-1).trigger();
    }
  }
    if(track == 4){
    if(note!=0){
    chords.get(note-1).trigger();
    }
  }
    if(track == 3){
    if(note!=0){
    background.get(note-1).trigger();
    }
  }
  if(track == 2){
    if(note!=0){
    crunch.get(note-1).trigger();
    }
  }
  if(track == 1){
    if(note!=0){
    harmony.get(note-1).trigger();
    }
  }
    if(track == 0){
    if(note!=0){
    lead.get(note-1).trigger();
    }
  }
  
}

//controll for the buttons (not entirely modular)
void mousePressed(){
 if(mouseX>loopButtonX && mouseX<loopButtonX+loopButtonWidth && mouseY>loopButtonY  && mouseY<loopButtonY+loopButtonHeight){
  loop = !loop; 
   
 }
 
  if(mouseX>playButtonX && mouseX<playButtonX+playButtonWidth && mouseY>playButtonY  && mouseY<playButtonY+playButtonHeight){
  play = !play; 
   
 }
 
   if(mouseX>quantButtonX && mouseX<quantButtonX+quantButtonWidth && mouseY>quantButtonY  && mouseY<quantButtonY+quantButtonHeight){
      if(quantize==1){
       quantize=2; 
      }
       else if(quantize==2){
       quantize=1; 
        
      }   
 }
  
}

//contorll for the spacebar pause
void keyPressed(){
 if(key==' '){
  play=!play;
  
 } 
  
}

//control for adding presets
void controlEvent(ControlEvent theEvent) {

  if (theEvent.isGroup()) {
    if(theEvent.getGroup()==drumPresets){
     drumDropDown = (int)theEvent.getGroup().getValue();
           for(int i = 0; i<empty.size(); i++){
             tracks.get(6).notes.set(i, drumMap.get(drumDropDown).get(i));
      }
    }
    if(theEvent.getGroup()==bassPresets){
     bassDropDown = (int)theEvent.getGroup().getValue();
           for(int i = 0; i<empty.size(); i++){
             tracks.get(5).notes.set(i, bassMap.get(bassDropDown).get(i));
      }
    }
    if(theEvent.getGroup()==chordsPresets){
     chordsDropDown = (int)theEvent.getGroup().getValue();
           for(int i = 0; i<empty.size(); i++){
             tracks.get(4).notes.set(i, chordsMap.get(chordsDropDown).get(i));
      }
    }
     
  } 
}


void draw(){
  
  //control for the volume sliders
  for(int in = 0 ;in <lead.size(); in++){
   lead.get(in).setGain(Volume0); 
   harmony.get(in).setGain(Volume1); 
   crunch.get(in).setGain(Volume2);
   background.get(in).setGain(Volume3);
   chords.get(in).setGain(Volume4);
   bass.get(in).setGain(Volume5);
   drums.get(in).setGain(Volume6);
  }

  colorMode(RGB);
  background(0);
  strokeWeight(3);
  stroke(0,200,0);
  
  //draws loop button
   if(mouseX>loopButtonX && mouseX<loopButtonX+loopButtonWidth && mouseY>loopButtonY  && mouseY<loopButtonY+loopButtonHeight){
       if(loop){
  fill(0,230,0);
  }
  else{
       fill(0,170,0); 
  }  

   }
 
   else{
  if(loop){
  fill(0,255,0);
  }
  else{
  fill(0,150,0); 
  }
   }
  textSize(10);
  rect(loopButtonX,loopButtonY,loopButtonWidth,loopButtonHeight);
  fill(255);
  text("loop",loopButtonX+10,loopButtonY+30);
  
  //draw instructions
  textSize(20);
  fill(255);
  text("Instructions:",740,30);
  
 //draws play button 
    stroke(0,0,200);
  if(mouseX>playButtonX && mouseX<playButtonX+playButtonWidth && mouseY>playButtonY  && mouseY<playButtonY+playButtonHeight){
       if(play){
  fill(0,0,230);
  }
  else{
       fill(0,0,170); 
  }  

   }
   else{
  if(play){
  fill(0,0,255);
  }
  else{
  fill(0,0,150); 
  }
   }
  textSize(10);
  rect(playButtonX,playButtonY,playButtonWidth,playButtonHeight);
  fill(255);
  if(play){
  text("Pause",playButtonX+5,playButtonY+30);
  }
  else{
     text("Play",playButtonX+5,playButtonY+30); 
  }
  
    //draws quantize button
     stroke(200,0,200);
   if(mouseX>quantButtonX && mouseX<quantButtonX+quantButtonWidth && mouseY>quantButtonY  && mouseY<quantButtonY+quantButtonHeight){
       if(quantize==2){
  fill(230,0,230);
  }
  else{
       fill(170,0,170); 
  }  

   }
 
   else{
  if(quantize==2){
  fill(255,0,255);
  }
  else{
  fill(150,0,150); 
  }
   }
  textSize(10);
  rect(quantButtonX,quantButtonY,quantButtonWidth,quantButtonHeight);
  fill(255);
  text("quantize",quantButtonX-1,quantButtonY+30);
  
  //control for looping
   strokeWeight(1);
  int startPlay = 0;
  int endPlay = 0;
    if(loop){
    startPlay=loopStart;
    endPlay=loopEnd;
  }
  else{
    startPlay=0;
    endPlay=end;
  }
  if(play){
  if(i<(endPlay-startPlay)){
    i++;
  }
  else{
    i=0;
  }
  }
  
  //control for loop dimentions
    if(mousePressed && mouseY<20 && mouseX<612 && mouseX >100){
    if(dist(mouseX,0,100+loopStart*8,0)<dist(mouseX,0,100+loopEnd*8,0)){
     loopStart=(mouseX-100)/8;
    }
    else{
     loopEnd=(mouseX-100)/8;
    }
    if(loopEnd<loopStart){
      loopEnd= loopStart+1;
    }
  }
  
  //control for playing notes
  for(int k = 0; k<tracks.size(); k++){
    tracks.get(k).isPressed=mousePressed;
    tracks.get(k).display(100,20+k*100,startPlay,endPlay+1);
         if(play){
        play(tracks.get(k).instrument,tracks.get(k).notes.get(i+startPlay));
         }
  }
  
  //draws loop dimentions
    stroke(0,100,0);
    strokeWeight(3);
    fill(0,255,0);
    ellipse(100+loopStart*8,10,10,20);
    ellipse(108+loopEnd*8,10,10,20);
    line(100+loopStart*8,20, 100+loopStart*8,20+100*tracks.size()-24);
    line(108+loopEnd*8,20, 108+loopEnd*8,20+100*tracks.size()-24);

  //draws current possition
    stroke(255,0,0);
    strokeWeight(3);
    line(startPlay*8+100+i*8,20,startPlay*8+100+i*8,20+100*tracks.size()-24);
    
    //adjust to change playback speed
    delay(100);
}
class Track{
  //universal constants deffine
  boolean isPressed;
  int instrument;
  IntList notes=new IntList();
  boolean mouseOver=false;
  
  //draw
  void display(int x, int y, int startLoop, int endLoop){
    
    //control for adding notes
    int relX=mouseX-x;
    int relY=(y+76)-mouseY;
    if(relX>0 && relY>0 && relX<512 && relY<76){
          mouseOver=true;
         if(isPressed){
           if(mouseButton != RIGHT){
             if(relY/6 !=0){
           notes.set(round((relX/8)/(quantize))*(quantize), relY/6);
             }
           }
           else{
           notes.set(relX/8, 0);
           }
         }
    }
    else{
     mouseOver = false; 
    }
    
    //draw track
    rectMode(CORNER);
    fill(100);
    strokeWeight(3);
    stroke(70);
    rect(x,y,notes.size()*8,76);
    rectMode(CORNERS);
    fill(0,266,266);
    rect(x+startLoop*8,y,x+endLoop*8,y+76);
    strokeWeight(1);
    stroke(150);
    line(x,y+76-6*1,x+512,y+76-6*1);
    line(x,y+76-6*2,x+512,y+76-6*2);
    line(x,y+76-6*3,x+512,y+76-6*3);
    line(x,y+76-6*4,x+512,y+76-6*4);
    line(x,y+76-6*5,x+512,y+76-6*5);
    line(x,y+76-6*6,x+512,y+76-6*6);
    line(x,y+76-6*7,x+512,y+76-6*7);
    line(x,y+76-6*8,x+512,y+76-6*8);
    line(x,y+76-6*9,x+512,y+76-6*9);
    line(x,y+76-6*10,x+512,y+76-6*10);
    line(x,y+76-6*11,x+512,y+76-6*11);
    line(x,y+76-6*12,x+512,y+76-6*12);
    for(int i = 0; i<=end;i++){
     if(i%16==0){
       stroke(70);
      strokeWeight(3);
      line(x+i*8,y,x+i*8,y+76); 
    }
    else if(i%8==0){
      stroke(60);
      strokeWeight(1.7);
      line(x+i*8,y,x+i*8,y+76);
    }
    else if(i%4==0){
      stroke(100);
     strokeWeight(1.6);
      line(x+i*8,y,x+i*8,y+76); 
    }
    else if(i%2==0){
      stroke(160);
      strokeWeight(1);
      line(x+i*8,y,x+i*8,y+76); 
    }
    strokeWeight(5);
     rectMode(CORNER);
    if(notes.get(i)!=0){
   
     stroke(266,0,0);
    rect(x+i*8,y+76-notes.get(i)*6,1,1);

    }
    
  }    
    
    //draws edges of track
    strokeWeight(3);
    stroke(70);
    fill(100);
    arc(x,y+38,100,76,radians(90),radians(180+90),PIE);
    arc(x+512,y+38,200,76,radians(-90),radians(90),PIE);
    fill(255,0,0);
    textSize(16);
    if(instrument==0){
    text("Melody",x+516,y+45);
    }
    else if(instrument==1){
    text("Harmony",x+516,y+45); 
    }
    else if(instrument==2){
    text("Crunch",x+516,y+45); 
    }
    else if(instrument==3){
    text("Background",x+516,y+45); 
    }
    else if(instrument==4){
    text("Chords",x+516,y+45); 
    }
    else if(instrument==5){
    text("Bass",x+516,y+45); 
    }
    else if(instrument==6){
    text("Drums",x+516,y+45); 
    }
    
    //draws volume symbol
    stroke(255,0,0);
    fill(255,0,0);
    strokeWeight(1);
    beginShape();
    vertex(x-35,y+44);
    vertex(x-40,y+39);
    vertex(x-43,y+39);
    vertex(x-43,y+35);
    vertex(x-40,y+35);
    vertex(x-35,y+31);
    vertex(x-35,y+44);
    endShape();
    noFill();
    arc(x-37,y+38,13,13,0-QUARTER_PI,QUARTER_PI);
    arc(x-37,y+38,20,20,0-QUARTER_PI,QUARTER_PI);
    
    //clear button
    stroke(200,200,0);
    fill(255,255,0);
    strokeWeight(3);
    rect(x-70,y+32,10,10);
    if(mouseX >x-70 && mouseX<x-60 && mouseY>y+32 && mouseY<y+42){
      if(mousePressed){
        for(int i = 0; i<empty.size(); i++){
         notes.set(i, empty.get(i));
        }  
      }
    }
    
    //cotnrol for mouseover
    if(mouseOver && ((y+76)-mouseY)/6>0){
      AudioMetaData meta = drums.get(0).getMetaData();
      if(instrument==6){
      meta = drums.get(((y+76)-mouseY)/6-1).getMetaData();
      }
      else if(instrument==5){
       meta = bass.get(((y+76)-mouseY)/6-1).getMetaData();
      }
      else if(instrument==4){
       meta = chords.get(((y+76)-mouseY)/6-1).getMetaData();
      }
      else if(instrument==3){
       meta = background.get(((y+76)-mouseY)/6-1).getMetaData();
      }
      else if(instrument==2){
       meta = crunch.get(((y+76)-mouseY)/6-1).getMetaData();
      }
      else if(instrument==1){
       meta = harmony.get(((y+76)-mouseY)/6-1).getMetaData();
      }
      else if(instrument==0){
       meta = lead.get(((y+76)-mouseY)/6-1).getMetaData();
      }

      String fileName = meta.fileName();
      String toPrint= fileName.substring(0, fileName.length()-4);
      strokeWeight(1);
      stroke(70);
       fill(200); 
      textSize(10);
      rect(mouseX,mouseY,toPrint.length()*9+10,20);
      fill(0);
      text(toPrint, mouseX+10, mouseY+15);
      
    }

    
  }
  
  //setup
  Track(int notesLength, int tempInstrument){
    for(int i=0;i<=notesLength;i++){
             notes.append(0);
    }
    instrument=tempInstrument;
  }
  
  
}


