
void setup (){
  size (600, 600);
  smooth();
  mapVis();
}


void mapVis(){
  smooth();
  background (0);
  
  String[] data = loadStrings("light_temp_data.csv");
  for(int i=0; i < data.length; i++){
    String[] pieces = split(data[i], ",");
    float x = parseFloat(pieces[0]);
    float y = parseFloat(pieces[1]);
    float o=random(200);
    float m=random(10);
    stroke(100);
    fill(255,80);
    ellipse(x,y,o,m);
    ellipse(x,y+200,m,o);
    ellipse(x,y+500,o,o);
    ellipse(x,y+400,m,m);

   
   

    
      }
}

