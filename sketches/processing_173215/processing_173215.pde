
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;



Minim minim;
AudioInput input;
*/float a,a2;

void setup()
{
  size(1000,500);
  /*minim= new Minim(this);
  input= minim.getLineIn(Minim.MONO,360);
  */a2=0;
}

void draw()
{
  background(239,21,255);
 /* println(input.left.get(0));
  a=input.left.get(0)*500;
  if(abs(a)>a2)
  {a2=abs(a);}
  //ease a2 back to zero at all times
  a2*=0.98;
  pushMatrix();
  translate(0,50);
   stroke(255,0,0);
   noFill();
  beginShape();
  for(int i=0; i<input.left.size();i++)
  {  
    float temp_y= input.left.get(i)*100;
    vertex(i*3.5,temp_y);
    
  }
  
  endShape();
  popMatrix();
  */pushMatrix();
  translate(width/2,height/2);
 noStroke();
 fill(142,71,0);
 rect(-500,-50,1000,300);
 fill(0,100);
 ellipse(20,150,900,100-a);
 fill(106,255,49);
 rect(-370,-180,800,350-a);
 fill(147,147,147);
  ellipse(-250,0,180,-180-a);
  stroke(0);
  line(-210,-80,-210,80-a2);
  line(-290,-80,-290,80-a2);
  line(-340,-10,-160,-10-a2);
  line(-325,-50,-175,-50-a2);
  line(-325,40,-175,40-a2);
  translate(50,0);
  noStroke();
  ellipse(250,0,180,-180-a2);
  
  noStroke();
  fill(255);
  rect(-100,-40,150,100-a2);
  
  popMatrix();
  triangle(450,210,450,308,360,308-a2);
  triangle(600,210,600,308,690,308-a2);
  fill(0,40);
  rect(350,190,340,118-a,6);
  pushMatrix();
  stroke(0);
  translate(1050,250);
   line(-210,-80,-210,80-a);
  line(-290,-80,-290,80-a);
  line(-340,-10,-160,-10-a);
  line(-325,-50,-175,-50-a);
  line(-325,40,-175,40-a);
  popMatrix();
  
  
 
}
