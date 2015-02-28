
PImage src;

void setup(){
  setup2(); 



}
void draw(){
  image(srci,0,0);
  //if(keyPressed)draw2();
}
PImage src2;



int mode = 2;
boolean locka= true;
boolean lockb= true;
boolean lockc= true;
boolean lockd= true;
int off=0;
int off1=0;
int off2=0;
int off3=0;
PImage srci;
import processing.opengl.*;
void setup2(){
  
  //size(src.width*3,src.height*3,P3D);
  // size(screen.width,screen.height,P3D);
  size(200,200);//200 200
src = createImage(width,height,ARGB);
  //smooth();
  src.resize(width,height);
  srci = createImage(src.width,src.height,ARGB);
  src2 = createImage(src.width,src.height,ARGB);
  for (int i=0;i<src.pixels.length;i++){
    color c = src.pixels[i];
    float rr = cr(c);
    float gg = cg(c);
    float bb = cb(c);
    src2.pixels[i]=color(rr,gg,bb,41);
  }
  draw2();
  //save("P3D.png");
}
void draw2(){

  off=0;
  off1=0;
  off2=0;
  off3=0;
  background(128);
  image(src2,0,0);
  PImage imageData = createImage(width*2,height*2,ARGB);
  if(mode==1)loadPixels();
  if(mode==2)srci.loadPixels();
  int offset = 0;
  for(int y = 0; y < imageData.height-4; y += 4) {
    for(int x = 0; x < imageData.width-4; x += 4) {
      if (off<4){
        off1=1;
        off2=2;
        off3=3;
      }   
      if (mode==1){
        if(locka)       pixels[off] =color((int)(Math.sin(x * 0.01) * 127 + 128));
        if(!locka)      pixels[off] =color((int)Math.sin(x * 0.01) * 127 + 128);

        //color(sin(x * 0.01) * 127 + 128);
        if(lockb)       pixels[off1]=color((int)(Math.sin(y * 0.02) * 127 + 128));  
        if(!lockb)      pixels[off1]=color((int)Math.sin(y * 0.02) * 127 + 128);
        if (lockc)      pixels[off2]=color((int)(Math.cos(x*  0.04 + y * 0.03) * 127 + 128)); //1.04 // x >> y
        if (!lockc)     pixels[off2]=color((int)Math.cos(x* 0.04 + y * 0.03) * 127 + 128); // x >> y
        if(lockd)       pixels[off3]=color((int)(Math.sin(x * 0.01) * 127 + 128)) ;
        if(!lockd)      pixels[off3]=color((int)Math.sin(x * 0.01) * 127 + 128) ;
      }
      if(mode==2){

        color soap = color((int)(sin(x * 0.01) * 127 + 128));
        //color soap = color((int)(Math.sin(x * 0.01) * 127 + 128));
        if(locka)  srci.pixels[off] =    color(soap,soap,soap,255-soap);
        //srci.pixels[off] =color(soap,soap,soap,255-soap);
        //color((int)(Math.sin(x * 0.01) * 127 + 128));
        //color(soap,soap,soap,255-soap);
        soap=color((int)Math.sin(x * 0.01) * 127 + 128);
        if(!locka)srci.pixels[off] =      color((int)Math.sin(x * 0.01) * 127 + 128); 
        //color(soap,soap,soap,255-soap);
        //srci.pixels[off] =color((int)Math.sin(x * 0.01) * 127 + 128);
        //color(soap,soap,soap,255-soap);

        //color(sin(x * 0.01) * 127 + 128);
        if(lockb)       srci.pixels[off1]=color((int)(Math.sin(y * 0.02) * 127 + 128));
        if(!lockb)      srci.pixels[off1]=color((int)Math.sin(y * 0.02) * 127 + 128);
        if (lockc)      srci.pixels[off2]=color((int)(Math.cos(x * 2.04 + y * 0.03) * 127 + 128)); //1.04 //x>>y
        if (!lockc)     srci.pixels[off2]=color((int)Math.cos( x * 0.04 + y * 0.03) * 127 + 128);//2.04 //x>>y
        if(lockd)       srci.pixels[off3]=color((int)(Math.sin(x * 1.01) * 127 + 128)) ;
        if(!lockd)      srci.pixels[off3]=color((int)Math.sin(x * 0.01) * 127 + 128) ;


      }

      //      pixels[offset] = color(
      //        (int)(Math.sin(x * 0.01) * 127 + 128),            // red
      //        (int)(Math.sin(y * 0.02) * 127 + 128),            // green
      //        (int)(Math.cos(x * 0.04 + y * 0.03) * 127 + 128), // blue
      //        (int)(Math.sin(x * 0.01) * 127 + 128)                                              // alpha
      //      );
      //      offset++;
      off+=4;
      off1=off+1;
      off2=off+2;
      off3=off+3;

    }
  }

  if(mode==1)updatePixels();
  if(mode==2){
    srci.updatePixels();
    image(srci,0,0);

  }
  //image(src2,0,0);
  // blend(src,0,0,width,height,0,0,width,height,OVERLAY);
  //  image(src,src.width,src.height);
  //  image(srci,0,0);
}

void keyPressed(){

  if(key=='1'){
    locka=!locka;
    draw2();
  }
  if(key=='2'){
    lockb=!lockb;
    draw2();
  }
  if(key=='3'){
    lockc=!lockc;
    draw2();
  }
  if(key=='4'){
    lockd=!lockd;
    draw2();
  }


  if (key=='a')mode=1;
  if (key=='b')mode=2;
}



int ca(color c) {
  return (c >> 24) & 255; 
}
int cr(color c) {
  return (c >> 16) & 255; 
}
int cg(color c) {
  return (c >> 8) & 255;
}
int cb(color c) {
  return c & 255; 
}



                
                                                                
