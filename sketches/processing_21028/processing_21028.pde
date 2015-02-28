
float angle = 0;
float p = 10;
float p2 = 20;
float puntangle = 50;
float puntaradius =20;


void setup ()
{
  size(192,157);
  background (0);
}
void draw()
{
  background (0);
    translate(width/4, height/2);
     
     for (int i=1;i<=5;i++)
     {
      
    
     rotate(puntangle/height);
     translate (puntaradius,height/2);
             {
  
  pushMatrix();
  scale(0.2);
  noFill(); 
  strokeWeight(6);
  stroke(255,0,0);
    beginShape();
        vertex(width/2,0);
        vertex(30,170);
        vertex(197,70);
        vertex (3,70);
        vertex (170,170);
        endShape(CLOSE);
    popMatrix();
}

          
     puntangle += 10;

 
    }
}               
