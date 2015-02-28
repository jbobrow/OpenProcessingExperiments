
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
}int [] posy={60,height/2,80,130,180};
int x=20,speed=2;
void setup()
{
size(200,200);
background(0);
}

void draw()
{
  if(mouseX>20 &&mouseX;<180 &&mouseY;<180)
 { 
  background(0); 
   for (int i=0; i<posy.length;i++)
      rect(x, posy[i],10,10);
   if(x>180 ||x<20)
   {
     speed=speed*-1;
   } 
   x=x+speed;  
 }
 else
 {
  background(0);
 }
}
