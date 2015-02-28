
Star star; 
 
void setup(){ 
  size(800, 600); 
  background(0); 
  smooth(); 
  star = new Star(); 
} 
 
void draw(){ 
  //background(0); 
  fadeToBlack(); 
  star.draw(); 
} 
 
void fadeToBlack(){ 
  // fade away  
  fill(0,0,0, 30); 
  noStroke(); 
  translate(0,0); 
  rect(0,0,width,height);  
} 
 
// ================================================================  
 
class Star 
{ 
  float phase = 0; 
  float r1=0, r2=0; 
  int spikes=0; 
  Point[] points; 
   
  Star(){ 
    setProps(); 
  } 
   
  public void draw(){      
    translate(width/2, height/2); 
    noStroke(); 
    fill(255,255,255, 50); 
     
    phase += .1; 
    calcPoly(); 
    renderPoly(); 
     
    if(frameCount % 60 == 0) setProps(); 
    if(spikes > 100 && (r1-r2) > 50) renderBalls(); 
  } 
   
  private void setProps(){ 
    spikes = int(random(174))+6;
    r1 = random(200)+50;
    r2 = random(150);
    int total = int(spikes*2); 
    points = new Point[ total ]; 
  } 
  
  private void renderBalls(){
    int i=0;
    int plength = points.length;    
    float n = int(random(180));
    float radius = 3;
    
    for(i=0; i<int(n); i++){
      int rpi = int(random(plength-1));
      Point p = points[rpi];
      if(p != null) ellipse(p.x, p.y, radius, radius);
    }
  } 
  
  private void calcPoly(){ 
     Point p; 
     int i=0;
     float n = points.length; 
     float a = 360/n; 
     float cosa, sina; 
      
     for(i=0;i<int(n);i++){ 
       points[i] = new Point(0,0); 
        p = points[i]; 
        cosa = cos((a*i) * PI/180); 
        sina = sin((a*i) * PI/180); 
        if(i%2==0){ 
          if(int(random(20))==2) {
           p.x = (r1+random(50)) * cosa; 
           p.y = (r1+random(50)) * sina; 
          }else{
           p.x = r1 * cosa; 
           p.y = r1 * sina; 
          }
        }else{ 
           p.x = r2 * cosa; 
           p.y = r2 * sina; 
        } 
         
     } 
  } 
   
  private void renderPoly(){ 
     int i=0, n=points.length; 
     Point p1, p2; 
      
     pushMatrix(); 
     beginShape(POLYGON); 
    // rotateY( ry ); 
      
     for(i=0; i<n; i++){ 
       if(i>0){ 
         p1 = points[i-1]; 
         p2 = points[i]; 
         //line( p1.x, p1.y, p2.x, p2.y ); 
         vertex( p1.x, p1.y ); 
         vertex( p2.x, p2.y ); 
         if(i==n-1) { 
           p1 = points[0]; 
           //line( p1.x, p1.y, p2.x, p2.y ); 
         }// end if 
       }// end if 
     }// end for 
      
     endShape(); 
     popMatrix(); 
  } 
} 
 
class Point { 
   public float x, y; 
   Point(float x, float y){ 
     this.x = x; 
     this.y = y;  
   } 
} 


