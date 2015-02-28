
class Bubble
{
  protected PVector position; // when the user has click
  protected long date; // of the clic
  
  // configuration :
  protected int duration=1300; // of the bubble
  protected int maxRadius=100; // of the bubble
  
  // builder :
  Bubble(PVector sPosition,long sDate) { this.position(sPosition); this.date(sDate); }
  
  // setters :
  public void position(PVector set) { this.position=set; }
  public void date(long set) { this.date=set; }
  
  // getters :
  public PVector position() { return this.position; }
  public long date() { return this.date; }
  
  // others :
  public boolean outdated() { return millis()-this.date()>this.duration; }
  public void draw()
  {
    if(!this.outdated())
    {
      int diameter=int(2*map(millis()-this.date(),0,this.duration,3,this.maxRadius));
      int alpha=int(map(millis()-this.date(),0,this.duration,255,0));
      
      stroke(255,alpha);noFill();
      ellipse(this.position.x,this.position.y,diameter,diameter);
    }
  }
}

