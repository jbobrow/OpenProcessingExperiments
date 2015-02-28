
int count;
color current;
bloop[] bloops = new bloop[80]; 

void setup(){
  size(200,200);
  background(0);
  colorMode(HSB,100);
  count = 0;
  for(int i = 0; i < 80; i++){
      bloops[i] = new bloop(int(random(10,100)),random(0,width), random(0,height), color(random(0,100),random(0,100),random(0,100),0),color(random(0,100),random(0,100),random(0,100)));
  }
}

void draw(){
  fill(0,0,0,50);
  rect(0,0,width,height);
  for(bloop a :bloops){
    a.draw();
  }
 }


class bloop{
  private float x, y;
  private color col, alph;
  private boolean in;
  private int rad, frame;
  
  public bloop(int rad, float x, float y, color col, color alph){
    this.in = false;
    this.frame = 1;
    this.rad = rad;
    this.x = x;
    this.y = y;
    this.col = col;
    this.alph = alph;
  }
  
  public void erase(){
    fill(0,0,0);
    ellipse(this.x, this.y, this.rad, this.rad);
  }
  
  public void draw(){
    for(float i = 0; i < this.rad; i++){
      if( i < this.frame){
      current = lerpColor(this.col, this.alph, i/this.rad);
      }
      else{
        current = lerpColor(this.alph, this.col, i/this.rad);
      }
      noFill();
      stroke(current);
      ellipse(x,y,i,i);
    }
    if(this.in){
      this.frame--;
    }
    else{
      this.frame++;
    }
    if(this.frame==this.rad || this.frame==0){
        this.in = !this.in;
    }  
   }
}
