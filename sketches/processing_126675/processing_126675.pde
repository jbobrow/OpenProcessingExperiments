
// TODO:
// 1. Put a little grey dot where letters can go
// 2. "You're getting there" should only show if its a good step forward
//    Otherwise, say something like "that doesn't help"
//    Root has k characters, current tiles has j characters
//    Distance is j-k, see if distance decreases upon move
//    If so, then print "you've made progress" otherwise, "that was not helpful"
//    If not helpful, then also put a gray line underneath the offending change
// 3. Prevent duplicate characters as hints.
// 4. You have for the guess letter array and a diacritical array.
//    You want the same for the answer, so you need to parse the unicode
//    into a diacritical array and a letter array.

//sets the gamemode
var mode = 1;

//tile images
PImage alif = null,alifHam = null,alifMak = null,ayn = null,beh = null,daad = null,daal = null,damma = null,dhaal = null,fatha = null,feh = null,ghayn = null,haa = null,hay = null,jeem = null,kaf = null,kasra = null,khaa = null,laam = null,miim = null,nuun = null,qaaf = null,raa = null,saad = null,seen = null,shadda = null,shin = null,sukun = null,taah = null,teh = null,thaa = null,theh = null,waaw = null,waawHam = null,yaa = null,zay = null;

//font var
PFont f = loadFont("Arial");

//contains tiles for root
var root = new Array(null, null, null);
//tiles that the player will manipulate
var tiles = new Array();
//diacritical mark tiles
var diacrits = new Array();

//translating hashmap
var trans = new HashMap();

//translating hashmap
var images = new HashMap();

var xOffset = 0;
var yOffset = 0;
var lockedTile = null;

var txt = null, txt = null, answer = null;
var chars = new Array();
var diaChars = new Array();

//array to contain the text file
var txtfile = null;
//array to contain the mode's unique characters
var modChars = null;
//array to contain characters that are correct in quiz mode
var correctChars = null;

/* @pjs preload="images/alif.png,images/alifHamsa.png,images/alifMaksura.png,images/ayn.png,images/beh.png,images/daad.png,images/daal.png,images/damma.png,images/dhaal.png,images/fatha.png,images/feh.png,images/ghayn.png,images/haa.png,images/hay.png,images/jeem.png,images/kaf.png,images/kasra.png,images/khaa.png,images/laam.png,images/miim.png,images/nuun.png,images/qaaf.png,images/raa.png,images/saad.png,images/seen.png,images/shadda.png,images/shin.png,images/sukun.png,images/taah.png,images/teh.png,images/thaa.png,images/theh.png,images/waaw.png,images/waawHamsa.png,images/yaa.png,images/zay.png"; */

