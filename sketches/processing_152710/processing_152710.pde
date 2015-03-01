
int i, fase=0;

void setup(){
  size(800, 600);
  frameRate(30);
  smooth();
  fill(#7011A5);
}

void draw(){
  background(#E31919); 
  line(20, 300, 780, 300);
  line(40, 40, 40, 560);
  //ellipse(40, 300, 1, 1);
  //ellipse(42, sin(42-40)+300, 1, 1);
  //ellipse(44, sin(44-40)+300, 1, 1);
  for (i=40; i<=780; i=i+2){
    //ellipse(i, 50*sin(3.1*i-40)+300, 1, 1);
    //ellipse(i, 50*sin(3.1*i-40+PI/16)+300, 1, 1);
    //ellipse(i, 50*sin(3.1*i-40+PI/16*fase)+300, 5, 5);
    //ellipse(i, 50*sin(3*i-40)*sin(3.3*i-40+PI/16*fase)+300, 5, 5);//AM
    ellipse(i, 50*sin(3*sin(3.1*i-40)-40+PI/16*fase)+300, 5, 5);//FM
  }
  fase++;
}


