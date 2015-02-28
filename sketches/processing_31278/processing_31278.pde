
void setup()
{
  size(800,800);
  background(255);
  noLoop();
}
  
void draw()
{
  //strokeWeight(2);
  stroke(0);
 // fill(0,5);
  noFill();

  float a;
  int b = 0;
  rectMode(CENTER);
  translate(width/2,height/2);
  int c = 10;
  float x = 0;
  float rot = 128;
  float r = PI/rot;
  float dif = 50;
  float rd = random(50+dif,205-dif);
  float gr = random(50+dif,205-dif);
  float bl = random(50+dif,205-dif); 
  float rrd;
  float rgr;
  float rbl;
  int opacity = 0;
  float e;
  stroke(0,60);
  
while(x<rot/3)
  {
    b = 0;
    a = 800;
    e = 800;
    
    while(b<c)
    {

      rrd = random(rd-dif,rd+dif);
      rgr = random(gr-dif,gr+dif);
      rbl = random(bl-dif,bl+dif);
      
      fill(rrd,rgr,rbl,opacity);
      stroke(rrd,rgr,rbl,80);
     
      rotate((PI/4));
      ellipse(0,0,e,e/3);
      e = e/1.5;
      /*
      rotate((PI/4));
      rect(0,0,a,a);
      a = (sqrt(a*a+a*a))/2;
      */
      fill(255-rd,255-gr,255-bl,opacity);
   //   stroke(255-rd,255-gr,255-bl);
      
  //    rotate((PI/4));
  //    rect(a,a,a,a);
  //    a = (sqrt(a*a+a*a))/2;
      
      b=b+1;
    }
    strokeWeight(1);
    rotate(r);
    x = x+1;
  /*  
    b = 0;
    a = 800;

    rd=random(255);
    gr=random(255);
    bl=random(255);

    while(b<c)
    {

      fill(rd,gr,bl,opacity);
   //   stroke(rd,gr,bl);
      
      rotate((PI/4));
      rect(0,0,a,a);
      a = (sqrt(a*a+a*a))/2;
      
      fill(255-rd,255-gr,255-bl,opacity);
   //   stroke(255-rd,255-gr,255-bl);
      
  //    rotate((PI/4));
  //    rect(a,a,a,a);
  //    a = (sqrt(a*a+a*a))/2;
      
      b=b+1;
    }
    strokeWeight(1);
    rotate(r);
 //   rotate(r);
    x = x+1;
    */
  }
  
}


