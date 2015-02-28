
/*
Written by : Owaun Scantlebury
May 19th 2009

3D Texture Screen Capture box 
Filter 1 - Press '6' then Press '8'

Film Strip of Screen Capture
Filter 2 - Press '7'

Grayscale and pixelation of Screen Capture
Filter 3 - Press '4' 

HINT : "Place any of the following co-ordinates 208,208
          i.a movie clip (quicktime,avi,etc)
          ii.dvd movie
          iii. gif animation
          iv. website
          v. Flash animation
          v1. Photoshop Image
          vii. Jpeg Image or any Image in the centre of the screen"
          viii. Move windows around your operating system
          ix. Or any Processing sketch;

     
     3.1 Press '-' to reduce brightness
     3.2 Press '+' to increase brightness
     3.3 Press ' SHIFT + < ' to move winlet to the right
     3.3 Press ' SHIFT + > ' to move winlet to the left
     3.4 Press common  'g' to toggle algorithm Grayscale
     3.5 Press capital 'G' to toggle JAVA Grayscale
     3.6 Press common  'b' to toggle blur
         For a nice effect toggle 'b' for blur and you get a nice
         'store-window' effect - Note - best seen with colour
     For a really nice image try mixing 3.4,3.5 and 3.6    

Filter 4 - Press '1' to toggle a texture Box using (transparent) PGraphics     
         instead of opaque PImages as used in Filter 1
 
Filter 5 - Press '2' to toggle four-screen display of screen capture area


     */
import processing.opengl.*;

import processing.core.*;
public int klash;


public PImage bg2x;
public PGraphics bg4;

public int yx=0;
public int xz=0;
public int colx=208;
PImage img,img2;
PImage tex;
PImage dotsw,dots2w,dots3w,dots4w,dots5w,dots6w;
PGraphics imgSource;
boolean src = false, shiftdown = false;
int sens = 10;
PVector ScreenSize;     //
public Robot robot;

boolean mouseleft = false;
boolean mouseright = false;
boolean mousemiddle = false;
public int xroller = 0;
int[][] c;
public int x1;


//---

public boolean modef = false;
public boolean mode1 = false;
public boolean mode2 = false;
public boolean mode3 = false;
public boolean mode4 = false;
public boolean mode5 = false;
public boolean mode6 = false;
public boolean mode7 = false;
public boolean mode8 = false;
public boolean mode9 = false;
public boolean boxes =false;
public boolean blur = false;
public boolean grey = false;
public boolean gray=true;
public boolean mirror = false;
public boolean pixelreplace = false;
public boolean skip,skipy= true;
int[][] ca;
PImage pimg,dots;
PGraphics gimg,gimg2,gimg3,gimg4,gimg5,gimg6;

public int wide= 1;
public int high= 4;
public int tt,yy=0;
public float nowrr,nowgg,nowbb;
color [] kl;
public color pixelcol;
public color katch;
public int skewleft = 0;
public int bright = 1;
public int pixelloc3;
public int pixelloc2;

public float rr3,gg3,bb3;


float rotx = PI/4;
float roty = PI/4;

void setup()
{
 colorMode(RGB,255);
 hint(ENABLE_OPENGL_4X_SMOOTH);

 hint(DISABLE_OPENGL_ERROR_REPORT);
 loadPixels();
 textureMode(NORMALIZED);
 frameRate(30);
 size(352*wide,208*high,P3D);    //OPENGL does not display correctly
 ca = new int[width][height];
 kl = new color [352*208];
 dots = new PImage(352,208);


 stroke(0);
 //smooth();

 ///--


   textureMode(NORMALIZED);
   try
{

 robot = new Robot();
BufferedImage bufferedImage = robot.createScreenCapture(
new Rectangle(new Dimension(screen.width, screen.height)));

img   = new PImage(bufferedImage);
dotsw  = new PImage(352,208);
dots2w = new PImage(352,208);
dots3w = new PImage(352,208);
dots4w = new PImage(352,208);
dots5w = new PImage(352,208);
dots6w = new PImage(352,208);
bg2x   = new PImage(352,208);
bg4= createGraphics(352,208,P3D);
//background(160, 32, 32);

}
catch (AWTException e) {
e.printStackTrace();
}

 c = new int[screen.width][screen.height];

 if (colx > screen.width-352){
  colx =  screen.width-352;
 }

 if (colx <0){
  colx = 0;
 }

 mode9 = true;
}


