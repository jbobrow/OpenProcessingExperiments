
//Modified for gabecolors for his Alchemeyez festival
//Colour box
//Original code by Owaun Scantlebury
//Code updated by Owaun Scantlebury
//798 x 598

int hf=255,wf=255,iff; 
float df=0,ef=0,rf=.01,zf,nf; 
int X,Y; 
PImage water; 
PGraphics water2; 
PImage bbg;
PImage _span,_span2;
void setup(){ 
  size(798,568,P3D);  
  bbg = new PImage(wf,hf);
  water = new PImage (wf,hf); 
  water2 = createGraphics (wf,hf,P3D); 
  //_span = createImage(wf,hf,ARGB);
  _span = createImage(width,height,ARGB);
  water.loadPixels(); 
  loadPixels(); 
} 
void draw(){ 
  makebg(true,false);
  //if (mousePressed){ 
  //background(_span);
  //}
  //else
  //{
  background(0); 
  //}
  _span = createImage(wf,hf,ARGB);
  df-=(mouseY-hf/2f)/hf/2f;//137 
  ef+=(mouseX-wf/2f)/wf/2f;//120 
  //water2.loadPixels(); 
  //water2.beginDraw(); 
  for(iff=0;iff<wf*hf;iff++){ 
    zf=iff/wf; // use  '/' for horizontal or '%' for vertical  
    X=int(iff%wf/zf*hf); 
    Y=int(hf/2+noise(iff%wf*rf+ef,iff*rf/wf+df)*99/zf*hf); 

    color c=Y+(get(X,Y)>>8&iff); 

    //   if (!mousePressed){ 

    //image(bbg,0,0);
    //water.pixels[iff]=color(c-mouseY,c-mouseX,c*iff)+bbg.pixels[iff];  
    // water.pixels[iff]=color(c-mouseY,c-mouseX,c*iff)+bbg.get(X,Y);  
    //water.pixels[iff]=blendColor(color(c-mouseY,c-mouseX,c*iff),bbg.pixels[iff],SUBTRACT);  

    _span.pixels[iff]=blendColor(color(c-mouseY,c-mouseX,c*iff),bbg.pixels[iff],SUBTRACT);
    // }  

    //   if (mousePressed){ 
    //     
    //      //set(X,Y,color(c-mouseY,c-mouseX,c*iff));
    //      _span.set(X,Y,color(c-mouseY,c-mouseX,c*iff));
    //   } 
  } 

  //water2.endDraw(); 
  //water2.updatePixels(); 
  //water.pixels = water2.pixels; 
  //water.updatePixels(); 
  //if (!mousePressed){ 
  //  // image(water,0,0); 
  //    //_span = createImage(wf,hf,ARGB);
  //    //arraycopy(water.pixels,_span.pixels);
  //    
  //   
  //   
  //} 
  _span.resize(width,height);
  image(_span,0,0);
} 


void keyPressed(){ 
  if (key =='h'){ 
    colorMode(HSB,350);   
  } 



  if (key == 'r'){ 
    colorMode(RGB,350);  
  } 
} 

int cpass=0;
void makebg(Boolean animate, Boolean invert){

  water.loadPixels();
  color colx = 0;
  for(int y=0;y<hf;y++){
    for(int x=0;x<wf;x++){
      int pos=y*wf+x;
      color col = water.pixels[pos] ;//
      colx = color(hf-y,x,y-x); 
      if (animate){
        //colx = color(height-y,X,cpass+y); 
        // colx = color(height-y,x,cpass-X); 
        colx = color(mouseY-y,x,cpass+y); 
      }


      float rr= red(colx);
      float bb= blue(colx);
      float gg= green(colx);

      rr = colx >> 16 & 0xff;
      gg = colx >> 8 & 0xff;
      bb = colx  & 0xff;
      //        for(int i=0;i<4;i++){
      //          dis =dist(p[i].xpos,p[i].ypos,x,y)/2;
      //          rr += cc[0]/dis-gain;
      //          gg += cc[1]/dis-gain;
      //          bb += cc[2]/dis-gain;
      //        }
      if (!invert)    {  
        bbg.pixels[pos]=color(rr,gg,bb);
      }
      if (invert)   {   
        bbg.pixels[pos]=-color(rr,gg,bb);
      }
    }
    bbg.updatePixels();
    //    if (!online){
    arraycopy(bbg.pixels,water.pixels); 
    //    }
  }
  if (animate){
    cpass++; 
  }
  if (cpass>4000){ 
    cpass=0;  
  } 

}



