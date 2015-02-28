
//Sketch Browser will use Open Slide 1.0 for the animation transitions
//Co-Developed by Owaun Scantlebury

import processing.video.*;
public int pn=0; 
public String savename ="k-os_slide-";
//"k-davemakerd-";  

MovieMaker mm;   

public boolean firstpass = true;  
public int mode = 1;
public boolean justmode2 = false;   
public int frate = 30;
public boolean inc = true;  
public boolean demo = false;  // enable as true for local use
public boolean addmovframe = true;  

public boolean dovid =false;  

public boolean looponce = false;  

public boolean snap = true;  
public int midn = 0;
public PImage a;
public PGraphics _a;
public int awidth = 255;
public int aheight = 255;
public int cnt=0;   

void saveget(){  

  setupvid();  
  _a.loadPixels();
  _a.beginDraw();

  cnt++;
  if (cnt>a.pixels.length){
    cnt=0; 
  }
  _a.pixels[cnt]=color(mouseX,mouseY,0,255);
  if(mousePressed)                   _a.pixels[cnt]=color(mouseX,mouseY,mouseButton,255);
  if(!mousePressed  && !keyPressed)  _a.pixels[cnt]=color(mouseX,mouseY,0,255);
  a.pixels[cnt]=color(mouseX,mouseY,0,255);
  if(mousePressed)                   a.pixels[cnt]=color(mouseX,mouseY,mouseButton,255);
  if(!mousePressed  && !keyPressed)  a.pixels[cnt]=color(mouseX,mouseY,0,255);

  if (dovid){  

    if (inc){  

      pn++;  


    }  





    if(!online)save(savename+str(pn)+".png");  



  }  



  if (addmovframe && !online){  

    mm.addFrame();  

  }   



  if (looponce){  

    noLoop();  

    exit();   

  }  

  if (keyPressed ==true && ( key=='s' || key =='S' && !online)){


    midn++;
    if (!online)_a.save(savename+"/mm_/mm_mid"+str(midn)+"_"+savename+".png");
    _a.loadPixels();
    _a.beginDraw();

  }




  if (keyPressed ==true && ( key=='`' || key =='~' || key == ESC || key =='1') && demo){
    key ='1';

    midn++;
    if (!online){
      _a.save(savename+"/mm_/mm_final"+str(midn)+"_"+savename+".png");
      mm.finish();  
    }
    background(-1);
    firstpass = true; //resetting environment
    mode =2;
    play();

  }

  if (keyPressed ==true && ( key=='`' || key =='~' || key == ESC || key =='1') && !demo){  
    mode = 2;
    midn++;
    if (!online)
    {
      _a.save(savename+"/mm_/mm_final"+str(midn)+"_"+savename+".png");
      mm.finish();  
    }
    //if (!demo) exit();  
    background(-1);
    if (demo){
      mode=2;
      play();
    }
  }  



  _a.endDraw();
  _a.updatePixels();


}  



void setupvid(){  

  if (firstpass)  

  { 
    a  = createImage(awidth,aheight,ARGB);
    _a = createGraphics (awidth,aheight,P3D);
    if (!online){
      mm = new MovieMaker(this, width, height, savename+"/mov/"+savename+".mov", frate,   

      MovieMaker.ANIMATION, MovieMaker.LOSSLESS);  
    }


    if (snap && !online){  

      save(savename+"/snap/snap"+savename+str(pn)+".png");  

    }  

    firstpass = false;  





  }  

}  





void loop(){  



  saveget();  //uncomment to save video  



}  

void play(){
  demo= false;
  if (firstpass){
    int picn=0;
    if (!justmode2)cnt =0;
    if (demo)picn = cnt;
    if (justmode2)picn = 10;
    if (!demo){
      //insert desired number here or write app to determin number 
    }
    online = true; // testing online use; `
    if (!online) a = loadImage(savename+"/mm_/mm_mid"+str(picn)+"_"+savename+".png");
    if (online && justmode2 == false && _a !=null){
      _a.endDraw();
      _a.updatePixels();
      arraycopy(_a.pixels,a.pixels);

    }

    if (justmode2){  
      a = loadImage(savename+"/mm_/mm_mid"+str(picn)+"_"+savename+".png");  
    }



    firstpass = false; 
  }
  int layers = 4; // 4 as default
  cnt++;
  if (cnt>width*layers){
    cnt=0; 
    //background(-1);
    stroke(random(255),random(255),random(255));
  }
  color c =  a.pixels[cnt];
  if (!online) c = _a.pixels[cnt];
  mouseX = gr(c);
  mouseY= gg(c);
}




void setup(){
 // online = true; //testing online usage - uncomment for local use
  size(255,255,P3D); 
  background(-1);
}

void draw(){

  if (mode==2){ 

    play();
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  if (mode==1){
    background(-1);
    rect(mouseX,mouseY,20,20);
    loop();
  }
}


void keyPressed(){
  if (key=='r'){
    mode = 1;
    setup();

  }

  if (key=='m' && !online){
    println(mode); 
  }

}


public int gr(int col){
  int cc=0;
  cc = col >> 16 & 0xff;
  return cc; 
}

public int gg(int col){
  int cc=0;
  cc = col >> 8 & 0xff;
  return cc; 
}

public int gb(int col){
  int cc=0;
  cc = col & 0xff;
  return cc; 
}



