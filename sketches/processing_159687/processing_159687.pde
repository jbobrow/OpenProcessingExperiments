

int x = 0;
int y = 0;
int R = 0;
int G = 0;
int B = 0;
int diameter = 0;


int count = 0;
int state = 0;
int strange = 0;

void setup()
{
 size(700,700);
 background(255);
 smooth(); 

 ellipseMode(CENTER);
}

void draw()
{
  count++;
  if(count > 30)
  {
   count = 0;
   state++;
   strange++;
   if(state > 10)
     {
       state = state * -1;
       
       println("WEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE!!!");
     }  
  }

   fill(255,0,0); 
   stroke(0);
   rect(0,0,width/3,height/3);
   //rect(width/3,height/3,width/3,height/3);
   rect(2*width/3,2*height/3,width/3,height/3);  
   fill(0,255,0);
   stroke(0);
   rect(width/3,0,width/3,height/3);
   rect(2*width/3,height/3,width/3,height/3);
   rect(0,2*height/3,width/3,height/3);  
     fill(0,0,255);
   stroke(0);
   rect(2*width/3,0,width/3,height/3);
   rect(0,height/3,width/3,height/3);
   rect(width/3,2*height/3,width/3,height/3);  
  R = int(random(0,255));
  G = int(random(0,255));
  B = int(random(0,255));
  //transparency = int(random(0,255));
  
  x = int(random(width/3,2*width/3));
  y = int(random(height/3,2*height/3));
  
  diameter = abs(state * 25);
  
  noStroke();
  fill(R,G,B);
  ellipse(x,y,diameter,diameter);

  strokeWeight(abs(state*10));

  
  
  

}


