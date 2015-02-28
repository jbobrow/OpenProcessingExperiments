
//import processing.opengl.*;

import guicomponents.*;
GLabel lblSegs, lblRad, lblPts, lblLRad;


PVector vertices[][];
float k=1;
int pts;
float angle = 0;
float radius = 1;




GWSlider sdrSegs, sdrRad, sdr3, sdr4, sdr5, sdr6, sdr7;

void setup() {
  size(1280,800,P3D);
  frameRate(60);
  // Sets the colour scheme for the GUI components 
  // Schemes available are 
  // BLUE_SCHEME, GREEN_SCHEME, RED_SCHEME, GREY_SCHEME
  // YELLOW_SCHEME, CYAN_SCHEME, PURPLE_SCHEME

  GComponent.globalColor = GCScheme.getColor(this,  GCScheme.GREY_SCHEME);
  GComponent.globalFont = GFont.getFont(this, "Verdana", 11);
GPanel p;
lblSegs = new GLabel(this, "Polygon", 2, 24, 120);  
lblRad = new GLabel(this, " Radius", 2, 64, 120);

  p = new GPanel(this, "Polygon Panel", 20, 20, 460, 100);
  p.setAlpha(80);
  
  sdrSegs = new GWSlider(this, "purple18px", 110, 20, 325);
  
  sdrSegs.setLimits(0, 3, 20);
  sdrSegs.setValueType(GWSlider.INTEGER);
 // sdrSegs.setRenderMaxMinLabel(false); //hides labels
 
 sdrRad = new GWSlider(this,"purple18px", 110, 66, 325);
  sdrRad.setLimits(0,0,500); 
 sdrRad.setValueType(GWSlider.DECIMAL); 
  //sdrRad.setRenderMaxMinLabel(false); //hides labels
  //sdrRad.setRenderValueLabel(false); //hides labels
    
p.add(lblSegs);
p.add(sdrSegs);
p.add(lblRad);
p.add(sdrRad);
  
 
  

}
void handleSliderEvents(GSlider slider) {
  
  if(slider == sdrSegs)
    pts=sdrSegs.getValue();
    else
  if(slider == sdrRad)
   radius=sdrRad.getValue();;

  
}

void draw() {
//  noLoop();
  pushMatrix();
  background(255);
  //lights();
   if(pts < 100)
 { float m = map(k, 1,1000,0,255);
 // fill(255,255-k,k+255,50);
 fill(#33CCCC, 1);
translate(width/2, height/2);
//rotate(radians (k));
//translate(width/5, height/5);
//rotate(radians (k));
vertices = new PVector[2][pts];// intialization


    
     for(int i=0;i<2;i++)  
     {
    for(int j = 0; j <pts; j++)
    {
    vertices[i][j] = new PVector();
    
     vertices[i][j].x = cos(radians(angle)) * radius*k;
          vertices[i][j].y = sin(radians(angle)) * radius*k;
          angle += 360.0/pts;

    }
    }
    smooth();
  
beginShape();
         
     for(int i=0;i<2;i++)
     { 
    for(int j=0;j<pts;j++)
    
    {
      vertex( vertices[i][j].x ,vertices[i][j].y );
   
       }
     }
endShape();
popMatrix();
//k=k+10;
//pts=pts+1;
delay(500);
 }
  
  
  
}



