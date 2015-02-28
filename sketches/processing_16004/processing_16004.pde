
void setup() {
  size(600,600);
  background(255);
  smooth();
}
void draw() {
  cheese(10,0,1);
  cheese(100,400,0.4);
  cheese(600,50,0.9);
}

void cheese(int x, int y,float a){

  translate(x,y);
  scale(a);
 //cheese cake case
  

  stroke(#98D1FF);
  fill(#D6FFF8);
  
triangle(280,190,460,290,10,360);
  
triangle(280,10,460,140,10,210);

line(280,10,280,160);

quad(10,210,460,140,460,290,10,360);


    //inside : cake
  
  fill(#FFC74D);
  noStroke();
triangle(280,60,440,170,30,240);
triangle(280,160,440,270,30,340);
fill(#F5B73B);
quad(30,240,440,170,440,270,30,340);


//cheese circle

fill(#C17802);
ellipse(400,230,30,30);
ellipse(190,260,60,60);
ellipse(140,250,30,30);
ellipse(375,155,40,40);
ellipse(295,110,30,30);
ellipse(70,290,40,40);
ellipse(260,200,40,40);
arc(100,328,30,30,radians(170),radians(350));
ellipse(140,190,30,30);
ellipse(300,170,30,30);
ellipse(290,110,40,40);
ellipse(270,160,20,20);
arc(210,110,40,40,radians(-35),radians(145));
arc(300,294,60,60,radians(170),radians(350));
 

}












