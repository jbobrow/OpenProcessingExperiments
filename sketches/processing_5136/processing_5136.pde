
class Rockfield {
  int numrocks=20;
  Rockellipse[] rockellipse=new  Rockellipse[numrocks];

  Rockfield(){
  }

  void setrocks(){
    for (int i=0; i <numrocks; i++){
      rockellipse[i]= new Rockellipse ();
    }
  }
  void  rockfield_MATH(){
    for (int d=0; d<numrocks;d++){
      rockellipse[d].rock_MATH(world.r2,world.speed);
    }
  }

  void rockfield_RENDER(){
    for (int d=0; d<numrocks;d++){
      rockellipse[d].rock_RENDER();//// this is render rockellipse now
    }

  }


  class Rockellipse{
    // boolean hit=false;
    boolean  blownup=false;
    float y_locTwo=-2; /// y location of astroid
    float x_locTwo=-2; /// x location of astroid
    int r2;//radius of astroids
    Rockellipse(){
    }
    ///------------------------------------

    void rock_MATH(int r2,float speed){
      this.r2=r2;
      if (x_locTwo==-2){
        x_locTwo=random(width,width+width); 
      }

      /////////////////////// asteroid destroyed /////////////////////////      moved over to collision class  ( not working any way )

      //  float missle_distance= dist(missle.missle_X,missle.missle_Y,x_locTwo,y_locTwo);
      //  if (missle_distance<missle.missle_radius+r2){
      //    destroyed=true;
      //  }
      /////////////////////////////////////////////////////////////////////

      x_locTwo-=speed;

      if (y_locTwo==-2){
        y_locTwo=random(0,height); 
      }
      if (x_locTwo<0){
        x_locTwo+=width; 
        y_locTwo=random(0,height);
      }   
    }


    void rock_RENDER(){
      noFill();
      // ellipse(x_locTwo,y_locTwo,r2,r2);  
      imageMode(CENTER);
      if (!blownup){ 
        image(rock_IMAGE,x_locTwo,y_locTwo);
      }
    }

  }
}

