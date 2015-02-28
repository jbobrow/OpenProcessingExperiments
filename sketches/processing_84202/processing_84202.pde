
void setup (){
  size(600,200);
  smooth();
}



void draw ()
{
background(random(212,250),random(231,250),random(247,250));
fill(random(9,100));
strokeWeight(2);
triangle(random(300,300),random(10,20),random(30,40),random(50,60),random(70,80),random(90,10));
triangle(random(300,300),random(20,10),random(40,30),random(60,50),random(80,70),random(10,90));
triangle(random(300,300),random(15,25),random(35,45),random(55,65),random(75,85),random(95,105));

//ellipse
ellipse(random(500,300),random(30,40),random(40,30),random(4,3));
ellipse(random(300,500),random(30,40),random(40,30),random(4,3));
ellipse(random (300,300),random(30,40),random(40,30),random(4,3));


stroke(random(0,200));

}
