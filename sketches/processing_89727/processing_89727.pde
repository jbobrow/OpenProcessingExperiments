
class Shaper{
float s;
float w;
float h;
float spacX;
float spacY; 
RShape grp;
String svgFile;
RShape newGrp;
  
  
 Shaper(float wid, float hei, int sizer,  String svgFile1){
   w = wid;
   h = hei;
   s = sizer;
   svgFile = svgFile1;
    
  
    }
    
   
    
 void transformed() {  
   //xOffset = width/8;
   grp = RG.loadShape(svgFile); 
   float pointSeparation = map(constrain(mouseY/2, 1, height-320), 200, height-100, 1, 1200); 
   
   RG.setPolygonizer( RG.UNIFORMLENGTH );
  RG.setPolygonizerLength( pointSeparation );
  
  
     
  newGrp = RG.polygonize( grp );
newGrp.transform(w, h, s, s); 

   
  pnts = newGrp.getPoints();
  iniPntxsT = new float[pnts.length];
  iniPntysT = new float[pnts.length];
  iniPntxs = new float[pnts.length];
  iniPntys = new float[pnts.length];
  for ( int i = 0; i < pnts.length; i++ )
  {
    iniPntxsT[i] = pnts[i].x;
    iniPntysT[i] = pnts[i].y;
    iniPntxs[i] = iniPntxsT[i]*1.1+random(-5, 5);
    iniPntys[i] = iniPntysT[i]*1.1+random(-5, 5);
  }  


 
  beginShape();
 
 
  for ( int i = 0; i < pnts.length; i++ )
  {
    {
      if(mouseY <= 500){
        
    iniPntxs[i] += (iniPntxsT[i]-iniPntxs[i])/10;
    iniPntys[i] += (iniPntysT[i]-iniPntys[i])/10; 

    }else{
    iniPntxs[i] -= (iniPntxsT[i]-iniPntxs[i])/random(5);
    iniPntys[i] -= (iniPntysT[i]-iniPntys[i])/random(5);      
  
    
    }
    }
    float x0 = pnts[i].x;
    float y0 = pnts[i].y;
    float a = mouseX-x0;
    float b = mouseY-y0;
    float r = sqrt(a*a+b*b);
    float quer_fugir_x = pnts[i].x-(a/r)*400/r*5;
    float quer_fugir_y = pnts[i].y-(b/r)*400/r*5;
    float quer_voltar_x = (iniPntxs[i]-x0)/5;
    float quer_voltar_y = (iniPntys[i]-y0)/5;
    pnts[i].x = quer_fugir_x+quer_voltar_x;
    pnts[i].y = quer_fugir_y+quer_voltar_y;
   curveVertex(pnts[i].x, pnts[i].y);  

  }
   
  endShape();
{
if (nve < ve.size()) {
if (((Point) ve.get(nve)).z != -10.0) {
if (mousePressed) {

    ((Point) ve.get(nve-1)).x += 0;
((Point) ve.get(nve-1)).y += 0;

//line(((Point) ve.get(nve-1)).x, ((Point) ve.get(nve-1)).y, ((Point) ve.get(nve)).x, ((Point) ve.get(nve)).y);

nve++;

}
}
else { 
RCommand.setSegmentLength(1);
RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
nve = 9;

}

}
}
}



class Point { 
float x, y, z; 
Point(float x, float y, float z) { 
this.x = x; 
this.y = y;
this.z = z;
} 

void set(float x, float y, float z) { 
this.x = x; 
this.y = y;
this.z = z;
}
}

}