void draw()
{
 if (mode6){
 background(19771114);
 }



if (mode9){

 image(dots2w,0,(208*3));
}



     pimg = new PImage(352,208);
pimg.loadPixels();
pimg.pixels = kl;
gimg= createGraphics(pimg.width,pimg.height,P3D);
gimg2= createGraphics(pimg.width,pimg.height,P3D);
gimg3= createGraphics(pimg.width,pimg.height,P3D);
gimg4= createGraphics(pimg.width,pimg.height,P3D);
gimg5= createGraphics(pimg.width,pimg.height,P3D);
gimg6= createGraphics(pimg.width,pimg.height,P3D);
gimg.loadPixels();
gimg2.loadPixels();
gimg3.loadPixels();
gimg4.loadPixels();
gimg5.loadPixels();
gimg6.loadPixels();

gimg.beginDraw();
gimg2.beginDraw();
gimg3.beginDraw();
gimg4.beginDraw();
gimg5.beginDraw();
gimg6.beginDraw();

gimg.image(pimg,0,0,pimg.width/2,pimg.height/2);
gimg.endDraw();
gimg.updatePixels();




 for (int x= 0; x < 352;x++){//352
   for (int y=0; y < 208;y++){//208

     if (mirror){
       pixelloc3 = (352 - x - 1) + y*352;  // x then y // y then x gives you inward mirror
     }
     else
     {
       pixelloc3 =  x+y*352;
     }

     // nowrr = red(pixels[pixelloc3]); //works great!!
     // nowgg = green(pixels[pixelloc3]);//works great!!
     // nowbb = blue(pixels[pixelloc3]);//works great!!

     //  nowrr = red(pixels[((207*352)*3)+        pixelloc3]); // works great!
     //  nowgg = green(pixels[((207*352)*3)+         pixelloc3]);//works great!
     //  nowbb = blue(pixels[ ((207*352)*3)+   pixelloc3]);// works great!
     if (mouseX<width*2/4 && mouseX >0 && mouseY >0 && mouseY <
height*2/4 && boxes)
     {
       nowrr = red(pixels[(((mouseX*mouseY)*3))+ (pixelloc3)]); // works great!
       nowgg = green(pixels[(((mouseX*mouseY)*3))+ (pixelloc3)]); //works great!
       nowbb = blue(pixels[(((mouseX*mouseY)*3))+ (pixelloc3)]); //works great!
     }
     else
     {
       nowrr = red(pixels[((207*352)*3)+        pixelloc3]); // works great!
       nowgg = green(pixels[((207*352)*3)+         pixelloc3]);// works great!
       nowbb = blue(pixels[ ((207*352)*3)+   pixelloc3]);// works great!
     }


     //nowrr = red(pixels[ x+y*352]);
     //nowgg = green(pixels[ x+y*352]);
     //nowbb = blue(pixels[ x+y*352]);

     if (gray){
       pixelcol = color(nowrr+nowgg+nowbb);
     }
     else
     {
       pixelcol = color(nowrr,nowgg,nowbb);

     }
     color pixelcolz = color(pixels[pixelloc3]);

     rr3 =   red(pixelcolz);
     gg3 = green(pixelcolz);
     bb3 =  blue(pixelcolz);


     if (gray){
       if (mode4){
       pixels[x+y*352]=color(nowrr/bright+nowgg/bright+nowbb/bright);
       }
       gimg3.pixels[x+y*352]=color(nowrr/bright+nowgg/bright+nowbb/bright);
     }
     else
     {
       if (mode4){
       pixels[x+y*352]=color(nowrr/bright,nowgg/bright,nowbb/bright);
       }
       gimg3.pixels[x+y*352]=color(nowrr/bright,nowgg/bright,nowbb/bright);
     }
     if (mode4){
       pixels[x+(208*352)+y*352]=pixelcol;
     }
     gimg4.pixels[x+y*352]=pixelcol;
    if (tt<width & yy< 208){
      if (mode4){
       pixels[(skewleft*1)+tt+((208*(352+(skewleft*0)))*1)+yy*352]=pixelcol*bright;
      }
     gimg5.pixels[x+y*352]=pixelcol*bright;
     if (mode4){
     pixels[tt*2+((208*352)*2)+(yy*2)*352]=pixelcol*bright;
     }

     dots.pixels[(tt*2)+(yy*2)*352]=pixelcol*bright;
     gimg2.pixels[(tt*1)+(yy*1)*352]=pixelcol*bright;
     gimg6.pixels[(tt*2)+(yy*2)*352]=pixelcol*bright;

   }
      skipy = !skipy;
         if(skipy){
         yy+=1;
         }


   } //for loop 2
   yy=0;
    skip = !skip;
       if (skip){
         tt+=1;
       }
 }// for loop 1
 tt=0;
 yy=0;
gimg2.endDraw();
gimg3.endDraw();
gimg4.endDraw();
gimg5.endDraw();
gimg6.endDraw();

gimg2.updatePixels();
gimg3.updatePixels();
gimg4.updatePixels();
gimg5.updatePixels();
gimg6.updatePixels();

if (mode2){
image(gimg3,0,0);
image(gimg4,0,208);
image(gimg5,0,208*2);
image(gimg6,0,208*3);
}

 gettop();

 translate(width/2.0, height/2.0);
 rotateX(rotx);
 rotateY(roty);
 scale(90);

 if (mode1){
 TexturedCube(gimg2,gimg3,gimg4,gimg5,gimg2,gimg6);
 }

if (mode8){
 TexturedCube2(dotsw,dots2w,dots3w,dots4w);
}


//if (mode7){

//

if (mode3){
 image(gimg,mouseX,mouseY);

}
//--------Modifiers
 if (blur){
 filter(BLUR,1f);
}
if (grey){
 filter(GRAY);
}


}

