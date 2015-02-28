
PImage myMap;

void setup (){
  size (640,400);
  smooth();
 myMap = loadImage ("map.png");
  mapVis();
}

void draw (){
  mapVis();
  
}
void mapVis(){
  image (myMap,0,0);
  
  String[] data = loadStrings ("locations.tsv");
  for(int i = 0; i < data.length; i ++){
    String[] pieces = split(data[i],TAB); 
    float x = parseFloat (pieces [1]);
    float y = parseFloat(pieces[2]);
    //println(pieces[0] + " " + x + " " +y);
    
    ellipse (x,y,10,10);
     text (data [i],x,y);
     textSize (10);
  }
}
void mousePressed (){
if(mousePressed){
      fill(random (250), random (40), random (200));
  }else{
    fill (0);
    }
}


