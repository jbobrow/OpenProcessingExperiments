
float time = 0;
int w = 400;
int h = 400;
PImage a;
int li;
void setup(){
  //smooth();
 
  size(400,400);
  smooth();
  a=createImage(w,h,ARGB);
  for (int i = 0;i<a.pixels.length;i++){
   a.pixels[i]=color(random(40)+random(40)+random(40)+random(40)); 
  }
  String ext = ".png";
  String fn ="http://1.bp.blogspot.com/-z4cYFotuDQs/TrHhwMV158I/AAAAAAAAAX0/dpvoQdkIZM0/s400/sand";
  //"vertical7";
  //"newop";
 // "markup"; 
  
  //"cs"; //.jpg
  a=createImage(w,h,ARGB);
  //cloud.png");
  //a.resize(w,h);
  for (int x =0;x<w;x++){
   for (int y = 0;y<h;y++){
    color c= color(w-x,y,h-y);
    a.set(x,y,c);
   } 
  }
  stroke(1,111);
  fill(1,111);
  //image(a,0,0);
}
float wave = 75;
void draw(){
 
  //fill(255);
  float x =0;
//  rect(0,0,w,h);
  while (x<w){
    float k = wave*noise(x/100,time);
    noStroke();
   // ellipse(x,200+(k),3,3);
    strokeWeight(2);
    //stroke(1);
    float y = 200+(k);
   // a.pixels[int(x)+w*int(y)]=a.get(int(li),li);
 //  stroke(a.get(int(li),li),111);//11
   stroke(a.get(int(x),li),131);//31,11
   point(x,(li+y)-200);
    //line(x,200+(k),x,h);
    x++;
  }
  time = time+.02;
  li++;
  if(li>h){
    li=0; 
  background(255);
  }
 
}               
