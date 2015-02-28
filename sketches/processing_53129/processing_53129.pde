
float x,y,z,s,angle,ellSize;

void setup(){
  size(500,500);
  background(0);
  x = 0;
  y = 0;
  angle = 0;
  smooth();
 
}
void draw(){
  
   x = cos(radians(angle)) * 100 + width/2;
   y = sin(radians(angle)) * 100 + height/2;
   z = tan(radians(angle)) * 100 + height/2;
   s = cos(radians(angle)) * 100 + width/2;
   ellSize = sin(x*y)*10;

   
   //blue circle
   noStroke ();
   fill(angle, 125, 50, 20);
   ellipse(x,y,10,10);
   angle++;
   //tan 1
   noStroke ();
   fill(75, angle, 150, 10);
   ellipse(x,z,10,10);
   angle++;
   noStroke ();
   fill(75, 25, angle, 10);
   ellipse(z,y,10,10);
   angle++;
   //tan 2
   noStroke ();
   fill(angle, 125, 150, 10);
   ellipse(x+100,z,10,10);
   angle++;
   noStroke ();
   fill(75, angle, 50, 10);
   ellipse(z,y+100,10,10);
   angle++;
   //tan 3
   noStroke ();
   fill(75, 125, angle, 10);
   ellipse(x-100,z,10,10);
   angle++;
   noStroke ();
   fill(angle, 125, 50, 10);
   ellipse(z,y-100,10,10);
   angle++;
   
   //tan 4
   noStroke ();
   fill(75, angle, 50, 10);
   ellipse(x,z,10,10);
   angle++;
   noStroke ();
   fill(25, 125, angle, 10);
   ellipse(z,y,10,10);
   angle++;
   //tan 5
   noStroke ();
   fill(angle, 125, 50, 10);
   ellipse(x+200,z,10,10);
   angle++;
   noStroke ();
   fill(75, angle, 50, 10);
   ellipse(z,y+200,10,10);
   angle++;
   //tan 6
   noStroke ();
   fill(25, 125, angle, 10);
   ellipse(x-200,z,10,10);
   angle++;
   noStroke ();
   fill(angle, 125, 50, 10);
   ellipse(z,y-200,10,10);
   angle++;
   
   //cos 1
   noStroke ();
   fill(75, angle, 50, 10);
   ellipse(x,y,10,10);
   angle++;
   noStroke ();
   fill(75, 125, angle, 10);
   ellipse(x,y,10,10);
   angle++;
   //cos2
   noStroke ();
   fill(angle, 125, 50, 10);
   ellipse(x+100,y,10,10);
   angle++;
   noStroke ();
   fill(75, angle, 150, 10);
   ellipse(x,y+100,10,10);
   angle++;
   //cos3
   noStroke ();
   fill(75, 125, angle, 10);
   ellipse(x-100,y,10,10);
   angle++;
   noStroke ();
   fill(angle, 125, 150, 10);
   ellipse(x,y-100,10,10);
   angle++;
   
   
   
   //float ellSize = 0;
  //for(int x= 0; x < width; x+=10){
    //for(int y= 0; y < height; y+=10){
    }
 // } 
//}  

