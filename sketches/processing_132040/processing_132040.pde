
// merkle
// Neve, montado seguindo tutorial prof. Merkle chuva
int flocos=400;
float [] nevex;
float [] nevey;
 int ac;//função acumular neve
 
void setup() {
  size(400, 400);
  strokeWeight(3);
  //  frameRate(10);
  stroke(0);
  
 nevex = new float[flocos];
  nevey = new float[flocos];
  for (int i=0; i<flocos; i++)
  {
    nevex[i] = floor(random(width));
    nevey[i] = floor(random(height));
  }
  
}
 
void draw() {
 
  //background(100, 100, 255);
  background(44 , 42 , 70);
   //predios pretos
  fill(0);
 
  //predios
  rect(0, 280, 43, 120);
  rect(42, 320, 30, 80);
  rect(72, 250, 50, 150);
  rect(82, 220, 30, 30);
  triangle(87, 220,107, 220, 97, 170);
  rect(122, 300, 34, 100);
 rect(155,270,55,130);
 rect(220,200,28,200);
 rect(248,255,46,145);
 rect(294,320,59,80);
 rect(353,250,30,150);
 ellipse (368, 250, 30, 100);
  rect(383,300,17,100 );

  
 
  stroke(200);
  for (int i=0; i<flocos; i++)
  {
    point(nevex[i], nevey[i]);
    nevey[i]=nevey[i]+random(-0.1, 0.5);//MOVIMENTO VERTICAL
    nevex[i]=nevex[i]+random(-0.1, 0.1);//MOVIMENTO HORIZONTAL
    if (nevey[i]>height)
    {
      nevex[i] = floor(random(width*1.5));
      nevey[i] = 0;//floor(random(height));
  
      if(ac< 400)//limite altura neve
      ac++;//função acumular neve
    }
  }
  fill(255);//função acumular neve
  noStroke();//função acumular neve
  rect(0,height,width,-pow(ac,0.777));//função acumular neve 
  
  
}
 
//void keyPressed()
{
  //background(random(100), random(60), random(54));
}