void setup() {
  fill(0);
  size(800, 600);

  frameRate(30);
  
  var t = loadStrings("test.txt");
  txtfile = t;
  
  var m = txtfile[1].split(",");
  modChars = m;
  
  textFont(f, 32);
  textAlign(CENTER);
  
  imageMode(CENTER);
  
  
  //load images to variables
  alif = loadImage("images/alif.png");
  alifHam = loadImage("images/alifHamsa.png");
  alifMak = loadImage("images/alifMaksura.png");
  ayn = loadImage("images/ayn.png");
  beh = loadImage("images/beh.png");
  daad = loadImage("images/daad.png");
  daal = loadImage("images/daal.png");
  damma = loadImage("images/damma.png");
  dhaal = loadImage("images/dhaal.png");
  fatha = loadImage("images/fatha.png");
  feh = loadImage("images/feh.png");
  ghayn = loadImage("images/ghayn.png");
  haa = loadImage("images/haa.png");
  hay = loadImage("images/hay.png");
  jeem = loadImage("images/jeem.png");
  kaf = loadImage("images/kaf.png");
  kasra = loadImage("images/kasra.png");
  khaa = loadImage("images/khaa.png");
  laam = loadImage("images/laam.png");
  miim = loadImage("images/miim.png");
  nuun = loadImage("images/nuun.png");
  qaaf = loadImage("images/qaaf.png");
  raa = loadImage("images/raa.png");
  saad = loadImage("images/saad.png");
  seen = loadImage("images/seen.png");
  shadda = loadImage("images/shadda.png");
  shin = loadImage("images/shin.png");
  sukun = loadImage("images/sukun.png");
  taah = loadImage("images/taah.png");
  taaDam = loadImage("taaDam.png");
  taaFat = loadImage("taaFat.png");
  taaKas = loadImage("taaKas.png");
  taaReg = loadImage("taaReg.png");
  taaSuk = loadImage("taaSuk.png");
  teh = loadImage("images/teh.png");
  thaa = loadImage("images/thaa.png");
  theh = loadImage("images/theh.png");
  waaw = loadImage("images/waaw.png");
  waawHam = loadImage("images/waawHamsa.png");
  yaa = loadImage("images/yaa.png");
  zay = loadImage("images/zay.png");
  
  //maps unicode letter to image    
  images.put("ا", alif);
  images.put("أ", alifHam);
  images.put("ئ", alifMak);
  images.put("ع", ayn);
  images.put("ب", beh);
  images.put("ض", daad);
  images.put("د", daal);
  images.put("ُ", damma);
  images.put("ز", dhaal);
  images.put("َ", fatha);
  images.put("ف", feh);
  images.put("غ", ghayn);
  images.put("ح", haa);
  images.put("ه", hay);
  images.put("ج", jeem);
  images.put("ك", kaf);
  images.put("ِ", kasra);
  images.put("خ", khaa);
  images.put("ل", laam);
  images.put("م", miim);
  images.put("ن", nuun);
  images.put("ق", qaaf);
  images.put("ر", raa);
  images.put("ص", saad);
  images.put("ّ", shadda);
  images.put("ش", shin);
  images.put("س", seen);
  images.put("ْ",  sukun);
  images.put("ط", taah);
  images.put("ت", teh);
  images.put("ظ", thaa);
  images.put("ث", theh);
  images.put("و", waaw);
  images.put("ؤ", waawHam);
  images.put("ي", yaa);
  images.put("ز", zay);   
 
  var i = 0; 

  for (i = 2; i < txtfile.length; i+=3) {
    trans.put(txtfile[i], txtfile[i+2]);
  }
  
  tiles = new Array();
    
  
 if (mode == 1) {
   for (i = 0; i < modChars.length; i++) {
     tiles[i] = new Tile(50 + 100*i, 450, modChars[i], images.get(modChars[i]));
   }
  }
 else if (mode == 2) {
    reset();
  }
  
  
  var rootChars = txtfile[0].split(",");
  root[0] = images.get(rootChars[0]);
  root[1] = images.get(rootChars[1]);
  root[2] = images.get(rootChars[2]);
  
  //initialize the root array
  chars[0] = "";
  chars[1] = "";
  chars[2] = rootChars[0];
  chars[3] = rootChars[1];
  chars[4] = rootChars[2];
  chars[5] = "";
  chars[6] = "";
    
  //intialize the diacritical array
  for (i = 0; i < 7; i++) {
    diaChars[i] = "";
  }
  
}

void draw() {   
  fill(0);  
  background(255);
    
  var rootChars = txtfile[0].split(",");

  // draw the diacriticals
  image(fatha, width/2 - 150, height - 50, 100, 100);
  image(kasra, width/2 -  50, height - 25, 100, 100);
  image(damma, width/2 +  50, height - 50, 100, 100);
  image(sukun, width/2 + 150, height - 50, 100, 100);
    
  //discovery mode
  if (mode == 1) {
    displayRoot();
    displayTiles();
    getArabicString();
    printAndTranslate();
    if (keyPressed && key == '2') {
      reset();
      mode = 2;
    }
  }
  
  //quiz mode
  else if (mode == 2) {
    displayRoot();
    displayTiles();
    getArabicString();
    prompt();
    if (keyPressed && key == '1') {
      tiles.length = 0;
      diacrits.length = 0;
      mode = 1;
      for (int i = 0; i < modChars.length; i++) {
        tiles[i] = new Tile(50 + 100*i, 450, modChars[i], images.get(modChars[i]));
      }
    }
  }
}

public void displayRoot() {
  image(root[0], width/2 + 75, height*6/20, 100, 150);
  image(root[1], width/2 +  0, height*6/20, 100, 150);
  image(root[2], width/2 - 75, height*6/20, 100, 150);
}

