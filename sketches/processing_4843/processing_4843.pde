






///----------------------------------------------------------------------------------------

class Starfield{
  int numstars = 700; 
  Starellipse[] starellipse =new Starellipse[numstars] ;

  Starfield(int qwe){
    numstars=qwe;
  }
  //-------------------------
  void setfield(){

    for (int i=0; i<numstars; i++) {
      starellipse[i]= new Starellipse(random(0,width),random(0,height));
      println();    
    }

  }
  //-------------------------

  void starfield(int cc, float dd){
    for (int d=0; d<numstars;d++){
      starellipse[d].starmove(cc,dd); 

    }




  }


  ///-----------------------------------------------------------------------------------------      
  class Starellipse{

    float q,y,z,qq,x;


    Starellipse(float xx,float yy  ){
      q=xx; 
      y=yy; 

    }

    ///------------------------------------
    void starmove(int bb,float oo){
      float qq=q-x;
      int ran = round(random(1,2));
      ellipse(qq,y,bb,bb); 
      if (qq<0){
        q=q+width; 
      }
      if (qq>width){
        q=q-width; 
      }

      x=x+oo;
    }
  }


}


//--------------------------------------------------------------------
///-------------------------------------------------------------------


Starfield one;
Starfield two;
Starfield three;
void setup(){
  size (500,400);
  background(0);
  smooth();
  one = new Starfield(500);
  two = new Starfield(500);
  three = new Starfield(500);
  one.setfield();
  two.setfield();
  three.setfield(); 
  noStroke();
}



void draw(){
  background(0);
  fill(196,211,255);
  one.starfield(1,.2);
  fill(110,255,108);
  two.starfield(2,.5);
  fill(255,180,248);
  three.starfield(2,.9);

}















