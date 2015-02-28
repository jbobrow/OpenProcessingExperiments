
/*
 Architecture Alive Project
 CSC106 
 
 Work influenced by Driss Ouadahi, Jim Campbell & Gerhard Mayer.
 
 See below for references.
 */


{
  //Merging of Images.
  size(1000, 667);
  smooth();
  background(loadImage("glassroof2.png"));
  PImage img = loadImage("glassroof2.png");
  PImage img1 = loadImage("bigben.png");
  PImage img2 = loadImage("glassroof.png");
  PImage img3 = loadImage("Pyramid.png");
  PImage img4 = loadImage("effiel.png");
  PImage img5 = loadImage("lodonbridge.png");
  PImage img6 = loadImage("goldengate.png");
  PImage img7 = loadImage("skyscraperpanama.png");
  PImage img8 = loadImage("pisa.png");
  PImage img9 = loadImage("tower.png");
  PImage img10 = loadImage("Pyramid2.png");

  blend(img7, 0, 0, 1000, 667, 50, -300, 565, 1250, LIGHTEST);
  blend(img, 0, 0, 1000, 667, 0, 0, 1000, 667, DARKEST);
  blend(img2, 0, 0, 1000, 667, 0, 0, 1000, 667, DARKEST);
  blend(img3, 0, 0, 1000, 667, 0, 0, 1000, 667, DARKEST);
  blend(img10, 0, 0, 1000, 667, 0, 0, 1000, 667, DARKEST);
  blend(img1, 0, 0, 1000, 667, 0, 0, 1000, 667, LIGHTEST);
  blend(img2, 0, 0, 1000, 667, 0, 0, 1000, 667, DARKEST);
  blend(img4, 0, 0, 1000, 667, 0, -100, 1700, 667, DARKEST);
  blend(img9, 0, 0, 1000, 667, 300, -100, 1000, 667, DARKEST);
  blend(img6, 0, 0, 1000, 667, 0, 0, 1000, 667, DARKEST);
  blend(img5, 0, 0, 1000, 667, 0, 0, 1000, 667, DARKEST);
  blend(img8, 0, 0, 1000, 667, -300, -100, 1000, 667, DARKEST);
  blend(img5, 0, 0, 1000, 667, 0, 0, 1000, 667, DARKEST);
}
//Pixilation Effect (Blur of Colors)
PImage img7 = loadImage("patternroof2.png");
int density = 40;
for ( int i=0; i<width; i+=density) {
  for ( int j=0; j<height; j+=density) {
    color c = img7.get(i, j);
    fill(c, int(random(100)));
    stroke(c, 40);
    strokeWeight(60);
    ellipse(i, j, density, density);
    rect(i, j, density, density);
    stroke(c, int(random(20)));
    strokeWeight(10);
    bezier(i, j, density, density, i, j, i, j);
    filter(OPAQUE);
  }
} 
save("architecturealive4.png");


/*
References
 Political Protest 
 Jim Campbell. Political Protest. 2005. Image. USA. JPEG.
 http://www.jimcampbell.tv/portfolio/still_image_works/political_protests/index.html
 
 Le Damier
 Driss Ouadahi. Le Damier. 2009. Image. Hosfelt Gallery. USA. JPEG.
 http://hosfeltgallery.com/index.php?p=artists&a=Driss%20Ouadahi
 
 Wandzeichnung #7
 Gerhard Mayer. Wandzeichnung #7. 2003. Image. Galerie Ute Parduhn Germany. JPEG.
 http://www.gerhard-mayer.com/index.php?id=4
 
 
 Giza Pyramid Image
 Gloria Euyoque. Giza Pyramid. 2007. Image. Cairo Egypt. JPEG.
 
 Big Ben Image
 Adrien Perez. Big Ben. 2009. Image. London. JPEG. 
 http://de.fotopedia.com/items/flickr-3564350333
 .
 Glass Roof Image
 Ana Gasston. Glass-roofed Arcade. 2007. Image. Galleria Vittorio Emanuelle II. Italy. JPEG. 
 http://www.fotopedia.com/items/flickr-2148088279
 
 Pattern Roof Image
 Peter van den Hamer. Untitled. 2010. Casa Amatller. Spain. JPEG. http://www.fotopedia.com/items/12s687mhrt7jn-drov8wQ3pJA 
 
 Glass Roof2 Image
 Giulio Menna. Galleria Vittorio Emanuelle II. 2010. Image. Galleria Vittorio Emanuelle II. Italy. JPEG.
 http://www.fotopedia.com/items/flickr-4435427918 
 
 Eiffel Tower
 Kumar Navaneethakrishnan. Eiffel Tower. 2009. Image. Paris. France. JPEG.
 http://www.fotopedia.com/items/flickr-4184844536
 
 London Bridge
 Anon. London Bridge. Unknown. Image. London. UK. JPEG. 
 http://www.talismancoins.com/catalog/London_Tower_Bridge_Tower.jpg
 
 Golden Gate Bridge.
 Troy Holden. Going the Distance. 2010. Image. California. USA. JPEG.
 http://ja.fotopedia.com/items/flickr-4404956709
 
 Sky Scraper Panama.
 Anon. http://www.worldarchitecturenews.com/news_images/10157_1_panama1big.jpg
 
 Tower of Pisa.
 Ian Britton. The Leaning Tower of Pisa. Image. Italy. JPEG.
 http://www.freefoto.com/preview/14-19-53/The-Leaning-Tower-of-Pisa--Tuscany--Italy
 
 Tower. 
 Anon. Petronas Twin Tower. Image. Kuala Lampur. JPEG
 http://www.travelfeeder.com/travel-destination/travel-snapshot-kuala-lumpur-petronas-twin-tower
 */

