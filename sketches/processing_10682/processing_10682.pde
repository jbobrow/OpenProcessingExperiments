
class MyMonster
{
  float xp,yp;
  float w, h;
    int a,a2;
    float pf;
    float pf1;
    
    float b1;
    float b2;
    boolean isOver;
    boolean isPressed;
    
    
  void init()
  {
  xp = random (width);
  yp = random (height);
  
  w=100;
  h=100;
  
  a  =5; //auge
  a2 =4 ; 
  pf=0;
  pf1=-pf;
  
  b1=0;
  b2=-b1;
}
  
 void MyMonster ()
  
      {  
      noStroke();
      
      fill(0);
      ellipse(xp,yp,100,60);//körper
      fill(255);
      ellipse(xp-20,yp-5,a,a);//augen
      ellipse(xp-30,yp-10,a2,a2);
     
      fill(0);
      ellipse(xp+50,yp+10,10,10);//schwanz
      
      ellipse(xp+pf1+30,yp+28,8,12);//fuesse
      ellipse(xp+pf1-10,yp+28,8,12);
       
      ellipse(xp+pf+10,yp+28,8,12);
      ellipse(xp+pf-30,yp+28,8,12);
      
      pushStyle();
      beginShape();
      noFill();
      stroke(0);
      vertex (xp+50,yp+10);
      bezierVertex (xp+55,yp-30, xp+40,yp-60,   xp-80,yp-60);
      endShape();
      popStyle();
      
      pushStyle();
      beginShape();
      noFill();
      stroke(0);
      strokeWeight(0.5);
      vertex (xp-78,yp-60);
      bezierVertex (xp-78,yp-50, xp-78,yp-40,   xp-78+b1,yp-30+b2);
      endShape();
      popStyle();
      
      pushStyle();
 
      fill(0);
      stroke(0);
      strokeWeight(1);

    
  triangle(xp-73+b1, yp-30+b2,  xp-83+b1,yp-30+b2,  xp-78+b1,yp-26+b2);
   ellipse(xp-75+b1, yp-30+b2,  5,5);
   ellipse(xp-81+b1, yp-30+b2,  5,5);
      popStyle();
      
      
      
      }
      
       void testMouseOver ( float mx , float my )
    {
        isOver = (mx > xp-width/2) && (mx < xp+w+height/2) && (my > yp-width/2) && (my < yp+h+height/2);
    }
    
    void testMousePressed ( float mx, float my )
    {
        testMouseOver( mx, my );
        
        isPressed = isOver;
    }
    
    void moveIfPressed ( float xd, float yd )
    {
        if ( isPressed )
        {
            xp += xd;
            yp += yd;
            if(a<11){
            a=a+2;
            }
            if(a2<9){
            a2=a+2;
            }
            else{
            a=a;
            a2=a2;
            }
         pf=(random(+19-10));
         pf1=(random(+10-19));
         
         b1=(random(+10));
         b2=(random(+10));

         pushMatrix();
           fill(255);
           ellipse (xp-27,yp+15,10,10);
          popMatrix();
        }
     }
    
    void released ()
    {
        isPressed = false;
        a=5;
        a2=4;
        
        b1=0;
        b2=0;
    }
}

MyMonster mm;

void setup(){
   size (400,400);
   smooth();
   
   
   mm=new MyMonster();
   
   mm.init();
}

void draw() {

  background(255);
mm.MyMonster();
      
}

void mouseMoved ()
{
    mm.testMouseOver( mouseX, mouseY );
}

void mousePressed ()
{
    mm.testMousePressed( mouseX, mouseY );   
}

void mouseDragged ()
{
    mm.moveIfPressed( mouseX-pmouseX, mouseY-pmouseY );
}

void mouseReleased ()
{
    mm.released();
}