void mousePressed(){
 println(color(pixels[mouseX+mouseY*width]));
}

void keyPressed(){
 if (key =='-'){
   if(bright>1){
     bright-- ;
     println(bright);
   }
 }

 if (key =='+'){
   if (bright <31){
     bright++;
     println(bright);
   }
 }

if (key =='b'){
 blur =!blur;
}

 if (key =='m'){
   mirror = !mirror;
 }

 if (key == 'g'){
   gray = !gray;
 }

if (key == 'x'){
 boxes = !boxes;
}
if (key =='p'){
 pixelreplace = !pixelreplace;
}
if(key =='G'){
 grey = !grey;
}

if(key== '>' && skewleft >0){
 skewleft--;
}

if (key =='<' && skewleft <width-(352/2)){
 skewleft++;
}

if (key == 'f'){
 modef = !modef;
}

if (key == '1'){
 mode1 = !mode1;
}


if (key == '2'){
 mode2 = !mode2;
}

if (key == '3'){
 mode3 = !mode3;
}

if (key == '4'){
 mode4 = !mode4;
}


if (key == '5'){
 mode5 = !mode5;
}

if (key == '6'){
 mode6 = !mode6;
}

if (key == '7'){
 mode7 = !mode7;
}

if (key == '8'){
 mode8 = !mode8;
}


if (key == '9'){
 mode9 = !mode9;
}

if (key =='m') //menu
{


}

}

