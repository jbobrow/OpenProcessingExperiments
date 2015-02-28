
void setup(){
  smooth();
  size(800,600);
  teaCoffee();
  
}
void teaCoffee(){
  colorMode(HSB,360,100,100);
  background(100,0,100);
  String[] data = loadStrings("milk-tea-coffee.tsv");
  for(int i=1;i< data.length; i++){
    float f = i;
    String[] splitData = split(data[i],TAB);
    float z = parseFloat(splitData[1]);
    float x = parseFloat(splitData[2]);
    float y = parseFloat(splitData[3]);
    y = height - y*10;
    fill(z*10,50,100);
    f = map(f,0,data.length,0,width);
    ellipse(f,y,x,x);
  }
}
    

