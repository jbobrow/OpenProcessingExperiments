
  //barquito anochecer
int barquitoX;
 
void setup(){
  size(800,600);
  barcoX=10;
   
}
 
void draw(){

  background(200,20,800);
  fill(0,0,124);
  rect(0,370,800,600);
  noStroke();
  smooth();
  fill(90,50,10);
  quad(barquitoX,400,barquitoX,350,barquitoX+200,350,barquitoX+150,400);
  fill(290,400,100);
 triangle(barquitoX+50,340,barquitoX+90,100,barquitoX+190,340);
 ellipse(50,50,90,90);
  barquitoX=barquitoX+1;
   
}