public void displayTiles() {
  var i;
  for (i = 0; i < tiles.length; i++) {
    image(tiles[i].img, tiles[i].posX, tiles[i].posY, 100, 150);
  }
  for (i = 0; i < diacrits.length(); i++) {
    image(diacrits[i].img, diacrits[i].posX, diacrits[i].posY, 100, 100);
  }
}

//get the string of Arabic letters
public void getArabicString() {
  //set txt to be the string of all characters in the array
  txt = "";
  for(var i = 0; i < chars.length; i++) {
    txt = txt + chars[i] + diaChars[i];
  }
}


//prints Arabic and English strings
public void printAndTranslate() {
  text(txt, width/2, height*9/20);
  txt2 = trans.get(txt);
  if (txt2 != null) 
    text(txt2, width/2, height*11/20);
  else {
    text("(not in dictionary)", width/2, height*11/20);
  }
}

//prompts the user for the answer and evaluates
public void prompt() {
  text(txt, width/2, height*9/20);
  if (txt.equals(chars[2] + chars[3] + chars[4])) {
    text("please enter: " + answer, width/2, height*11/20);
  }
  else {
    txt2 = trans.get(txt);
    if (txt2 != null && txt2.equals(answer)) {
      text("correct! press enter to reset", width/2, height*11/20);
      if (keyPressed && key == ENTER) {
        reset();
      }
    }
    else if (partialMatch()) {
      text("you're getting there!", width/2, height*11/20);
    }
    else {
      text("try again!", width/2, height*11/20);
    }
  }
}

function partialMatch() {
  for (var i = 0; i < correctChars.length; i++) {
    if (correctChars[i] == chars[0] ||
        correctChars[i] == chars[1] ||
        correctChars[i] == chars[5] ||
        correctChars[i] == chars[6]) 
      return true;
  }
  return false;
}

public void reset() {
  var rand = (int)random(0, ((txtfile.length - 5) /3));
  var randIndex = shuffle();
  answer = txtfile[3 * rand + 7];
  tiles.length = 0;
  diacrits.length = 0;
  var aChars = txtfile[3 * rand+6].split(",");
  correctChars = aChars;
  var i;
  chars[0] = ""; chars[1] = ""; chars[5] = ""; chars[6] = "";
  for (i = 0; i < diaChars.length; i++) {
    diaChars[i] = "";
  }
  for (i = 0; i < aChars.length; i++) {
    tiles[i] = new Tile(300 + 100*randIndex[i], 450, aChars[i], images.get(aChars[i]));
  }
  var rChars = txtfile[1].split(",");
  for (i = aChars.length; i < 3; i++) {
    rand = (int)random(0, rChars.length);
    tiles[i] = new Tile(300 + 100*randIndex[i], 450, rChars[rand], images.get(rChars[rand]));
  }
}

function shuffle() {
  var randArray = new Array();
  var a = 3;
  var i;
  for (i = 0; i < a; i++) {
    randArray[i] = i;
  }
  var rand;
  var tmp;
  for (i = 0; i < a; i++) {
    rand = (int)random(0, a);
    tmp = randArray[i];
    randArray[i] = randArray[rand];
    randArray[rand] = tmp;
  }
  return randArray;
}

//used for dragging
public void mousePressed() {
  if (lockedTile == null) {
    //locks a tile to be dragged
    //currently prioritized to tiles that are placed in array earlier
    //think about fixing latter down the road
    lockedTile = topTile();
    var i = lockedBounds();
    if (i > -1)  {
      if (lockedTile.img.equals(fatha) ||
          lockedTile.img.equals(kasra) ||
          lockedTile.img.equals(damma) ||
          lockedTile.img.equals(sukun)) {
        diaChars[i] = "";
      }
      else chars[i] = "";
    }
  }
  else {
    xOffset = mouseX - lockedTile.posX;
    yOffset = mouseY - lockedTile.posY;
  }
}

//used for dragging
public void mouseDragged() {
  if (lockedTile != null) {
    lockedTile.posX = mouseX - xOffset;
    lockedTile.posY = mouseY - yOffset;
  }
}
  
  //releases the locked tile
