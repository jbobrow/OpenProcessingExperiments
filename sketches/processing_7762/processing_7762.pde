
//Owaun Scantlebury
//February  21st 2010
// Press 'u' and MouseWheel up to increase the tide level
// Press 'd' and MouseWheel u  to decrease the tide level
// Press 1 for render mode 1 // 3d rotional vertices
// Press 2 for render mode 2 // rotational image
// Press 3 for render mode 3 // full screen
// Press 4 to select image  // select image
// Press 'h' for HSB color
// Press 'r' for RGB color
// Press 'l' to toggle image selection process
// Move the mouse around to change the flow ryhthm

//Email owaunz@gmail.com me if you have been able to get more than 5 fps


//Hint Move the mouse in a figure 8 horizontally for a wave motion
//Hint Move the mouse in a figure 8 vertically for a wave motion

public boolean usepic =true;

public int mode=1  ;
public float riseup=10.0;
public float lowrise = -100.0;
public float toprise = 100;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;

int hf=300,wf=hf,iff; 
float df=0,ef=0,rf=.01,zf,nf; 
int X,Y; 
PImage q,w,e,r,t,y,u; 
PGraphics water2,water,w3,show,panel,framestamp; 
PImage bbg;
import processing.opengl.*;
public PFont font1; 
void setup(){ 


  size(300,300,P3D);
  
   font1 = createFont("arial",12);


  q=loadImage("fish.png");
  w=loadImage("paw.png");
  e=loadImage("bevelm-1.png");
  r=loadImage("457.png");
  t=loadImage("processingmoney.png");
  y=loadImage("bfish.png");
  



  u=new PImage(300,300);
 // smooth();
  lights();
  cam = new PeasyCam  (this,width);

  bbg = new PImage(width,height);
  
  w3 = createGraphics (wf,hf,P3D); 
  w3.beginDraw();
  w3.loadPixels();
  w3.image(loadImage("457.png"),0,0,w3.width,w3.height); // nice
  w3.updatePixels();
  
  water = createGraphics (wf,hf,P3D); 
  water2 = createGraphics (wf,hf,P3D); 
  show= createGraphics (250,250,JAVA2D); 
  panel= createGraphics (width,50,JAVA2D); 
  framestamp= createGraphics (width,50,JAVA2D); 
  loadPixels(); 
  
  
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
    }
  }
  ); 
} 

public float zoomStep = 0.1;

void mouseWheel(int delta) {
 // online = true; // use to test for online use
  if (online){
  if(delta < 0 && keyPressed && key == 'd') {
    riseup -= zoomStep;
    //controlP5.controller("zoom").setValue(zoomFactor);
  }
 // else {
   if(delta < 0 && keyPressed && key == 'u') {
    riseup += zoomStep;
    //controlP5.controller("zoom").setValue(zoomFactor); 
  }
 }
 
 if (!online){
     if(delta > 0) { 
    riseup -= zoomStep; 
    //controlP5.controller("zoom").setValue(zoomFactor); 
  } 
  else { 
    riseup += zoomStep; 
    //controlP5.controller("zoom").setValue(zoomFactor);  
  } 
   
 }
  if (riseup >toprise){
    riseup = toprise; 
  }

  if (toprise <lowrise){
    riseup = lowrise; 
  }
 if (!online) println(riseup);
}


