
//println("hello world!");
int x1=200, y1=300;
int w1=200, h1=200;


void setup(){
size(600,600);
background(50);
pacMan();
}


void draw()
{
  pacMan();
  /*strokeWeight(10);
  float m=map((mouseX+mouseY),0,1200,0,255);
  //stroke((mouseX+mouseY)/4);p((mouseX+mouseY),0,1200,0,255);
  stroke(m);
  line(mouseX, mouseY, pmouseX, pmouseY); */
  

  

 }


void pacMan(){
  int mx=mouseX-100, my=mouseY-50;
background(50);
fill(255,186,0);
noStroke();
arc(mx,my,w1,h1,radians(random(50)),radians(330));

stroke(0);
fill(50);
ellipse(mx+15,my-50,15,15);
fill(200);
ellipse(mx+17,my-50,5,5);

}




