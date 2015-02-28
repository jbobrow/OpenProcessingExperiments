
/*Prueba de mandala animada
 26 de febrero 2011*/

int x=0;
int y=0;
int vel=10;
void setup() {
  background(0);
  size(600,600);
}

void draw() {
frameRate(30);
  smooth();
  x=x+vel;
  y=y+vel;
  /*
            for(int i=0; i<height; i=i+10) {
   //x=x+10;
   line(i,0,width,i);
   // line(0,i,i,height);
   }
   fill(190,40);
   rect(0,0,width,height);
   */

  if(x>width)
  {
    vel = vel * -1;
  }
  else if(x<0)
  {
    vel = vel * -1;
  }
  //perimetrales
 //stroke(255);
    stroke(255,x,width/8-y);
  line(x,0,width,y);
  line(0,y,x,height);

  stroke(x,width/8-y,255); 
  line(x,0, 0,height-x);
  line(width,x,width-x,height);
  //centrales
  //  
  line(width,x, x,height-x);
  line(x,height-x,width-x,0);

  //line(x,height, 0,height-x);
  //line(0,x, x,height-x);

  fill(0,5);
  noStroke();
  rect(0,0,width,height);
}


