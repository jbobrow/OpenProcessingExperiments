
float x=0;
int y=0;
int k=0;

void setup(){
  size(800,600);
  smooth();
  frameRate(100);

  colorMode(HSB, 360, 100, 100);
  for(int i=0; i<width; i++){
    x++;
    stroke(x, 50, 100);
    if (x>340){
      x=0;
    }
    line(i, 0, i, height);
  
  }

  for(int i=0; i<height; i++){
   y+=25;
   stroke(y, 50, 100);
   if(y>300){
    y=0;
    }
  line(0, i*20, width, i*60);
  }
  

}

void draw(){

  
  PFont font = loadFont("AirstreamNF-200.vlw");
  textFont(font);
  //textSize(200);
  for(int j=0;j<345;j+=50){
    k++;
    fill(k, 70, 80);
    text("Disco", width/3, 250);
    text("time", width/2, 350);
      if(k>=345){
        k=0;
      }
    if(j>=345){
      j=0;
    }
  }
      
  
  
}
  


