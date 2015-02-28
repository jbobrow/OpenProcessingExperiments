
void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
   pushMatrix();
  noStroke();
  fill(123,234,12,120);
 rect(50,50,400,100); 
 
 noStroke();
 translate(0,50);
 rotate(PI/30);
 fill(13,134,12,120);
 rect(50,50,400,100);
 
  noStroke();
 translate(0,50);
 rotate(PI/30);
 fill(93,114,230,120);
 rect(50,50,400,100);
 
   noStroke();
 translate(0,50);
 rotate(PI/40);
 fill(193,114,123,120);
 rect(50,50,400,100);

 
 popMatrix();


}


