
boolean doDrawRect = true;

Runtime rt = Runtime.getRuntime();
PImage img;

void setup(){
  size(300,300);
  //img = loadImage("sample.png"); //try this.
  frameRate(10);
  textSize(10);
  
  draw();
}

void draw(){
  background(255);
  
  println("start !");
  
  int s = millis();
  
  //img = loadImage("sample.png"); // try this too.
  
  if(doDrawRect){
    for(int i=0; i<10000; i++){
      fill(int(random(255)));
      rect(random(width),random(height),10,10);
    }
  }
  
  
  int e = millis();
  long m = (rt.totalMemory() - rt.freeMemory())/1024;
  
  println("finished !");
  fill(0);
  rect(0,0,width,40);
  fill(255);
  text(String.format("Time: %d ms%nMemory: %d KB", e-s, m), 10, 16);
  println(String.format("Time: %d ms%nMemory: %d KB", e-s, m));
}

void hoge(){
}

