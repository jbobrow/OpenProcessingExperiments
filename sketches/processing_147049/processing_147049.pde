


import com.getflourish.stt.*;
import ddf.minim.*;

STT stt;
String result;

Minim minim;
AudioPlayer backgroundplayer;
AudioPlayer vox;

PImage background;
int gamestate = 0;
int langeweile = 200;
int geduld = 10;

void setup ()
{
  frameRate(25);
  size(320, 568);

  stt = new STT(this);
  stt.enableDebug();
  stt.setLanguage("de"); 
  stt.enableAutoRecord();
  minim = new Minim(this);
  background = loadImage("onscreen.jpg");
  
  backgroundplayer = minim.loadFile("dialtone-intro.mp3"); 
  vox = minim.loadFile("001.mp3");
  backgroundplayer.play();
  
  textFont(createFont("Arial", 24));
  result = "Say something!";
}

void draw ()
{

  background(0);
  image(background, 0, 0);
//   text(result, mouseX, mouseY);
  stroke(255, 255, 255, 40);

  for(int i = 0; i < backgroundplayer.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, backgroundplayer.bufferSize(), 0, width );
    float x2 = map( i+1, 0, backgroundplayer.bufferSize(), 0, width );
    float y1 = map( i, 0, vox.bufferSize(), 0, width );
    float y2 = map( i+1, 0, vox.bufferSize(), 0, width );
    line( x1, 90 + backgroundplayer.left.get(i)*200 + vox.left.get(i)*200, x2, 93 + backgroundplayer.left.get(i+1)*200 + vox.left.get(i+1)*200);

  }
  
  if (gamestate == 0) {
    if (backgroundplayer.isPlaying()) { }
      else {
        gamestate = 1;
        backgroundplayer = minim.loadFile("musikundregen.mp3");
        backgroundplayer.loop();
        vox = minim.loadFile("001.mp3"); 
        vox.play();
      }
    }
  
  if (gamestate == 99) {
  if (vox.isPlaying()) {}
  else {
   backgroundplayer.close();
   backgroundplayer = minim.loadFile("dialtone-outro.mp3");
   backgroundplayer.play();
   gamestate = 100;
  }  
  }
  
  if (gamestate == 100) {
  if (backgroundplayer.isPlaying()) {}
  else {
   backgroundplayer.close();
   vox.close();
   super.stop();
   exit();
  }  
  }
  
   if (vox.isPlaying() == true ) {
     langeweile = 300;
  } else {
    langeweile = langeweile - 1;
  }


  if (gamestate == 1) {
    
    if (langeweile <= 0) {
    int zufall = int(random(0,3));
    vox.close();
    if (zufall == 0) { vox = minim.loadFile("021.mp3"); }
    if (zufall == 1) { vox = minim.loadFile("019.mp3"); }
    if (zufall == 2) { vox = minim.loadFile("001.mp3"); }
    vox.play(); 
    langeweile = 300;
    }
   
    if (geduld <= 0) {
        vox.close();
        vox = minim.loadFile("013.mp3");
        vox.play(); 
        gamestate = 99;
    }  
  }
  

  
  
}


