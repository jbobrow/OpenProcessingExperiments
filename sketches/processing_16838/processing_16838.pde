
void setup(){
  size(600,600);
  smooth();
}
void draw(){
  background(255);
  doo(-60, 70,int(random(58, 88)), 1);  
  doo(380, -100, int(random(58, 88)),0.5);  
  doo(300, 1000, int(random(58, 88)),0.4);
}  


  void doo(int x, int y,int a, float s){  
translate(x, y);  
scale(s);  

  fill(253,177,135);
  strokeWeight(4);
  ellipse(105,310,85,95);
  fill(253,177,135);
  strokeWeight(4);
  ellipse(495,310,85,95);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(105,315,45,45);
  fill(253,177,135);
  strokeWeight(3);
  ellipse(495,315,45,45);
  
  fill(253,177,135);
  strokeWeight(5);
  ellipse(300,300,400,400);
  
  fill(0);
  strokeWeight(7);
ellipse(170,230,8,8);
fill(0);
  strokeWeight(7);
ellipse(430,230,8,8);

fill(167,121,105);
strokeWeight(2);
ellipse(280,245,15,20);
fill(167,121,105);
strokeWeight(2);
ellipse(320,245,15,20);

strokeWeight(2);
line(280,315,320,315);

fill(246,113,75);
  strokeWeight(1);
ellipse(160,340,85,95);
fill(246,113,75);
  strokeWeight(1);
ellipse(440,340,85,95);

strokeWeight(4);
line(305,70,300,100);
strokeWeight(4);
line(135,140,158,158);
strokeWeight(4);
line(220,115,200,90);
strokeWeight(4);
line(85,220,110,235);
strokeWeight(4);
line(440,120,420,140);
strokeWeight(4);
line(460,180,490,170);
strokeWeight(4);
line(490,230,520,220);

strokeWeight(1);
line(140,310,170,315);
strokeWeight(1);
line(135,335,165,333);
strokeWeight(1);
line(140,360,170,350);
strokeWeight(1);
line(460,310,430,315);
strokeWeight(1);
line(470,338,440,333);
strokeWeight(1);
line(460,360,430,350);

}


