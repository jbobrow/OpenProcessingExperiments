


//Owaun Scantlebury
//March 28th 2010
//Coral Shape Explorer


import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
public boolean piclock= true;
PImage v3,glossover,v2;
public boolean wrapper =false;
public boolean encapsulate=true;
public int w=300;//300;
public int h=300;//300;
public int cubsize = 2;
public color [] A,B,C,D;
public color n;
public boolean firstrun =true;
public boolean dosave =false;
public int ii=1;
void setup(){
 size (300,300,P3D); 
//size(300,300,"hipstersinc.P5Sunflow");
if (ii>17){
 ii=1; 
}
  loadPixels();

  A=pixels;
  frameRate(3000);
  n = A[0];

  if (firstrun){
    cam = new PeasyCam (this,width);
  }
  //w =300; //310;//296  // Toggle these values to create a number of shapes
  // h=  300; // 310; //296 // Toggle these values to create a number of shapes
  C= new color[w*h];
if (!piclock) ii++;
  v3 = loadImage(ii+".png"); 
  D=v3.pixels;
  glossover = loadImage(ii+".png"); 

  v2=new PImage(width,height);
  for (int x=0;x<width;x++){
    for (int y=0;y<height;y++){
      v2.set(x,y,color(height-y,x,x-y));

    } 
  }
  B=v2.pixels;


  v3.resize(w,h);
  v2.resize(w,h);
  v2.resize(width,height);
  v3.resize(width,height); 
 // arraycopy(glossover.pixels,B);
  lights();

}

void resizepics(){
  v3.resize(w,h);
  v2.resize(w,h);
  v2.resize(width,height);
  v3.resize(width,height);  
}

void draw(){

//scale(2);
  translate(-width/2*1,-height/2*1,-200); 

  background(30,144,255); //1 green
  for (float y = 0;y<height;y+=cubsize){
    translate(0,y);

    for (float x = 0;x<width;x+=cubsize){
      int _x =(int)x;
      int _y= int(y);

      int pos = _x +width *_y;
     // float br = brightness(D[pos]);
   //   float br = brightness(D[pos]);
      translate(x,0,-10);
      float _a = brightness(v3.pixels[pos]);
      float _b = brightness(v3.get(_x-cubsize,_y));
      float _c = brightness(v3.get(_x-cubsize,_y-cubsize));
      float _d = brightness(v3.get(_x,_y-cubsize));

if (wrapper){
  
  if((_x==0 ||_x==width-1 )){
  _a = 0;
  _b = 0;
  _c=0;
  _d=0;
}
 if((_y==0 ||_y>=height-1 )){
  _a = 0;
  _b = 0;
  _c=0;
  _d=0;
}




// 
 //  _a = (brightness(v3.pixels[pos]) + brightness(v3.pixels[pos+1]))/2;
 //  _b = (brightness(v3.pixels[_x-1+width*y]) + brightness(v3.pixels[_x-1+width*(y+1)]))/2;
   
   
   
 //}
  
}



      fill(B[_x+width*_y]);
      //   translate(x,y,br);
      noStroke();
      if (encapsulate){
        beginShape(QUADS);
        vertex(0,0,_a);
        vertex(0-cubsize,0,_b);
        vertex(0-cubsize,0-cubsize,_c);
        vertex(0,0-cubsize,_d);
        endShape(CLOSE);
      }

      beginShape(QUADS);
      vertex(0,0,0-_a);
      vertex(0-cubsize,0,0-_b);
      vertex(0-cubsize,0-cubsize,0-_c);
      vertex(0,0-cubsize,0-_d);
                
      endShape(CLOSE); 


    
      translate(-x,0,10);    

    }

    translate(0,-y);
  }
  yy++;
  if(dosave && !online)save("pic"+str(yy)+".png");
  firstrun = false;
//  if(ii<16){
//  ii++;
//    setup();
//  
//  }
//  else
//  {
//    exit();
//  }
  
}
public int yy;
void keyPressed(){
  if (key=='s')smooth();
  if (key=='r')resizepics();
  if (key=='D'){
    w--;
    h--;
    setup();
  }

  if (key=='U'){

    w++;
    h++;
    setup();
  }

  if (key=='d'){
    w-=1;
    h+=1;
    setup();
  }

  if (key=='u'){
    w+=1;
    h-=1;
    setup();
  }

  if (key=='d'){
     if (h<w+1){
    w-=1;
    h+=1;
     
    setup();
     }
  }

  if (keyCode==LEFT){
    w-=1;
    //h-=1;
    setup();
  }
  if (keyCode==RIGHT){
    w+=1;
    //h-=1;
    setup();
  }

  if (keyCode==DOWN){
    h-=1;
    //h-=1;
    setup();
  }
  if (keyCode==UP){
    if (h<w+1){
    h+=1;
    //h-=1;
    setup();
    }
  }
  
  if (key =='R'){
   w= 300;
  h=300;
  setup();
  
  }
if(key=='e')encapsulate=!encapsulate;
if(key=='w')wrapper =!wrapper;
if (!online && key =='p')save("ipad.png");
  if (key=='S')noSmooth();
  if (key =='i')image(v2,0,0);
  if (key =='I')image(v3,0,0);
  if (key=='l')piclock=!piclock;
}






