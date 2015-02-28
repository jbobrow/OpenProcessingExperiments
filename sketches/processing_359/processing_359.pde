
/*  I wanted to create some cool art for my 3 year old daughter's bedroom
so I took this great random flower program on OpenProcessing.org
(Flowers by Kevin Middleton : http://openprocessing.org/visuals/?visualID=312) 
and added the color taker (inspired by Jared Tarbell) and an SVG export... 
I tried the PDF library and could not get it to export everything.  
ProSVG also had a bug and I had to get an updated version.  
Press "S" to save the files to your sketch's directory

Anyway the color picker is a big add as it allows you to find a image that
you like the "feel" of and mimic it in the flowers...  

I also added the ability to manually add flowers with a mouse click 
if you want to turn of the random placement


Gary George Aug-2008
*/

// commented for OpenProcessing upload       import prosvg.*; //gg for saving as svg



int xMin = 50; 
int yMax,xMax; 
int yMin = 50; 
int colorCount;
PImage b;//gg for take color
int flowerCount = 0;
color[] colors;  
String name = "Flowers"+round(random(0, 25000)); //gg- for a unique file name
int currentX =0;  //gg- used for center of the flower
int currentY=0;  //gg- used for center of the flower
 
void setup() { 
  smooth(); 
  size(800,600);//gg- use this other version of size when you want to export.  Does not work on OpenProcessing.org:  size(800,600,"prosvg.SVGOut");
  yMax = height-50; 
  xMax = width-50; 
  frameRate(3); 
   
  takecolor();
  background(255,255,255);  //gg-clears the background... over the image that was loaded
} 
 
void draw() { 
    //gg-comment out if you want to manually add the flowers
currentX=round(random(0,width));  //gg- if you change these to the mouseX and mouseY you will "draw" flowers as you mouse moves
currentY=round(random(0,height));
randomFlower();
//comment to here
} 
 
void mousePressed() { //gg-instead of random as the original does it with the mouse coordinates
currentX=mouseX;
currentY=mouseY;
randomFlower();
}
 
void randomFlower() { 
   
//color clr = color(random(20,230),random(20,230), random(20,230));  //gg- original random colors
  //color clr = colors[flowerCount%colorCount]; //gg- this will read the image top to bottom and left to right
  color clr = colors[round(random(0,colorCount))];  //gg-this randomly select colors from the image
// println(flowerCount%colorCount);
  float trans = 210;//gg- random(190, 250); 
  stroke(255,255,255); //gg-for white outline
  fill(clr,trans); 
  //position of center of flower can be varied by translate 
   translate(currentX,currentY); 
  //number of petals (numPetals) can be varied 
  float numPetals = round(random(6, 20)); //gg-the original program did not round here which kept giving flowers that had petals that were slightly off-gg
  float petalLength = random(25, 100); 
  //println("Petal length = " + petalLength); 
  for (float rot = 0; rot < radians(360); rot += radians(360/(numPetals))) { 
    pushMatrix(); 
    rotate(rot); 
    beginShape(); 
    vertex(10,10); 
    //petal length = distance between x,y params (1st 2 and last 2) below 
    bezierVertex(10,10,50,20,10 + petalLength,10 + petalLength); 
    // to make the petals fatter, increase the 3rd param below 
    //petal length = distance between x,y params (1st 2 and last 2) below 
    bezierVertex(10 + petalLength ,10 + petalLength,20,60,10,10); 
    endShape();     
popMatrix(); 
  }
    flowerCount++;
  
  //center size - change below 
  ellipse(0,0,25,25); 
 
} 


//The idea of pulling colors from images was inspired from Jared Tarbell - - http://complexification.net/gallery/machines/substrate/index.php 
// COLOR  ----------------------------------------------------------------

void takecolor() { //gg- http://krazydad.com/colrpickr/ is a great place to find some cool flickr pics that will create your color theme
//Go ahead and uncomment some of these different images to find a theme you like
     b =  loadImage("colorFile.jpg");  //gg- can be a image or a file in your data folder
     //b = loadImage("http://beautiful-island.50webs.com/beautiful-island/ocean-flowers.jpg");
 //b = loadImage("http://beautiful-island.50webs.com/beautiful-island/sunny-beach.jpg");  
   // b = loadImage("http://images.payplay.fm/d/r/dreamcatcher2/600/dreamcatcher2.jpg");
   // b = loadImage("http://files.turbosquid.com/Preview/Content_on_7_30_2006_01_23_12/sun1.jpge3568d0a-d376-48f6-8af4-ddc1e2826928Large.jpg");
// b = loadImage("http://mirror-in-bom1.gallery.hd.org/_exhibits/pasta/blue-fusilli-green-back-CS.jpg");
 //b = loadImage("http://vidyahivale.com/images/landscapes/blue_sky.jpg");
// b = loadImage("http://www.poster.net/van-gogh-vincent/van-gogh-vincent-starry-night-7900683.jpg");
//b = loadImage("http://www.librarypodcasts.org/images/DiegoRivera.jpg");
      int spacer =5;
      image(b,0,0);
      colorCount = (b.width/spacer) * (b.height/spacer);
     // println("b.width: "+ b.width +"b.height: "+b.height+"spacer: "+spacer);
      colors = new color[colorCount]; 
     // println("colorCount: "+colorCount);
      int colorsSize = 0;
      for (int x=0;x<b.width -spacer && x< width;x=x+spacer){  //gg-incrementing based on image size, so it provides some variety
        for (int y=0;y<b.height-spacer && y<height;y=y+spacer) {
         color c = get(x,y);
         colors[colorsSize] =c;
          //println(x + "-"+y+"-"+c);
         colorsSize++; 
    }
  }
  colorCount=colorsSize;//gg-making sure the color loop is the same size the array from takecolor
  //println("colorsSize: "+colorsSize);
}
void keyPressed() {
 if (key == 's') { /// gg-save the flower
  // commented for OpenProcessing upload   saveFrame(name+"-####.svg");
    //saveFrame(name+"-####.tif");  // gg-saving as both svg and tif
 }

}

