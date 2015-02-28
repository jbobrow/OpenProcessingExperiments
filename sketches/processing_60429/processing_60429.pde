
/////Teresa Yang - Final Project - Study on Motions in Typography & an homage to American Minimalist Music


/*
  Minimalist Process Music Not So Minimal After All
 
 I was in this prematurely air-conditioned supermarket
 and there were all these aisles
 and there were all these bathing caps you could buy
 which had these kind of Fourth of July plumes in them
 they were red and yellow and blue
 I wasn't tempted to buy one
 but I was reminded of the fact that I  had been avoiding the beach
 
 Philip Glass, Einstein on the Beach, act 3, scene 1, "Trial" 1976
 
 --------------------------------
 ////ABOUT THE FINAL PIECE:
 
 While exploring the possibilities of typographic motions in Processing, I became interested in working with a narrative
 to better convey the idea and the flow of each motions. 

 While 1960s American Process Music (Minimalist Music) has always been a subject of fascination for me, 
 I found the term minimalism to be a misnomer to such highly saturated, repetitive sounds. The connection 
 between the visual and auditory realm of minimalism wasn't all too clear for me, and I found the act of 
 explaining the missions of the sonic practice according to the doctrines of the visual art questionable. 

 Recently, I came across a text by musicologist Robert Fink, who described minimalist music as being 
 "no more celibate than disco", despite the veil of asceticism automatically attached to it. (It 
 almost seems blasphemous to associate minimalist music with consumer culture or Pop Art, due to 
 its lofty status as an esoteric form of music. But perhaps we're socially trained to think so, due 
 to the term and its linkages made with the elitist Minimalist artworks.) While the visual practice
 of Minimalism is often considered as a critical countercultural movement against commodity culture,  
 the sonic practice is deeply rooted within the secular context of the postwar consumerism.

 For this reason, Philip Glass's lyrics to his 1976 piece "Trial" with repetitive lyrics such as 
 "prematurely air-conditioned supermarket" seemed most appropriate, in order to raise the thought that 
 1960s minimalist music may not be all that minimal in the ascetic sense, after all.
 


  ////Mode 1:
  I was in this prematurely air-conditioned supermarket
  
  ////Mode 2:
  there were all these aisles
  
  ////Mode 3:
  and there were these bathing caps
  
  ////Mode 4:
  I wasn't tempted to buy one
  
  ////Mode 5:
  But I was reminded of the fact
  
  ////Mode 6:
  That I had been avoiding the beach



 ////Instructions:
 * Please use keys 1-6, only in consecutive order.
 * Click the mouse to change colors of the fonts for Modes 1 and 6.
 * Click and drag mouse up and down for Mode 2.
 * Mode 3 takes a little while... Upon seeing the sentence "and there were these bathing caps", 
   please allow around 6 seconds for the background to fully load.
 * Enter key makes a screenshot of the frame.
 
 
 
 ///References:
 For the general idea of mode 3: http://www.openprocessing.org/sketch/3848
 Processing.org Learning (Linear Image) : http://processing.org/learning/topics/linearimage.html
 book page 329. Typography: Motion. Flickering type
 book page 298. example
 Book page 330. Strings, Words in motion
 
 */

int mode = 1;

PImage img;
PFont font;
PFont fontTwo;
PFont fontThree;

String[] words = {
  "I was", "in this", "prematurely", "air-conditioned", "supermarket", " "
};

String[] wordsTwo = {
  "But I was", "reminded", "of", "the", "fact", " "
};

String[] wordsThree = {
  "That", "I had been", "avoiding", "the beach", " "
};


float inc = 0.05;
int density = 4;
float znoise = 9.0;
float signal;
float angle = 0.0;
float noiseScale = 0.02;

int i, j, l, w=110, whichWord =0;
int i2, j2, l2, w2=40;
int direction = 1;
int opacity = 0;

void setup()
{
  size(1000, 300, P3D);
  noStroke();
  background(150);
  cursor(CROSS);
  noFill();

  font = loadFont("Garamond-48.vlw");
  fontTwo = loadFont("Futura-CondensedMedium-30.vlw");
  fontThree = loadFont("Courier-25.vlw");

  img = loadImage("koyaa2.jpg");
  img.loadPixels();
  loadPixels();

  textFont(font);
  textAlign(CENTER);
}

