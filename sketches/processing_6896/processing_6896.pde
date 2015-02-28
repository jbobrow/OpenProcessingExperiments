
int Length=1000;
float[] X=new float[Length];
float[] Y=new float[Length];
float[] Z=new float[Length];
float[] theta=new float[Length];
float[] FontSize=new float[Length];
int[] moji=new int[Length];
int[] messages=new int[Length];
String[] Messages={
  "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};

void setup(){
  PFont font=loadFont("moji.vlw");
  textFont(font);
  textAlign(CENTER);
  size(800,600,P3D);
  frameRate(30);
  colorMode(HSB,100);
  background(0);
  for(int i=0;i<Length;i++){
    X[i]=random(width);
    Y[i]=random(height);
    Z[i]=random(-1000,1000);
    theta[i]=random(-1,1);
    FontSize[i]=random(10,30);
    messages[i]=int(random(Messages.length));
  }

}

void draw(){
  background(0);
  move();
  camera(0,0,-2000,0,0,0,0,1,0);

}

void move(){
  for(int i=1;i<Length-1;i++){
    //pushMatrix();
    fill(100);
    textSize(FontSize[i]);
    text( Messages[messages[i]],X[i],Y[i],Z[i]);
    rotateX(theta[i]);
    rotateY(theta[i]);
    rotateZ(theta[i]);
    X[i]+=1;
    Y[i]+=1;
    Z[i]+=1;
    theta[i]+=0.0003+(mouseX-pmouseX)/100;
    //popMatrix();
  }
}

void mousePressed(){
  for(int i=0;i<Length;i++){
    X[i]=random(width);
    Y[i]=random(height);
    Z[i]=random(-1000,1000);
    theta[i]=random(-1,1);
    FontSize[i]=random(10,30);
    messages[i]=int(random(Messages.length));
  }
  move();
}


