
//Chere De Koh
//Processing Project One

//Exploring kawaii 
//  While researching the kawaii aesthetic, I was particularly 
//  struck by a phrase raising the point that kawaii has, in some cases, become
//  'culturally odourless'. My reaction to that is this sketch
//  which explores various ancestors to the the kawaii aesthetic.


//References: 
//Joel Simon http://www.openprocessing.org/sketch/36010
//J. Taylor O'Connor http://www.openprocessing.org/sketch/32892
 
 
//Image sources:
//hokusai nostril guy - http://minazuki-branch.cocolog-nifty.com/photos/uncategorized/2008/02/09/08009hokusai01_3.jpg 
//rose of versailles - http://chomikuj.pl/Lilith24/Anime+i+Manga+*5bPL*5d/Rose+of+Versailles
//mickey - http://www.ebay.com/itm/Painting-Numbers-Mickey-Mouse-Retro-by-Ravensburger-283927-/190538221716
//betty boop - http://animationresources.org/?p=6463
//retro bunny hearts - http://cartoongraphics.blogspot.com.au/
//moomin - http://www.chokawaii.com/chokawaii/mizuho/
//bunka doll - http://blogs.yahoo.co.jp/hydrangea2001jp/62518353.html
//kokeshi doll - http://www.onogawa.jp/~koma/onogawa_JP/koma/sakuzou/1.htm
//kewpie- http://judyspostcardsplus.blogspot.com.au/2011/02/kewpie-poscards-from-reproductions-of.html

 
PImage[] images = new PImage[9];
PImage img = new PImage();
float x;
float y;
int r;

void setup() {
 
  size(1000, 600); 
  background(#FFFFFF);
  smooth();
  PFont font;
  font = loadFont("Arial-BoldMT-190.vlw");
  textFont(font); 
  
    for (int i = 0; i < images.length; i ++)
   {
    images[i] = loadImage( i +".JPG");
   }
   for(int i=0; i  < images.length; i ++)
   {
   images[i].resize(1000,600);
   }
   background(images[0]);
}
 
void draw() {
  //image(img, 0, 0);
  fill(0);

  ellipse(300, 250, 100, 120);
  ellipse(700, 250, 100, 120);
 
 
 
 //   fill(255,0,0);
 //  if(mousePressed){
 // ellipse(300,290, 50, 30);
 //  }
 
 // fill(52, 34, 31);//mustache color
 // arc(300, 296, 65, 40, PI, TWO_PI);
 
//  if (second()%6 ==0) {
  //  fill(0);
    //arc(269, 230, 30, 20, 0, PI);
    //arc(334, 230, 30, 20, 0, PI);
 // }
  //else {
   // noFill();
   // arc(269, 230, 30, 20, 0, PI);
   // arc(334, 230, 30, 20, 0, PI);
 
    //Eyes
    
    ///////////////////RIGHT EYE
    strokeWeight(10);
    int x = int(map(mouseX, 0, 600, -5, 5));
    int y = int(map(mouseY, 0, 491, -5, 5));
    
    //catchlights 
    point(270+x, 230+y);
    point(337+x, 230+y);
    strokeWeight(5);
    stroke(#FFFFFF);
  
    point(260+x, 220+y);
    point(327+x, 220+y);
    strokeWeight(14);
    stroke(#FFFFFF);
    
    point(260+x, 280+y);
    strokeWeight(18);
    stroke(#FFFFFF);
    
  ///////////////////RIGHT EYE

    point(670+x, 230+y);
    point(737+x, 230+y);
    strokeWeight(5);
    stroke(#FFFFFF);
  
    point(660+x, 220+y);
    point(727+x, 220+y);
    strokeWeight(14);
    stroke(#FFFFFF);
    
     point(660+x, 280+y);
    strokeWeight(18);
    stroke(#FFFFFF);
    
      //my addition
    if (mousePressed){
    x+= random(-4, 4);
    y+= random(-2, 2);
    ellipse(300, 250, 100, 120);
    ellipse(700, 250, 100, 120);
    
    textSize(72);
    fill(#FFFFFF);
    text(">", 280+x, 210+y, 240, 100);
    
   textSize(72);
    fill(#FFFFFF);
    text("<", 680+x,210+y, 240, 100);  
    
 if (second()%4 ==0) {
   //textSize(72);
    //fill(#EEAEEE);
    //text(">", 280+x, 210+y, 240, 100);
    
   //textSize(72);
    //fill(#EEC900);
    //text("<", 680+x,210+y, 240, 100);  
    
    {
    for(int count = 0;count<20;count ++)
    {
      r=int(random(9));
      image(images[r],0,0);
    }
  }
       }
    else {
      x = (x);
      y = (y);
      
    }
    }
    
      textSize(72);
   fill(#000000);
   text("ω", 470, 280, 240, 100); 
 
  
  }
    
    
    
    
//*****************MOUSE TRAIL//
//  stroke(255);
//  line(pmouseX,pmouseY,mouseX,mouseY);



