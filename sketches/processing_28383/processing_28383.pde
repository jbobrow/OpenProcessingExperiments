
void setup(){
  size(600,600);
  background(0);
  smooth();
  coffeeMap();
}

void coffeeMap(){
  String[] data = loadStrings("milk-tea-coffee.tsv");
  for(int i = 0 ; i <data. length;i++){
    String[] pieces = split(data[i],TAB);
    float milk = parseFloat(pieces[1]);
    float tea = parseFloat(pieces[2]);
    float coffee = parseFloat(pieces[3]);
    
    float yearCoffeeMap = map(i, 0, data.length, 0, width);
    if (i % 20 == 0)
      text (pieces[0], yearCoffeeMap, 10);
    fill(#f1ff59);
    ellipse(yearCoffeeMap, height - coffee*10, 10, 10);  
}
}



