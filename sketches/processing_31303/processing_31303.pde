
float x;
float y ;
float dia = 50;
float radius = dia/2;
color col = color(200);
 

void setup(){
  size (500,500);
  background (255,255,255);
}
void draw(){
  x  = width/2;
  y = height/2 ;
  fill (255);
  rect (x,y,510,100);
    if(mousePressed == true) { 
      ellipse (x,y,100,100); 
      background (0,0,0);
    if(mouseX > x-radius && mouseY< x+radius && mouseY > y-radius && mouseY < y+radius){
    col = color(200,100,30);
    }
    }
    }
20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

                
                
