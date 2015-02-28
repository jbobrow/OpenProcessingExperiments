
PImage myMap;

void setup() {
  background(0);
  size(1200,700);
  smooth();
  myMap = loadImage("map.png");
  mapVis();
}

void draw() {
}

void mapVis() {

  String[] data = loadStrings("milk-tea-coffee.tsv");
  for(int i = 1; i < data.length; i++) {
    String[] pieces = split(data[i],TAB);
    float x = parseFloat(pieces[0]);
    float y = parseFloat(pieces[1]);
    float z = parseFloat(pieces[2]);
    float w = parseFloat(pieces[3]);
    float Year = map(x,1910,2004,0,width);
    float Milk = map(y,20,45,0,height);
    float Tea = map(z,1.0,12.0,0,height);
    float Coffee = map(w,10.0,50.0,0,height);
    float txt = map(i,0,data.length,0,width);
    fill(255);

    fill(255);
    ellipse(Year,(height-Milk),8,8);
    fill(10,150,23);
    ellipse(Year,(height-Tea),10,10);
    text(data.length,10,10);
    fill(250,50,203);
    ellipse(Year,(height-Coffee),10,10);

    fill(200);
    if(i%10==0) {
      text(pieces[0],txt,10);
    }
    fill(255);
    if(i%10==0) {
      text(pieces[1],txt,(height-Milk));
    }
    fill(10,150,23);
    if(i%10==0) {
      text(pieces[2],txt,((height-Tea)+15));
    }
    fill(250,50,203);
    if(i%10==0) {
      text(pieces[3],txt,((height-Coffee)+15));
    }
  }
}


