
class Scanner{
  private color c;
  private float wid;
  private float hei;
  private float prog;
  private int start;
  private int duration;
  private float range;
  
  Scanner(float r){
    this.c = color(100,150,200);
    this.wid = 100;
    this.hei = 100;
    this.start = millis();
    this.duration = 5000;
    this.range = r;
  }
  
  public void show(){
    pushMatrix();
    pushStyle();
    fill(102,153,204,255);
    translate(width/2,height/2,0);
    rect(0,0,this.wid,this.hei);
    //rotateY(radians(60));
    popStyle();
    popMatrix();
  }
  
  public void scan(){
    prog = range * (millis() - start) / this.duration;
    //println("prog:" + prog + "now:" + millis() + " start:" + start);
    if(prog > this.range){
      prog = 0;
      //println("lalala");
      this.start = millis();
    }
    pushMatrix();
    pushStyle();
    fill(102,153,204);
    translate(width/2,height/2,-prog);
    rect(0,0,this.wid,this.hei);
    popStyle();
    popMatrix(); 
  }
  
}

