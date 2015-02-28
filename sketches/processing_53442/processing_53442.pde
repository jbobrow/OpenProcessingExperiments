
//sin smooth curve
int threshold;
int prevMillis=0;
float t = 0.0;
float angle = 0.0;

void setup()
{
  size(500,500);
  smooth();
  
  threshold =10;
   
}


void draw()
{ 
  background(255);
  noStroke();
  
   
  
  angle+=0.02;//the speed will change by this integer
  
  translate(width/2,height/2);
  
  /*
  float sinVal = 250+sin(angle)*10;//*x offset degree, +y offset starting point
                               //cos will swing in alittle bitdiff pace
                               //tan totally diff
                               
                              
  println(sinVal);
  
 
  ellipse(30,0,sinVal,sinVal);
  */
  
  if(millis() - prevMillis >= threshold)
  {
  
  float d = dist(width/2,height/2,mouseX,mouseY);

  float sinVal = sin(angle)*d;
 // ellipse(0,sinVal,30,30);

  
  fill(255,0,0);
  float cosVal = cos(angle)*d;
 
  ellipse(sinVal,cosVal,30,30);//sinval cosval make circle
  ellipse(sinVal+d,cosVal+d,30,30);
  ellipse(sinVal+d,cosVal,30,30);
  ellipse(sinVal,cosVal+d,30,30);
      ellipse(sinVal-d,cosVal-d,30,30);
    ellipse(sinVal-d,cosVal,30,30);
    ellipse(sinVal,cosVal-d,30,30);
     ellipse(sinVal,cosVal*(d*0.02),30,30);
         ellipse(sinVal,cosVal*(d*0.03),30,30);
              ellipse(sinVal*(d*0.03),cosVal,30,30);
  
    
  ellipse(cosVal,sinVal,30,30);
   ellipse(cosVal+d,sinVal,30,30); 
   ellipse(cosVal-d,sinVal,30,30);
     ellipse(cosVal,sinVal+d,30,30);
       ellipse(cosVal,sinVal-d,30,30);
  /*
    beginShape();
  for (int i=0;i<360;i+=40){
  

float y = sin(radians(i))*100;//other than circle, ref to math equations!!
float x = cos(radians(i))*100;
 fill(255,0,0);
//ellipse(x,y,30,30);
x+=random(-4,4);
y+=random(-4,4);
vertex(x,y);
  }
  endShape();
*/

  }
}



