
/* Credit: Thomas Ramirez: http://www.openprocessing.org/sketch/64053 */

ArrayList bubbles;
PImage backgroundImage;

void setup(){
  size(800,533);
  smooth();
  bubbles=new ArrayList();
  backgroundImage=loadImage("pondbg.jpg");
}

long lastPongTime=0;
boolean toogleBackground=true;
PVector lastPongPosition=new PVector(0,0);
public void draw()
{
  // background :
  background(0);
  if(toogleBackground)
    image(backgroundImage,0,0,width,height);
  
  // drawing of the homemade cursor :
  noCursor();
  stroke(255);
  strokeWeight(3);
  point(mouseX,mouseY);
  strokeWeight(1);
  
  // drawings of rings or purge array :
  strokeWeight(2);
  for(int i=0;i<bubbles.size();i++)
  {
    Bubble bubble=(Bubble)bubbles.get(i);
    
    if(!bubble.outdated())
      bubble.draw();
    else
      bubbles.remove(i);
  }
  strokeWeight(1);
  
  // click management (like the function mousePressed and mouseDragged)
  if(mousePressed && millis()-lastPongTime>200 && (mouseX!=lastPongPosition.x || mouseY!=lastPongPosition.y || millis()-lastPongTime>350))
  {
    bubbles.add(new Bubble(new PVector(mouseX,mouseY),millis()));
    
    lastPongTime=millis();
    lastPongPosition=new PVector(mouseX,mouseY);
  }
}

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

