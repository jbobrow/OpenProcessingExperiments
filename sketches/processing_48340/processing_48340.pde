
// ----------------------- Actor class hlper

void InitActors() {
  for ( int i=0; i<ACTOR_NUM; i++ ) {
    actors[i] = new Actor();
    actors[i].index_ = i;
    //    if ( i<1 ) actors[i].Create();
  }
}
void  ResetActors() {
  for ( int i=0; i<ACTOR_NUM; i++ ) {
    actors[i].Kill();
    //    if ( i<1 ) Actors[i].Create();
  }
}


void CreateActor( int x,int y,int type ) {
  for ( int i=0; i<ACTOR_NUM; i++ ) {
    if ( !actors[i].IsExist() ) {
      actors[i].Create(x,y,type);
      break;
    }
  }
}

void GrowActor( int type ) {
  float x=200,y=200;
  for ( int i=0; i<ACTOR_NUM; i++ ) {
    if ( !actors[i].IsExist() ) {
      actors[i].Create(x,y,type);
      break;
    }
    else{
      x = actors[i].x_;
      y = actors[i].y_;
    }
  }
}


// ------------------------ Actor class

class Actor {
  boolean fExist_;
  float x_;
  float y_;
  float xs_;
  float ys_;

  int type_;

  int index_;

  Actor() {
    fExist_=false;
  }

  void Create( float x,float y,int type) {
    x_=x;
    y_=y;
    type_=type;

    xs_=ys_=0;
    xs_=random(2)-1;
    ys_=random(2)-1;
    xs_*=0.1;
    ys_*=0.1;
    fExist_=true;
    //    SetGoal();
  }
  void Create() {
    Create( random(width),random(height),0 );
  }
  void SetGoal() {
    float x = random(width);
    float y = random(height);
    float d = dist(x,y,x_,y_);
    xs_ = (x-x_)*10/d;
    ys_ = (y-y_)*10/d;
  }

  boolean IsExist() { 
    return fExist_; 
  }

  void Action() {
    x_+=xs_;
    y_+=ys_;
    xs_*=.9;
    ys_*=.9;


    for ( int i=0; i<ITEM_NUM; i++ ) {
      if ( items[i].IsExist() ) {
        float tx = items[i].x_;
        float ty = items[i].y_;
        //       if ( tx==x_ && ty==y_ ) x_+=random(5);

        float d1 = dist(x_,y_,tx,ty);
        float dmax = 10;        
  
        if ( d1<dmax ) {
          
        }
      }
    }
    if ( x_<0 ) { 
      x_=0; 
      xs_=abs(xs_)/2; 
    }
    if ( x_>width ) { 
      x_=width; 
      xs_=-abs(xs_)/2; 
    }
    if ( y_<0 ) { 
      y_=0; 
      ys_=abs(ys_)/2; 
    }
    if ( y_>height-10 ) { 
      y_=height-10; 
      ys_=-abs(ys_)/2; 
    }

    noStroke();
    colorMode(HSB, 100);

   if ( type_==0 ) {
      fill(index_*5,50,100);
    }
    else{
      fill(75,120,255);
    }
    ellipse( x_,y_,10,10);
  }

  void Kill() { 
    fExist_=false; 
  }
};




