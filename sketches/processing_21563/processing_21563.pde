
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;


void setup() {
  size(640, 480);
  smooth();
  
  a = loadImage("cloud1.png");
  b = loadImage("cloud2.png");
  c = loadImage("cloud3.png");
  d = loadImage("cloud4.png");
  e= loadImage("grey.png");
  f= loadImage ("red.png");
  g= loadImage ("orange.png");
  h= loadImage ("yellow.png");
  i= loadImage ("green.png");
  j= loadImage ("blue.png");
  k= loadImage ("purple.png");
  l= loadImage ("brd1.gif");
 
}
  
  void draw() {
  background(255);
  
  
 
PImage a;
a= loadImage ("cloud1.png");
image(a, 10, 20);

PImage b;
b= loadImage ("cloud2.png");
image(b, 240, 100);

PImage c;
c= loadImage ("cloud3.png");
image(c, 270, 30);

PImage d;
d= loadImage ("cloud4.png");
image(d, 430, 40);

PImage e;
e= loadImage ("grey.png");
image(e, 110, 280);


if(mouseX<= 1 && mouseY<=1){
PImage ee;
ee= loadImage ("grey.png");
image(ee, 110, 280);

PFont font;
font = loadFont("Baskerville-140.vlw"); 
textFont(font, 140); 
text("kate spade", 30, 240);
fill (0);

PFont font2;
font2 = loadFont("PeaKadee-20.vlw"); 
textFont(font2, 20); 
text("COLOR!", 480, 90);
fill (0);

PImage l;
  l= loadImage ("brd1.gif");
  image (l,mouseX, mouseY);

  }
    
    else if(mouseX <= 225 && mouseY <= 240){
     
        PImage f;
f= loadImage ("red.png");
image(f, 110, 280);

PFont font;
font = loadFont("Baskerville-140.vlw"); 
textFont(font, 140); 
text("kate spade", 30, 240);
fill (227,24,55);

PFont font3;
font3 = loadFont("PeaKadee-20.vlw"); 
textFont(font3, 20); 
text("COLOR!", 480, 90);
fill (227,24,55);

PImage l;
  l= loadImage ("brd1.gif");
  image (l,mouseX, mouseY);

    }
    
    else if(mouseX <= 450 && mouseY <= 240){
     
        PImage g;
g= loadImage ("orange.png");
image(g, 110, 280);

PFont font;
font = loadFont("Baskerville-140.vlw"); 
textFont(font, 140); 
text("kate spade", 30, 240);
fill (241,93,34);

PFont font4;
font4 = loadFont("PeaKadee-20.vlw"); 
textFont(font4, 20); 
text("COLOR!", 480, 90);
fill (241,93,34);

PImage l;
  l= loadImage ("brd1.gif");
  image (l,mouseX, mouseY);
    }
    
       else if(mouseX <= 680 && mouseY <= 240){
     
        PImage h;
h= loadImage ("yellow.png");
image(h, 110, 280);

PFont font;
font = loadFont("Baskerville-140.vlw"); 
textFont(font, 140); 
text("kate spade", 30, 240);
fill (255, 242, 3);

PFont font5;
font5 = loadFont("PeaKadee-20.vlw"); 
textFont(font5, 20); 
text("COLOR!", 480, 90);
fill (255,242,3);

PImage l;
  l= loadImage ("brd1.gif");
  image (l,mouseX, mouseY);

    }
  
     else if(mouseX <= 225 && mouseY <= 480){
     
        PImage i;
i= loadImage ("green.png");
image(i, 110, 280);

PFont font;
font = loadFont("Baskerville-140.vlw"); 
textFont(font, 140); 
text("kate spade", 30, 240);
fill (0, 161, 96);

PFont font5;
font5 = loadFont("PeaKadee-20.vlw"); 
textFont(font5, 20); 
text("COLOR!", 480, 90);
fill (0, 161, 96);

PImage l;
  l= loadImage ("brd1.gif");
  image (l,mouseX, mouseY);
    }
  
     else if(mouseX <= 450 && mouseY <= 480){
     
        PImage j;
j= loadImage ("blue.png");
image(j, 110, 280);

PFont font;
font = loadFont("Baskerville-140.vlw"); 
textFont(font, 140); 
text("kate spade", 30, 240);
fill (28, 63, 148);

PFont font6;
font6 = loadFont("PeaKadee-20.vlw"); 
textFont(font6, 20); 
text("COLOR!", 480, 90);
fill (28, 63, 148);

PImage l;
  l= loadImage ("brd1.gif");
  image (l,mouseX, mouseY);
    }
    
       else if(mouseX <= 680 && mouseY <= 480){
     
        PImage k;
k= loadImage ("purple.png");
image(k, 110, 280);

PFont font;
font = loadFont("Baskerville-140.vlw"); 
textFont(font, 140); 
text("kate spade", 30, 240);
fill (82, 46, 145);

PFont font7;
font7 = loadFont("PeaKadee-20.vlw"); 
textFont(font7, 20); 
text("COLOR!", 480, 90);
fill (82, 46, 145);

PImage l;
  l= loadImage ("brd1.gif");
  image (l,mouseX, mouseY);

    }


}