void transcribe (String utterance, float confidence) 
{
//  println(utterance);
  result = utterance;
 
 String verstanden = utterance;
 String[] woerter = split(verstanden, ' ');
 String checkwort;
 
 utterance = utterance.toLowerCase();
 
 for (int i=0; i<woerter.length; i++) {
   woerter[i] = woerter[i].toLowerCase();
   print(woerter[i] + " ");
   
 
 
   


}


if (utterance == "") {
 } else {
    
// Name
  if( utterance.indexOf("wer bist du") >= 0 ) { vox.close(); vox = minim.loadFile("006.mp3"); vox.play(); return; }
  if( utterance.indexOf("name") >= 0 ) { vox.close(); vox = minim.loadFile("006.mp3"); vox.play(); return; }
  if (utterance.indexOf("heisst") >= 0) { vox.close(); vox = minim.loadFile("006.mp3"); vox.play(); return; }
  
// Alter
  if (utterance.indexOf("alt") >= 0) { vox.close(); vox = minim.loadFile("022.mp3"); vox.play(); return; }
  if (utterance.indexOf("kind") >= 0) { vox.close(); vox = minim.loadFile("022.mp3"); vox.play(); return; }
  
  if ((utterance.indexOf("wo") >= 0) && (utterance.indexOf("eltern") >= 0)) { vox.close(); vox = minim.loadFile("008.mp3"); vox.play(); return; }
  
// Peter die Socke
  if ((utterance.indexOf("du") >= 0 ) && (utterance.indexOf("getötet") >= 0 )) { vox.close(); vox = minim.loadFile("018.mp3"); vox.play(); gamestate = 99; return; }
  if ((utterance.indexOf("peter") >= 0 ) && (utterance.indexOf("getötet") >= 0 )) { vox.close(); vox = minim.loadFile("018.mp3"); vox.play(); gamestate = 99; return; }
  if ((utterance.indexOf("peter") >= 0 ) && (utterance.indexOf("gekillt") >= 0 )) { vox.close(); vox = minim.loadFile("018.mp3"); vox.play(); gamestate = 99; return; }
  if ((utterance.indexOf("du") >= 0 ) && (utterance.indexOf("gekillt") >= 0 )) { vox.close(); vox = minim.loadFile("018.mp3"); vox.play(); gamestate = 99; return; }
  if ((utterance.indexOf("peter") >= 0 ) && (utterance.indexOf("erstochen") >= 0 )) { vox.close(); vox = minim.loadFile("018.mp3"); vox.play(); gamestate = 99; return; }
  if ((utterance.indexOf("du") >= 0 ) && (utterance.indexOf("erstochen") >= 0 )) { vox.close(); vox = minim.loadFile("018.mp3"); vox.play(); gamestate = 99; return; }
  if ((utterance.indexOf("peter") >= 0 ) && (utterance.indexOf("eltern") >= 0 )) { vox.close(); vox = minim.loadFile("016.mp3"); vox.play(); return; }
  if ((utterance.indexOf("peter") >= 0 ) && (utterance.indexOf("vater") >= 0 )) { vox.close(); vox = minim.loadFile("016.mp3"); vox.play(); return; }
   if ((utterance.indexOf("peter") >= 0 ) && (utterance.indexOf("papa") >= 0 )) { vox.close(); vox = minim.loadFile("016.mp3"); vox.play(); return; }
  if ((utterance.indexOf("peter") >= 0 ) && (utterance.indexOf("mutter") >= 0 )) { vox.close(); vox = minim.loadFile("016.mp3"); vox.play(); return; }
  if ((utterance.indexOf("peter") >= 0 ) && (utterance.indexOf("mama") >= 0 )) { vox.close(); vox = minim.loadFile("016.mp3"); vox.play(); return; }
  if ((utterance.indexOf("peter") >= 0 ) && (utterance.indexOf("wieso") >= 0 )) { vox.close(); vox = minim.loadFile("027.mp3"); vox.play(); return; }
  if ((utterance.indexOf("peter") >= 0 ) && (utterance.indexOf("macht") >= 0 )) { vox.close(); vox = minim.loadFile("016.mp3"); vox.play(); return; }
  if( utterance.indexOf("peter") >= 0 ) { vox.close(); vox = minim.loadFile("015.mp3"); vox.play(); return; }
  if( utterance.indexOf("messer") >= 0 ) { vox.close(); vox = minim.loadFile("016.mp3"); vox.play(); return; }
  if (utterance.indexOf("schrei") >= 0 ) { vox.close(); vox = minim.loadFile("027.mp3"); vox.play(); return; }
  
// Musik  
  if( utterance.indexOf("musik") >= 0 ) { vox.close(); vox = minim.loadFile("023.mp3"); vox.play(); return; }
  if( utterance.indexOf("läuft") >= 0 ) { vox.close(); vox = minim.loadFile("023.mp3"); vox.play(); return; }
  if( utterance.indexOf("hintergrund") >= 0 ) { vox.close(); vox = minim.loadFile("023.mp3"); vox.play(); return; }
  if( utterance.indexOf("lied") >= 0 ) { vox.close(); vox = minim.loadFile("023.mp3"); vox.play(); return; }
  
// Haus verlassen
  if( utterance.indexOf("wohn") >= 0 ) { vox.close(); vox = minim.loadFile("026.mp3"); vox.play(); return; }
  if( utterance.indexOf("leb") >= 0 ) { vox.close(); vox = minim.loadFile("026.mp3"); vox.play(); return; }
  if( utterance.indexOf("adresse") >= 0 ) { vox.close(); vox = minim.loadFile("026.mp3"); vox.play(); return; }
  if( utterance.indexOf("haus") >= 0 ) { vox.close(); vox = minim.loadFile("024.mp3"); vox.play(); return; }
  if( utterance.indexOf("regen") >= 0 ) { vox.close(); vox = minim.loadFile("024.mp3"); vox.play(); return; }
  if( utterance.indexOf("raus") >= 0 ) { vox.close(); vox = minim.loadFile("024.mp3"); vox.play(); return; }
  
// Eltern  
  if( utterance.indexOf("eltern") >= 0 ) { vox.close(); vox = minim.loadFile("003.mp3"); vox.play(); return; }
  if( utterance.indexOf("mutter") >= 0 ) { vox.close(); vox = minim.loadFile("010.mp3"); vox.play(); return; }
  if( utterance.indexOf("mama") >= 0 ) { vox.close(); vox = minim.loadFile("010.mp3"); vox.play(); return; }
  if(( utterance.indexOf("wieso") >= 0 ) && (utterance.indexOf("vater") >= 0)) { vox.close(); vox = minim.loadFile("009.mp3"); vox.play(); return; }
  if(( utterance.indexOf("wieso") >= 0 ) && (utterance.indexOf("papa") >= 0)) { vox.close(); vox = minim.loadFile("009.mp3"); vox.play(); return; }
  if(( utterance.indexOf("vater") >= 0 ) && (utterance.indexOf("gemacht") >= 0)) { vox.close(); vox = minim.loadFile("009.mp3"); vox.play(); return; }
  if(( utterance.indexOf("papa") >= 0 ) && (utterance.indexOf("gemacht") >= 0)) { vox.close(); vox = minim.loadFile("009.mp3"); vox.play(); return; }
  if(( utterance.indexOf("wo") >= 0 ) && (utterance.indexOf("vater") >= 0)) { vox.close(); vox = minim.loadFile("008.mp3"); vox.play(); return; }
  if(( utterance.indexOf("wo") >= 0 ) && (utterance.indexOf("papa") >= 0)) { vox.close(); vox = minim.loadFile("008.mp3"); vox.play(); return; }
  if( utterance.indexOf("hol") >= 0 ) { vox.close(); vox = minim.loadFile("008.mp3"); vox.play(); return; }
  if( utterance.indexOf("vater") >= 0 ) { vox.close(); vox = minim.loadFile("007.mp3"); vox.play(); return; }
  if( utterance.indexOf("papa") >= 0 ) { vox.close(); vox = minim.loadFile("007.mp3"); vox.play(); return; }
  if( utterance.indexOf("schlafen") >= 0 ) { vox.close(); vox = minim.loadFile("008.mp3"); vox.play(); return; }
  if( utterance.indexOf("müde") >= 0 ) { vox.close(); vox = minim.loadFile("008.mp3"); vox.play(); return; }
  if( utterance.indexOf("bad") >= 0 ) { vox.close(); vox = minim.loadFile("011.mp3"); vox.play(); return; }
  if( utterance.indexOf("küche") >= 0 ) { vox.close(); vox = minim.loadFile("011.mp3"); vox.play(); return; }
  if( utterance.indexOf("blut") >= 0 ) { vox.close(); vox = minim.loadFile("011.mp3"); vox.play(); return; }
  if( utterance.indexOf("keller") >= 0 ) { vox.close(); vox = minim.loadFile("011.mp3"); vox.play(); return; }
  if( utterance.indexOf("sauerei") >= 0 ) { vox.close(); vox = minim.loadFile("020.mp3"); vox.play(); return; }
  
//  Alleine
   if( utterance.indexOf("alleine") >= 0 ) { vox.close(); vox = minim.loadFile("014.mp3"); vox.play(); return; }
   if( utterance.indexOf("tod") >= 0 ) { vox.close(); vox = minim.loadFile("014.mp3"); vox.play(); return; }
   if( utterance.indexOf("tot") >= 0 ) { vox.close(); vox = minim.loadFile("014.mp3"); vox.play(); return; }
   if( utterance.indexOf("jemand") >= 0 ) { vox.close(); vox = minim.loadFile("014.mp3"); vox.play(); return; }
  
// Hallo
  if (utterance.indexOf("hallo") >= 0) { vox.close(); vox = minim.loadFile("021.mp3"); vox.play(); return; }
  if (utterance.indexOf("schön") >= 0) { vox.close(); vox = minim.loadFile("028.mp3"); vox.play(); return; }
  if (utterance.indexOf("lieb") >= 0) { vox.close(); vox = minim.loadFile("028.mp3"); vox.play(); return; }
  if (utterance.indexOf("brav") >= 0) { vox.close(); vox = minim.loadFile("028.mp3"); vox.play(); return; }
  
// Telefon
  if (utterance.indexOf("telefon") >= 0) { vox.close(); vox = minim.loadFile("025.mp3"); vox.play(); return; }
  if (utterance.indexOf("kling") >= 0) { vox.close(); vox = minim.loadFile("025.mp3"); vox.play(); return; }

// Das geht mir aber etwas zuweit.
  if (utterance.indexOf("komm") >= 0) { vox.close(); vox = minim.loadFile("017.mp3"); vox.play(); return; }
  if (utterance.indexOf("sex") >= 0) { vox.close(); vox = minim.loadFile("017.mp3"); vox.play(); return; }
  if (utterance.indexOf("wahrheit") >= 0) { vox.close(); vox = minim.loadFile("017.mp3"); vox.play(); return; }

// Nein. Wieso?
  if (utterance.indexOf("hilf") >= 0 ) { vox.close(); vox = minim.loadFile("005.mp3"); vox.play(); return; }
  if (utterance.indexOf("bruder") >= 0 ) { vox.close(); vox = minim.loadFile("005.mp3"); vox.play(); return; }
  if (utterance.indexOf("schwester") >= 0 ) { vox.close(); vox = minim.loadFile("005.mp3"); vox.play(); return; }
  if (utterance.indexOf("kann") >= 0 ) { vox.close(); vox = minim.loadFile("005.mp3"); vox.play(); return; }
  if (utterance.indexOf("möchtest") >= 0 ) { vox.close(); vox = minim.loadFile("005.mp3"); vox.play(); return; }
  if (utterance.indexOf("will") >= 0 ) { vox.close(); vox = minim.loadFile("005.mp3"); vox.play(); return; }
  if (utterance.indexOf("lüg") >= 0 ) { vox.close(); vox = minim.loadFile("005.mp3"); vox.play(); return; }
  
// FRAGEN!  
   if (utterance.indexOf("wie") >= 0 ) { vox.close(); vox = minim.loadFile("029.mp3"); vox.play(); return; }
   if (utterance.indexOf("weshalb") >= 0 ) { vox.close(); vox = minim.loadFile("029.mp3"); vox.play(); return; }
   if (utterance.indexOf("wo") >= 0 ) { vox.close(); vox = minim.loadFile("029.mp3"); vox.play(); return; }
   if (utterance.indexOf("warum") >= 0 ) { vox.close(); vox = minim.loadFile("029.mp3"); vox.play(); return; }
  
// Tschüüs
  if (utterance.indexOf("tschüss") >= 0 ) { vox.close(); vox = minim.loadFile("013.mp3"); vox.play(); gamestate = 99; return; }
  if (utterance.indexOf("häng") >= 0 ) { vox.close(); vox = minim.loadFile("013.mp3"); vox.play(); gamestate = 99; return; }
  if (utterance.indexOf("schluss") >= 0 ) { vox.close(); vox = minim.loadFile("013.mp3"); vox.play(); gamestate = 99; return; }
  if (utterance.indexOf("ciao") >= 0 ) { vox.close(); vox = minim.loadFile("013.mp3"); vox.play(); gamestate = 99; return; }
  if (utterance.indexOf("wiedersehen") >= 0 ) { vox.close(); vox = minim.loadFile("013.mp3"); vox.play(); gamestate = 99; return; }
  
 }
   
 
 
 
  
 
 println();
 
 if (utterance == "") {
 } else {
 int zufall = int(random(0,4));
 vox.close();
   if (zufall == 0) { vox = minim.loadFile("002.mp3"); }
   if (zufall == 1) { vox = minim.loadFile("003.mp3"); }
   if (zufall == 2) { vox = minim.loadFile("004.mp3"); }
   if (zufall == 3) { vox = minim.loadFile("020.mp3"); }
   geduld = geduld - 1;
 vox.play();
 return; 
 }
     
}
  

void mouseReleased() {

}




void stop()
{
  backgroundplayer.close();
  vox.close();
  
  super.stop();
}


