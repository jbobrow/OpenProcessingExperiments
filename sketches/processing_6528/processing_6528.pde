
import peasy.org.apache.commons.math.*; 
import peasy.*; 
import peasy.org.apache.commons.math.geometry.*; 
PeasyCam cam; 
public boolean donowcolor= false;
public boolean vmix = false;
public boolean invert = true;
public color nowcolor;
import processing.video.*; 
public int pn=0; 

public String savename ="k-smoothie-v4-"; 
MovieMaker mm;  
public boolean firstpass = true; 

public boolean inc = true; 
public boolean addmovframe = true; 
public boolean dovid =true; 
public boolean looponce = false; 
public boolean snap = true; 

void saveget(){ 
  setupvid(); 
  if (dovid){ 
    if (inc){ 
      pn++; 
    } 


    save(savename+str(pn)+".png"); 
  } 

  if (addmovframe){ 
    mm.addFrame(); 
  }  

  if (looponce){ 
    noLoop(); 
    exit();  
  } 

  if (keyPressed ==true && ( key=='`' || key =='~' || key == ESC)){ 
    mm.finish(); 
    exit();  
  } 

} 

void setupvid(){ 
  if (firstpass) 
  {
    mm = new MovieMaker(this, width, height, savename+".mov", 30,  
    MovieMaker.ANIMATION, MovieMaker.LOSSLESS); 

    if (snap){ 
      save("snap"+savename+str(pn)+".png"); 
    } 
    firstpass = false; 


  } 
} 


void loop(){ 

  // saveget();  //uncomment to save video 

} 


int cpass=0; 
import processing.opengl.*;  
public color [] csv,ppp;
public boolean lines =false;
PImage a;
PImage pxx;
public boolean trails = false;
PGraphics pop,pop2,pop3;

int cvt=0;
public color cc;

////--------------
void setup(){ 
  size(300,300,P3D); 
  donowcolor= false;
  vmix = false;
  invert = true;
  a= new PImage (width,height);
  pxx= new PImage (width,height);
  pop = createGraphics(width,height,P3D);
  pop2 = createGraphics(width,height,P3D);
  pop3 = createGraphics(width,height,P3D);
  lights(); 
  frameRate(15); 
  hint(DISABLE_OPENGL_2X_SMOOTH); 
  noSmooth(); 
  loadPixels();
  mouseX= 20;
  mouseY =20;
  //hint(ENABLE_OPENGL_4X_SMOOTH); 
  csv= new color[width*height];
  ppp= new color[width*height];
  //smooth(); 
  //cam = new PeasyCam (this,width); 
  makebg();
  strokeWeight(0.5f); 
} 
int pp;
float px,pxget; 
int mode = 2; 

