
//FIRST SYMBOL IS AN  L

float  l1ax =99*3-200;
float  l1ay =165*3-400;
float  l2ax =99*3-200;
float  l2ay =165*3-400;
float  l3ax =108*3-200;
float  l3ay =189*3-400;
float  l4ax =164*3-200;
float  l4ay =183*3-400;
float  l5ax =99*3-200;
float  l5ay =165*3-400;
float  l6ax =108*3-200;
float  l6ay =189*3-400;
float  l7ax =171*3-200;
float  l7ay =207*3-400;
float  l8ax =164*3-200;
float  l8ay =183*3-400;
float  l9ax =97*3-200;
float  l9ay =175*3-400;
float  l10ax =97*3-200;
float  l10ay =175*3-400;
float  l11ax =103*3-200;
float  l11ay =199*3-400;
float  l12ax =162*3-200;
float  l12ay =192*3-400;
  
float  l1bx =164*3-200;
float  l1by =183*3-400;
float  l2bx =108*3-200;
float  l2by =189*3-400;
float  l3bx =171*3-200;
float  l3by =207*3-400;
float  l4bx =171*3-200;
float  l4by =207*3-400;
float  l5bx =97*3-200;
float  l5by =175*3-400;
float  l6bx =103*3-200;
float  l6by =199*3-400;
float  l7bx =168*3-200;
float  l7by =216*3-400;
float  l8bx =162*3-200;
float  l8by =192*3-400;
float  l9bx =162*3-200;
float  l9by =192*3-400;
float  l10bx =103*3-200;
float  l10by =199*3-400;
float  l11bx =168*3-200;
float  l11by =216*3-400;
float  l12bx =168*3-200;
float  l12by =216*3-400;

float x;
float y;

float gl1a=0;
float gl2a=0;
float gl3a=0;
float gl4a=0;
float gl5a=0;
float gl6a=0;
float gl7a=0;
float gl8a=0;
float gl9a=0;
float gl10a=0;
float gl11a=0;
float gl12a=0;

float gl1b=0;
float gl2b=0;
float gl3b=0;
float gl4b=0;
float gl5b=0;
float gl6b=0;
float gl7b=0;
float gl8b=0;
float gl9b=0;
float gl10b=0;
float gl11b=0;
float gl12b=0;

float sl1a = 4;
float sl2a = 4;
float sl3a = 4;
float sl4a = 4;
float sl5a = 4;
float sl6a = 4;
float sl7a = 4;
float sl8a = 4;
float sl9a = 4;
float sl10a = 4;
float sl11a = 4;
float sl12a = 4;

float sl1b = 4;
float sl2b = 4;
float sl3b = 4;
float sl4b = 4;
float sl5b = 4;
float sl6b = 4;
float sl7b = 4;
float sl8b = 4;
float sl9b = 4;
float sl10b = 4;
float sl11b = 4;
float sl12b = 4;

float gc;
//gravity constant

float sc;
//speed constant
float resx;
float resy;
float gh;
//ground height

int click;

