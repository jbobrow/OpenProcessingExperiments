
void setup(){
  size(600,600);
  background(0);
  smooth();
  //myMap = loadImage("map.png");
  mapVis();
}


void mapVis(){
 
  String[] data = loadStrings("milk-tea-coffee.tsv");
  for(int i = 1 ; i <data. length;i++){
    String[] pieces = split(data[i],TAB);
    float Milk = parseFloat(pieces[1]);
    float Tea = parseFloat(pieces[2]);
    float Coffee = parseFloat(pieces[3]);
    
  
    float Year = map(i, 0, data.length,0,width);
 if (i % 10 ==0){
  text (pieces[0], Year, 200);
 
 
 }
 Coffee = map(Coffee, 0, 50, 0, height);
 Milk = map(Coffee, 0, 50, 0, height);
 Tea = map(Coffee, 0, 12, 0, height);


stroke(32,20,123);

ellipse(Year, height - Coffee, 10, 10);

}
}

