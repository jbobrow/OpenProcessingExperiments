
public class Arrow {
  private Vector mBallpos = mBall.pos;
  private Vector center = new Vector();
  private Vector radius = new Vector(); 
  
 // public Arrow(float x, float y){
   // start.set(x, y);
  //} 
 
  public void draw(){
    if(mBall.state == STATE_SHOT) return;
    center.set(mouseX, display_height-mBallpos.y);
    radius.set((2*mBallpos.x)-(2*mouseX), (2*(display_height-mBallpos.y))-(2*mouseY));
    
    strokeWeight(2);
    stroke(50);
    noFill();
    arc(center.x, center.y, radius.x, radius.y, TWO_PI-PI/2, TWO_PI);
    ellipse(mouseX, mouseY, mBall_size/2, mBall_size/2);
  }
  
  
}




