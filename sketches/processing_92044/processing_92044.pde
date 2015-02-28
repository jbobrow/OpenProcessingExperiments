
void setup(){
  size (200,200);
        background (150);
}
 int x=-100;
void draw () {
 

    smooth ();
    strokeWeight (3);
    point (x+100, (x*x/100)+100);
    point ((x*x/100) +100, x+100);
    
    point (-x+100, -(x*x/100)+100);
    point (-(x*x/100)+100, -x+100);
    
    point ((x*x/100)+100, x+100);
    point (x+100, (x*x/100)+100);
    
    point (-(x*x/100)+100, -x+100);
    point (-x+100, -(x*x/100)+100);
    x=(x+5); 
    if(x>200) {
      background (150);
      x=-100;
    }
  }