public void mouseReleased() {
  if (lockedTile != null) {
    var i = lockedBounds();
    if (lockedTile.img.equals(kasra)) {
      if (i > -1) {
        lockedTile.posX = (float) (width/2 + 275 - (90 * i));
        lockedTile.posY = height*8/20;
        diaChars[i] = lockedTile.c;
      }
      else lockedTile.posX = -100;
      lockedTile = null;
    }
    else if (lockedTile.img.equals(fatha) ||
        lockedTile.img.equals(damma) ||
        lockedTile.img.equals(sukun)) {
      if (i > -1) {
        lockedTile.posX = (float) (width/2 + 275 - (90 * i));
        lockedTile.posY = height*4/20;
        diaChars[i] = lockedTile.c;
      }
      else lockedTile.posX = -100;
      lockedTile = null;
    }
    else {
      if (i > -1) {
        lockedTile.posX = (float) (width/2 + 275 - (90 * i));
        lockedTile.posY = height*6/20;
        chars[i] = lockedTile.c;
      }
      else {
        lockedTile.posX = lockedTile.stickyX;
        lockedTile.posY = lockedTile.stickyY;
      }
    lockedTile = null;
    }
  }
  /*
  for (int j = 0; j < diacrits.size(); j++) {
    if (diacrits.get(j).posX < 0) diacrits.remove(j);
  }
  */
}

//gets the first tile in the tile array that the mouse is hovering over
//this prevents more than one tile from being selected at a time
function topTile() {
  var i;
  for (i = 0; i < tiles.length; i++) {
    if (mouseX > tiles[i].posX - 75 &&
      mouseX < tiles[i].posX + 75 &&
      mouseY > tiles[i].posY - 50 &&
      mouseY < tiles[i].posY + 50) {
      return tiles[i];
    }
  }
  for (i = 0; i < diacrits.length; i++) {
    if (mouseX > diacrits[i].posX - 50 &&
      mouseX < diacrits[i].posX + 50 &&
      mouseY > diacrits[i].posY - 50 &&
      mouseY < diacrits[i].posY + 50) {
      return diacrits[i];
    }
  }
  if (mouseY > height - 100) {
    if (mouseX > width/2 - 175 && mouseX < width/2 - 125) {
      var t = new Tile(mouseX, mouseY, "\u064e", fatha);
      var index = diacrits.length;
      diacrits[index] = t;
      return t;
    }
    else if (mouseX > width/2 - 75 && mouseX < width/2 - 25) {
      var t = new Tile(mouseX, mouseY, "\u0650", kasra);
      var index = diacrits.length;
      diacrits[index] = t;
      return t;
      }
    else if (mouseX > width/2 + 25 && mouseX < width/2 + 75) {
      var t = new Tile(mouseX, mouseY, "\u064f", damma);
      var index = diacrits.length;
      diacrits[index] = t;
      return t;
    }
    else if (mouseX > width/2 + 125 && mouseX < width/2 + 175) {
      var t = new Tile(mouseX, mouseY, "\u0652", sukun);
      var index = diacrits.length;
      diacrits[index] = t;
      return t;
    }
  }
  return null;
}
  
function lockedBounds() {
  var t = lockedTile;
  if (t == null) return -1;
  if (  t.posX < width/2 + 300 &&
      t.posX > width/2 + 250 &&
      t.posY > height*6/20 - 150 &&
      t.posY < height*6/20 + 150)
    return 0;
  if (  t.posX < width/2 + 200 &&
      t.posX > width/2 + 150 &&
      t.posY > height*6/20 - 150 &&
      t.posY < height*6/20 + 150)
    return 1;
  if (  t.posX > width/2 - 200 &&
      t.posX < width/2 - 150 &&
      t.posY > height*6/20 - 150 &&
      t.posY < height*6/20 + 150) 
    return 5;
  if (  t.posX > width/2 - 300 &&
      t.posX < width/2 - 250 &&
      t.posY > height*6/20 - 150 &&
      t.posY < height*6/20 + 150) 
    return 6;
  
  return -1;
}

class Tile {
  float stickyX;
  float stickyY;
  float posX;
  float posY;
  String c;
  int arrayPos = -1;
  boolean overTile = false;
  boolean locked = false;
  PImage img;
  
  Tile(float x, float y, String cha, PImage pi) {
    stickyX = x; posX = x; stickyY = y; posY = y; c = cha; img = pi; 
  }
}



