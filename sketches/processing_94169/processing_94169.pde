
void setup(){
  size(1000,800);
  noLoop();
}

void draw(){
  PFont f = createFont("Arial",30,true);
  fill(0,0,0);
  textFont(f);
  
  PImage img = loadImage("smiley.jpg");
  background(255);
  text("MOST POPULATED COUNTRIES VS NEW YORK", 120,80);
  f = createFont("Arial",16,true);
  String[] cities = {"Shanghai","Istanbul","Karachi","Mumbai","Tehran","Moscow","New York"};
  int[] sizes = {17863133,13854740,12991000,12478447,11977988,11716000,8244910};
  int total = 0;
  for(int i:sizes) total+=i;
  int max = sizes[0];
  double[] smilies = new double[7];
  smilies[0]=10;
  for(int i = 1; i < 7; i++){
    smilies[i] = sizes[i] * 10.0/sizes[0];
  }
  textFont(f);
  fill(0);
  for(int i = 150;i<=750;i+=100){
    text(cities[(i-150)/100],80,i);
    text("" + sizes[(i-150)/100],80,i+30);
    imageMode(CENTER);
    System.out.println(smilies[(i-150)/100]);
    double last = 0;
    for(int j = 200; j < 200 + smilies[(i-150)/100]*75; j+=75){
      
//      System.out.println(((i-150)/100) + " " + ((j-200)/75));
      image(img,j,i);
      last = j;
    }
    last+=75;
    if((i-150)/100!=0){
      image(img,(int)last,i);
      noStroke();
      fill(255,255,255);
      double remainder = (50*(smilies[(i-150)/100]-(int)(smilies[(i-150)/100])));
      System.out.println((int)(last-25+remainder) + " " + (i-25) + " " + remainder);
      rect((int)(last-25+remainder),i-25,50,50);
    }
    fill(0,0,0);
  }
  
  
}

