
float counter = 0;

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
  
  ellipse(200+sin(millis()/1000.0)*20, 100, 150, 100);
  ellipse(250+sin(millis()/1000.0)*20, 100, 80, 60);
  ellipse(130+sin(millis()/1000.0)*20, 100, 90, 70);

  translate(width/4, height/2);
  rectMode(CENTER);
  for (int i=0; i<100; i++ )
    // for(int i=0;i<360;i+= 100)
  {
  pushMatrix();
   if (mouseButton == LEFT)
  

  rect (170,150,10,10);
  if (mouseButton == LEFT)
  rect (170,160,10,10);
  if (mouseButton == LEFT)

  rect(175,170,20,10);
    if (mouseButton == LEFT)
  rect(180,180,10,50);
    
    if (mouseButton == LEFT)
 
{  

  
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

