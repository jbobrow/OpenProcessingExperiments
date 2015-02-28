
class bubble {
  
  public float lon,lat;
  private int sz;
  private int when; // UTC
  
  public bubble(float _lon,float _lat,int _when) {
    lon=round(_lon);
    lat=round(_lat);
    when=_when;
    sz=32; // initial size
  }
  
  public void draw() {
    //glitch in image means GMT is at 340, not 360 as expected...?
    ellipse(340.0+(2*lon),180-(2*lat),sz,sz);
    if (this.sz>1) this.sz= this.sz-1;
  }
  
  
}

