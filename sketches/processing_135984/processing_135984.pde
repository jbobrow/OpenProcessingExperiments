

int x = 100;
void setup(){
  size (400, 400);

    background (0,100);
}
void draw (){
  textSize(50);
text("Hello World",x,x*2); 
noStroke();
fill(255);
ellipse(x*4, x*0.4, x*0.3, x*0.3);
ellipse(random(400), random(400), 5,5);
fill(0,50,255);
ellipse(x*5, x*5, x*5, x*5);

fill(250,250,50);
ellipse(x*0.1, x*0.1, x, x);



}


