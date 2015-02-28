
float angulo;
PImage imagen;
PImage imagen2;

void setup() {
  size(640, 500);
  smooth();
  background(0);
  imagen = loadImage("pasto.jpg");
 imagen2 = loadImage("luna.jpg");
}

void draw() 
{  
  pasto();
  luna();
  frameRate(1);
  stroke(random(255), random(255), random(255)); 
  strokeWeight(random(1,3));
  float a = random(10f,50f);
  angulo = radians(a);
  float p1 = random(1,640);
  float f = random(70,90);
  translate(p1,height);
  line(0,0,0,-f);
  translate(0,-f);
  Ramas(f);
}

void mousePressed()
{
  background(0);
}

void Ramas(float h) 
{
  h *= 0.66;
  
  if (h > 2) {
    pushMatrix();
    rotate(angulo);
    line(0, 0, 0, -h);
    translate(0, -h);
    Ramas(h);
    popMatrix(); 
    
    pushMatrix();
    rotate(-angulo);
    line(0, 0, 0, -h);
    translate(0, -h);
    Ramas(h);
    popMatrix();
  }
}

void pasto(){
  float des = (random(50,100)) /(random(5,10));
  for(int x=0 ; x<640 ; x++)
  {
    for(int y=0 ; y<100 ; y++)
    {
      color este;
      este = imagen.get( x+int( random(-des,des) ) , y+int( random(-des,des) ) );
      set( x , y+450 , este );
    }
  }
}

void luna(){
  float des = (random(50,100)) /(random(5,10));
  for(int x=0 ; x<244 ; x++)
  {
    for(int y=0 ; y<240 ; y++)
    {
      color este;
      este = imagen2.get( x+int( random(-des,des) ) , y+int( random(-des,des) ) );
      set( x+400 , y , este );
    }
  }
}

