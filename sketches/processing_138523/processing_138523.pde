
/**
 * readerjs
 *
 * speed reader based on
 * http://www.spreeder.com
 *
 * by perdide, 2014
 * perdidem@gmail.com
 *
 */


import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;


int tempo = 400;
int nbw = 2;
int jumpStep = 25;

String[] words;
String texte, item;
PFont font40, font10;
int i, n;
int lastT, dT, T, initT;
float AVGspeed, speed;
int w, h;
Boolean pause = false;


void setup() {

  size (800, 200, P2D);
  frameRate (60);
  w = width;
  h = height;
  
  font10 = loadFont("AvenirNext-Regular-10.vlw");
  font40 = loadFont("AvenirNext-Regular-40.vlw");
  textAlign(CENTER);
  fill (0);
  
  dT = 0;
  n = 0;

  loadDefaultFile ();
}


void draw() {

  T = millis();
  dT = T - lastT;

  if ((!pause) && (dT >= tempo) && (i < n)) {
    
    lastT = T;
    background (255);
    
    item = "";
    for (int j=0; j<nbw; j++) if (i<n) item += words[i++] + " ";
    textFont (font40, 40);
    text (item, w/2, (h+20)/2);
    
    AVGspeed = i*60000/(1+T-initT);
    speed = 60000*nbw/tempo;
    textFont (font10, 10);
    text (floor(speed) + "  :  " + floor(AVGspeed) + " wpm", 50, h-20);
  }

}


void keyPressed()
{
  if ((key == 'a') || (key == 'q')) tempo += 10;
  if ((key == 'z') || (key == 'w')) tempo -= 10;
  if ((key > '0') && (key < '7')) nbw = key-'0';
  if ((key == 'v') || (key == 0x16)) GetTextFromClipboard();
  if (key == '@') GetTextFromFile();
  if (key == ' ') pause = ((pause)?false:true);
  if ((key == CODED) && (keyCode == LEFT)) {i-=jumpStep; i = max(0, i);}
  if ((key == CODED) && (keyCode == RIGHT)) {i+=jumpStep; i = min(n-1, i);}
}


void GetTextFromFile()
{
  selectInput ("Select a text file to process:", "file");
}


void loadDefaultFile ()
{
  String[] lines = loadStrings ("data.txt");
  texte = join (lines, " ");
  words = splitTokens (texte);
  n = words.length;
  initT = millis();
  i=0;
}


void file (File selection) {
  if (selection == null)
    println ("NO FILE SELECTED");
  else {
    String[] lines = loadStrings (selection.getAbsolutePath());
    texte = join (lines, " ");
    words = splitTokens (texte);
    n = words.length;
    initT = millis();
    i=0;
  }
}


void GetTextFromClipboard()
{
  texte = (String) GetFromClipboard(DataFlavor.stringFlavor);
  words = splitTokens (texte);
  n = words.length;
  initT = millis();
  i=0;
  println(texte);
}


Object GetFromClipboard(DataFlavor flavor)
{
  Clipboard clipboard = getToolkit().getSystemClipboard();
  Transferable contents = clipboard.getContents(null);
  Object obj = null;
  if (contents != null && contents.isDataFlavorSupported(flavor)) {
    try {
      obj = contents.getTransferData(flavor);
    }
    catch (UnsupportedFlavorException exu) {
      println("Unsupported flavor: " + exu);
      //~ exu.printStackTrace();
    }
    catch (java.io.IOException exi) {
      println("Unavailable data: " + exi);
      //~ exi.printStackTrace();
    }
  }
  return obj;
}


