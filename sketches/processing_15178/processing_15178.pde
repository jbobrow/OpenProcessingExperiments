
float x,z,w,d,depth,spacing;
float wRan, wLight;
float h[],colR[],colG[],colB[];
int n,res;
PFont font;
float zpos=0;

void setup() {
  size(800,600, P3D);
  font = loadFont("uni.vlw");  
  textFont(font, 12); 
  
  noSmooth();
  n=121;
  depth=400;
  w=44;
  d=44;  
  spacing=10;
  x=spacing;
  z=spacing;
  h=new float[n];  
  colR=new float[n]; 
  colG=new float[n]; 
  colB=new float[n]; 
  res=(int)sqrt(n);
  
  for(int i=0; i<n; i++) {
  h[i]=(int)(random(50,height/2)/10)*10;
  colR[i]=random(200,255);
  colG[i]=random(10,100);
  colB[i]=random(10,100);
  }
  
   // add mouse wheel listener
      addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
          public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
            mouseWheel(evt.getWheelRotation());
        }}); 

}

void draw() {
  pushMatrix();
  
  translate(width/2, height/2+150, -depth/2+zpos);
  lights();
  rotateY(mouseY * 0.005);
  rotateX(mouseX * 0.01);; 

  background(10);  
  
//  scale(1);
   
  for(int k=0; k<res; k++) {
    pushMatrix();
    translate(-(w+spacing)*res/2,0,-(d+spacing)*res/2);
    for(int j=0;j<res; j++) {
      pushMatrix();
      if(k>0) {x=k*(w+spacing);}
      else {
        x=0;
      }
      if(j>0) {z=z+d+spacing;}
      else {
        z=spacing;
      }
      translate(x,-h[k*res+j]/2,z);
      stroke(0);
      
      // draw box
      noFill();
//      fill(255,102,102);        
      fill(colR[k*res+j],colG[k*res+j],colB[k*res+j]);
      box(w,h[k*res+j],d);
      
     // rotate box 90
     for(float o=0; o<4; o++) {   
        rotateY(radians(90));

        // draw windows
        pushMatrix();
          translate(-spacing*2,5,-d/2-1);
          noStroke();
          for(float n=0; n<(h[k*res+j]/10)-1; n++) {
            translate(0,-10,0);
            for(float m=0; m<6; m++) {
              wRan=random(0,100);
              if(wRan>95) {fill(255,255,0);}
              else fill(20);
              rect((5+2)*m,((h[k*res+j]/2))-10,5,6);
            }
          }
        popMatrix();
        }
      
      // draw box no.
//      fill(255);
//      text("No. "+(k*res+j),10,10);
      
      popMatrix();
    }
    popMatrix();
  }
  
    popMatrix();
    fill(255);
      textFont(font, 12); 

//    text("Framerate: "+frameRate,20,20);
//  noLoop();
}

  void mouseWheel(int delta) {
    zpos=zpos-delta*20;
  }

