
PImage[] oEye=new PImage[40];
PImage[] cEye=new PImage[40];
PImage maskImg;
String oEyeLoad;
String cEyeLoad;
int yGridOld=10;
int xGridOld=10;
int yGrid;
int xGrid;

void setup(){
  frameRate(5);
  smooth();
  size(300,300);
  background(0);
  
  maskImg = loadImage("mask.jpg");
  imageMode(CENTER);
  
  for(int i=0; i<40; i++){
    if(i==0)
      print(i);
    if(i<9){
      oEyeLoad="oEye_0"+Integer.toString(i+1)+".jpg";
      cEyeLoad="cEye_0"+Integer.toString(i+1)+".jpg";
    }
    else{
      oEyeLoad="oEye_"+Integer.toString(i+1)+".jpg";
      cEyeLoad="cEye_"+Integer.toString(i+1)+".jpg";
    }
    oEye[i]= loadImage(oEyeLoad);
    cEye[i]= loadImage(cEyeLoad);
  }
  coverStage();
}

void coverStage(){
  for(int i=0; i<6; i++){
    pushMatrix();
    for(int k=0; k<6; k++){
      image(oEye[int(random(0,39))], 25, 25);
      translate(0,height/6);
    }
    popMatrix();
    translate(width/6,0);
  }
}

void draw(){
  if(mouseY<51)
    yGrid=0;
  else if(mouseY<101)
    yGrid=1;
  else if(mouseY<151)
    yGrid=2;
  else if(mouseY<201)
    yGrid=3;
  else if(mouseY<251)
    yGrid=4;
  else
    yGrid=5;
    
  if(mouseX<51)
    xGrid=0;
  else if(mouseX<101)
    xGrid=1;
  else if(mouseX<151)
    xGrid=2;
  else if(mouseX<201)
    xGrid=3;
  else if(mouseX<251)
    xGrid=4;
  else
    xGrid=5;
  
  if(yGridOld!=yGrid||xGridOld!=xGrid){
    pushMatrix();
    translate(50*xGrid,50*yGrid);
    image(cEye[int(random(0,39))], 25, 25);
    popMatrix();
    pushMatrix();
    translate(50*xGridOld,50*yGridOld);
    image(oEye[int(random(0,39))], 25, 25);
    popMatrix();
  }
  
  yGridOld=yGrid;
  xGridOld=xGrid;
}

