

  
void setup() {
  size(215, 215);

  stroke(255, 0, 255);
fill(150,0,255);
}

float px=0;
void draw (){

  px++;
   line(215,215,20,20);
   
  ellipse(px,200,30,30);
 ellipse(200,px,30,30);
 ellipse(200,200,40,40);
 ellipse(100,100,10,10);
 ellipse(50,50,10,10);
 rect(15,15,15,15);
 
 
}
