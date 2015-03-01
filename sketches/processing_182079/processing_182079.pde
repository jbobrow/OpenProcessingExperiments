
int tx;                //trianlge locations x and y
int ty;                
int cx;                //circle locations, x and y
int cy;                
int sx;                 //square locations x and y
int sy;                 
int distance1;          //Distance from circle to triangle
int distance2;         //Distance from square to triangle
void setup(){
  size(400,400);                      //size of window
  ellipseMode(CENTER);                  //ellipses
  rectMode(CENTER);                    //rectangles
  findCoffee();                  // call coffee function
}
void draw(){if(mousePressed){findCoffee();}}           // if mouse pressed, will call function find coffee
void findCoffee(){
  background(90);                  //set the background as white
  for(int b=40;b<400;b+=40){       
  for(int i=40;i<400;i+=40){          // Grid placement.
   line(b,0,b,400);line(0,i,400,i);
  }
  }
 tx = int(random(1,9)); tx *=40;           //random locations
 ty = int(random(1,9)); ty *=40;            //random locations
 sx = int(random(1,9)); sx *=40;              //random locations
 sy = int(random(1,9)); sy *=40;
 cx = int(random(1,9)); cx *=40;
 cy = int(random(1,9)); cy *=40;
 cityBlockDistance(); //Calculate distances
 if(distance1<distance2){fill(0,0,255);}else{fill(255);}              //distance check circle
 ellipse(cx,cy,20,20);
 if(distance2<distance1){fill(0,0,255);}else{fill(255);}              //distance check square
 rect(sx,sy,20,20);                                     
 fill(0,128,0); triangle(tx-5,ty+5,tx,ty-5,tx+5,ty+5);
 println("Circle distance:"+distance1+", Square distance:"+distance2+"");
}
void cityBlockDistance(){
 distance1=abs(cx-tx)+abs(cy-ty);distance1/=20;        //calculates distance of circle to triangle
 distance2=abs(sx-tx)+abs(sy-ty);distance2/=20;         //Calculates distance of square to triangle
}
