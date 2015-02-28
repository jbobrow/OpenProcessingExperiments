
class CrossFade extends Fader {
  
  // simple crossfade. Mask is gradually changed from black (first image)
  // to white (second image)
  
  public void animateFade(float percent) {
    alphamask.beginDraw();
    alphamask.fill(255*percent);
    alphamask.stroke(255*percent);
    alphamask.rect(0,0,img1.width,img1.height);
    alphamask.endDraw();
  }
  
}

