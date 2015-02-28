
Smile smile1;
Smile smile2;
Smile smile3;
Smile smile4;

void setup(){
  size (500,500);
  smile1=new Smile(220, 100, #D60B0B);
  smile2=new Smile(245, 400, #0DD60B);
  smile3=new Smile(215, 200, #D6A00B);
  smile4=new Smile(350, 300, #3D0BD6);
  }
void draw(){
  background(#CFC7E5);
  smile1.move(1);
  smile2.move(2);
  smile3.move(3);
  smile4.move(4);
//  saveFrame("images/export-"+"#####.jpg");
//  if (frameCount>=6000){
//    exit();
//  }
if (key=='s' && keyPressed == true){
  saveFrame("images/export-"+"-####.tiff");
  }
}
 


  

class Smile{
   int m;
  float y;
  color c;
  float []x=new float[50];
  void setup(){
  for (int i=0; i<x.length; i++){
    x[i]=0;
  }
  }
  Smile(int smilex, int smiley, color smilecolor){
    m=smilex;
    y=smiley;
    c=smilecolor;
  }
  void move(int speed){
    m=m+2*speed;
    if (m>500){
      m=0;
    }

    fill(255,10);
stroke(0);
strokeWeight(5);
ellipseMode(CENTER);
for (int i=0; i<x.length-3; i++){
  x[i]=x[i+1];
  fill (c);
  ellipse(x[i],y,100,100);
ellipse(m, y, 100, 100);
ellipse(m-15, y-15, 5, 5);
ellipse(m+15, y-15, 5, 5);
arc(m, y, 75, 80, 0.2, PI - 0.2);

}
x[x.length-10]= m;
  }
}





