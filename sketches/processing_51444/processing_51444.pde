
/**
 *    Live glitching, tatlin's nightmare
 *    by Krystof Pesek / Kof, 2012
 */


// import library for native awt picture manipulation
import java.awt.Toolkit;

// define the JPEG! picture filename
String filename = "tatlin001.jpg";

// create temporary awt.Image obejct 
Image tmp;
// and create resulting PImage processing native object
PImage ptmp, original;

// this is out byte[] data array
// all the *magic* happenes inside
byte[] data;

// some extra PGraphics to beautify output burred border of sketch
PGraphics ram;

// this array is for *console* test outputting error matrix
ArrayList txt;

// dcnt is for printing byte errors after bit bombardment
int dcnt[];

void setup()
{
  // load data into our array first
  data = loadBytes(filename);

  // create the *console* arraylist, each line per entry
  txt = new ArrayList();

  // this calls a function which returns an PImage
  // argument passed means how much damage we want to make
  // original is our backup image so we pass 0, no damage at all
  original = corruptImage(0);

  //this is our displaying image
  //here we can produce first glitch
  //by passing 1
  ptmp = corruptImage(1);

  // let's define the size according to
  // dimmensions of loaded image
  //size(ptmp.width, ptmp.height, P2D);

  //fixed width height for applet only
  size(483, 600, P2D);

  //no smooth for more raw feeling and speed
  noSmooth();

  //functions to load console font
  textFont(loadFont("53Seed-8.vlw"));
  textAlign(RIGHT);
  // for pixel fonts and P2D renderer this
  // is almost necessary for readability
  // the text will not receive transformations
  // but otherwise the font gets really ugly
  textMode(SCREEN);

  // let's create some extra graphics
  ram = createGraphics(width, height, P2D);
  // smooth black border rendering into it
  ram.beginDraw();
  ram.noFill();
  ram.stroke(0, 150);
  ram.strokeWeight(10);
  ram.rect(0, 0, width, height);
  ram.endDraw();
  ram.filter(BLUR, 7.5);
}


/**
 *  Routine to actual data corruption
 */
PImage corruptImage(int howMuch) {
  // this is just for text ouput
  dcnt = new int[howMuch];

  // and here is actual routine for altering jpeg data
  // how much argument recieves how much it shoul alter
  // the data
  for (int i=0;i<howMuch;i++) // 100 changes
  {
    // lowering the number under 255 produces nicer results
    // but it is more *erronous*, 4000 is safe (?)
    // so pick some random byt position from 4000 and end of data
    int loc=(int)random(4000, data.length-1);
    // now slightly add a fragment of random value to the original
    // one, it is enought to create glitch effect 
    data[loc]+=(byte)(((byte)random(10, 255)-data[loc])/20.0);
    // capture incimined data location for output
    dcnt[i] = loc;
  }

  // is try statement is quite useless
  // it is *trying* to avoid some random
  // error appearing from time to time
  //  not sure what it is causing
  //  but we are working with wild data
  //  so we don't care
  try {
    // this is important here we are calling
    // a routine which construct a JPEG image
    //  from byte array data (this is our altered one)
    tmp = GetFromJPEG(data);
  }
  // catch some mess...
  catch(Exception e) {
    // and do nothing
  }

  //ok that's it let's return correct-brand-new-
  //gitchy PImage
  // now it is wihout any formal byte error (!)
  // nice
  return new PImage(tmp);
}


void draw() {
  // every ten frames reload the original
  // the old one got really hurt
  if (frameCount%10==0) {
    data = loadBytes(filename);
  }

  // there is a call for more and more corrupted image
  // it requires an argument *howMuch*, remember?
  // how much damage we need to cause it
  // to make it bit more interesting
  // we can pass some Perlin noise into process
  ptmp = corruptImage((int)(noise(frameCount/30.0)*12));

  // voila! let's display actual result
  image(ptmp, 0, 0);


  // this loop is for that fancy
  // console-like output
  // it is really useless
  // anyway, i like it
  for (int i = 0;i<txt.size();i++) {
    int pos = txt.size()*8;
    String ln = (String)txt.get(i);
    fill(0, 180);
    text(ln, width-3, i*8);
  }

  // here we can construct the line of text
  // by adding some informations about the
  // errors in jpeg
  // the numbers are altered positions
  String matrix = "";
  for (int i =0 ; i < dcnt.length;i++)
    matrix += dcnt[i]+" | ";

  //and add it to arrayList we created before
  txt.add("ERROR matrix: "+matrix);


  // to not get completely overflowed java heap
  // lets remove old entries, the ones wich are not
  // displayed
  if (txt.size()>height/8)
    txt.remove(0);

  //and finaly put some
  //border darkening effect
  image(ram, 0, 0);
}


