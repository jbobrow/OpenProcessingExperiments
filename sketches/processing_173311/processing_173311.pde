
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}void setup()
{
  size (2000,1000);
  smooth();
  noStroke();
  ellipseMode(CENTER);
}

void draw()
{
  {
  fill(255,255,255);  
  text("Click mouse for big circles, Press a key to refresh, Hold mouse key and keyboard down for crazyness!!! ", 1020, 20);
  }
  fill(0,0,0,4);
  rect(1000,0,width,height);
  fill(random(255),random(255),random(255));
  ellipse(mouseX,
  mouseY, 100, 100);
  ellipse(mouseY, mouseX, 100, 100);
  {
     if(keyPressed) 
     background(random(255),random(255),random(255));
   }
  if(mousePressed)
  {
    fill(random(255),random(255),random(255));
    ellipse(randomStuff(mouseX),mouseY,1800,1800); 
    sampleMethod(5);  
  }
}


{
     if(keyPressed) 
     background(random(255),random(255),random(255));
   }

float randomStuff(int a)
{
  if (a < 50)
  {
    return a;
  }
  else
  {
    return random(500);
  }
}

void sampleMethod(int a)
{
  fill(random(255),random(255),random(255));
  ellipse(a,a,50,a);
}
