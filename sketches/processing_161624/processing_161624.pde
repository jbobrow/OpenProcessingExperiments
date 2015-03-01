
float jitter;
float angle;

void setup() {
 size(1600,1600);
}

void randomTri(int x, int y, int offset, float rotate){
  

 shapeMode(CENTER);
  rotate(rotate);
  
  
  fill(0,0,0);
  triangle(x,y-offset,
            x-sqrt(3)*offset/2,y+offset/2,
                  x+sqrt(3)*offset/2,y+offset/2);      
    triangle(x,y-offset+offset*2,
            x-sqrt(3)*offset/2,y+offset/2+offset*2,
                  x+sqrt(3)*offset/2,y+offset/2+offset*2);  
                      triangle(x,y-offset-offset*2,
            x-sqrt(3)*offset/2,y+offset/2-offset*2,
                  x+sqrt(3)*offset/2,y+offset/2-offset*2); 
}



void draw()
{
  if(mousePressed)
  {
     ellipse(width/2,height/2,30,30);//in fact useless
  }else{
    switch(frameCount%5)
    {
      case 0 : background(255,255,3);
        break;
      case 1 : background(234,54,31);
        break;
      case 2 : background(234,0,200);  
        break; 
      case 3 : background(134,154,31);
         break;
      default : background(0,54,4);
      break;
    }

    randomTri(mouseX,mouseY,200,radians(0));
  }
}

