

//========================================================
// INTRO
//========================================================

//========================================================
// GLOBAL VARIABLES
//========================================================
import prohtml.*;

PImage webImg1, webImg2, webImg3;
HtmlImageFinder htmlImageFinder;

PFont font;
font = loadFont("MyriadPro-Bold-24.vlw");  

int imgW = 512; // widthy of the image stills
int imgH = 238; // height of the image stills
int rand15 = int(random(1,15));
int rand30 = int(random(15,30));
int rand45 = int(random(30,45));


String [] movies = new String [3];
movies [0] = "http://film-grab.com/2010/11/23/american-beauty/";
movies [1] = "http://film-grab.com/2010/06/23/blade-runner/";
movies [2] = "http://film-grab.com/2010/07/06/2001-a-space-odyssey/";

//insert your url here
htmlImageFinder = new HtmlImageFinder(movies[2]);

PImage[] images = new PImage[htmlImageFinder.getNumbOfImages()];
println(htmlImageFinder.getNumbOfImages());
size(imgW,imgH*3);

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
// extract keyword from image
    String kW1a = htmlImageFinder.getImageLink(rand15);
    String[] kW1b = split(kW1a,".png");
    String[] kW1c = split (kW1b[0], "-");
    String [] kW1final= split (kW1c[1], "1");
    String kW1F = kW1final[0];
    println("image1..."+ kW1F);
    
    String kW2a = htmlImageFinder.getImageLink(rand30);
    String[] kW2b = split(kW2a,".png");
    String[] kW2c = split (kW2b[0], "-");
    String[] kW2final= split (kW2c[1], "1");
    println("image2..." + kW2final[0]);
    println(kW2a);
    
    String kW3a = htmlImageFinder.getImageLink(rand45);
    String[] kW3b = split(kW3a,".png");
    String[] kW3c = split (kW3b[0], "-");
    String[] kW3final= split (kW3c[1], "1");
    println("image3..." + kW3final[0]);
    
 // make images better resolution, remove ?w=150& from URL  
   String betterPic1 = htmlImageFinder.getImageLink(rand15);
   String[] picture1 = split(betterPic1,"?w=150&");
   
   String betterPic2 = htmlImageFinder.getImageLink(rand30);
   String[] picture2 = split(betterPic2,"?w=150&");
   
   String betterPic3 = htmlImageFinder.getImageLink(rand45);
   String[] picture3 = split(betterPic3,"?w=150&");
   
   println("this is picture 1..." + picture1[0]); 
    
   //PImage newImage = new PImage (picture1[0]);
   //image(newImage,0,0);  
    
  int randStanza = int(random(0,11)); 

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

  image(webImg1, 0, 0);
  image(webImg2, 0, imgH);
  image(webImg3, 0, imgH*2);
  
  println(kW1final);


//========================================================
// GET KEYWORDS AND SEARCH
//========================================================


String keyword1temp= join( kW1final, "+");
String keyword1 = keyword1temp;

String keyword2temp= join( kW2final, "+");
String keyword2 = keyword2temp;

String keyword3temp= join( kW3final, "+");
String keyword3 = keyword3temp;

 
println (keyword1);
println (keyword2);
println (keyword3);

// search
String baseURL = "http://www.lyricfind.com/services/lyrics-search/try-our-search/?q=";

String request = baseURL + keyword1 + keyword2 + keyword3;

println(request);



String lines[] = loadStrings(request);
println("there are " + lines.length + " lines");
for (int i = 0 ; i < lines.length; i++) {
}
 

String lyric = lines[252];
println(lyric);
//String htmlJunk = htmlList.pageList;
String [] list1 = split(lyric,">");
try {
String [] list2 = split(list1[1],"<em");
}
catch(Exception e) {
}

println(list1[1]);
println(list1[2]);

String [] emPart = split(list1[2],"</em");
//println(emPart[0]);

//println(list2[0]);

//println(list2[0] + emPart[0]);

String toExclude = "</em>" ;
String lyric0 = lyric.replaceAll(toExclude, "");
String toExclude2 = "<em>" ;
String lyric1 = lyric0.replaceAll(toExclude2, "");
String toExclude3 = "<p style=\"margin-left:25px;\">" ;
String lyric2 = lyric1.replaceAll(toExclude3, "");
String toExclude4 = "</p>" ;
String lyric3 = lyric2.replaceAll(toExclude4, "");


//println(lyric3);

String [] stanzas = split(lyric3,"/");

print(stanzas[0]);
print(stanzas[1]);
print(stanzas[2]);

   textSize(21);  // text size
    textFont(font, 24); //font
    fill(250);    // white text 
    textAlign(CENTER); // center Text

    text(stanzas[0], 10, (imgH)-55, width-10, (imgH));
    text(stanzas[1],10, (imgH*2)-55, width-10, (imgH*2));
    text(stanzas[2], 10, (imgH*3)-55, width-10, (imgH*3));

saveFrame();


