
dandelion d;

void setup(){

  size(600,600);
 
  d=new dandelion(160,100,width/2-50,height/2-60);
  
  smooth();
  
}

void draw(){
background(#FFEBD3);
noStroke();
fill(#FFF7ED);
ellipse(width/2,height/2,480,480);
 d.display();


  

}
public class dandelion{
  float d1;
  float cx;
  float cy;
  float d;
  int num;
  ArrayList petals;
  Bud bud;
  dandelion(int num,float d,float cx,float cy){
  this.num=num;
  this.d=d;
  d1=d/2;
  this.cx=cx;
  this.cy=cy;
  petals=new ArrayList();
  createDandelion(num,d1,cx,cy);
  }
  public void createDandelion(int num,float d2,float sx,float sy){
  bud=new Bud(sx,sy,d2,num);// to be added
  float[] angle=new float[num];
  //float[][] xy=new float[num][2];
  for(int i=0;i<num;i++){
  angle[i]=random(360);
  
  }
  for(int i=0;i<num;i++){
  petals.add(new petal(angle[i],d,cx,cy));
  }
  }
  void display(){
  
  for(int i=0;i<petals.size();i++){
  petal pt=(petal)petals.get(i);
  pt.display();
  }
  bud.display();
  }
  
}


class petal{
  //float n;
  //float sa;
  float length;
  ArrayList branches;
  float sa;
  petal(float sa,float d,float cx,float cy){
  this.sa=sa;
  length=d;
  branches=new ArrayList();
  createPetals(sa,length,cx,cy,0);
  }
  void createPetals(float sa,float l,float cx,float cy,int c){
  int count=c;
  float[][] points=new float[8][2];
  points[0][0]=points[1][0]=cx;
  points[0][1]=points[1][1]=cy;
 // float delta=random(0,20);
 points[7][0]=points[6][0]=cx+l*cos(radians(sa));
  points[7][1]=points[6][1]=cy+l*sin(radians(sa));
 for(int i=2;i<6;i++){
 float delta=random(-5,5);
 points[i][0]=cx+l/5*i*cos(radians(sa+delta));
  points[i][1]=cy+l/5*i*sin(radians(sa+delta));
 }
 
  
  branches.add(new Branch(points));
  
  count+=1;
  if(count<5){
  float a=random(-40,40);
  createPetals(sa-a,l/3,points[4][0],points[4][1],count);
  createPetals(sa+a,l/5,points[5][0],points[5][1],count);
 float b=random(-30,30);
//createPetals(sa-b,l/3,points[3][0],points[3][1],count);
  createPetals(sa-b,l/4,points[4][0],points[4][1],count);
  }
 
    }
 void display(){
 for(int i=0;i<branches.size();i++){
 Branch br=(Branch)branches.get(i);
 br.display();
 }
 }

}
///// Bud
class Bud{
  float d;
  int numb;
  float[] p;
  float[] a;
  float x;
  float y;
Bud(float x,float y,float d,int num){
this.d=d;
this.x=x;
this.y=y;
numb=2*num;
p=new float[numb];
a=new float[numb];
for(int i=0;i<numb;i++){
p[i]=random(2,40);
a[i]=random(360);
}
}
void display(){
fill(10,280);
noStroke(); 
ellipse(x,y,d,d);
  
  for(int i=0;i<numb;i++){
    strokeWeight(0.8);
    stroke(10,200);
    line(x+(d/2+p[i])*cos(radians(a[i])),y+(d/2+p[i])*sin(radians(a[i])),x,y);
    noStroke();
  fill(10,200);
  ellipse(x+(d/2+p[i])*cos(radians(a[i])),y+(d/2+p[i])*sin(radians(a[i])),d/20,d/20);
  }
}
}
/////  Branch
class Branch{
float[][] points;
Branch(float[][] points){
this.points=new float[8][2];
arrayCopy(points,this.points);
}
void display(){
noFill();
    stroke (0);
    strokeWeight(0.6);
    beginShape();
    for (int i = 0; i < points.length; i++)
    {
     curveVertex (points [i] [0], points [i] [1]);
    }
    endShape();
}
}