void TexturedCube(PGraphics tex , PGraphics tex2,  PGraphics tex3,
PGraphics tex4, PGraphics tex5, PGraphics tex6) {
 noStroke();
 beginShape(QUADS);
 texture(tex3);

 // Given one texture and six faces, we can easily set up the uv coordinates
 // such that four of the faces tile "perfectly" along either u or v,but the other
 // two faces cannot be so aligned.  This code tiles "along" u,"around" the X/Z faces
 // and fudges the Y faces - the Y faces are arbitrarily aligned such that a
 // rotation along the X axis will put the "top" of either texture at the "top"
 // of the screen, but is not otherwised aligned with the X/Z faces. (This
 // just affects what type of symmetry is required if you need seamless
 // tiling all the way around the cube)

 // +Z "front" face
 vertex(-1, -1,  1, 0, 0);
 vertex( 1, -1,  1, 1, 0);
 vertex( 1,  1,  1, 1, 1);
 vertex(-1,  1,  1, 0, 1);
 endShape();

  beginShape(QUADS);
 texture(tex4);
 // +Y "bottom" face
 vertex(-1,  1,  1, 0, 0);
 vertex( 1,  1,  1, 1, 0);
 vertex( 1,  1, -1, 1, 1);
 vertex(-1,  1, -1, 0, 1);
  endShape();
  beginShape(QUADS);
 texture(tex2);
 // -Y "top" face
 vertex(-1, -1, -1, 0, 0);
 vertex( 1, -1, -1, 1, 0);
 vertex( 1, -1,  1, 1, 1);
 vertex(-1, -1,  1, 0, 1);
  endShape();
  beginShape(QUADS);
 texture(tex5);
 // +X "right" face
 vertex( 1, -1,  1, 0, 0);
 vertex( 1, -1, -1, 1, 0);
 vertex( 1,  1, -1, 1, 1);
 vertex( 1,  1,  1, 0, 1);
  endShape();
  beginShape(QUADS);
 texture(tex6);
 // -X "left" face
 vertex(-1, -1, -1, 0, 0);
 vertex(-1, -1,  1, 1, 0);
 vertex(-1,  1,  1, 1, 1);
 vertex(-1,  1, -1, 0, 1);

 endShape();
}

void mouseDragged() {
 float rate = 0.01;
 rotx += (pmouseY-mouseY) * rate;
 roty += (mouseX-pmouseX) * rate;
}




void gettop() {
 translate(0,0);
 if (colx > screen.width-352){
  colx =  screen.width-352;
 }

 if (colx <0){
  colx = 0;
 }

BufferedImage bufferedImage = robot.createScreenCapture(
new Rectangle(new Dimension(screen.width, screen.height)));

img = new PImage(bufferedImage);




 img2 = new PImage(bufferedImage);



 dotsw.loadPixels();
 x1 =0;
//  for (int x = xroller; x <xroller+dots.width; x++){
//   for (int y = xroller; y <xroller+dots.height; y++){
 xz=0;
 for (int x = colx; x <colx+352; x++){
 
 for (int y = 0; y <208; y++){

          c[x][y]=img.get(x,y);
       
        color e = color(img.get(x,y));
        float rr = red(e);
        float gg = green(e);
        float bb = blue(e);
       if (xz <352){
         dotsw.pixels[xz+y*dotsw.width]=img.get(x,y);
       }





            x1++;





   }

xz++;
 }

 dotsw.updatePixels();

 //-------------

 yx=0;
 x1=0;
xz=0;
   for (int x = colx+0; x <colx+352; x++){
    // xz++;
 for (int y = 208; y <(208*2); y++){
   yx++;
          c[x][y]=img.get(x,y);

        color e = color(img.get(x,y));
        float rr = red(e);
        float gg = green(e);
        float bb = blue(e);

          if (yx< 208 && xz< 352){
         dots2w.pixels[xz+yx*dots2w.width]=img.get(x,y);
        }




            x1++;



  if (yx >208){
    yx = 0;
  }

   }
   xz++;
yx =0;

 }
  dots2w.updatePixels();

 //----------

  yx=0;
 x1=0;
xz=0;
   for (int x = colx; x <colx+352; x++){
   //  xz++;
 for (int y = (208*2); y <(208*3); y++){
   yx++;
          c[x][y]=img.get(x,y);

        color e = color(img.get(x,y));
        float rr = red(e);
        float gg = green(e);
        float bb = blue(e);

          if (yx< 208 && xz< 352){
         dots3w.pixels[xz+yx*dots3w.width]=img.get(x,y);
        }




            x1++;



  if (yx >208){
    yx = 0;
  }

   }
   xz++;
yx =0;

 }
  dots3w.updatePixels();




  yx=0;
 x1=0;
xz=0;
   for (int x = colx; x <colx+352; x++){

 for (int y = (208*3); y <(208+208+208+144); y++){
   yx++;
          c[x][y]=img.get(x,y);

        color e = color(img.get(x,y));
        float rr = red(e);
        float gg = green(e);
        float bb = blue(e);

          if (yx< 208 && xz< 352){
         dots4w.pixels[xz+yx*dots4w.width]=img.get(x,y);
        }




            x1++;



  if (yx >208){
    yx = 0;
  }

   }
   xz++;
yx =0;

 }
  dots4w.updatePixels();



if (mode7){
   if (modef){
  fillblue(dotsw);
  savetopic();
  image(bg4,0,0);
 }
 else
 {
image(dotsw,0,0);
 }

 if (modef){
   fillblue(dots2w);
   savetopic();
  image(bg4,0,208);
 }
 else
 {
image(dots2w,0,208);
 }

 if (modef){
  fillblue(dots3w);
   savetopic();
  image(bg4,0,(208*2));
 }
 else
 {
image(dots3w,0,(208*2));
 }

 if (modef)
 {
    fillblue(dots4w);
   savetopic();
  image(bg4,0,208*3);
 }
 else
 {
image(dots4w,0,(208*3));
 }
}


}


