
void setup()
{
  int s = 800;
  size(800,800);
  background(255);
  noLoop();
}

void draw ()
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
  float rd = 0;
  float gr = 0;
  float bl = 0; 
  int opacity = 0;
  
while(x<rot/2)
  {
    b = 0;
    a = 800;

    rd=random(255);
    gr=random(255);
    bl=random(255);

    while(b<c)
    {

      fill(rd,gr,bl,opacity);
      stroke(rd,gr,bl);
      
      rotate((PI/4));
      rect(a,a,10,10);
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


