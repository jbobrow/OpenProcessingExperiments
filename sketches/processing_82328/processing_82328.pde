
//Lillie Ferris
//liferris@andrew.cmu.edu
//Copyright November 2012

/*research from http://www.petsclan.com/popular-rabbit-breeds.html
http://en.wikipedia.org/wiki/Rabbit
http://rabbitempire.org/breeds-of-rabbits
*/
/*images 
1. black tailed - http://animals.nationalgeographic.com/animals/mammals/jackrabbit/
2. pygmy - http://www.bridgerlandaudubon.org/wildaboututah/101104pygmyrabbits.htm
3. snowshoe - http://www.gailshumway.com/gallery/index.php?level=picture&id=486
4. eastern - http://www.nhptv.org/natureworks/graphics/easterncottontail1sm.jpg
5. tapeti - http://www.nationalgeographicstock.com/ngsimages/explore/explorecomp.jsf?xsys=SE&id=1292347
6. arctic - http://www.nunatsiaqonline.ca/stories/article/65674photo_hare_takes_to_the_air/
7. scrub - http://blog.londolozi.com/wp-content/uploads/2012/03/DSC08701.jpg
8. cape - http://www.treknature.com/gallery/Middle_East/Israel/photo8800.htm
9. mountain - http://www.birdphoto.org.uk/page4.htm
10. tolai - all rights reserved by Paul B Jones http://www.flickr.com/photos/paulbjones/8016677442/sizes/n/in/photostream/

*/
PImage background; 

PImage [] portraits;

PImage [] maps;

PFont din, dinlight, dinbold;

float x, y;  //diam;

float diam[];

int [] leftright = {135, 120, 150, 180, 250, 240, 450, 450, 600, 640};

int [] updown =    {240, 245, 200, 250, 400, 160, 440, 330, 180, 220};

float [] d = {6.75, 1.94, 2.31, 1.69, 1.714, 3.75, 2.4, 1, 6,3};

PImage img;

String [] rabbits = {"Black Tailed Jackrabbit", "Pygmy Rabbit", "Showshoe Hare", "Eastern Cottontail",
                    "Tapeti", "Arctic Hare", "Scrub Hare", "Cape Hare", "Mountain Hare", "Tolai Hare"};
                    
String [] locations = {"\n Western United States", "\n Southwestern United States","\n Alaska\n Northern United States", "\n Eastern United States",
                    "\n Central South America", "\n Greenland\n Canada", "\n South Africa", "\n Middle East\n Central Asia\n South Asia", 
                    "\n Norway\n Sweden\n Finland\n Northern Russia", "\n Central Asia\n Mongolia\n Northern China\n Central China"};                   
                    
                 
void setup(){
  size (900, 600);
  smooth();
  din = loadFont("din.vlw");
  dinlight = loadFont("dinlight.vlw");
  dinbold = loadFont("dinbold.vlw");
  diam = new float [10];

  img = loadImage("worldmap.png");
 portraits = new PImage[10];
 maps = new PImage[10];
 
  for(int i = 0; i < leftright.length; i++){
     maps[i] = loadImage("maps/"+ i +  ".png");
  }
  
 imageMode(CENTER);
 textAlign(CENTER, CENTER);
  for(int i = 0; i < leftright.length; i++){
       
    portraits[i] = loadImage(i + ".png");
   
    
  }
  
  
}

void draw(){
  prepWindow();
  titleText();
  drawCircle();
  expandCircle();
}

void prepWindow(){
      //original image from http://upload.wikimedia.org/wikipedia/commons/1/17/BlankMap-World-noborders.png
  background (img);
}

void titleText(){
  textFont(dinbold, 30);
  textAlign(LEFT);
  fill(10, 120);
  text("RABBITS & HARES AROUND THE WORLD", width/22.5 + 2, height/10);
  fill(255);
  text("RABBITS & HARES AROUND THE WORLD", width/22.5, height/10);
}
  
void drawCircle(){
  for(int i = 0; i < leftright.length; i++){
    //float x = map(i, 0, leftright.length, 10, 890);
   // float y = map(0, i, updown.length, 10, 590);
    float x = map(leftright[i], max(leftright), min(leftright), 10, 890);  //fix this
    float y = map(updown[i], max(updown), min(updown), 10, 590);
    noStroke();
    fill(200, 90);
    ellipse(leftright[i], updown[i], diam[i], diam[i]);
    
  }}
  
  void expandCircle(){
    for(int i = 0; i < leftright.length; i++){
      float x = map(leftright[i], max(leftright), min(leftright), 10, 890); // fixxxxx!!!!!!
      float y = map(updown[i], max(updown), min(updown), 10, 590);
    if(dist(mouseX, mouseY, leftright[i], updown[i]) <= 10){
      diam[i] = diam[i] + 2;
   
   // tint(255, 220); 
     
    image(maps[i], width/2+1, height/2-3, width, height);
   image(portraits[i], leftright[i], updown[i], diam[i], diam[i]);
      
   textFont(dinbold, 20);
    //
     
      if(y > 600){
    fill(0);} else{fill(10, 180);}
 
    textAlign(LEFT, LEFT);
   
    text(" " + rabbits [i] + " ", leftright[i], updown[i]);
    
    textFont(din, 15);
    fill(20, 180);
    String supdown = nf(0, updown[i]);
    text(" " + locations [i] + " ", leftright[i], updown[i]);
   }else{
   diam[i] = diam[i] - 4;
  }
  if(diam[i] > 100){ //if diam is greater than d then doam = d
    diam[i] =  100;
  }
  if(diam[i] < 12){
    diam[i] = 12;
  }
  }
}

   

