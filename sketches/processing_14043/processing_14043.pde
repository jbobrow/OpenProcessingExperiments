
PFont font;

PImage imgg;
PImage img;
PImage[] images = new PImage[5];
PImage[] dimages = new PImage[5];
String[] words = new String[3];

int xx = 0;
int yy = int(random(images.length-1));
int zz = int(random(images.length-1));
int tt = int(random(words.length));
int ttt = int(random(words.length));

int textx, texty;


float rnd = random(2);


int x = 0;
int y = 0;

void setup() {
  font = loadFont("font.vlw");
  //array containing component pictures
  images[0] = loadImage("rushday.png");
  images[1] = loadImage("capitolday.png");
  images[2] = loadImage("libertyface.png");
  images[3] = loadImage("archday.png");
  images[4] = loadImage("lincolnday.png");
  
  dimages[0] = loadImage("drushday.jpg");
  dimages[1] = loadImage("dcapitolday.jpg");
  dimages[2] = loadImage("dlibertyface.jpg");
  dimages[3] = loadImage("darchday.jpg");
  dimages[4] = loadImage("dlincolnday.jpg");
  
  words[0] = "I like to see a man proud of the place in which he lives.  I like to see a man live so that his place will be proud of him.";
  words[1] = "Patriotism is not short, frenzied outbursts of emotion, but the tranquil and steady dedication of a lifetime.";
  words[2] = "Ours is the only country deliberately founded on a good idea.";
  
  size(640,480);
  img = images[yy];
  imgg = images[zz];
  background(0);
  smooth();
}

void draw() 
{
  background(100,150,200);
  println(yy);
  
  
  if((xx == 0) || (xx == 2)){textx = 330;texty = 285;}
  else if((xx == 1) || (xx == 3)){textx = 60;texty = 55;}
  else if(xx == 4){textx = 330;texty = 55;}
  
  loadPixels();
  for(y = 0; y < height; y+=1)
  {
    for(x = 0; x < width; x+=1)
    {
      int loc = (x) + (y)*imgg.width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      float a = alpha(img.pixels[loc]);
      noStroke();
      
      xx = int(map(brightness(color(r,g,b)),0,255,0,(images.length)-1));
      
      //set fill to pixel color
      //draw background image
      if(a > 0)
      {
        //tint background image with pixel color
        fill(r,g,b,255);
        rect(x,y,1,1);
      }
    }
  }
  for(y = 0; y < height; y+=12)
  {
    for(x = 0; x < width; x+=16)
    {
      int loc = (x+8) + (y+6)*imgg.width;
      float r = red(imgg.pixels[loc]);
      float g = green(imgg.pixels[loc]);
      float b = blue(imgg.pixels[loc]);
      float a = alpha(imgg.pixels[loc]);
      noStroke();
      
      xx = int(map(brightness(color(r,g,b)),0,255,0,(images.length)-1));
      
      //set fill to pixel color
      //draw background image
      if(a > 0)
      {
        image(dimages[xx],x,y,16,12);
        //tint background image with pixel color
        fill(r,g,b,100);
        rect(x,y,16,12);
      }
    }
  }
  textFont(font,24);
  fill(255);
  text(words[tt],textx+1,texty+1,300,500);
  fill(0);
  text(words[tt],textx,texty,300,500);
}

void mousePressed()
{
   yy = int(random(images.length));
   zz = int(random(images.length));
   tt = int(random(words.length));
   ttt = int(random(4));
   
   while(yy == zz)
   {
     yy = int(random(images.length-1));
     zz = int(random(images.length-1));
   }
   img = images[yy];
   imgg = images[zz];
}


