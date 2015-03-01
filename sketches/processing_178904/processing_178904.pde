
import java.util.*;
int n;
int nL;
float xPos;
float yPos;
color dotCol;
color lineCol;
color highlightCol;
GSlider nSlider;
GSlider nLSlider;


void setup(){
  size(1000,1000);
  noStroke();
  fill(200);
  rect(0,900,1000,100);
  nSlider = new GSlider("Number of points to a side",100,950,350,10,2,20,7,color(130,125,176),true,true,"points");
  nLSlider = new GSlider("Sequence index",550,950,350,10,1,19,1,color(130,125,176),true,true,"");
  xPos = 100;
  yPos = 50;
  dotCol = color(0);
  lineCol = color(255,100,100);
  highlightCol = color(200,80,80);
  n = 2;
  nL = 1;
  background(255);
  drawFig();
}

void draw(){
  noStroke();
  fill(200);
  rect(0,900,470,100);
  rect(530,900,500,100);
  nSlider.refresh();
  nLSlider.refresh();
  if(nLSlider.getVal()>nSlider.getVal()-1){
    nLSlider.setVal(nSlider.getVal()-1);
  }
  int newN = int(nSlider.getVal());
  int newNL = int(nLSlider.getVal());
  if(n != newN || nL != newNL){
    n = newN;
    nL = newNL;
    background(255);
    drawFig();
  }
}

//void keyPressed(){
//  if(keyCode==UP && nL<n){
//    nLSlider.setVal(nL+1);
//  }
//  if(keyCode==DOWN && nL>1){
//    nLSlider.setVal(nL-1);
//  }
//  if(keyCode==RIGHT && n<20){
//    nSlider.setVal(n+1);
//  }
//  if(keyCode==LEFT && n>2){
//    nSlider.setVal(n-1);
//  }
//}

class Tuple{
  int x,y;
  Tuple(int xval, int yval){
    x = xval;
    y = yval;
  }
}

void drawFig(){
  ArrayList<Tuple> coords = getCoords(n);
  ArrayList<Tuple> allPairs = getAllPairs(n*n);
  ArrayList<Float> lengths = getLengths(coords,allPairs);
  ArrayList<Tuple> pairsN = getPairsN(lengths,allPairs,nL);
  pushMatrix();
  translate(xPos,yPos);
  float scaler = 800./(n-1);
  scale(scaler);
  drawLines(pairsN,coords,2/scaler,lineCol);
  drawArray(coords,5/scaler,dotCol);
  popMatrix();
  noStroke();
  fill(200);
  rect(0,900,1000,100);
  fill(100);
  textSize(40);
  text(pairsN.size(),500,980);
}

void drawArray(ArrayList<Tuple> coords, float dotSize, color dotColor){
  noStroke();
  fill(dotColor);
  for(int i=0;i<coords.size();i++){
    ellipse(coords.get(i).x,coords.get(i).y,dotSize,dotSize);
  }
}

void drawLines(ArrayList<Tuple> allPairs,ArrayList<Tuple> coords, float lineThick,color lineColor){
  for(int i=0;i<allPairs.size();i++){
    int ind1 = allPairs.get(i).x;
    int ind2 = allPairs.get(i).y;
    float dotSize = 10./(800./(n-1));
    fill(highlightCol);
    noStroke();
    ellipse(coords.get(ind1).x,coords.get(ind1).y,dotSize,dotSize);
    ellipse(coords.get(ind2).x,coords.get(ind2).y,dotSize,dotSize);
    strokeWeight(lineThick);
    stroke(lineColor);
    line(coords.get(ind1).x,coords.get(ind1).y,coords.get(ind2).x,coords.get(ind2).y);
  }
}
  

ArrayList<Tuple> getCoords(int n){
  ArrayList<Tuple> coords = new ArrayList<Tuple>();//(n*n);
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      coords.add(new Tuple(i,j));
    }
  }
  return coords;
}



ArrayList<Tuple> getAllPairs(int n){
  ArrayList<Tuple> allPairs = new ArrayList<Tuple>();//(n*(n-1));
  for(int i=0;i<n-1;i++){
    for(int j=i+1;j<n;j++){
      allPairs.add(new Tuple(i,j));
    }
  }
  return allPairs;
}

ArrayList<Float> getLengths(ArrayList<Tuple> coords,ArrayList<Tuple> allPairs){
  ArrayList<Float> lengths = new ArrayList<Float>();
  for(int i=0;i<allPairs.size();i++){
    int ind1 = allPairs.get(i).x;
    int ind2 = allPairs.get(i).y;
    int x1 = coords.get(ind1).x;
    int y1 = coords.get(ind1).y;
    int x2 = coords.get(ind2).x;
    int y2 = coords.get(ind2).y;
    float distnc = sqrt(sq(x2-x1)+sq(y2-y1));
    lengths.add(distnc);
  }
  return lengths;
}