void draw()
{  
  if ( mode == 1 )
  {

    float fontSz = random (90);
    float blurRate = random (2);
    frameRate(200);
    if (mousePressed) {
      fill (40);
    } 
    else {
      fill (240);
    }

    pushMatrix();
    translate(0, 0, fontSz);
    textFont (font, 42);
    textAlign (CENTER);

    whichWord++;
    if (whichWord == words.length) {
      whichWord = 0;
    }
    text (words[whichWord], mouseX, mouseY);
    filter(BLUR, blurRate);
    popMatrix();
  }
  else if ( mode == 2 )
  {
    if (signal > img.height-1 || signal < 0) { 
      direction = direction * -1;
    }
    if (mousePressed) {
      signal = abs(mouseY % img.height);
    } 
    else {
      signal += (0.3*direction);
    }

    if (keyPressed) {
      set(0, 0, img);
      line(0, signal, img.width, signal);
    } 
    else {
      int signalOffset = int(signal)*img.width;
      for (int y = 0; y < img.height; y++) {
        arrayCopy(img.pixels, signalOffset, pixels, y*width, img.width);
      }
      updatePixels();
    }
    textFont(fontTwo);
    fill (255);
    text ("t  h  e  r  e    w  e  r  e    a  l  l    t  h  e  s  e    a  i  s  l  e  s", width/2, 170);
  }

  else if ( mode == 3 )
  {
    frameRate(200);
    j2+=1;
    textFont(createFont("", 40));
    fill(235, 85);
    filter(9);
    whichWord++;
    if (whichWord == words.length) {
      whichWord = 0;
    }
    for (i2=0;++i2<800;l2=int(noise(j2/10&(i2%30)*10,j2/10&(i2/10)*10)*100),fill(l2*4))text(words[whichWord], (i2%100)*10, (i2/20)*10);
    textFont(fontThree);
    fill (0);
    text ("and there were these bathing caps", width/2, 170);
  }


  else if ( mode == 4 )
  {
    background (150);
    frameRate(12);
    for (int y=0; y<=height; y+=40) {
      for (int x=0; x<=width; x+=40) {
        fill (0, random(5, 60));
        textSize (random (5, 90));

        whichWord++;
        if (whichWord == words.length) {
          whichWord = 0;
        }
        //text (words[whichWord], random(x, y), random(y, x));
        //text ("I\nWasn't\nTempted\nTo\nBuy\nOne\nBut\nI\nWas\nReminded\nOf\nThe\nFact", random(x, y), random(y, x));
        text ("I\nWasn't\nTempted\nTo\nBuy\nOne", random(x, y), random(y, x));
      }
    }
  }

  else if ( mode == 5)
  {
    {
      float xnoise = 0.0;
      float ynoise = 0.0;
      textFont (font, 80);
      //frameRate(2);
      for (int y=0; y< height; y+=density) {
        for (int x=0; x<width; x += density) {
          float n =noise(xnoise, ynoise, znoise)*420;
          fill(n);
          ellipse(x, y, density, density);
          xnoise += inc;
        }
        xnoise = 0;
        ynoise += inc;
      }
      znoise += inc;

      whichWord++;
      if (whichWord == wordsTwo.length) {
        whichWord = 0;
      }
      fill (255);
      text (wordsTwo[whichWord], width/2, height/2+25);
    }
  }


  else if ( mode == 6 )
  {
    float fontSz = random (200);
    float blurRate = random (2);
    frameRate(50);

    if (mousePressed) {
      fill (40);
    } 
    else {
      fill (240);
    }
    translate (0, 0, fontSz);
    textFont (font, 42);
    textAlign (CENTER);

    whichWord++;
    if (whichWord == wordsThree.length) {
      whichWord = 0;
    }
    text (wordsThree[whichWord], mouseX, mouseY);
  }
}

void keyPressed()
{
  if ( key == '1' )
  {
    mode = 1;
    background (150);
  }
  else if ( key == '2' )
  {
    mode = 2;
  }
  else if ( key == '3' )
  {
    mode = 3;
  }
  else if ( key == '4' )
  {
    mode = 4;
    background(150);
  }
  else if ( key == '5' )
  {
    mode = 5;
    background(150);
  }
  else if ( key == '6' )
  {
    mode = 6;
    background (240);
  }


  else if ( key == ENTER )
  {
    saveFrame("example_####.png");
  }
}


