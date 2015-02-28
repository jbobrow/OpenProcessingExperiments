
void setup()
{
 background(87,179,252);
 size(600,600);
 smooth();
}

void draw()

{
   background(87,179,252);

   frameRate(5);

  stroke(255, 255, 255);
  strokeWeight(3);
 
  for (int i = 0; i < 20; i = i+1)
  {
    for (int j=0; j<20; j=j+1)
    {
      point(random(i*40, (i+1)*40), random(height));
    }
  }

  println(mouseX +" "+mouseY);
  noStroke();
  fill(255,255,255,67);
   ellipse(500,100,300,70);
   
   fill(255,255,255,50);
   ellipse(50,300,300,85);

    strokeWeight(5);

  stroke(0,0,0);
  line(300,170,0,150);
  
  stroke(0,0,0);
  line(300,170,600,150);
  
  stroke(250,215,13);
  strokeWeight(10);
  line(300,170,300,185);
  
  stroke(0,0,0);
  fill(0,0,0);
  rect(250,194,100,250,10); 
  
  noStroke();
  fill(250,215,13);
    rect(266,210,70,220,3);
    
    strokeWeight(2);
    fill(0,0,0);
    ellipse(300,250,60,60);
        ellipse(300,320,60,60);
            ellipse(300,390,60,60);

if(key=='r');
{
  fill(255,0,0);
   ellipse(300,250,60,60);

}
         



}
