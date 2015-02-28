
int totaldalnumber = 15;
int totalleafnumber = 13;
int noofdal=0;
int noofleaves=0;
dal[] dals = new dal[totaldalnumber];
int[] bpoints = new int[4];
int[] bpoints2 = bpoints;
leaf[] leaves = new leaf[totalleafnumber];
int noofdisposed=0;
PImage leaftext;

void setup(){

  size(800,600);
  background(255);
  frameRate(25);
  smooth();
  dals[noofdal]=new dal(0,800,200,30, noofdal);
  bpoints=dals[noofdal].getBranchPoints();
  println(bpoints);
  dals[noofdal].display();
  leaftext=loadImage("textleaf.jpg");
  noofdal++;
}

int acce=1;
float velo=0;
int step=108;
float motionS=0.1;
int desiredP;
int currentP=50;
int calibr=-600;

void draw(){
  fill(255);
  if (currentP<desiredP){ //eger kucukse hareket ettir
    if (desiredP-currentP>=50){
      acce = abs(acce);
      
    }
    else
    {
      acce = -abs(acce);
      
    }
    velo = velo + acce; 
    currentP = currentP + abs(int(motionS*velo))*(desiredP-currentP)/step;
    //velo = acce*abs(step/2-abs(desiredP-currentP-step/2)); 
    //println(velo);
    //currentP = currentP + int(motionS*velo);
    
  } 
  else
  {
    //currentP=desiredP;
    velo=0;
    
  }
  rect(-1,-1,width, height);
  image(leaftext,-(currentP + calibr),height-20);
  
  for (int i=0;i<noofdal;i++){
    dals[i].display();
    //dals[i].displayBranches();
  }
  for (int i=0+noofdisposed;i<noofleaves;i++){
    if (noofleaves<totalleafnumber){
      //leaves[i].setDirection(mouseX);
      leaves[i-noofdisposed].display();
    }
    else {
      leaves[i-noofdisposed].setDirection(mouseX);
      leaves[i-noofdisposed].displayWind(i-noofdisposed);
      desiredP=(noofdisposed+bpoints.length/2 + noofleaves)*step;
    }
  
  }
  

}



public void mousePressed() {
  println("test");
  console.log(bpoints2);
  desiredP=(bpoints.length/2 + noofleaves)*step;
  //println("desiredP " + desiredP);
  
  
  
  if (noofdal<totaldalnumber){  //creating branches
    fill(255);
    //int[] bpoints=dals[int(random(0,noofdal-1))].getBranchPoint();
    int randomnumber = int(random(1,noofdal+1));
    int[] newbpoints = new int[4];
    dals[noofdal]=new dal(bpoints[2*randomnumber],bpoints[2*randomnumber+1],mouseX,mouseY, noofdal);
    newbpoints=dals[noofdal].getBranchPoints();
    bpoints[2*randomnumber]=newbpoints[2];
    bpoints[2*randomnumber+1]=newbpoints[3];
    bpoints= concat(bpoints, subset(newbpoints,0,2));
    //dals[noofdal].display();
    //println("bpoints " + bpoints.length);

    noofdal++;
  }
  else if (noofleaves<totalleafnumber){  //creating leaves
    bpoints=dals[int(random(0,noofdal-1))].getBranchPoints();
    int randomnumber = int(random(10,20));
    if (randomnumber<15)
      randomnumber=-1;
    else
      randomnumber=1;
    leaves[noofleaves]=new leaf(bpoints[1+randomnumber],bpoints[2+randomnumber], noofleaves);
    noofleaves++;
    //println("leaves " + noofleaves);
  }


}




public class dal {

  int xi;  //input points
  int yi;
  int xo;  //output points
  int yo;
  int dalnumber;
  int newdalpoint1;  //new points to branch
  int newdalpoint2;
  float c1x;  //control points
  float c1y;
  float c2x;
  float c2y;
  boolean branch1used=false;
  boolean branch2used=false;
  int[] newdals = new int[4];

  int[] xp = new int[60];  //branch point coordinates
  int[] yp = new int[60];


  public dal(int Xi,int Yi, int Xo, int Yo, int Dalnumber){
    xi=Xi;
    yi=Yi;
    xo=Xo;
    yo=Yo;
    dalnumber=Dalnumber;
    branch1used=false;
    branch2used=false;
    newdalpoint1=int(random(3,20));
    newdalpoint2=int(random(20,45));

    c1x=(xo-xi)/random(1,10)+xi;  //set control points
    c1y=(yo-yi)*random(-0.2,1.2)+yi;
    c2x=xo-(xo-xi)/random(1,10);
    c2y=(yo-yi)*random(-0.2,1.2)+yi;

    int steps=60;              //set branch points
    for (int i = 0; i < steps; i++) { 
      float t = i / float(steps); 
      xp[i] = int(bezierPoint(xi,c1x, c2x, xo, t)); 
      yp[i] = int(bezierPoint(yi, c1y, c2y, yo, t)); 
      //ellipse(xp[i],yp[i], 10,10);
    }

    newdals[0]=int(xp[newdalpoint1]);
    newdals[1]=int(yp[newdalpoint1]);
    newdals[2]=int(xp[newdalpoint2]);
    newdals[3]=int(yp[newdalpoint2]);

  }

