
int x;
int y;
void setup (){
   
  size (200,200);
  background (255);
 
}
 int l=20;
void draw() {
  //background (255);
   strokeWeight (0);
  fill (124, 252, 0);
  rect (0,190,200,10);
  while (x<80){
    line(10+x,100-10*x/9,20+x,90-10*x/9);
    line(95+x,5+10*x/9,105+x,15+10*x/9);
    x=x+5;
   
  }
  fill(255, 222, 173);
  rect(15,95,160,95);
  fill(255);
  rect(110,130,30,30);
  line (110,145,140,145);
  line (125,130,125,160);
fill (255,255,0);
  ellipse (30,30,30,30);
  fill (0,100,0);
  ellipse (180,190,20,20); 
  fill (0,255,127);
  ellipse (190,185,22,22);
  fill (0);
  rect (l,170,20,200);
  l++;
  }
