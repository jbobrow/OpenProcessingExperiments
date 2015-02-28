
int x=100;

void setup(){
  background(150,245,255);
  size(400,400);
}
  

  
void draw (){
   
   background(100,255,200);
   //grass
   fill(50,137,60);
   noStroke();
   rect(0,200,400,200);
   //outer green
   strokeWeight(6);
   stroke(0,100,0);
   fill(0,100,0);
   ellipse(20,350,500,120);
   //inner green
   noStroke();
   fill(113,198,113,100);
   ellipse(40,350,300,60);
  //flag
   stroke(0);
   strokeWeight(7);
   line(20,50,20,350);
   fill(255,50,50);
   triangle(20,50,100,100,20,100);
   //ball
  strokeWeight(1);
  fill(255);
  stroke(0);
  frameRate(50);
  if (mousePressed==false){
    if((x>width)||(x<0))
    {
      x=x*-1;
    }
      ellipse(x,350,10,10);
    x+=1;
  }
 if (mousePressed==true)
  {
    if((x>width)||(x<0))
    {
      x=x*-1;
    }
      ellipse(x,350,10,10);
    x=x-1;
  }
}

