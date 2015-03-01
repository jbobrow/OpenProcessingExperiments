
int count;

void setup()

{
  size(400,400);
  count = 0;
}

void draw()

{
  if (count%50 == 49)
  
  {
    
    fill(random(256),random(256),random(256));
  
  }
   ellipse((width/2)-(count%500),(height/2)-(count%1000),width-(count%150)*100,height-(count%200)*100); 
   
   count ++;
}