void TexturedCube2(PImage tex , PImage tex2,  PImage tex3, PImage tex4 ) {
 noStroke();
 beginShape(QUADS);
 texture(tex3);

 // Given one texture and six faces, we can easily set up the uv coordinates
 // such that four of the faces tile "perfectly" along either u or v,but the other
 // two faces cannot be so aligned.  This code tiles "along" u,"around" the X/Z faces
 // and fudges the Y faces - the Y faces are arbitrarily aligned such that a
 // rotation along the X axis will put the "top" of either texture at the "top"
 // of the screen, but is not otherwised aligned with the X/Z faces. (This
 // just affects what type of symmetry is required if you need seamless
 // tiling all the way around the cube)

 // +Z "front" face
 vertex(-1, -1,  1, 0, 0);
 vertex( 1, -1,  1, 1, 0);
 vertex( 1,  1,  1, 1, 1);
 vertex(-1,  1,  1, 0, 1);
 endShape();
  beginShape(QUADS);
 texture(tex);
 // -Z "back" face
 vertex( 1, -1, -1, 0, 0);
 vertex(-1, -1, -1, 1, 0);
 vertex(-1,  1, -1, 1, 1);
 vertex( 1,  1, -1, 0, 1);
  endShape();
  beginShape(QUADS);
 texture(tex4);
 // +Y "bottom" face
 vertex(-1,  1,  1, 0, 0);
 vertex( 1,  1,  1, 1, 0);
 vertex( 1,  1, -1, 1, 1);
 vertex(-1,  1, -1, 0, 1);
  endShape();
  beginShape(QUADS);
 texture(tex2);
 // -Y "top" face
 vertex(-1, -1, -1, 0, 0);
 vertex( 1, -1, -1, 1, 0);
 vertex( 1, -1,  1, 1, 1);
 vertex(-1, -1,  1, 0, 1);
  endShape();

}

void fillblue(PImage bg){
  klash = -1050000;
 bg2x.loadPixels();

  for (int x = 0; x< bg.width; x++){
    for (int y = 0; y < bg.height; y++){


       color c = color(bg.pixels[x+y*bg.width]);

        float rr = red(c);
        float gg = green(c);
        float bb = blue (c);

     
       if (c>klash){ //-1

        bg2x.pixels[x+y*bg2x.width] = color (19771114);
       }
       else
       {
        bg2x.pixels[x+y*bg2x.width]=bg.pixels[x+y*bg.width];
    
       }
    }
  }
 bg2x.updatePixels();

}

void savetopic(){

 bg4.beginDraw();

   for (int x = 0; x< bg2x.width; x++){
    for (int y = 0; y < bg2x.height; y++){
    int loc = (bg2x.width - x - 1) + y*bg2x.width;

       //color e = color(bg2.pixels[x+y*width]);
       color e = color(bg2x.pixels[loc]);
         if (e == 19771114){

       
         //  bg4.pixels[loc] = color(bg2.pixels[x+y*width]);

          bg4.pixels[x+y*width] = color(bg2x.pixels[x+y*width]);



       


         }
         else
         {
       
           bg4.pixels[x+y*width] = color(bg2x.pixels[loc]);  // works e ==

    
        // bg4.pixels[loc]=color(bg2.pixels[x+y*width]);

              bg4.pixels[loc]=color(bg2x.pixels[loc]); //works
         }

     }
   }

   bg4.endDraw();

}

