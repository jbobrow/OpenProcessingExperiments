
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
}
//
float x,y, w,h;
color col;

void setup()
{
 size(400,400);
 background(random(255),random(255),random(255));
 x= 0;
 y=height;
 w= width;
 h= height;
frameRate(50);
}
void draw()
{

//   fill(col);
//   rect(0,0,width,height);

 fill(random(255),random(255),random(255),10);
   rect(0,0,w,h);
     
   
   line(mouseX, mouseY, pmouseX-mouseY, random(width));
   
   stroke(random(255),random(255),random(255));
   fill(random(255),random(255),random(255));
   ellipse(mouseX,mouseY, mouseX*.1, mouseY*.3);
  
x=x+1;
 
}
