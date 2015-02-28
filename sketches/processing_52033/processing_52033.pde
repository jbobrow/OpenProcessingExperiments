
float v;

float x;
float y;




void setup()
{
  size(500, 500);
  smooth();
}




void draw()
{
  background(240);
  //x,y =center
  x = width/2;
  y = height/2;

  v = 50+(mouseX/10);

   float v2 = map(v, 0, 120, 0, 255);


  strokeWeight(v*0.2);
  fill(random(v*5));
  ellipse(x*0.7, y*0.6, v, v);
  fill(0);
  ellipse(x*0.7, y*0.6, v*0.1, v*0.1);

  strokeWeight(v*0.1);
  fill(random(v*5));
  ellipse(x*1.4, y*0.7, v*0.8, v*0.8);
  fill(0);
  ellipse(x*1.4, y*0.7, v*0.5, v*0.5);

  //hair
  
   
  strokeWeight(v*0.01);


  for (int j=0 ; j<width/2 ; j+=v*0.1) {
    line(j, 0, 0, height);
  }

  /*
line(250,0,70,500);
   line(70,500,130,0);
   line(135,0,70,500);
   line(140,0,70,500);
   line(144,0,70,500);
   line(149,0,70,500);
   line(156,0,70,500);
   line(160,0,70,500);
   line(170,0,70,500);
   line(200,0,70,500);
   line(210,0,70,500);
   line(220,0,70,500);
   line(240,0,70,500);
   */



  for (int i=250 ; i<width ; i+=v*0.2) {
    line(i, 0, width, height);
  }



  /*
line(250,0,width,height);
   line(255,0,width,height);
   line(260,0,width,height);
   line(290,0,width,height);
   line(360,0,width,height);
   line(400,0,width,height);
   line(280,0,width,height);
   line(330,0,width,height);
   line(390,0,width,height);
   line(410,0,width,height);
   line(430,0,width,height);
   line(420,0,width,height);
   line(455,0,width,height);
   line(310,0,width,height);
   line(320,0,width,height);
   line(370,0,width,height);
   line(335,0,width,height);
   line(450,0,width,height);
   */

  //mouth

  fill(0);
  strokeWeight(v*0.05);
  quad(x*0.8, y*0.9, x*0.7, v*4.75, v*4, v*4.5, x*1.16, y*0.96);

  strokeWeight(v*0.03);
  fill(240);
  quad(x*0.74, v*4.4, x*0.72, v*4.8, v*4, v*4.7, v*3.75, v*4.38);
  
  /*
  x = x*0.8;
  y = y*1.76;
  line(x, y, x, y*1.085);
  line(x*1.2, y, x*1.2, y*1.085);
  line(x*1.3, y, x*1.3, y*1.08);
  line(x*1.5, y, x*1.5, y*1.08);
  line(x*1.6, y, x*1.6, y*1.075);
  line(x*1.75, y, x*1.75, y*1.07);
*/

  x=width/2;
  y=width/2;
  quad(x*0.8, y*0.96, x*0.84, v*3.85, x, v*3.83, x, y*0.96);
  quad(x, y*0.96, x*1.02, v*4.1, x*1.2, v*4.1, x*1.16, y*0.96);
}


