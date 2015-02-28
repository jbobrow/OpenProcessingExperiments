

float []lineX=new float[100];
float strokeSize;
float colorRange;
int epi=0;
int mode=0;
int startChange=0;
PImage[]man=new PImage[5];

void setup() {
//  size(200, 200);
  frameRate(24);

  for (int lop=1;lop<5;lop++) {
    man[lop]=loadImage("man_"+lop+".png");
  }
}

void draw() {

  imageMode(CENTER);
  background(255);
  colorRange=random(255);
  

  if (mode==0)image(man[1], width/2, height/2);
  if (mode==1)image(man[2], width/2, height/2);
  if (mode==2)image(man[3], width/2, height/2);
  if (mode==3)image(man[4], width/2, height/2);

  if (mousePressed==true)startChange=1;

  if (startChange==1 || startChange==2) {
    epi+=1;


    if (epi<25)strokeSize+=1.5;
    if (epi>25)strokeSize-=1.5;
    if (epi>45 && startChange==2){
      strokeSize=1;
      epi=0;
      startChange=0;
    }
    if (epi==25 && startChange==1) {
      mode+=1;
      startChange=2;
    }

    println(epi +" "+ strokeSize);
    for (int lop=0; lop<100;lop++) {

      strokeWeight(strokeSize);
      lineX[lop]=random(width); 
      stroke(colorRange, colorRange, colorRange, 180);
      line(lineX[lop], 0, lineX[lop], height);
    }
  }
}


