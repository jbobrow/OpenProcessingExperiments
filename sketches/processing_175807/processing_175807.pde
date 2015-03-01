
float counter = 0;
 int value = 0;
void setup()
{
  size(400, 400);
}
 
void draw()
{
 
  background(0, 0, 100);
 
  rect (0, 400, 800, 90);
  fill(155);
  smooth(3);
 
  counter += 0.001;
 


 
 
  float step = map(10, 0, width, 10, 100);
  float amplitude = map(height, 100, width, 20, 40);
   
 
   

{
  pushMatrix();
   
 {
   text("Thunder",10,10,10,10);
textSize(20);
fill(100,0,0);
 }


  popMatrix();





}

 pushMatrix();
 fill(0);
 textSize(20);
  text("Cloud",200+sin(millis()/1000.0)*20, 100, 60, 100);
 
  text("Sky",250+sin(millis()/1000.0)*20, 100, 120, 70);
 
  text("Heaven",130+sin(millis()/1000.0)*20, 100, 80, 70);
 text("Rain",130+sin(millis()/1000.0)*20, 130, 70, 120);
 text("Windy",130+sin(millis()/1000.0)*20, 150,100,100);
  text("Raindrops",250+sin(millis()/1000.0)*20, 150, 140,50);
  text("Thunder",250+sin(millis()/1000.0)*20, 120, 110, 80);
 
 popMatrix();
 
 
  translate(width/4, height/2);
  rectMode(CENTER);
  for (int i=0; i<100; i++ )
   
  {
 
 
    pushMatrix();
 
    translate(i*step, cos(counter+i)*amplitude);
    translate(-200, 100);
    stroke(0, 155, 0);
    strokeWeight(10);
 
    line (100+sin(millis()/1000.0)*10, 10, 100, 100);       
 
    stroke(10);
 
    popMatrix();
 
 
    counter += 0.001;
  }
  noStroke();
  fill(0, 155, 0);
}

