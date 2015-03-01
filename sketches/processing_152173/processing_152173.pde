
int w=256;//width
int h=256;//height
int step=4;//cell size
 
cell[] cells=new cell[w*h];//the cells
  
public void setup(){
size(w,h);
noStroke();
for(int x=0;x<w;x+=step){for(int y=0;y<h;y+=step){
int i=x*h+y; cells[i]=new cell(x,y);}}//create the cells
            background(0);
            fill(255);
           textAlign(CENTER,CENTER);
           text("drag with your mouse",w/2,h/2);
      noLoop(); untouched=true;
}
  
  
 HTMLElement selectedThumbnail=parent.document.body.getElementsByClassName('visThumbnail50 selected')[0].children[0];// get the right HTMLElement
 selectedThumbnail.style.width="50px";
 
public void draw(){       if(untouched){   return;   }
background(0);
for(int x=0;x<w;x+=step){for(int y=0;y<h;y+=step){int i=x*h+y;
cells[i].update();}}//update the cells

selectedThumbnail.src=externals.canvas.toDataURL("image/jpeg",0.7);// take a screenshot from the sketch and place it in the imgElement

}
  
 
 
 
  boolean untouched=true;
 public void mouseDragged() {         
  float vx=mouseX-pmouseX;
  float vy=mouseY-pmouseY;
  addForce(mouseX,mouseY,vx,vy);     }
   
 public void keyPressed() {          setup();      }
 
void addForce(float tx,float ty,float vx,float vy){  if(untouched){loop();      untouched=false;}
 float rad=30;
 rad=constrain((abs(vx)+abs(vy))*3,20,40);
 for(int x=0;x<w;x+=step){for(int y=0;y<h;y+=step){int i=x*h+y;
  float dist=mdist(tx,ty,x,y);
 
  if(dist<rad){
    // float angle=atan2(cells[i].cy)
    int mvx=cells[i].cx-tx;
    int mvy=cells[i].cy-ty;
    cells[i].vx=vx*(dist)+mvx*2;
    cells[i].vy=vy*(dist)+mvy*2;
}}}}
 
 
  
class cell{
  int cx,cy;
  float vx,vy;
cell(int ix,int iy){cx=ix;cy=iy;vx=0;vy=0;}
  
  
  
public void update(){
 
vx*=.35f;vy*=.35f;// fade velocity
if (abs(vx)<.1f)vx=0;// cutoff velocity
if (abs(vy)<.1f)vy=0;// cutoff velocity
if(vx==0&&vy==0){}//donÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â´t update cells without velocity
else{//only update cells with velocity
int plus=0;
  
float velocityAngle=(atan2(vy,vx)* (180.0f / PI)) ;// angle of cell velocity
float  testAngle = (velocityAngle > 0.0 ? velocityAngle : (360.0 + velocityAngle)); // map angle to 360Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â°
if((testAngle>270)||(testAngle<90)){plus=180;}else plus=0;// test direction, fix angle calculation issue by adding 180Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â° to right direction.
  
 velocityAngle+=plus ;// Without "plus" dragging to the right is broken. Test what I am talking about by setting plus to zero. TODO get rid of the test by fixing angle calculation
 velocityAngle = (velocityAngle > 0.0 ? velocityAngle : (360.0 + velocityAngle));// map angle to 360Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â°
 
//     float   speed = sqrt( (vx)*(vx) + (vy)*(vy) );
 
 
     float  combustionX =vx*cos(velocityAngle)*.2f;//for the combustion like effect
     float  combustionY= vy*sin(velocityAngle)*.2f;//for the combustion like effect
      
  
  for(int xi = -step; xi < 2*step; xi+=step)  {    for(int yi = -step; yi < 2*step; yi+=step)    {//get all neighbors of each cell
      if(cx + xi < 0 || cx + xi >= w || cy + yi < 0 || cy + yi >= h)  continue;// dont update out of bounds
      if( xi == 0 && yi == 0)  continue;// dont update middle cell with itself
        
      float neighborAngle=(atan2(yi,xi) * (180.0f / PI))+plus;// angle of middle cell to neighbor
       neighborAngle = (neighborAngle > 0.0 ? neighborAngle : (360.0 + neighborAngle));// map angle to 360Ã�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â°
  
        
      float angleDistance=(360-abs(neighborAngle-velocityAngle))/360;//TODO distance between neighborAngle and velocityAngle
        
       angleDistance=pow(angleDistance,7);// exponential
 
      cell n=cells[(cx+xi)*h+(cy+yi)];//get current neighbor cell
 
      
      
     n.vx+=angleDistance*combustionX;//this actually creates a combustion like effect
     n.vy+=angleDistance*combustionY;//this actually creates a combustion like effect
//  
 
        
        
      n.vx+=angleDistance*vx;// sample velocity to the neighbor depending from angle
      n.vy+=angleDistance*vy;// sample velocity to the neighbor depending from angle
       
      //Borders attemp
      if(cx + xi <= step )n.vx=abs(n.vx);
      if( cx + xi >= w-step )n.vx=-abs(n.vx);
  
      if(cy + yi <= step  )n.vy=abs(n.vy);
      if( cy + yi >= h-step )n.vy=-abs(n.vy);
  }}
  fill(abs(vx)+abs(vy),abs(vy),abs(vx));rect(cx,cy,step,step);
   }
}
}
 
 
 
 
//Multitouch disable for java-mode
float[] pTx= new float[99];float[] pTy= new float[99];
void touchStart(t) {    for (int i = 0; i < t.touches.length; i++) {
     pTx[i]=t.touches[i].offsetX;
     pTy[i]=t.touches[i].offsetY;
     addForce(pTx[i], pTy[i], 0, 0);   }  }
void touchMove(t) {    for (int i = 0; i < t.touches.length; i++) {
float pTvx=pTx[i]-t.touches[i].offsetX;   
float pTvy=pTy[i]-t.touches[i].offsetY;   
     pTx[i]=t.touches[i].offsetX;
     pTy[i]=t.touches[i].offsetY;
     addForce(pTx[i], pTy[i], -pTvx, -pTvy);    }  }
//Multitouch disable for java-mode
 
 
 
 
 
 
 
    float mdist(float x1, float y1, float x2, float y2) { return msqrt(msq(x2-x1) + msq(y2-y1));}float msqrt(float a) { return (float) (Math.sqrt(a));} float msq(float a) { return a*a;}//dist() was not working for me in javascript so I replaced with this