ArrayList<Tuple> getPairsN(ArrayList<Float> lengths,ArrayList<Tuple> allPairs,int lengInd){
  ArrayList<Tuple> pairsN = new ArrayList<Tuple>();
  ArrayList<Float> dists = new ArrayList<Float>();
  Float[] lengthArray = new Float[lengths.size()];
  for(int i=0;i<lengths.size();i++){
    lengthArray[i] = lengths.get(i);
  }
  lengthArray.sort(numCompare);

  for(int i=0;i<lengths.size();i++){
    dists.add(lengthArray[i]);
  }
  
  for(int i=0;i<dists.size()-1;i++){
    float l1 = dists.get(i);
    float l2 = dists.get(i+1);
    while(l1==l2 && i<dists.size()-1){
      dists.remove(i+1);
      if(i<dists.size()-1){
        l2 = dists.get(i+1);
      }
    }
  }
  float lengthWanted = dists.get(dists.size()-lengInd);
  for(int i=0;i<lengths.size();i++){
    float curLen = lengths.get(i);
    if(curLen==lengthWanted){
      pairsN.add(allPairs.get(i));
    }
  }
  return pairsN;
}

int numCompare(float a, float b){
  return a-b;
}

class GSlider {
  int swidth, sheight;  //width and height of slider
  float xpos, ypos;     //slider position
  float spos, newspos;  //indicator position
  float smin, smax;     //min and max positions of indicator
  float vmin, vmax;     //min and max values of the slider
  int loose;            //control tightness
  boolean over;         //mouse hovering
  boolean locked;
  color col;
  float ratio;
  int vanityEdge;       //extra width so that indicator won't go off of slider
  String label;
  Boolean showVal;
  Boolean floored;
  Boolean isActive;
  String units;
  
  GSlider (String l, float xp, float yp, int sw, int sh, float theMin, float theMax, float initPos, color c,boolean showv,boolean floord,String unts){
    label = l;
    swidth = sw;
    sheight = sh;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + ((initPos-theMin)/(theMax-theMin))*swidth;
    smin = xpos;
    smax = xpos+swidth;
    spos = max(min(spos,smax),smin);
    vmin = theMin;
    vmax = theMax;
    col = c;
    vanityEdge = 5;
    showVal = showv;
    floored = floord;
    isActive = true;
    units = unts;
  }
  
  void refresh(){
    this.update();
    this.display();
  }
  
  void update(){
    if(isActive){
      if(overEvent()){
        over = true;
      }else{
        over = false;
      }
      if(mousePressed && over){
        locked = true;
      }
      if(!mousePressed){
        locked = false;
      }
      if(locked){
        spos = min(max(mouseX,smin),smax);
      }
    }
  }
  
  void setVal(float val){
    spos = smin + ((val-vmin)/(vmax-vmin))*swidth;
  }
  
  void setActive(boolean active){
    isActive = active;
  }
  
  boolean overEvent(){
    if(mouseX>xpos && mouseX<xpos+swidth && mouseY>ypos && mouseY<ypos+sheight){
      return true;
    }else{
      return false;
    }
  }
  
  void display(){
    color colour;
    if(isActive){
      colour = col;
    }else{
      colour = color(0);
    }
    fill(blendColor(colour,color(30),BURN));
    textSize(12);
    textAlign(CENTER, BOTTOM);
    text(label,xpos+swidth/2,ypos-1);
    if(showVal){
      if(floored){
        text(int(this.getVal())+" "+units,xpos+swidth/2,ypos+sheight*2.5);
      }else{
        text(this.getVal()+" "+units,xpos+swidth/2,ypos+sheight*2.5);
      }
    }
    noStroke();
    fill(colour);
    rect(xpos-vanityEdge,ypos,swidth+2*vanityEdge,sheight);
    if(over || locked){
      fill(blendColor(colour,color(90),DODGE));
    }else{
      fill(blendColor(colour,color(50),DODGE));
    }
    rect(spos-sheight/2,ypos-1,sheight,sheight+2);
  }
  
  float getVal(){
    if(isActive){
      if(floored){
        return floor(vmin+((spos-xpos)/swidth)*(vmax-vmin));
      }else{
        return vmin+((spos-xpos)/swidth)*(vmax-vmin);
      }
    }else{
      return 0;
    }
  }
}
    
    


