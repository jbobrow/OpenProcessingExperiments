
//Programmed by Owaun Scantlebury
//

public boolean firststart = false; 
public boolean mirror = true;
public boolean pause = false; 
public int beforemode=0;
public int rmode = 4;
public int w = 300; 
public int h = 300; 
public color []ar,br,cr;
PImage a,b,c,d,src,src2; 

public int rr;
public color n;
void setup(){
  size(w,h,P2D);
  loadPixels();
  n = pixels[0];
  ar = new color[w*h];
  br = new color[w*h];
  cr = new color[w*h];

  //only required for when  rmode = '4'
  a= new PImage(w,h); 
  b = new PImage(w,h); 
  c = new PImage(w,h); 
  d = new PImage(w,h); 
  src = new PImage(w,h); 
  //loadPixels(); 
  src.loadPixels();


}
void draw(){
  if (rmode==1){
    int xx;
    if (firststart){ 

      if (rmode==1){

        arraycopy(pixels,ar); 
      }

      firststart = false; 
    } 
    else 
    { 


      if (rmode==1){


        arraycopy(pixels,ar); 
      }

      arraycopy(ar,br);



      for (int x=0;x<width*height;x++){

        br[x]=br[x]*-1;  //INVERT the array - does not work without this
      } 

      int _xxx = mouseX;
      int _yyy= mouseY;
      for (int z=0;z<br.length-(_xxx+(width*_yyy));z++){
        int _x=(int)z/width;
        int _y=z-(_x*width);
        int _xx = mouseX+_x;
        int _yy = mouseY+_y;     
        brget(_xx,_yy);
        set(_x,_y,ff);
      }
      xx=0;
    }


  }

  if (rmode ==2){
    int xx;
    if (firststart){ 

      if (rmode==2){

        arraycopy(pixels,ar); 
      }

      firststart = false; 
    } 
    else 
    { 


      if (rmode==2){


        arraycopy(pixels,ar); 
      }

      arraycopy(ar,br);



      for (int x=0;x<width*height;x++){

        br[x]=br[x]*-1;  //INVERT the array - does not work without this
      } 

      int _xxx = mouseX;
      int _yyy= mouseY;
      for (int z=0;z<br.length-(_xxx+(width*_yyy));z++){
        int _x=(int)z/width;
        int _y=z-(_x*width);
        int _xx = mouseX+_x;
        int _yy = mouseY+_y;     
        brget(_xx,_yy);
        set(_y,_x,ff);
      }
      xx=0;
    }

  }


  if (rmode==3){
    if (firststart){ 
      arraycopy(cr,ar); 

      firststart = false; 
    } 
    else 
    { 

      arraycopy(cr,ar); 

      arraycopy(ar,br); 
      for (int x=0;x<width*height;x++){

        br[x]=br[x]*-1;  //INVERT the array - does not work without this
      } 
      //b.filter(INVERT); 

      // image(b,mouseX,mouseY);   

      int _xxx = mouseX;
      int _yyy= mouseY;
      for (int z=0;z<br.length-(_xxx+(width*_yyy));z++){
        int _x=(int)z/width;
        int _y=z-(_x*width);
        int _xx = mouseX+_x;
        int _yy = mouseY+_y;     
        brget(_xx,_yy);
        set(_y,_x,ff);
      }


    }

    arraycopy(pixels,cr);



  }



  if (rmode==4){
    if (firststart){ 
      arraycopy(src.pixels,a.pixels); 

      firststart = false; 
    } 
    else 
    { 

      arraycopy(src.pixels,a.pixels); 

      arraycopy(a.pixels,b.pixels); 

      b.filter(INVERT); 

      image(b,mouseX,mouseY);   
    }

    arraycopy(pixels,src.pixels);
  }


  if (mirror) flowermirror();
}

public color ff;
void brget(int x,int y){
  if ((y+width*x) < br.length){
    ff = br[y+width*x];
  }
}


void flowermirror(){

  for (int x=0;x<=width;x++){
    for (int y=0;y<height;y++){

      set(x,y,get(x,y));
      set(width-x,y,get(x,y));
      set(y,width-x,get(x,y));
      set(y,x,get(x,y));

    } 
  } 
}

void keyPressed(){
  if (key=='S' || key =='s' && !online){
    rr++;
    save("sift-"+str(rr)+".png");

  } 

  if (key=='m' ||key =='M'){
    mirror = !mirror;
  }  
  if (key=='c'){
    background(n); 
  }

  if (key=='0' || key =='p'){

    pause=!pause;
    if (pause)
    {  
      beforemode = rmode;
      rmode =0;
    } 
    if (!pause) rmode= beforemode;
  }
  if (key=='1'){
    background(n); 
    rmode =1;
    beforemode = rmode;
  }
  if (key=='2')
  {
    background(n); 
    rmode =2;
    beforemode = rmode;
  }

  if (key=='3')
  {
    //frameRate(10);
    background(n); 
    rmode =3;
    beforemode = rmode;
  }

  if (key=='4')
  {
    //frameRate(10);
    background(n); 
    rmode =4;
    beforemode = rmode;
  }

}