void draw(){
  
   if (!online){
  //int cd = color (v2.pixels[mouseX+width*mouseY])  ;
 // float rr =red(cd);
 // float gg = green (cd);
 // float bb= blue (cd);

  //float brightnessx = brightness (cd);
  this.frame.setTitle("  Tide Level "+str(riseup)   );
  }
 // text("fps: "+frameRate,10,20);
  if ( mode ==1)render1();
  if ( mode ==2)render2();
  if ( mode ==3)render3();
  if ( mode ==4)render4();
  framestamp= createGraphics (width,50,P2D); 
  framestamp.loadPixels();
  framestamp.beginDraw();
//  framestamp.smooth();
  framestamp.textFont(font1, 12);
  
  framestamp.text("fps: "+frameRate,10,20);
  framestamp.text(str(riseup-int(riseup)),200,20);
   framestamp.text("tide level: "+int(riseup) + " point ",100,20);
//  for (int x=0;x<150;x++){
//     for (int y=0;y<25;y++){
//        framestamp.set(x,y,blendColor( color(get(x,y),255),color(framestamp.get(x,y),125),LIGHTEST));
//     }
//  }
  framestamp.endDraw();
  framestamp.updatePixels();
  color l =framestamp.pixels[0];
  for (int x=0;x<width;x++){
     for (int y=0;y<25;y++){
       //if (framestamp.pixels[x+150*25] != framestamp.pixels[0])set (x,y,framestamp.get(x,y));
       // if (framestamp.get(x,y) != l)set (x,y,color(framestamp.get(x,y)));
       set (x,y,framestamp.get(x,y));
       if(x<width-75)set(width-y,25+x,framestamp.get(x,y));
     }
  }
}
public int by;
void render4(){ 
  show.loadPixels();
  panel.loadPixels();
  show.beginDraw();
  panel.beginDraw();
  by=0;
  for (int i =1;i<=6;i++){
    if(i==1) arraycopy(q.pixels,u.pixels);
    if(i==2) arraycopy(w.pixels,u.pixels);
    if(i==3) arraycopy(e.pixels,u.pixels);
    if(i==4) arraycopy(r.pixels,u.pixels);
    if(i==5) arraycopy(t.pixels,u.pixels);
    if(i==6) arraycopy(y.pixels,u.pixels);

   
    if (mouseX<by+50 && mouseX > by ){
      if (mousePressed && usepic==true){
        arraycopy(u.pixels,w3.pixels);

      }

      u.resize(300-50,300-50);
      for (int x =0;x<250;x++){      
        for (int y =0;y<250;y++){
          set(x+25,y,u.get(x,y));
          //         noStroke();
          //        fill(u.get(x,y),124);
          //         //rectmode
          //        rect(x,y,2,2);
          // set(x+25,y,show.get(x,y));
        }       
      }

      u.filter(INVERT); 

    }

    u.resize(50,50);


    for (int x =by;x<by+50;x++){
      int yy=0;
      for (int y =height-50;y<height;y++){

     
        set(x,y,u.get(x-by,yy));
        yy++;
      }
    }


    
    by+=50;



    u=new PImage(300,300);



  }
 //;
}
void render3(){ 
  translate(width/2,-height/2);
  rotate(radians(90));
 
 
  background(0); 
  

  df-=(mouseY-hf/2f)/hf/2f;//137 
  ef+=(mouseX-wf/2f)/wf/2f;//120 
  water2.beginDraw();
  water2.loadPixels(); 
  water.beginDraw();
  water.loadPixels(); 
  makebg(true,false);
  bbg.blend(w3,0,0,bbg.width,bbg.height,0,0,bbg.width,bbg.height,SOFT_LIGHT);

  for(iff=0;iff<wf*wf;iff++){ 

    int _x = (int)iff/width;
    int _y = iff-(_x*width);
    zf=iff%wf; // use  '/' for horizontal or '%' for vertical  
    X=int(iff%wf/zf*hf); 
    Y=int(hf/2+noise(iff%wf*rf+ef,iff*rf/wf+df)*99/zf*hf); 

    color c=Y+(get(X,Y)>>8&iff); 

   
    //       //water.pixels[iff]=color(c-mouseY,c-mouseX,c*iff)+bbg.pixels[iff];  
    //      // water.pixels[iff]=color(c-mouseY,c-mouseX,c*iff)+bbg.get(X,Y);  
    water.pixels[iff]=blendColor(color(c-mouseY,c-mouseX,c*iff),bbg.pixels[iff],SUBTRACT);  
    //  water.pixels[iff]=bbg.pixels[iff];
    
  } 

   
  water2.updatePixels(); 
  water.pixels = water2.pixels; 

  water.updatePixels(); 
  
  arraycopy(water2.pixels,pixels); 
  

}



void render2(){ 
  translate(width/2,-height/2);
  rotate(radians(90));
 
  background(0); 
  

  df-=(mouseY-hf/2f)/hf/2f;//137 
  ef+=(mouseX-wf/2f)/wf/2f;//120 
  water2.beginDraw();
  water2.loadPixels(); 
  water.beginDraw();
  water.loadPixels(); 
  makebg(true,false);
  bbg.blend(w3,0,0,bbg.width,bbg.height,0,0,bbg.width,bbg.height,SOFT_LIGHT);

  for(iff=0;iff<wf*wf;iff++){ 

    int _x = (int)iff/width;
    int _y = iff-(_x*width);
    zf=iff%wf; // use  '/' for horizontal or '%' for vertical  
   X=int(iff%wf/zf*hf); 
   
    Y=int(hf/2+noise(iff%wf*rf+ef,iff*rf/wf+df)*99/zf*hf); 
 //Y=int(hf%2+noise(iff/wf*rf+ef,iff*rf/wf+df)*99/zf*hf); 
    color c=Y+(get(X,Y)>>8&iff); 

   
   
    //       //water.pixels[iff]=color(c-mouseY,c-mouseX,c*iff)+bbg.pixels[iff];  
    //      // water.pixels[iff]=color(c-mouseY,c-mouseX,c*iff)+bbg.get(X,Y);  
    water.pixels[iff]=blendColor(color(c-mouseY,c-mouseX,c*iff),bbg.pixels[iff],SUBTRACT);  
    //  water.pixels[iff]=bbg.pixels[iff];
    
  } 

  
  water2.updatePixels(); 
  water.pixels = water2.pixels; 

  water.updatePixels(); 
  
  image(water2,0,0); 
 

} 

