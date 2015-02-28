
 void setup()
{
  size(600,800);
  background(0,0);
  frameRate(30);

//  smooth();
  
}
 
int m= 1;
int XPos=0;
int YPos=0;

int XWidth=600;
int YHeight=400;
int Spacing=100;

 
 
 
void draw()

{
blendColor(random(255,255,0),random(0,255,255), DODGE);
 // stroke(0)
 stroke(random(255),random(255),random(255));
   fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos, YPos, XPos, YPos+Spacing, XPos+Spacing, YPos+Spacing);
   fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos, YPos, XPos+Spacing, YPos, XPos+Spacing, YPos+Spacing);
   
   fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos+100, YPos+100, XPos+100, YPos+Spacing+100, XPos+Spacing+100, YPos+Spacing+100);
   fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos+100, YPos+100, XPos+Spacing+100, YPos+100, XPos+Spacing+100, YPos+Spacing+100);
   
   fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos+100, YPos+Spacing, XPos+Spacing+100, YPos+Spacing, XPos+Spacing+100, YPos);
     fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos+100, YPos+Spacing, XPos+100, YPos, XPos+Spacing+100, YPos);
   
     fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos, YPos+Spacing+100, XPos+Spacing, YPos+Spacing+100, XPos+Spacing, YPos+100);
fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos, YPos+Spacing+100, XPos, YPos+100, XPos+Spacing, YPos+100);
  
     fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos, YPos+Spacing+50, XPos+Spacing, YPos+Spacing+50, XPos+Spacing, YPos+50);
fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos, YPos+Spacing+100, XPos, YPos+100, XPos+Spacing, YPos+100);  

   fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos+50, YPos+50, XPos+50, YPos+Spacing+50, XPos+Spacing+50, YPos+Spacing+50);
   fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos+25, YPos+25, XPos+Spacing+25, YPos+25, XPos+Spacing+25, YPos+Spacing+25);


   fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos, YPos-50, XPos, YPos+Spacing-50, XPos+Spacing, YPos+Spacing-50);
   fill(random(255),random(255),random(255),random(0 - 255));
  triangle(XPos-50, YPos-50, XPos+Spacing-50, YPos-50, XPos+Spacing-50, YPos+Spacing-50);


smooth();   
 
  if (XPos>XWidth){
    YPos=YPos+Spacing+100;
    XPos=-200;
   
  }
  
    
 
  XPos=XPos+Spacing+100;
   
  if (YPos>XWidth){
    YPos=0;
    XPos=0;
  }
}
 
   
    

                
                                                                                                                                                                                                                                
