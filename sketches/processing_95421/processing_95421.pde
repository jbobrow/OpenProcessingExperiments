

//========================================================
// INTRO
//========================================================
/*
Comedy53 is a Image+Text generator that matches images from popular film to lyrics, in hopes to create
a humourous comic output.

Comedy53 scrapes images from http://film-grab.com/, and uses keywords from those images to search the online 
lyric database http://www.lyricfind.com/services/lyrics-search/ to retrieve lyrics based on those keywords
Keywords from the Movie can also be used to complete search.
The images are then rearranged to match the stanza layout of the lyrics, to create a 3 frame comic.

All images are provided from from http://film-grab.com/ == thank you ME
All lyircs are provided from http://www.lyricfind.com/services/lyrics-search/ == thank you Roy


created by dan hawkins
School of Interactive Art + Technology, SFU
drhawkin@sfu.ca
April 2nd 2013

*/
//========================================================
// GLOBAL VARIABLES
//========================================================
//import libraries
import prohtml.*;
import java.util.*;

PImage webImg1, webImg2, webImg3;
HtmlImageFinder htmlImageFinder;

String [] nothing = {""};
ArrayList words1, words2, words3; // holds word search matches

PFont font;


int imgW = 512; // widthy of the image stills
int imgH = 238; // height of the image stills
// Ai, Bi, Ci, are used for re-ordering images to match stanza position
// Ai = 1st order, Bi = 2nd order, Ci = 3rd order
int Ai = 0;
int Bi = 238;
int Ci = 238*2;


void setup () {
  background(20);
  font = loadFont("MyriadPro-Bold-24.vlw");  
  size(imgW,imgH*3);
  intro();
}

void draw () {
//println("drawdraw");
}//end Draw

// intro message
void intro () {
  
  textFont(font); // myriad font
  textSize(40);
  fill(250);  
  textAlign(CENTER);
  text("Press ENTER to Refresh", 10, (imgH*3)- 55, width-10, imgH*3);
  
  
  textFont(font, 24); //font
   
} // end intro

//**************************************************  
// USER INPUT : KeyBoard
//**************************************************     

void keyPressed () {  
   if (keyCode == ENTER) {
     println("NEW RUN=============================");
     play();
   }
}  // end key pressed
   
