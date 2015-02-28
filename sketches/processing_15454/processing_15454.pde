

int centerx;
int centery;
int x=0;
int y=0; 

void setup()
{
size (400, 400);
smooth();
frameRate(30);
}

void draw()
{
  centerx=width/2;
  centery=height/2;
  x=x+11;
  y=y+5;
 
  background (0);
  
   fill(random (225),random(225),random(225));
   ellipse(width/2,height/2,random(width),random(height)); 
   fill(random (225),random(225),random(225));
   ellipse(width/2,height/2,random(width),random(height)); 
   fill(random (225),random(225),random(225));
   ellipse(centerx,centery,x,y);
   fill(0);
   ellipse(centerx,centery,x-5,y-5);
   fill(random (225),random(225),random(225));
   ellipse(centerx,centery,x-10,y-10);
   fill(0);
   ellipse(centerx,centery,x-15,y-15); 
   fill(random (225),random(225),random(225));
   ellipse(centerx,centery,x-20,y-20);
   fill(0);
   ellipse(centerx,centery,x-25,y-25);  
   fill(random (225),random(225),random(225));
   ellipse(centerx,centery,x-30,y-30);
   ellipse(centerx,centery,x-35,y-35); 
  
   if (x>250) {x=0;}
   if (y>250) {y=0;}
   
}


void keyPressed(){
  if (key == 'p'){
  noLoop();}   
if (key == 'r'){
    loop();}
 
}



