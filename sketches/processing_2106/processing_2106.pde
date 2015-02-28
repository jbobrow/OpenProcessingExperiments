

public boolean boxes =false;
public boolean blur = false;
public boolean grey = false;
public boolean gray=true;
public boolean mirror = false;
public boolean pixelreplace = false;
public boolean skip,skipy= true;
PImage ghost;
PImage pimg;
PGraphics gimg;
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
void setup()
{ 
  colorMode(RGB,255);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  hint(DISABLE_OPENGL_ERROR_REPORT);
  loadPixels();
  
  ghost = loadImage ("gh.png");
 // ghost.loadPixels();
 // ghost = new Movie(this,"ghost.mov");
  //ghost.loop();
  frameRate(30);
  size(352*wide,208*high,P3D);   
  kl = new color [352*208];
}
//void movieEvent (Movie ghost){
//
//  if(ghost.available()){
//    ghost.read();
//    kl = ghost.pixels;
//
//  }
//}

void draw()
{ 
    image(ghost,0,height*3/4);   
  image(ghost,0,0); 
  arraycopy(ghost.pixels,kl); // provides more stability
  
  kl = ghost.pixels; 
  
  //--
  
      pimg = new PImage(352,208);
pimg.loadPixels(); 
pimg.pixels = kl;
gimg= createGraphics(pimg.width,pimg.height,P3D);
gimg.loadPixels();
gimg.beginDraw();
gimg.image(pimg,0,0,pimg.width/2,pimg.height/2);
gimg.endDraw();
gimg.updatePixels();

// for (int x=0; x< 352; x++){
//  for (int y = 0; x < 208; y++){
//    pimg.pixels[x+y*352] = ghost.pixels[x+y*352];
//    //pimg.pixels[x+y*gimg.width]=ghost.pixels[x+y*gimg.width];
//
//  }
// }
  //--
  
  
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
      //  nowgg = green(pixels[((207*352)*3)+         pixelloc3]);// works great!
      //  nowbb = blue(pixels[ ((207*352)*3)+   pixelloc3]);// works great!
      if (mouseX<width*2/4 && mouseX >0 && mouseY >0 && mouseY < height*2/4 && boxes)
      {
        nowrr = red(pixels[(((mouseX*mouseY)*3))+ (pixelloc3)]); // works great!
        nowgg = green(pixels[(((mouseX*mouseY)*3))+ (pixelloc3)]); // works great!
        nowbb = blue(pixels[(((mouseX*mouseY)*3))+ (pixelloc3)]); // works great!
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
        pixels[x+y*352]=color(nowrr/bright+nowgg/bright+nowbb/bright);
      }
      else
      {
        pixels[x+y*352]=color(nowrr/bright,nowgg/bright,nowbb/bright);
      }
      pixels[x+(208*352)+y*352]=pixelcol;
     if (tt<width & yy< 208){  
      pixels[(skewleft*1)+tt+((208*(352+(skewleft*0)))*1)+yy*352]=pixelcol*bright;
      pixels[tt*2+((208*352)*2)+(yy*2)*352]=pixelcol*bright;
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

//image(gimg,mouseX,mouseY);

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

if (key =='m') //menu
{
  
  
}

}