//**************************************************  
// RUN PROGRAM --- PLAY
//**************************************************      
void play () {
  
  //1) Select Movie
int randomNumber = int(random(25));
String [] movies = new String [26];

//these movie URLs are loaded manually, rather than scraped from film-grab 
// because some films contain NO label/keywords attached to the image
movies [0] = "http://film-grab.com/2010/11/23/american-beauty/";
movies [1] = "http://film-grab.com/2010/06/23/blade-runner/";
movies [2] = "http://film-grab.com/2010/07/06/2001-a-space-odyssey/";
movies [3] =  "http://film-grab.com/2010/07/07/a-clockwork-orange/";
movies [4] = "http://film-grab.com/2010/10/04/brazil/";
movies [5] = "http://film-grab.com/2010/07/19/the-darjeeling-limited/";
movies [6] = "http://film-grab.com/2010/10/02/the-dark-knight/";
movies [7] = "http://film-grab.com/2010/09/25/easy-rider/";
movies [8] = "http://film-grab.com/2011/01/01/eternal-sunshine-of-the-spotless-mind/";
movies [9] = "http://film-grab.com/2010/11/14/fight-club/";
movies [10] = "http://film-grab.com/2010/07/27/the-godfather/";
movies [11] = "http://film-grab.com/2010/09/01/halloween/";
movies [12] = "http://film-grab.com/2010/09/21/lost-in-translation/";
movies [13] = "http://film-grab.com/2011/01/12/moon/";
movies [14] = "http://film-grab.com/2010/08/22/the-new-world/";
movies [15] = "http://film-grab.com/2010/09/05/o-brother-where-art-thou/";
movies [16] = "http://film-grab.com/2010/06/25/the-prestige/";
movies [17] = "http://film-grab.com/2010/07/09/the-shining/";
movies [18] = "http://film-grab.com/2010/08/16/there-will-be-blood/";
movies [19] = "http://film-grab.com/2010/09/07/this-is-england/";
movies [20] = "http://film-grab.com/2010/08/10/where-the-wild-things-are/";
movies [21] = "http://film-grab.com/2010/08/24/the-wrestler/";
movies [22] =  "http://film-grab.com/2010/07/29/taxi-driver/";
movies [23] = "http://film-grab.com/2010/10/14/rushmore/";
movies [24] = "http://film-grab.com/2010/07/21/days-of-heaven/";
movies [25] = "http://film-grab.com/2011/01/26/butch-cassidy-and-the-sundance-kid/";

 //2) Select Movie KeyWord
String keyWmovie = movies[randomNumber];
String [] keyWm1 = split(keyWmovie, ".com");
String [] keyWm2 = split(keyWm1[1], "/");
String [] keyWm3 = split(keyWm2[4], "/");
String[] movieTemp = concat(keyWm3, nothing);
String  movieKeyword= join (movieTemp, "+");

//insert your url here
htmlImageFinder = new HtmlImageFinder(movies[randomNumber]);

PImage[] images = new PImage[htmlImageFinder.getNumbOfImages()];
println(htmlImageFinder.getNumbOfImages());

//========================================================
// 2)  GENERATE IMAGES from MOVIE
//========================================================
int rand15 = int(random(1,20));
int rand30 = int(random(20,40));
int rand45 = int(random(40,55));

try{
 for(int i = 0;i<50;i++){
   images[i] = loadImage(htmlImageFinder.getImageLink(i));  
   images[i].resize(imgW,imgH); 
 // println(htmlImageFinder.getImageLink(i));
 }//end LOOP

} // end try

catch (NullPointerException e) {
}
  
//========================================================
// GET IMAGES AND KEYWORDS
//========================================================

 // make images better resolution, remove ?w=150& from URL  
   String betterPic1 = htmlImageFinder.getImageLink(rand15);
   String[] picture1 = split(betterPic1,"?w=150&");
   
   String betterPic2 = htmlImageFinder.getImageLink(rand30);
   String[] picture2 = split(betterPic2,"?w=150&");
   
   String betterPic3 = htmlImageFinder.getImageLink(rand45);
   String[] picture3 = split(betterPic3,"?w=150&");
   
     println("this is picture 1..." + picture1[0]); 
     println("this is picture 2..." + picture2[0]);
     println("this is picture 3..." + picture3[0]);
    
   //PImage newImage = new PImage (picture1[0]);
   //image(newImage,0,0);  
    
//   int randStanza = int(random(0,11)); 

  String url1 = picture1[0];
  String url2 = picture2[0];
  String url3 = picture3[0];
  // Load image from a web server
  webImg1 = loadImage(url1, "gif");
  webImg1.resize(imgW,imgH); 
  
  webImg2 = loadImage(url2, "gif");
  webImg2.resize(imgW,imgH); 
  
  webImg3 = loadImage(url3, "gif");
  webImg3.resize(imgW,imgH); 

//default print of images, if no images match
// print images 
  image(webImg1, 0, Ai);
  image(webImg2, 0, Bi);
  image(webImg3, 0, Ci);
  

  
//========================================================
// extract keyword from image
// clean up image, extract keyword -- .png, etc
 

    String kW1a = htmlImageFinder.getImageLink(rand15);
    String[] kW1b = split(kW1a,".png");
    String[] kW1c = split (kW1b[0], "-");
    String [] kW1temp= split (kW1c[1], "1");
    String[] kW1final = concat(kW1temp, nothing);
     
    String kW2a = htmlImageFinder.getImageLink(rand30);
    String[] kW2b = split(kW2a,".png");
    String[] kW2c = split (kW2b[0], "-");
    String[] kW2temp= split (kW2c[1], "1");
    String[] kW2final = concat(kW2temp, nothing);
    
    String kW3a = htmlImageFinder.getImageLink(rand45);
    String[] kW3b = split(kW3a,".png");
    String[] kW3c = split (kW3b[0], "-");
    String[] kW3temp= split (kW3c[1], "1");
    String[] kW3final = concat(kW3temp, nothing);

//========================================================
// GET KEYWORDS AND SEARCH
//========================================================
// add + to end of Keyword to put into URL search

String keyword1temp= join( kW1final, "+");
String keyword1 = keyword1temp;

String keyword2temp= join( kW2final, "+");
String keyword2 = keyword2temp;

String keyword3temp= join( kW3final, "+");
String keyword3 = keyword3temp;

 //========================================================
// MAKE KEKWORD IMAGE detectable, remove + 


String kw1image = keyword1;
if( kw1image.charAt( kw1image.length()-1) == '+' ){
  kw1image = kw1image.substring( 0, kw1image.length()-1 );
}

String kw2image = keyword2;
if( kw2image.charAt( kw2image.length()-1) == '+' ){
  kw2image = kw2image.substring( 0, kw2image.length()-1 );
}

String kw3image = keyword3;
if( kw3image.charAt( kw3image.length()-1) == '+' ){
  kw3image = kw3image.substring( 0, kw3image.length()-1 );
}
println(kw1image); 
println(kw2image);
println(kw3image);
 

// search base
String baseURL = "http://www.lyricfind.com/services/lyrics-search/try-our-search/?q=";

String request = baseURL + keyword1 + keyword2 + keyword3;

// STRING TO ADD MOVIE KEYWORD -- REMOVED RIGHT NOW, can undo Comment to Add
//String request = baseURL + keyword1 + keyword2 + keyword3 + movieKeyword;

println(request);

String lines[] = loadStrings(request);
println("there are " + lines.length + " lines");
for (int i = 0 ; i < lines.length; i++) {
}
 
 //========================================================
 // LYRICS
try {
  // load LYRICS
String lyric = lines[252];
println(lyric);

// CLEAN UP LYRICS

String [] list1 = split(lyric,">");
String [] list2 = split(list1[1],"<em");
String [] emPart = split(list1[2],"</em");
  
String toExclude = "</em>" ;
String lyric0 = lyric.replaceAll(toExclude, "");
String toExclude2 = "<em>" ;
String lyric1 = lyric0.replaceAll(toExclude2, "");
String toExclude3 = "<p style=\"margin-left:25px;\">" ;
String lyric2 = lyric1.replaceAll(toExclude3, "");
String toExclude4 = "</p>" ;
String lyric3 = lyric2.replaceAll(toExclude4, "");  

//========================================================
// Split Lyrics to 3 Stanzas

String [] stanzas = split(lyric3,"/");


 // convertn keyword images to word find search
   String word2find1 = kw1image;
   String word2find2 = kw2image;
   String word2find3 = kw3image;
   
 // convert to upper case to bypass case-sensitice search  
 word2find1 = word2find1.toUpperCase();
 word2find2 = word2find2.toUpperCase();
 word2find3 = word2find3.toUpperCase();
 
 String stanzasPrint1= stanzas[0];
 String stanzasPrint2 = stanzas[1];
 String stanzasPrint3= stanzas[2];
  
  // convert to upper case to bypass case-sensitice search  
 stanzas[0]= stanzas[0].toUpperCase();
 stanzas[1] = stanzas[1].toUpperCase();
 stanzas[2]= stanzas[2].toUpperCase();

//========================================================
// MATCH IMAGE TO KEYWORDS
//========================================================

//========================================================
 //RUN for keyword1  
  for(int i = 0; i < stanzas.length; i++){
   
    words1 = getWords(stanzas[0]);
    words2 = getWords(stanzas[1]);
    words3 = getWords(stanzas[2]);
    
    if(words1.contains(word2find1))
 
    println(kw1image+ " from Image 1 found in Stanza1");
    
    if(words1.contains(word2find1) && words2.contains(word2find3))
    
     println("Winner" + kw2image+ " from Image1 in Stanza1 AND"+ kw3image+" in Stanza2");
     // StanzaW1 = B, only
    
    image(webImg1, 0, Ai);
    image(webImg3, 0, Bi);
    image(webImg2, 0, Ci);
    
    text(stanzasPrint1, 10, (imgH)-55, width-10, (imgH));
    text(stanzasPrint2,10, (imgH*2)-55, width-10, (imgH*2));
    text(stanzasPrint3, 10, (imgH*3)-55, width-10, (imgH*3));
      saveFrame("DW1-####.png");
  
    if(words1.contains(word2find2))
     println(kw2image+" from Image 2 found in Stanza1");
     // StanzaW1 = B, only
    
    image(webImg2, 0, Ai);
    image(webImg1, 0, Bi);
    image(webImg3, 0, Ci);
    
     if(words1.contains(word2find3) )
     println(kw3image+" from Image 3 found in Stanza1");
     // StanzaW1 = B, only
    
    image(webImg3, 0, Ai);
    image(webImg1, 0, Bi);
    image(webImg2, 0, Ci);
    
    
     if(words1.contains(word2find3) && words2.contains(word2find1) )
     println(kw3image+" from Image 3 found in Stanza1 AND Image1 in Stanza2");
     // StanzaW1 = B, only
    
    image(webImg3, 0, Ai);
    image(webImg1, 0, Bi);
    image(webImg2, 0, Ci);
    
    
    
    if(words1.contains(word2find2) && words2.contains(word2find3))
     println(kw2image+" from Image2 found in Stanza1 AND Image3 in Stanza2"); 
     //StanzaW1 = C
    image(webImg2, 0, Ai);
    image(webImg3, 0, Bi);
    image(webImg1, 0, Ci);
    
    text(stanzasPrint1, 10, (imgH)-55, width-10, (imgH));
    text(stanzasPrint2,10, (imgH*2)-55, width-10, (imgH*2));
    text(stanzasPrint3, 10, (imgH*3)-55, width-10, (imgH*3));
      saveFrame("DW1-####.png");

  //========================================================
  //RUN for Stanza 2  
   
    if(words2.contains(word2find1))
     println(kw1image+" from Image 1  found in Stanza2");
     //img2 = stz2
    image(webImg2, 0, Ai);
    image(webImg1, 0, Bi);
    image(webImg3, 0, Ci);
  
     if(words2.contains(word2find2) && words1.contains(word2find3))
      println("== DW" +kw2image+" from Image 2  found in Stanza2 AND image3 in Stanza1");
    // img2 = Stz2 AND img3 =  Stz1
    image(webImg3, 0, Ai);
    image(webImg2, 0, Bi);
    image(webImg1, 0, Ci);
    
    text(stanzasPrint1, 10, (imgH)-55, width-10, (imgH));
    text(stanzasPrint2,10, (imgH*2)-55, width-10, (imgH*2));
    text(stanzasPrint3, 10, (imgH*3)-55, width-10, (imgH*3));
       saveFrame("DW2-####.png");
     
     
     if(words2.contains(word2find3))
     println(kw3image+" from Image 3 found in Stanza2");   
    //Sw2 = C
    image(webImg1, 0, Ai);
    image(webImg3, 0, Bi);
    image(webImg2, 0, Ci);
    
     if(words2.contains(word2find3)&& words1.contains(word2find2))
     println("== DW" + kw3image+" from Image 3 found in Stanza2 " +kw2image+ "from Image2 found in Stanza1");   
    //Sw2 = C
    image(webImg2, 0, Ai);
    image(webImg3, 0, Bi);
    image(webImg1, 0, Ci);
    
    text(stanzasPrint1, 10, (imgH)-55, width-10, (imgH));
    text(stanzasPrint2,10, (imgH*2)-55, width-10, (imgH*2));
    text(stanzasPrint3, 10, (imgH*3)-55, width-10, (imgH*3));
    
      saveFrame("DW2-####.png");
    ///=======================================
     //RUN for Stanza 3  
 
    if(words3.contains(word2find1))
     println(kw1image+" from Image 1  found in Stanza3");
    
    image(webImg3, 0, Ai);
    image(webImg1, 0, Bi);
    image(webImg2, 0, Ci);
    
     if(words3.contains(word2find1)&& words1.contains(word2find3))
     println("== DW" + kw3image+" from Image 3 found in Stanza2 " +kw2image+ "from Image2 found in Stanza2");   
    //Sw2 = C
    image(webImg3, 0, Ai);
    image(webImg2, 0, Bi);
    image(webImg1, 0, Ci);
     text(stanzasPrint1, 10, (imgH)-55, width-10, (imgH));
    text(stanzasPrint2,10, (imgH*2)-55, width-10, (imgH*2));
    text(stanzasPrint3, 10, (imgH*3)-55, width-10, (imgH*3));
      saveFrame("DW3-####.png");
     
     if(words3.contains(word2find2))
     println(kw2image+" from Image 2 found in Stanza3");
   
    image(webImg1, 0, Ai);
    image(webImg3, 0, Bi);
    image(webImg2, 0, Ci);
    
     if(words3.contains(word2find2)&& words1.contains(word2find2))
     println("== DW" + kw3image+" from Image 3 found in Stanza2 " +kw2image+ "from Image2 found in Stanza1");   
    //Sw2 = C
    image(webImg2, 0, Ai);
    image(webImg3, 0, Bi);
    image(webImg1, 0, Ci);
    
    text(stanzasPrint1, 10, (imgH)-55, width-10, (imgH));
    text(stanzasPrint2,10, (imgH*2)-55, width-10, (imgH*2));
    text(stanzasPrint3, 10, (imgH*3)-55, width-10, (imgH*3));
    saveFrame("DW3-####.png");
     
      if(words3.contains(word2find3))
     println(kw3image+" from Image 3 found in Stanza3"); 
     
  
  
  if(words3.contains(word2find3)&& words1.contains(word2find2))
     println("== DW" + kw3image+" from Image 3 found in Stanza2 " +kw2image+ "from Image2 found in Stanza1");   
    //Sw2 = C
    image(webImg2, 0, Ai);
    image(webImg1, 0, Bi);
    image(webImg3, 0, Ci); 
    
    text(stanzasPrint1, 10, (imgH)-55, width-10, (imgH));
    text(stanzasPrint2,10, (imgH*2)-55, width-10, (imgH*2));
    text(stanzasPrint3, 10, (imgH*3)-55, width-10, (imgH*3));
  
  saveFrame("DW3-####.png");
  }  
      

//========================================================
// Final Text Print on Screen
    
    textSize(21);  // text size
    textFont(font, 24); //font
    fill(250);    // white text 
    textAlign(CENTER); // center Text

    text(stanzasPrint1, 10, (imgH)-55, width-10, (imgH));
    text(stanzasPrint2,10, (imgH*2)-55, width-10, (imgH*2));
    text(stanzasPrint3, 10, (imgH*3)-55, width-10, (imgH*3));

// Catch if NO matches are found....
} catch (Exception e){
  println("Hey, that’s not a valid index!");
  text("No Matching Lyrics, Try Again!", 10, (imgH*3)-200, width-10, (imgH*3));
}


} // end run

//Array for WordSearch
 ArrayList getWords(String s){
  String[] w1 = s.split(" ");
  ArrayList w2 = new ArrayList();
  for(int i = 0; i < w1.length; i++){
    w2.add(w1[i]);
  }
  return w2;
}// end getWords