void render1(){ 
  translate(width/2,-height/2);
  rotate(radians(90));
  rotateY(radians(-45)); 
  translate(0,0,-200);
  background(0); 
  

  df-=(mouseY-hf/2f)/hf/2f;//137 
  ef+=(mouseX-wf/2f)/wf/2f;//120 
  water2.loadPixels(); 
  water2.beginDraw(); 
  water.loadPixels(); 
  water.beginDraw(); 

  makebg(true,false);
  bbg.blend(w3,0,0,bbg.width,bbg.height,0,0,bbg.width,bbg.height,SOFT_LIGHT);

  for(iff=0;iff<wf*wf;iff++){ 

    int _y = (int)iff/width;
    int _x = iff-(_y*width);
    zf=iff%wf; // use  '/' for horizontal or '%' for vertical  
    X=int(iff%wf/zf*hf); 
    Y=int(hf/2+noise(iff%wf*rf+ef,iff*rf/wf+df)*99/zf*hf); 
  //Y=int(hf/2+iff%wf*rf+ef-iff*rf/wf+df*99/zf*hf);
 // Y=X;
    color c=Y+(get(X,Y)>>8&iff); 

       
    //      //image(bbg,0,0);
    //       //water.pixels[iff]=color(c-mouseY,c-mouseX,c*iff)+bbg.pixels[iff];  
    //      // water.pixels[iff]=color(c-mouseY,c-mouseX,c*iff)+bbg.get(X,Y);  
    water.pixels[iff]=blendColor(color(c-mouseY,c-mouseX,c*iff),bbg.pixels[iff],SUBTRACT);  
    //  water.pixels[iff]=bbg.pixels[iff];
    

    // water.set(X,Y,color(c-mouseY,c-mouseX,c*iff)); 
    color v  =color(c-mouseY,c-mouseX,c*iff);
    noStroke ();
    beginShape(QUADS);// POLYGON //256  ( int)
    fill ( blendColor(v,bbg.get(_x,_y),SOFT_LIGHT ),255 );
    //  fill (w3.get(_x,_y),125 );
    //                vertex(j, i, (255 - values[( int)j][( int)i]) / 20);
    //                vertex(j - 1.5, i, (255 - values[( int)j - 1][( int)i]) / 20);
    //                vertex(j - 1.5, i - 1.5, (255 - values[( int)j - 1][( int)i - 1]) / 20);
    //                vertex(j, i - 1.5, (255 - values[( int)j][( int)i - 1]) / 20);

    //                  vertex(X, Y, (255 - brightness ( water.get  ( X,Y  ) )  ) / 20);
    //                vertex(X - 1.5, Y, (255 - brightness ( water.get  ( X-1,Y  ) )  ) / 20);
    //                vertex(X - 1.5, Y - 1.5, (255 - brightness ( water.get  ( X-1,Y-1  ) ) ) / 20);
    //                vertex(X, Y - 1.5, (255 - brightness ( water.get  ( X,Y -1 ) ) ) / 20);

    //                vertex(_x, _y, (255 - brightness ( water.get  ( X,Y  ) )  ) / 20);
    //                vertex(_x - 1, _y, (255 - brightness ( water.get  ( X-1,Y  ) )  ) / 20);
    //                vertex(_x - 1, _y - 1, (255 - brightness ( water.get  ( X-1,Y-1  ) ) ) / 20);
    //                vertex(_x, _y - 1, (255 - brightness ( water.get  ( X,Y -1 ) ) ) / 20);

    vertex(_x, _y, (255 - brightness (water.get  ( _x,_y  ) )  ) / riseup);
    vertex(_x - 1, _y, (255 - brightness ( water.get  ( _x-1,_y  ) )  ) / riseup);
    vertex(_x - 1, _y - 1, (255 - brightness ( water.get  ( _x-1,_y-1  ) ) ) / riseup);
    vertex(_x, _y - 1, (255 - brightness ( water.get  ( _x,_y -1 ) ) ) / riseup);     

    endShape();

    // } 
  } 

 
  water2.updatePixels(); 
  water.pixels = water2.pixels; 
  water.updatePixels(); 
 

} 


void keyPressed(){ 
  if (key =='h'){ 
    colorMode(HSB,350);   
  } 



  if (key == 'r'){ 
    colorMode(RGB,350);  
  } 

  if (key =='1')mode=1;
  if (key =='2')mode=2;
  if (key =='3')mode=3;
  if (key =='4')mode=4;
  if (key =='l')usepic=!usepic;
  if (!online)save("3dStorm.png");
} 

int cpass=0;
void makebg(Boolean animate, Boolean invert){

  water.loadPixels();
  color colx = 0;
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      int pos=y*width+x;
      color col = water.pixels[pos] ;//
      colx = color(height-y,x,y-x); 
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


