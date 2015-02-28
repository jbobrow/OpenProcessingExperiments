
int ben1=600;
 int ben2=500;
  int ben3=550;
  int ben4=580;
  int ben5=620;
  int ben6A=ben5-100;
  int ben6B=ben4-100;
  int ben7=600;
  int arm2=525;
  int arm4=535;
  int hoved3=40;

void setup(){
  size(1000,1000);

}
void draw(){
  background(0,250,0);
 
  //himmel
fill(0, 185, 234);
stroke(0, 185, 234);
rect(0, 0, 1000, 300);
  fill(0,0,0);
  stroke(0,0,0);
 
  //hoved
  ellipse(ben1,ben2,hoved3,hoved3);

 //arme
 line(ben1,arm2,ben5,arm4);
 line(ben1,arm2,ben4,arm4);
  
  //krop
  line(ben1,ben2,ben1,ben3);
  
  //ben
  line(ben1, ben3, ben4, ben7);
  line(ben1, ben3, ben5, ben7);
  
  ben1=ben1+1;
  ben4=ben4+1;
  ben5=ben5+1;
 
  //hus
stroke(250,0,0);
fill(206,95,21);
rect(150,200,150,200);

//tag
fill(250,13,0);
stroke(250,0,0);
triangle(225,100,150,200,300,200);

//sol
stroke(246, 255, 0);
fill(246, 255, 0);
ellipse(950, 50, 60, 60);
  
}
