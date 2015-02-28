

import rita.*;
 
 
RiLexicon lexicon = new RiLexicon();
PImage webImg;
PFont font;
 
 
String randomverb;
String otherrandomverb;
String otherrandomnoun;
String anotherrandomnoun;
String athirdrandomnoun;
String randomcc;
String randominterjection;
String randomadjective;
String otherrandomadjective;
String randomnoun;
String propernoun;
String presentverb;
String presentverb2;
String presentverb3;
String randomnounagain;
int flipperdirection=1;
int tracker;
 
String[] rhymes;
String[] rhyme2;
String[] rhyme3;
 
int randomrandom;
int randomnumber;
String weburl;
 
//String randomverb= lexicon.randomWord("vbd",2);
//String otherrandomverb= lexicon.randomWord("vbd",2);
//String otherrandomnoun=lexicon.randomWord("nn",2);
//String anotherrandomnoun=lexicon.randomWord("nn",2);
//String athirdrandomnoun=lexicon.randomWord("nn",2);
//String randomcc=lexicon.randomWord("cc",2);
//String randominterjection=lexicon.randomWord("uh");
//String randomadjective=lexicon.randomWord("jj",2);
//String otherrandomadjective=lexicon.randomWord("jj",2);
//String randomnoun=lexicon.randomWord("nn",2);
//String propernoun=lexicon.randomWord("nnp",2);
//String presentverb=lexicon.randomWord("vbp",2);
//String presentverb2=lexicon.randomWord("vbp",2);
//String presentverb3=lexicon.randomWord("vbp",2);
//
//String[] rhymes = lexicon.rhymes(randomnoun);
//String[] rhyme2 = lexicon.rhymes(otherrandomadjective);
//String[] rhyme3 = lexicon.rhymes(randomadjective);
//
//int randomrandom=int(random(1,4));
 
void setup()
{
  initializevariables();
  size(600,600);
background(250);
makepicture();
  String url = weburl;
  // Load image from a web server
  webImg = loadImage(url, "gif");
 
}
 
void draw() {
  println(tracker);
  background(80);
if (tracker==1)
{
  font=loadFont("Zapfino-50.vlw");
  textFont(font);
   new RiText(this,randomnounagain,(width/2)-100,height/2,font).draw();
}
   
   
  if (keyPressed == true)
       {
 tracker=tracker+flipperdirection;
       }
       if (tracker==3)
       {
         flipperdirection=-1;
       }
       if (tracker==1)
       {
         flipperdirection=1;
       }

   
   
   if (tracker==2)
   {
   
   background(80);
 
  image(webImg, 200,200,200,200);
  delay(500);
   }

 

if (tracker==3)
{
       background(255);
        if (randomrandom<3)
      {
      poem1();
      
      }
      else {
        poem2();
      }
}
}
   

 
     



   
 
 
void poem1()
{
  if (rhymes.length>=1 || rhyme2.length>=1)
  {
  new RiText(this,"Martha "+randomverb + " the "+randomnoun,20,100).draw();
new RiText(this,"Because " + "Martha is " + otherrandomadjective,20,130).draw();
new RiText(this,"She "+otherrandomverb+" the "+rhymes[0],20,160).draw();
new RiText(this, randominterjection+" "+athirdrandomnoun+" is "+rhyme2[0],20,190).draw();
  }
  else
  {
    
     
        new RiText(this,"sigh.",20,130).draw();
        
      }
  }


 

void poem2()
{
    if (rhyme3.length>=1 || rhyme2.length>=1)
  {
  new RiText(this,"Martha"+" is "+randomadjective,20,100).draw();
 new RiText(this,"And"+" Martha "+"is "+otherrandomadjective,20,130).draw();
 new RiText(this,presentverb+" and "+presentverb2+" for "+rhyme3[0],20,160).draw();
 new RiText(this,"And "+presentverb3+" "+rhyme2[0],20,190).draw();
  }
 else
  {
    
     
        new RiText(this,"sigh.",20,130).draw();
        
      }
  

}
void initializevariables()
{
  tracker=1;
 randomverb= lexicon.randomWord("vbd",2);
 otherrandomverb= lexicon.randomWord("vbd",2);
 otherrandomnoun=lexicon.randomWord("nn",2);
 anotherrandomnoun=lexicon.randomWord("nn",2);
 athirdrandomnoun=lexicon.randomWord("nn",2);
 randomcc=lexicon.randomWord("cc",2);
 randominterjection=lexicon.randomWord("uh");
 randomadjective=lexicon.randomWord("jj",2);
 otherrandomadjective=lexicon.randomWord("jj",2);
 randomnoun=lexicon.randomWord("nn",2);
 propernoun=lexicon.randomWord("nnp",2);
 presentverb=lexicon.randomWord("vbp",2);
 presentverb2=lexicon.randomWord("vbp",2);
 presentverb3=lexicon.randomWord("vbp",2);
 randomnounagain=lexicon.randomWord("nn");
 
 rhymes = lexicon.rhymes(randomnoun);
 rhyme2 = lexicon.rhymes(otherrandomadjective);
 rhyme3 = lexicon.rhymes(randomadjective);
 randomnumber=int(random(1,10));
 
 randomrandom=int(random(1,4));
  
}
void makepicture()
{
if (randomnumber==1)
{
  weburl="http://hollywoodpark-tx.gov/wp-content/uploads/2013/10/loan-oak-tree.jpg";
}
if (randomnumber==2)
{
  weburl="http://3.bp.blogspot.com/_r4Klv8u2tgU/TUoHNFgy8aI/AAAAAAAANrE/AeOXyrwEgKo/s1600/Gray%2BLava%2BMoss%2BRock.JPG";
}
if (randomnumber==3)
{
  weburl="http://paganpages.org/content/wp-content/uploads/2013/02/rainbow1.jpg";
  
}
if (randomnumber ==4)
{
  
 weburl= "http://scienceblogs.com/lifelines/files/2014/01/13243547332073393725diving-with-great-white-sharks.jpg";
}
if (randomnumber==5)
{
  
  weburl="http://kaydubya.files.wordpress.com/2012/12/zooey_deschanel_81-1.jpeg";
}
if (randomnumber==6)
{
 weburl="http://static.comicvine.com/uploads/original/11111/111113523/3605753-1936874063-31646.png" ;
}
if (randomnumber==7)
{
  weburl="http://upload.wikimedia.org/wikipedia/commons/0/08/Pencils_hb.jpg";
}
if (randomnumber==8)
{
  weburl="http://caamfest.com/2013/files/2013/02/astroboy21.jpg";
}
if (randomnumber==9)
{
  weburl="http://fc04.deviantart.net/fs24/f/2008/028/a/2/Giraffe__by_belvi.jpg";
}
if (randomnumber==10)
{
  weburl="http://rajivawijesinha.files.wordpress.com/2010/08/taj-mahal.jpg";
}
}