void draw(){ 
 // mouseButton = 37; 
 // mousePressed = true; 
  // background(a); 

  if (gcam){ 

    cam = new PeasyCam (this,width); 
  } 
  else 
  { 
    cam = null;  
  } 
  rotateX(radians(180)); 


  px+=0.001;  
  pxget = px; 


  if (kk==1){ 
    kk=0; 

    translate(width/4+60,height/6-75); 
    pop2.translate(width/4+60,height/6-75); 
    pop3.translate(width/4+60,height/6-75); 
    rotateX(radians(45/2));//45 
    pop2.rotateX(radians(45/2));//45 
    pop3.rotateX(radians(45/2));//45 
    //background(255); 
    //background(a); 
    background(pop); 
    pop2.background(pop); 
    pop3.background(pop);     
    pop2.noStroke(); 
    pop3.noStroke(); 


    fill(233,23,23,123);  
    pop2.fill(233,23,23,123); 
    pop3.fill(233,23,23,123); 
    for(float z=0;z<height/2;z+=1){ 
      translate(0,0,z); 
      pop2.translate(0,0,z); 
      pop3.translate(0,0,z); 
      pp++;
      if (pp>a.pixels.length-2){
        pp=0; 
      }
      if (donowcolor){
        cc = csv[(int)z]+nowcolor;

      }
      else
      {
        //  cc = csv[(int)z]+cvt;
        cc = cvt;
      }

      if (vmix){
        cc = color(height-z,z,cpass+z)+color(mouseX+width*mouseY);
      }
      // color cc = csv[cvt];
      color ccd = color(height-z,z,cpass+z); 
      //color ccf = blendColor(ccf,ccd,OVERLAY);

      if (mode ==1){ 
        rotateZ(radians(px)); 
        pop2.rotateZ(radians(px)); 
        pop3.rotateZ(radians(px)); 
      } 
      if (mode ==2){ 
        rotateZ(px); 
        pop2.rotateZ(px); 
        pop3.rotateZ(px); 
      } 
      ellipseMode(CORNER); 
      pop2.ellipseMode(CORNER); 
      pop3.ellipseMode(CORNER); 

      fill(cc); 


      if (donowcolor){
        noStroke();
      }
      else
      {
        if (lines){
          stroke(-cc); 
        }
        else
        {
          noStroke(); 
        }
      
      }

      pop2.fill(cc); 
      pop3.fill(cc); 
      ellipse(0,0,10+z,10+z); 
      pop2.ellipse(0,0,10+z,10+z); 
      pop3.ellipse(0,0,10+z,10+z); 
      //rect(0,0,10+z,10+z); 
      translate(0,0,-z); 
      pop2.translate(0,0,-z); 
      pop3.translate(0,0,-z); 

    } 
  } 

  cpass+=1; 
  if (cpass>4000){ 
    cpass=0;  
  } 



  kk = 1; 
  pop.mask(pop2);

  if (trails){
    for (int i = 0;i<pixels.length;i++){
      if (color(pixels[i]) == -3355444){
        if (invert){
          pop.pixels[i]=a.pixels[i];
        }
        else
        {
          pop.pixels[i]=-a.pixels[i];
        }
      } 
      else
      {
        if (invert){
          pop.pixels[i]=pixels[i]; 
        }
        else
        {
          pop.pixels[i]=-pixels[i]; 
        }
      }
    }
  }

  if (donowcolor){
    if (lines){
      cvt+=width;
      if (invert){
        nowcolor = -color(mouseX+width*mouseY);
      }
      else
      {
        nowcolor = color(mouseX+width*mouseY);
      }
    }
    else
    {
      if (invert){

        nowcolor=-cvt; 
      }
      else
      {
        nowcolor=cvt; 
      }
    }
  }
  else
  {
    if (invert)
    {
      cvt = color(mouseX+width*mouseY);
    }
    else
    {
      cvt = -color(mouseX+width*mouseY);
    }

  }
  if (cvt>(width*height)-3){
    cvt=0; 
  }



  if (invert){
    PImage apa = new PImage(width,height);
    apa = get();
    apa.filter(INVERT);
    arraycopy(apa.pixels,pixels);
  }


  loop(); 



} 

int kk = 1; 
boolean gcam = false; 


void keyPressed(){ 
  if (key=='1'){ 
    mode =1; 
  } 

  if (key=='q'){ 
    colorMode (RGB); 
  } 

  if (key=='Q'){ 
    colorMode (HSB); 
  } 

  if (key=='g'){
    println(color(pixels[mouseX+width*mouseY])); 
  }

  if (key=='2'){ 
    mode= 2; 
  } 

  if (key=='d' || key =='D'){ 
    donowcolor = !donowcolor;
  } 

  if (key =='c'){ 

    gcam=!gcam;  
  } 
  if (key =='l' || key =='L'){ 

    lines=!lines;  
  } 

  if (key =='v' || key =='V'){ 

    vmix= !vmix;
  } 

  if (key =='t'){
    trails = !trails; 
  }

  if (key =='i' || key =='I' ){
    invert = !invert; 
  }


  if (key =='r'){ 
    setup();  
  } 
 

} 


void makebg(){

  int cpass=0;
  for (int i = 0;i<(width*height);i++){
    csv[i]=color(0); 
  }
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      int pos=y*width+x;
      color col = csv[pos] ;//
      color colx = color(height-y,x,y-x); 
      // color colx = color(height-y,X,cpass+y); 


      float rr= red(colx);
      float bb= blue(colx);
      float gg= green(colx);




      csv[pos]=color(rr,gg,bb);
    }
  }
  arraycopy(csv,a.pixels);
  arraycopy(csv,pop.pixels);
  pop.updatePixels();
  cpass++; 


  //if (cpass>4000){ 
  // cpass=0;  
  //} 



}