void setup(){
  size (800, 800);
  background(255);
//  /frameRate(10);
  click = 1;
  gh = 75;
  gc = .981;
  sc = -0.0;
}
void draw(){
  if (click == 1){
    fill(255, 255, 255, 1000);
    rect(-2, -2, width+2, height+2);
    line (0, height - gh, width, height-gh);
    
    gl1a = gl1a+gc;
    gl2a = gl2a+gc;
    gl3a = gl3a+gc;
    gl4a = gl4a+gc;
    gl5a = gl5a+gc;
    gl6a = gl6a+gc;
    gl7a = gl7a+gc;
    gl8a = gl8a+gc;
    gl9a = gl9a+gc;
    gl10a = gl10a+gc;
    gl11a = gl11a+gc;
    gl12a = gl12a+gc;
    
    gl1b = gl1b+gc;
    gl2b = gl2b+gc;
    gl3b = gl3b+gc;
    gl4b = gl4b+gc;
    gl5b = gl5b+gc;
    gl6b = gl6b+gc;
    gl7b = gl7b+gc;
    gl8b = gl8b+gc;
    gl9b = gl9b+gc;
    gl10b = gl10b+gc;
    gl11b = gl11b+gc;
    gl12b = gl12b+gc;
    
    gl1a = gl1a+sc;
    gl2a = gl2a+sc;
    gl3a = gl3a+sc;
    gl4a = gl4a+sc;
    gl5a = gl5a+sc;
    gl6a = gl6a+sc;
    gl7a = gl7a+sc;
    gl8a = gl8a+sc;
    gl9a = gl9a+sc;
    gl10a = gl10a+sc;
    gl11a = gl11a+sc;
    gl12a = gl12a+sc;
    
    gl1b = gl1b+sc;
    gl2b = gl2b+sc;
    gl3b = gl3b+sc;
    gl4b = gl4b+sc;
    gl5b = gl5b+sc;
    gl6b = gl6b+sc;
    gl7b = gl7b+sc;
    gl8b = gl8b+sc;
    gl9b = gl9b+sc;
    gl10b = gl10b+sc;
    gl11b = gl11b+sc;
    gl12b = gl12b+sc;
    
    l1ay = l1ay+gl1a;
    l2ay = l2ay+gl2a;
    l3ay = l3ay+gl3a;
    l4ay = l4ay+gl4a;
    l5ay = l5ay+gl5a;
    l6ay = l6ay+gl6a;
    l7ay = l7ay+gl7a;
    l8ay = l8ay+gl8a;
    l9ay = l9ay+gl9a;
    l10ay = l10ay+gl10a;
    l11ay = l11ay+gl11a;
    l12ay = l12ay+gl12a;
    
    l1by = l1by+gl1b;
    l2by = l2by+gl2b;
    l3by = l3by+gl3b;
    l4by = l4by+gl4b;
    l5by = l5by+gl5b;
    l6by = l6by+gl6b;
    l7by = l7by+gl7b;
    l8by = l8by+gl8b;
    l9by = l9by+gl9b;
    l10by = l10by+gl10b;
    l11by = l11by+gl11b;
    l12by = l12by+gl12b;
    
    l1ax = l1ax+sl1a;
    l2ax = l2ax+sl2a;
    l3ax = l3ax+sl3a;
    l4ax = l4ax+sl4a;
    l5ax = l5ax+sl5a;
    l6ax = l6ax+sl6a;
    l7ax = l7ax+sl7a;
    l8ax = l8ax+sl8a;
    l9ax = l9ax+sl9a;
    l10ax = l10ax+sl10a;
    l11ax = l11ax+sl11a;
    l12ax = l12ax+sl12a;
    
    l1bx = l1bx+sl1b;
    l2bx = l2bx+sl2b;
    l3bx = l3bx+sl3b;
    l4bx = l4bx+sl4b;
    l5bx = l5bx+sl5b;
    l6bx = l6bx+sl6b;
    l7bx = l7bx+sl7b;
    l8bx = l8bx+sl8b;
    l9bx = l9bx+sl9b;
    l10bx = l10bx+sl10b;
    l11bx = l11bx+sl11b;
    l12bx = l12bx+sl12b;
    
  line(l1ax, l1ay, l1bx, l1by);
  line(l2ax, l2ay, l2bx, l2by);
  line(l3ax, l3ay, l3bx, l3by);
  line(l4ax, l4ay, l4bx, l4by);
  line(l5ax, l5ay, l5bx, l5by);
  line(l6ax, l6ay, l6bx, l6by);
  line(l7ax, l7ay, l7bx, l7by);
  line(l8ax, l8ay, l8bx, l8by);
  line(l9ax, l9ay, l9bx, l9by);
  line(l10ax, l10ay, l10bx, l10by);
  line(l11ax, l11ay, l11bx, l11by);
  line(l12ax, l12ay, l12bx, l12by);
    
    if(l1ay>height-gh){
      gl1a = -gl1a;
    }
    if(l2ay>height-gh){
      gl2a = -gl2a;
    }
    if(l3ay>height-gh){
      gl3a = -gl3a;
    }
    if(l4ay>height-gh){
      gl4a = -gl4a;
    }
    if(l5ay>height-gh){
      gl5a = -gl5a;
    }
    if(l6ay>height-gh){
      gl6a = -gl6a;
    }
    if(l7ay>height-gh){
      gl7a = -gl7a;
    }
    if(l8ay>height-gh){
      gl8a = -gl8a;
    }
    if(l9ay>height-gh){
      gl9a = -gl9a;
    }
    if(l10ay>height-gh){
      gl10a = -gl10a;
    }
    if(l11ay>height-gh){
      gl11a = -gl11a;
    }
    if(l12ay>height-gh){
      gl12a = -gl12a;
    }
    //________________________________________
    if(l1by>height-gh){
      gl1b = -gl1b;
    }
    if(l2by>height-gh){
      gl2b = -gl2b;
    }
    if(l3by>height-gh){
      gl3b = -gl3b;
    }
    if(l4by>height-gh){
      gl4b = -gl4b;
    }
    if(l5by>height-gh){
      gl5b = -gl5b;
    }
    if(l6by>height-gh){
      gl6b = -gl6b;
    }
    if(l7by>height-gh){
      gl7b = -gl7b;
    }
    if(l8by>height-gh){
      gl8b = -gl8b;
    }
    if(l9by>height-gh){
      gl9b = -gl9b;
    }
    if(l10by>height-gh){
      gl10b = -gl10b;
    }
    if(l11by>height-gh){
      gl11b = -gl11b;
    }
    if(l12by>height-gh){
      gl12b = -gl12b;
    }
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^bottom to top
    
    if(l1ay<0){
      gl1a = -gl1a;
    }
    if(l2ay<0){
      gl2a = -gl2a;
    }
    if(l3ay<0){
      gl3a = -gl3a;
    }
    if(l4ay<0){
      gl4a = -gl4a;
    }
    if(l5ay<0){
      gl5a = -gl5a;
    }
    if(l6ay<0){
      gl6a = -gl6a;
    }
    if(l7ay<0){
      gl7a = -gl7a;
    }
    if(l8ay<0){
      gl8a = -gl8a;
    }
    if(l9ay<0){
      gl9a = -gl9a;
    }
    if(l10ay<0){
      gl10a = -gl10a;
    }
    if(l11ay<0){
      gl11a = -gl11a;
    }
    if(l12ay<0){
      gl12a = -gl12a;
    }
    //________________________________________
    if(l1by<0){
      gl1b = -gl1b;
    }
    if(l2by<0){
      gl2b = -gl2b;
    }
    if(l3by<0){
      gl3b = -gl3b;
    }
    if(l4by<0){
      gl4b = -gl4b;
    }
    if(l5by<0){
      gl5b = -gl5b;
    }
    if(l6by<0){
      gl6b = -gl6b;
    }
    if(l7by<0){
      gl7b = -gl7b;
    }
    if(l8by<0){
      gl8b = -gl8b;
    }
    if(l9by<0){
      gl9b = -gl9b;
    }
    if(l10by<0){
      gl10b = -gl10b;
    }
    if(l11by<0){
      gl11b = -gl11b;
    }
    if(l12by<0){
      gl12b = -gl12b;
    }
    //+++++++++++++++++++++++++++++++++++++++++g->sc
    
    if(l1ax>width){
      sl1a = -sl1a;
    }
    if(l2ax>width){
      sl2a = -sl2a;
    }
    if(l3ax>width){
      sl3a = -sl3a;
    }
    if(l4ax>width){
      sl4a = -sl4a;
    }
    if(l5ax>width){
      sl5a = -sl5a;
    }
    if(l6ax>width){
      sl6a = -sl6a;
    }
    if(l7ax>width){
      sl7a = -sl7a;
    }
    if(l8ax>width){
      sl8a = -sl8a;
    }
    if(l9ax>width){
      sl9a = -sl9a;
    }
    if(l10ax>width){
      sl10a = -sl10a;
    }
    if(l11ax>width){
      sl11a = -sl11a;
    }
    if(l12ax>width){
      sl12a = -sl12a;
    }
    //________________________________________
    if(l1bx>width){
      sl1b = -sl1b;
    }
    if(l2bx>width){
      sl2b = -sl2b;
    }
    if(l3bx>width){
      sl3b = -sl3b;
    }
    if(l4bx>width){
      sl4b = -sl4b;
    }
    if(l5bx>width){
      sl5b = -sl5b;
    }
    if(l6bx>width){
      sl6b = -sl6b;
    }
    if(l7bx>width){
      sl7b = -sl7b;
    }
    if(l8bx>width){
      sl8b = -sl8b;
    }
    if(l9bx>width){
      sl9b = -sl9b;
    }
    if(l10bx>width){
      sl10b = -sl10b;
    }
    if(l11bx>width){
      sl11b = -sl11b;
    }
    if(l12bx>width){
      sl12b = -sl12b;
    }
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^bottom to top
    
    if(l1ax<0){
      sl1a = -sl1a;
    }
    if(l2ax<0){
      sl2a = -sl2a;
    }
    if(l3ax<0){
      sl3a = -sl3a;
    }
    if(l4ax<0){
      sl4a = -sl4a;
    }
    if(l5ax<0){
      sl5a = -sl5a;
    }
    if(l6ax<0){
      sl6a = -sl6a;
    }
    if(l7ax<0){
      sl7a = -sl7a;
    }
    if(l8ax<0){
      sl8a = -sl8a;
    }
    if(l9ax<0){
      sl9a = -sl9a;
    }
    if(l10ax<0){
      sl10a = -sl10a;
    }
    if(l11ax<0){
      sl11a = -sl11a;
    }
    if(l12ax<0){
      sl12a = -sl12a;
    }
    //________________________________________
    if(l1bx<0){
      sl1b = -sl1b;
    }
    if(l2bx<0){
      sl2b = -sl2b;
    }
    if(l3bx<0){
      sl3b = -sl3b;
    }
    if(l4bx<0){
      sl4b = -sl4b;
    }
    if(l5bx<0){
      sl5b = -sl5b;
    }
    if(l6bx<0){
      sl6b = -sl6b;
    }
    if(l7bx<0){
      sl7b = -sl7b;
    }
    if(l8bx<0){
      sl8b = -sl8b;
    }
    if(l9bx<0){
      sl9b = -sl9b;
    }
    if(l10bx<0){
      sl10b = -sl10b;
    }
    if(l11bx<0){
      sl11b = -sl11b;
    }
    if(l12bx<0){
      sl12b = -sl12b;
    }
  }
}

void mousePressed(){
  if (click == 1){
    click = 0;
  }else{
    click = 1;
  }
}

void keyPressed(){
  if (key == 'g'){
    save("Gravity/"+frameCount+".png");
  }
}
  


