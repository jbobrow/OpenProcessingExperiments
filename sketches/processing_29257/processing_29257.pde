
String tenuto = "Path to Tenuto: North Section \n" + 
"Keep on the path and fight onions as you see them. All you really need to do \n" + 
"here is press on, though if you stand by the cliff next to the red flag, \n" +
"you’ll see a question mark over Polka’s head. Press A and \n" + 
"she’ll talk about the ocean. Get used to these question marks.\n" +
"Keep going to trigger a flashback scene with Polka and some of the locals. Aww.\n \n" +

"After the scene, you’ll be at a fork in the path. There is nothing to \n" +
"your right, so take the left path to find another chest and a few more onions. \n" +
"By now you should be a pro at fighting, so just collect the experience and \n" +
"head up the path to Tenuto Village.";

PFont thisFont;


int x = 10;
int y = 20;


void setup () {
  background (0);
  size (600, 300);
  smooth();
  thisFont = loadFont("Scala-16.vlw");

  /*
  textFont (thisFont);
   fill (250);
   text(tenuto, 20, 20, 580, 300);
   */


}

void draw () {
  
  
  String vocalA = "a";
  int aIndex = tenuto.indexOf(vocalA);
  int aCount = 0;
  while(aIndex > -1) {
    aCount = aCount + 1;
    aIndex = tenuto.indexOf("a", aIndex+1);
  }
  println("a =" + aCount);


  String vocalE = "e";
  int wordIndex = tenuto.indexOf(vocalE);
  int eCount = 0;
  while(wordIndex > -1) {
    eCount = eCount + 1;
    wordIndex = tenuto.indexOf("e", wordIndex+1);
  }
  println("e =" + eCount);


  String vocalI = "i";
  int iIndex = tenuto.indexOf(vocalI);
  int iCount = 0;
  while(iIndex > -1) {
    iCount = iCount + 1;
    iIndex = tenuto.indexOf("i", iIndex+1);
  }
  println("i =" + iCount);


  String vocalO = "o";
  int oIndex = tenuto.indexOf(vocalO);
  int oCount = 0;
  while(oIndex > -1) {
    oCount = oCount + 1;
    oIndex = tenuto.indexOf("o", oIndex+1);
  }
  println("o =" + oCount);


  String vocalU = "u";
  int uIndex = tenuto.indexOf(vocalU);
  int uCount = 0;
  while(uIndex > -1) {
    uCount = uCount + 1;
    uIndex = tenuto.indexOf("u", uIndex+1);
  }
  println("u =" + uCount);

  
  for (int i=0; i<tenuto.length(); i= i+1) {
    fill(250);
    text(tenuto.charAt(i), x, y);
    x += textWidth(tenuto.charAt(i));  
    //ganz hässlicher selfmade Blocksatz)
    if (x > 500) {
      x = 10;
      y = y + 20;
    }
    if (tenuto.charAt(i) =='e') {
      fill (150, eCount, 150, 150);
      textSize (eCount/2);
      text("e", x-5, y-10);
      textSize(16);
    }
     if (tenuto.charAt(i) =='a') {
      fill (150, 150, aCount, 150);
      textSize (aCount/2);
      text("a", x-5, y-10);
      textSize(16);
    }
     if (tenuto.charAt(i) =='i') {
      fill (iCount,150, 150, 150);
      textSize (iCount);
      text("i", x-5, y-10);
      textSize(16);
    }
     if (tenuto.charAt(i) =='o') {
      fill (oCount, 150, 150, 150);
      textSize (oCount/2);
      text("o", x-5, y+10);
      textSize(16);
    }
     if (tenuto.charAt(i) =='u') {
      fill (uCount*2, 150, 150, 150);
      textSize (uCount*2);
      text("u", x-5, y+10);
      textSize(16);
    }
  }
}


