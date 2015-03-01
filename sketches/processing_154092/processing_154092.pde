
int counter = 0;

void setup()
 {  //setup function called initially, only once
size(600,600);rect(0,0, width, height);



}

void draw() 
{  //draw function loops 
fill(counter,255-counter,255-counter)
rect(0,0,width,height);
fill(counter);
ellipse(300,300,counter,counter);
counter=mouseX;
if (counter >= 255)
{
counter = +10;
 if(counter >= 300)
  {
  textSize(32);
    fill(255);
  text("You Know Nothing Jon Snow",300,300);
 
  }
rect(0,0, width, height);

 } 
 rect(counter,counter,50,50);
 rect(550-counter,counter,50,50);
 rect(counter,550-counter,50,50);
 rect(550-counter,550-counter,50,50);
  


  
}
