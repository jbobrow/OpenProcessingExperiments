
int counter;
Hashmap<color,int> h;
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  h = new HashMap<color, int>();
  for (int i=0;i<10;i++)
    h.put(color(i,i+1,i+2),i);
  noLoop();
}

void draw() {  //draw function loops
  int x=random(10); 
  println((int)h.get(color(x,x+1,x+2)));
  println(25);
  ellipse(20,20,20,20);
}
