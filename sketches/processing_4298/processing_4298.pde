
//---------------------------------------------------
// some new usefull primitive
//cylinder(  base, top , radius, resolution)

  public void cylinder( int base, int top, float w, int res )
  {
    float inc = TWO_PI / res;
    beginShape( QUADS );
    for( float i = 0; i < TWO_PI; i += inc )
    {
      float cw=cos(i)*w,sw=sin(i)*w,cw1=cos(i+inc)*w,sw1=sin(i+inc)*w;
      if(dummy%2==0){ fill(180,192,192);}else{fill(120,128,128);}
      if ((i%(inc*6)==0)&(dummy%3==0)) fill(255,255,0); // fenêtres
      vertex( cw, sw, base);
      vertex( cw1, sw1, base );
      vertex( cw1, sw1, top );
      vertex( cw, sw, top );  
    }
    endShape();
  }



