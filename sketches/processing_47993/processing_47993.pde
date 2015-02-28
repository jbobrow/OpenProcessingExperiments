
public class carthesianAxisPlot{
 
 protected float[] lowerBounds;
 protected float[] upperBounds;
 protected int[] tickmarks;
 protected int dimension;
 protected int tickmarkFontSize;
 protected int axisLabelFontSize;
 protected PFont tickmarkFont;
 protected PFont axisLabelFont;
 protected float scalingFactor;
 public carthesianAxisPlot(){
  lowerBounds=null;
  upperBounds=null;
  tickmarks=null;
  dimension=-1;
  scalingFactor=0;
 }
 public carthesianAxisPlot(int dimension){
  this.dimension=dimension;
  lowerBounds=new float[dimension];
  upperBounds=new float[dimension];
  tickmarks=new int[dimension];
  scalingFactor=1;
  
 }
 public carthesianAxisPlot(int dimension, float[] bounds){
  this.dimension=dimension;
  lowerBounds=new float[dimension];
  upperBounds=new float[dimension];
  tickmarks=new int[dimension];
  if(bounds.length==2*dimension){
   for(int i=0;i<dimension;i++){
    lowerBounds[i]=bounds[i];
   }
   for(int j=0;j<dimension;j++){
    upperBounds[j]=bounds[dimension+j];
   }
  }else if(bounds.length==dimension){
   for(int i=0;i<dimension;i++){
    lowerBounds[i]=-bounds[i]/2;
    upperBounds[i]=bounds[i]/2;
   }
  }
  scalingFactor=1;
 }
 public carthesianAxisPlot(int dimension, float[] bounds,int[] tickmarks){
  this.dimension=dimension;
  lowerBounds=new float[dimension];
  upperBounds=new float[dimension];
  this.tickmarks=tickmarks;
  if(bounds.length==2*dimension){
   for(int i=0;i<dimension;i++){
    lowerBounds[i]=bounds[i];
   }
   for(int j=0;j<dimension;j++){
    upperBounds[j]=bounds[dimension+j];
   }
  }else if(bounds.length==dimension){
   for(int i=0;i<dimension;i++){
    lowerBounds[i]=-bounds[i]/2;
    upperBounds[i]=bounds[i]/2;
   }
  }
  scalingFactor=1;
 }
 public carthesianAxisPlot(float X, float Y){
  this.dimension=2;
  lowerBounds=new float[dimension];
  upperBounds=new float[dimension];
  tickmarks=new int[2];
  lowerBounds[0]=-X/2;
  lowerBounds[1]=-Y/2;
  upperBounds[0]=X/2;
  upperBounds[1]=Y/2;
  scalingFactor=1;
 }
 public carthesianAxisPlot(float X, float Y, float Z){
   this.dimension=3;
  lowerBounds=new float[dimension];
  upperBounds=new float[dimension];
  tickmarks=new int[3];
  lowerBounds[0]=-X/2;
  lowerBounds[1]=-Y/2;
  lowerBounds[2]=-Z/2;
  upperBounds[0]=X/2;
  upperBounds[1]=Y/2;
  upperBounds[2]=Z/2;
  scalingFactor=1;
 }
 public void setTickmarks(int[] tickmarks){
  this.tickmarks=tickmarks;
 }
 public void setTickmarks(int x, int y){
  tickmarks=new int[2];
  tickmarks[0]=x;
  tickmarks[1]=y;
 }
 public void setTickmarks(int x, int y, int z){
  tickmarks=new int[3];
  tickmarks[0]=x;
  tickmarks[1]=y;
  tickmarks[2]=z;
 }
 public void setBounds(float A){
  if(dimension==2){
   lowerBounds[0]=-A;
   lowerBounds[1]=-A;
   upperBounds[0]=X/2;
   upperBounds[1]=Y/2;
  }else if(dimension==3){
   lowerBounds[0]=-A;
   lowerBounds[1]=-A;
   lowerBounds[2]=-A;
   upperBounds[0]=A;
   upperBounds[1]=A;
   upperBounds[2]=A;
  }
 }
 public void setTickmarkFontProperties(PFont tickmarkFont, int tickmarkFontSize){
  this.tickmarkFont=tickmarkFont;
  this.tickmarkFontSize=tickmarkFontSize;
 }
 public void setAxisLabelFontProperties(PFont axisLabelFont, int axisLabelFontSize){
  this.axisLabelFont=axisLabelFont;
  this.axisLabelFontSize=axisLabelFontSize; 
 }
 public void setScalingFactor(float scalingFactor){
  this.scalingFactor=scalingFactor;
 }
 public float getScalingFactor(){
  return scalingFactor;
 }
 void plotPoint(color pointColor, float pointWidth,float x, float y,float z){
  stroke(pointColor);
  fill(pointColor);
  float[] c=screenCoordinates(new float[]{x,y,z});
  pushMatrix();
   translate(c[0],c[1],c[2]);
   box(pointWidth);
  popMatrix();
 }
 void plotPoint(color pointColor, float pointWidth, float x, float y){
  stroke(pointColor);
  fill(pointColor);
  float[] c=screenCoordinates(new float[]{x,y});
  ellipse(c[0],-c[1],pointWidth,pointWidth);
 }
 void plotPoint(nDVector v, color pointColor){
  if(v.getDimension()==2)
   plotPoint(pointColor, 2,v.getComponent('x'),v.getComponent('y'));
  else if(v.getDimension()==3){
   stroke(pointColor); 
   float[] c=screenCoordinates(new float[]{v.getComponent('x'),v.getComponent('y'),v.getComponent('z')});
   point(c[0],c[1],c[2]);
  } 
 }
 void plotPoint(nDVector v,color pointColor, float pointWidth){
  if(v.getDimension()==2){
   plotPoint(pointColor, pointWidth,v.getComponent('x'),v.getComponent('y'));
  }else if(v.getDimension()==3){
   plotPoint(pointColor, pointWidth,v.getComponent('x'),v.getComponent('y'),v.getComponent('z'));
  }
 }
 void plotVector(nDVector v, color vectorColor, int lineThickness){
  plotVector(v.getComponents(),vectorColor,lineThickness);
 }
 void plotVector(float[] coords, color vectorColor, int lineThickness){
  float[] sCoords=screenCoordinates(coords);
  stroke(vectorColor);
  strokeWeight(lineThickness);
  if(sCoords.length==2)
   line(0,0,sCoords[0],-sCoords[1]);
  else if(sCoords.length==3)
   line(0,0,0,sCoords[0],-sCoords[2],sCoords[1]);
 }
 void plotAnchoredVector(nDVector anchor, nDVector v, color vectorColor, int lineThickness){
  plotAnchoredVector(anchor.getComponents(),v.getComponents(),vectorColor,lineThickness);
 }
 void plotParametricDomain(parametricDomain d){
  int[] domainDimensions=d.domainSize();
  if(domainDimensions.length==2){
   for(int i=0;i<domainDimensions[0]-1;i++){
     for(int j=0;j<domainDimensions[1]-1;j++){
       float[] d0=screenCoordinates(d.domainPoint(i,j));
       float[] d1=screenCoordinates(d.domainPoint(i+1,j));
       float[] d2=screenCoordinates(d.domainPoint(i+1,j+1));
       float[] d3=screenCoordinates(d.domainPoint(i,j+1));
       if(dimension==2){
        beginShape();
         vertex(d0[0],d0[1]);
         vertex(d1[0],d1[1]);
         vertex(d2[0],d2[1]);
         vertex(d3[0],d3[1]);
        endShape(CLOSE);
      }else if(dimension==3)
        beginShape();
         vertex(d0[0],0,d0[1]);
         vertex(d1[0],0,d1[1]);
         vertex(d2[0],0,d2[1]);
         vertex(d3[0],0,d3[1]);
        endShape(CLOSE);   
     } 
    }
   }  
 }
  void plotParametricDomain(parametricDomain d, int embeddingPlane){
  int[] domainDimensions=d.domainSize();
  for(int i=0;i<domainDimensions[0]-1;i++){
     for(int j=0;j<domainDimensions[1]-1;j++){
       float[] d0=screenCoordinates(d.domainPoint(i,j).embed(embeddingPlane));
       float[] d1=screenCoordinates(d.domainPoint(i+1,j).embed(embeddingPlane));
       float[] d2=screenCoordinates(d.domainPoint(i+1,j+1).embed(embeddingPlane));
       float[] d3=screenCoordinates(d.domainPoint(i,j+1).embed(embeddingPlane));
       beginShape();
         vertex(d0[0],d0[1],d0[2]);
         vertex(d1[0],d1[1],d1[2]);
         vertex(d2[0],d2[1],d2[2]);
         vertex(d3[0],d3[1],d3[2]);
       endShape(CLOSE);   
      
    }
   }  
 }
 void plotScalarField(parametricDomain d, scalarField f, String domainPlane){
  int[] domainDimensions=d.domainSize();
  for(int i=0;i<domainDimensions[0]-1;i++){
     for(int j=0;j<domainDimensions[1]-1;j++){
       float[] d0,d1,d2,d3;
       if(domainPlane=="xy"){
        d0=screenCoordinates(d.domainPoint(i,j).getComponent('x'),d.domainPoint(i,j).getComponent('y'),f.evaluate(d.domainPoint(i,j).getComponent('x'),d.domainPoint(i,j).getComponent('y')));
        d1=screenCoordinates(d.domainPoint(i+1,j).getComponent('x'),d.domainPoint(i+1,j).getComponent('y'),f.evaluate(d.domainPoint(i+1,j).getComponent('x'),d.domainPoint(i+1,j).getComponent('y')));
        d2=screenCoordinates(d.domainPoint(i+1,j+1).getComponent('x'),d.domainPoint(i+1,j+1).getComponent('y'),f.evaluate(d.domainPoint(i+1,j+1).getComponent('x'),d.domainPoint(i+1,j+1).getComponent('y')));
        d3=screenCoordinates(d.domainPoint(i,j+1).getComponent('x'),d.domainPoint(i,j+1).getComponent('y'),f.evaluate(d.domainPoint(i,j+1).getComponent('x'),d.domainPoint(i,j+1).getComponent('y')));
       }else if(domainPlane=="xz"){
        d0=screenCoordinates(d.domainPoint(i,j).getComponent('x'),f.evaluate(d.domainPoint(i,j).getComponent('x'),d.domainPoint(i,j).getComponent('y')),d.domainPoint(i,j).getComponent('y'));
        d1=screenCoordinates(d.domainPoint(i+1,j).getComponent('x'),f.evaluate(d.domainPoint(i+1,j).getComponent('x'),d.domainPoint(i+1,j).getComponent('y')),d.domainPoint(i+1,j).getComponent('y'));
        d2=screenCoordinates(d.domainPoint(i+1,j+1).getComponent('x'),f.evaluate(d.domainPoint(i+1,j+1).getComponent('x'),d.domainPoint(i+1,j+1).getComponent('y')),d.domainPoint(i+1,j+1).getComponent('y'));
        d3=screenCoordinates(d.domainPoint(i,j+1).getComponent('x'),f.evaluate(d.domainPoint(i,j+1).getComponent('x'),d.domainPoint(i,j+1).getComponent('y')),d.domainPoint(i,j+1).getComponent('y'));
       }else{//domainPlane=="yz"
        d0=screenCoordinates(f.evaluate(d.domainPoint(i,j).getComponent('x'),d.domainPoint(i,j).getComponent('y')),d.domainPoint(i,j).getComponent('x'),d.domainPoint(i,j).getComponent('y'));
        d1=screenCoordinates(f.evaluate(d.domainPoint(i+1,j).getComponent('x'),d.domainPoint(i+1,j).getComponent('y')),d.domainPoint(i+1,j).getComponent('x'),d.domainPoint(i+1,j).getComponent('y'));
        d2=screenCoordinates(f.evaluate(d.domainPoint(i+1,j+1).getComponent('x'),d.domainPoint(i+1,j+1).getComponent('y')),d.domainPoint(i+1,j+1).getComponent('x'),d.domainPoint(i+1,j+1).getComponent('y'));
        d3=screenCoordinates(f.evaluate(d.domainPoint(i,j+1).getComponent('x'),d.domainPoint(i,j+1).getComponent('y')),d.domainPoint(i,j+1).getComponent('x'),d.domainPoint(i,j+1).getComponent('y'));
       }
       beginShape(QUADS);
         vertex(d0[0],d0[1],d0[2]);
         vertex(d1[0],d1[1],d1[2]);
         vertex(d2[0],d2[1],d2[2]);
         vertex(d3[0],d3[1],d3[2]);
       endShape(CLOSE);   
      
    }
   }
 }
 void plotParametricSurface(parametricDomain d, parametricSurface s){
  int[] domainDimensions=d.domainSize();
  for(int i=0;i<domainDimensions[0]-1;i++){
     for(int j=0;j<domainDimensions[1]-1;j++){
       float[] d0=screenCoordinates(s.evaluate(d.domainPoint(i,j)));
       float[] d1=screenCoordinates(s.evaluate(d.domainPoint(i+1,j)));
       float[] d2=screenCoordinates(s.evaluate(d.domainPoint(i+1,j+1)));
       float[] d3=screenCoordinates(s.evaluate(d.domainPoint(i,j+1)));
       beginShape();
         vertex(d0[0],d0[1],d0[2]);
         vertex(d1[0],d1[1],d1[2]);
         vertex(d2[0],d2[1],d2[2]);
         vertex(d3[0],d3[1],d3[2]);
       endShape(CLOSE);   
      
    }
   }  
  
 }
 void plotAnchoredVector(float[] anchor, float[] v, color vectorColor, int lineThickness){
  float[] aCoords=screenCoordinates(anchor);
  float[] vCoords=screenCoordinates(v);
  stroke(vectorColor);
  strokeWeight(lineThickness);
  if(aCoords.length==3)
   line(aCoords[0],aCoords[1],aCoords[2],aCoords[0]+vCoords[0],aCoords[1]+vCoords[1],aCoords[2]+vCoords[2]);
  else if(aCoords.length==2)
   line(aCoords[0],aCoords[1],aCoords[0]+vCoords[0],aCoords[1]+vCoords[1]); 
 }
 float[] screenCoordinates(float[] coords){
  if(coords.length==2){
   return screenCoordinates(coords[0],coords[1]);
  }else{
   return screenCoordinates(coords[0],coords[1],coords[2]);
  }
 }
 float[] screenCoordinates(float x, float y){
  float[] aCoords=new float[2];
  float a=(x/abs(upperBounds[0]-lowerBounds[0]));
  float b=(y/abs(upperBounds[1]-lowerBounds[1]));
  if(a>1)
   a=1;
  else if(a<-1)
   a=-1;
  if(b>1)
   b=1;
  else if(b<-1)
   b=-1;
  aCoords[0]=(a)*width*scalingFactor;
  aCoords[1]=(b)*height*scalingFactor;
  return aCoords;
 }
 float[] screenCoordinates(float x, float y, float z){
  float[] aCoords=new float[3];
  float a=x/abs(upperBounds[0]-lowerBounds[0]);
  float b=-z/abs(upperBounds[2]-lowerBounds[2]);
  float c=y/abs(upperBounds[1]-lowerBounds[1]);
  aCoords[0]=(a/2)*width*scalingFactor;
  aCoords[1]=(b/2)*width*scalingFactor;
  aCoords[2]=(c/2)*width*scalingFactor;
  return aCoords;
 }
 float[] screenCoordinates(nDVector v){
  if(v.getDimension()==2)
   return screenCoordinates(v.getComponent('x'),v.getComponent('y'));
  else if(v.getDimension()==3)
   return screenCoordinates(v.getComponent('x'),v.getComponent('y'),v.getComponent('z'));
  else
   return null; 
 }
 public void plotAxis(color axisColors, color tickColors){
  if(dimension==2){
   plotAxis2D(axisColors,tickColors,tickColors,axisColors);
  }else if(dimension==3){
   plotAxis3D(axisColors,tickColors,tickColors,axisColors,scalingFactor);
  }
 }
 protected void plotAxis2D(color axisColor, color ticklineColor, color tickmarkColor, color axisLabelFontColor){
  strokeWeight(2);
  stroke(axisColor);
  fill(axisColor);
  line(-width/2,0,width/2,0);
  line(0,-height/2,0,height/2);
  textFont(axisLabelFont,axisLabelFontSize);
  text("X",width/2-axisLabelFontSize,0);
  text("Y",0,-height/2+axisLabelFontSize);
  stroke(ticklineColor);
  fill(ticklineColor);
  textFont(tickmarkFont,tickmarkFontSize);
 }
 protected void plotAxis3D(color axisColor, color ticklineColor, color tickmarkColor, color axisLabelFontColor,float factor){
  strokeWeight(2);
  stroke(axisColor);
  fill(axisColor);
  line((-width/2)*factor,0,0,(width/2)*factor,0,0);
  line(0,(-height/2)*factor,0,0,(height/2)*factor,0);
  line(0,0,(-width/2)*factor,0,0,(width/2)*factor);
  textFont(axisLabelFont,axisLabelFontSize);
  text("X",(width/2)*factor-axisLabelFontSize,0,0);
  text("Z",0,-(height/2)*factor+axisLabelFontSize,0);
  text("Y",0,0,(width/2)*factor+axisLabelFontSize*0.3);
 }

void plotPlanes(color ticklineColor, color tickmarkColor,float factor){
  stroke(ticklineColor);
  fill(ticklineColor);
  if(dimension==2){
   for(int i=0;i<tickmarks[0];i++){
    float lambdaX=(float)i/(float)(tickmarks[0]);
    float x=lowerBounds[0]*(1-lambdaX)+upperBounds[0]*lambdaX;
    float xGeom=(-width/2)*(1-lambdaX)+(width/2)*lambdaX;
    strokeWeight(1);
    text(x,xGeom,0);
    line(xGeom,-height/2,xGeom,height/2);
   }
   for(int j=0;j<tickmarks[1];j++){
    float lambdaY=(float)j/(float)(tickmarks[1]);
    float y=lowerBounds[1]*(1-lambdaY)+upperBounds[1]*lambdaY;
    float yGeom=(-height/2)*(1-lambdaY)+(height/2)*lambdaY;
    strokeWeight(1);
    text(y,0,-yGeom);
    line(-width/2,yGeom,width/2,yGeom);
   }
  }else if(dimension==3){
   for(int i=0;i<=tickmarks[0];i++){
    float lambdaX=(float)i/(float)(tickmarks[0]);
    float x=lowerBounds[0]*(1-lambdaX)+upperBounds[0]*lambdaX;
    float xGeom=factor*(-width/2)*(1-lambdaX)+factor*(width/2)*lambdaX;
    strokeWeight(1);
    //text(x,xGeom,0,0);
    line(xGeom,(-height/2)*factor,0,xGeom,(height/2)*factor,0);
   }
   for(int j=0;j<=tickmarks[1];j++){
    float lambdaY=(float)j/(float)(tickmarks[1]);
    float y=lowerBounds[1]*(1-lambdaY)+upperBounds[1]*lambdaY;
    float yGeom=factor*(-height/2)*(1-lambdaY)+factor*(height/2)*lambdaY;
    strokeWeight(1);
    //text(y,0,yGeom,0);
    line((-width/2)*factor,yGeom,0,(width/2)*factor,yGeom,0);
   }
   for(int k=0;k<=tickmarks[2];k++){
    float lambdaZ=(float)k/(float)(tickmarks[2]);
    float z=lowerBounds[2]*(1-lambdaZ)+upperBounds[2]*lambdaZ;
    float zGeom=factor*(-width/2)*(1-lambdaZ)+factor*(width/2)*lambdaZ;
    strokeWeight(1);
    //text(z,0,0,zGeom);
    line((-width/2)*factor,0,zGeom,(width/2)*factor,0,zGeom);
   }
   for(int k=0;k<=tickmarks[2];k++){
    float lambdaZ=(float)k/(float)(tickmarks[2]);
    float z=lowerBounds[2]*(1-lambdaZ)+upperBounds[2]*lambdaZ;
    float zGeom=factor*(-width/2)*(1-lambdaZ)+factor*(width/2)*lambdaZ;
    line(zGeom,0,(-width/2)*factor,zGeom,0,(width/2)*factor); 
   }
  }
 }
}

