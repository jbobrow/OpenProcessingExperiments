
int J=-450;//defines J
int U=450;//defines U
int A1=-450;//defines A
int A2=-450;//defines A
int N=450;//defines N 
 
 void setup(){
  background(150, 21, 255);//color of background(purple)
  size(700,600);//size of canvas
  noStroke();//no strok
 }
 void draw(){
  names(100, 200);//calls name
 }
 color pick(){
  return color(random(255), random(255), random(255));// chooses random color
}
 void J(int x, int y, color c){
  J=J+8;//adding 1 to J
  J=min(0, J);//where it has to stop
 fill(c);
 rect(180+J, 170, 30, 200);//left part of J
 rect(100+J, 340, 100, 30);//bottom part of J
 rect(100+J, 310, 30, 30);//right part of J
 }
 void U(int x, int y, color c){
 U=U-8;//subtract 1 from U
  U=max(0, U);//where it has to stop
 fill(c);
 rect(220, 250+U, 30, 90);//right part of U
 rect(220, 340+U, 120, 30);//middle part of U
 rect(310, 250+U, 30, 90);//left part of U
 }
 void A(int x, int y, color c){
  A1=A1-8;//subtract 1 from A1
  A2=A2+8;//add 1 to A2
  A1=max(0, A1);//where it has to stop
  A2=min(0, A2);//where it has to stop
 fill(c);
 rect(350+A1, 250+A2, 90, 30);//top part of A
 rect(350+A1, 250+A2, 30, 120);//left part of A
 rect(350+A1, 310+A2, 90, 30);//bottom part of A
 rect(440+A1, 250+A2, 30, 120);//right part of A
 }
 
void N(int x, int y, color c){
 N=N-8;//subtract 1 from N
 N=max(0, N);//where it has to stop
 fill(c);
 rect(480+N, 250, 30, 120);//left part of U
 rect(510+N, 250, 90, 30);//top part of U
 rect(570+N, 250, 30, 120);//right part U
}
 
 void names(int x, int y){
    background(150, 21, 255); 
   J(180+x, 170+y, pick());
   U(220+x, 250+y, pick());
   A(350+x, 250+y, pick());
   N(480+x, 250+y, pick());
 }

