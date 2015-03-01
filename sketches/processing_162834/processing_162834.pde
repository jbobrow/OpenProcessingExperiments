
PImage myFace;
PFont font;
PImage batman;
int val = 0;
int num = 0;
int i = 0;
int add = 0;
void setup(){
  font = createFont("Arial",40);
  size(800,800);
  frameRate(1.2);
  myFace = loadImage("myFace.jpg");
  batman = loadImage("batman.jpg");
}



void draw(){
  
  for(j=0;j<10;j++){
    for(i=0;i<15;i++){
      rect(0+i*60-(j*10),0,7,800);
      fill(255,random(200));
      stroke(0);
    }
  }
  // draws first image
  image(myFace, 0,0, 800, 800);
  //timer for batman
  if(num==5){
    // mirror process from NoahBuddy at http://processing.org/discourse/beta/num_1242102535.html
    //could have just edited the image outside of processing
    pushMatrix();
    scale(-1,1);
    image(batman, -800, 0, 800, 800);
    popMatrix();
    tint(256,random(200,256));
    num=-1;
  }
  // cycle of filters applied, first no filter, then erode, dilate, and posterize
  if(val==1){
    filter(ERODE);
  }
  else if(val==2){
    filter(DILATE);
  }
  else if(val==3){
    filter(POSTERIZE,5);
    val = -1;
  }
  val++;
  num++;
}