  void display(){
    color c = color(0, 0, 0, (totaldalnumber-dalnumber)*255/totaldalnumber); //transparent color
    stroke(c);
    noFill();
    bezier(xi, yi, c1x ,c1y ,  c2x, c2y,  xo, yo);
    //ellipse(c1x,c1y, 10,10);
    //ellipse(c2x,c2y, 10,10);
  }

  int[] getBranchPoints(){
    return newdals;
  }

  void displayBranches(){
    ellipse(newdals[0],newdals[1],10,10);
    ellipse(newdals[2],newdals[3],5,5);
  }
}
public class leaf{

  private color c=color(120,110,178,30);
  private int calibx=-35;
  private int caliby=-50;
  private float iDirection; //initial direction
  private float direction;   //current direction
  private int positionx;
  private int positiony;
  private float[] translateArray = new float[40];
  private int[] stabilityList = {
    350,400,150,200,250,300,50,100,450,6000,550,600  };
  private int stability;
  private boolean fly=false;
  private float mousex;
  private int leafno;
  private boolean dispose=false;  //set true, if the leaf goes outside the screen area
  private int directincrement = 1;  //incremented to change direction from iDirection to Wind direction


  leaf(int x, int y, int Leafno){
    positionx=x;
    positiony=y;
    mousex=mouseX;
    leafno=Leafno;
    iDirection=random(-PI/4,3*PI/4);    //initial direction is set
    direction=iDirection;              //set as the current direction

      stability=stabilityList[leafno];  //higher stability makes a stronger bond to the branch
    for (int i=0;i<40;i++){
      translateArray[i]=random(-2,5);    //coordinates of its shape is created
    }

  }


  void setDirection(int X){

    if (abs(X-mousex)<stability || fly==true){
      mousex=X;

      float newdirection = (mousex)/350-PI/5;
      //leaf's direction is set as a ratio of its initial direction and wind direction
      direction= iDirection*(32-directincrement)/32 + newdirection*directincrement/32; 
      if (directincrement<33)
        directincrement++;
    }
    else {
      fly=true;
    }
  }

  void displayWind(int Disposenumber){

    fill(c);
    noStroke();
    pushMatrix();
    scale(0.3);

    if (fly==true){    //if it is flying, its position is incremented according to its direction
      positionx=int(positionx+20*cos(direction+PI/4));
      positiony=int(positiony+20*sin(direction+PI/4));
    }
    translate(positionx/0.3,positiony/0.3);
    rotate(direction);
    for (int i=0;i<40;i++){      //drawing the same vector shape repeatedly

      translate(random(-2,5),random(-2,5));

      beginShape(POLYGON); 
      vertex(20+calibx, 30+caliby); 
      vertex(20+calibx, 50+caliby); 
      vertex(40+calibx, 90+caliby); 
      vertex(60+calibx, 75+caliby); 
      vertex(70+calibx, 65+caliby);
      vertex(90+calibx, 60+caliby);  
      vertex(45+calibx, 55+caliby); 
      endShape();
    }
    popMatrix();
    if (positionx>800 || positionx<0 || positiony>600 || positiony<0)
      dispose(Disposenumber);   //disposes the leaf if it goes outside the screen
  }

  void display(){    //drawing stable leaf
    fill(c);
    
    //stroke(c);
    noStroke();
    pushMatrix();
    scale(0.3);
    translate(positionx/0.3,positiony/0.3);
    rotate(iDirection);
    for (int i=0;i<40;i++){
      translate(translateArray[i],translateArray[i]);
      beginShape(POLYGON); 
      vertex(20+calibx, 30+caliby); 
      vertex(20+calibx, 50+caliby); 
      vertex(40+calibx, 90+caliby); 
      vertex(60+calibx, 75+caliby); 
      vertex(70+calibx, 65+caliby);
      vertex(90+calibx, 60+caliby);  
      vertex(45+calibx, 55+caliby); 
      endShape();
    }
    popMatrix();
  }


  void dispose(int Disposenumber){  //disposes the leaf from 'leaves' array
    arrayCopy(leaves,Disposenumber+1,leaves,Disposenumber,leaves.length-Disposenumber-1);
    subset(leaves,0,leaves.length-1);
    noofdisposed++;
    //println("disposed: " + leafno);
  }

}
public class textLeaf{
  int speed = 90;
  int tPosition = 0; //where the text is 
  PImage textIm;

  public textLeaf(){
    textIm = loadImage("textleaf.jpg");

  }
  
  public void displayText(int level){
    if (-tPosition < level*speed){
    tPosition = tPosition -5;
    }
    image(textIm,tPosition+300,height-50); 
    if (-tPosition == level*speed ){
      //println("tposition " + tPosition);
    }
    
  }
  

}


