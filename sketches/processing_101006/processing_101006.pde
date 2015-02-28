
int x,y;
int d=100;
void setup()
{
  size(500,500);
  smooth();
  background(#645520);
  x=width/2;
  y=height/2;
  fill(#CB3535);
  ellipse(width/2,height/2,d,d);
  
}

void draw()
{
  ellipse(x,y,d,d);
}

void keyPressed()
{
  
  if(key== CODED)
  { 
    background(#645520);
    if(keyCode==UP){
       y-=10;
       if(y<(d/2)){
         y=height-d/2;
       }
    }
    if(keyCode==DOWN){
      y+=10; 
      if(y>(height-(d/2))){
         y=d/2;
       }
    }
    if(keyCode==LEFT){
      x-=10;
      if(x<(d/2)){
        x=width-d/2;
      }
    }
    if(keyCode==RIGHT){
      x+=10;
      if(x>(width-(d/2))){
        x=d/2;
      }
    }
  }
}

void keyReleased()
{
  switch(key)
  {
    case 'r' : 
      
      fill(255,0,0);
      draw();
      break;
    case 'b' :
      fill(0,0,255);
      draw();
      break;
    case 'g' :
      fill(0,255,0);
      draw();   
      break;
     case 'i' :
       background(#645520);
       d+=10;
       d= constrain(d,10,310);
       draw();
       break;
     case 'd' :
       background(#645520);
       d-=10;
       d= constrain(d,10,310);
       draw();
       break;
    default:
      break;
  }
 }





