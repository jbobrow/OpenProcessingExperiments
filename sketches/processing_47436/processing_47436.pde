
ArrayList<Contour> contourList;

void setup() {  //setup function called initially, only once
  size(900, 450, P2D);
  contourList = new ArrayList<Contour>();
  background(255);  //set background white
  
  //num contour lines
  for(int i=0;i<100;i++){
ArrayList<PVector> vList = new ArrayList<Vec3D>();

//num vertices per line
  for(int j=0;j<30;j++){
  vList.add(new PVector((i*20)+random(-10,10),j*20));
  }
    Contour co = new Contour(vList);
    contourList.add(co); 
  }
}

void draw() {  //draw function loops 
for(int i=0;i<contourList.size();i++){

contourList.get(i).drawContour();
contourList.get(i).moveContour();
}
}

void mousePressed(){
if(mousePressed){
setup();
}
}



class Contour{
ArrayList<PVector> list;
Contour(ArrayList<PVector> _list){
list = _list;
}

void moveContour(){
for(int i=0;i<list.size();i++){
list.set(new PVector(list.get(i).x, list.get(i).y)) ;
}
}

void drawContour(){
beginShape();
noFill();
for(int i=0;i<list.size();i++){
curveVertex(list.get(i).x, list.get(i).y) ;
}
endShape();
}



}

                
                                                                                                                
