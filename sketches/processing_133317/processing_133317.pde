
float radius = 100;//tweak here
int resolution = 300;//tweak here
float circleX = width/2;
float circleY = height/2;
int ang = 0;

void setup()
{
  size(900, 700);
  background(150, 150, 150);
  frameRate(5);
  smooth();
}

void draw()
{
 background(150, 150, 150);
 
 

  translate(width/2, height/2);

  
  rotate(radians(ang));
  ang=ang+5;
  
     int advod = 0;
     advod=advod+10;
     if(advod>=360)
     {advod = 0}
    

    for (int m=50; m<=200; m=m+10)
    {
      radius = m;//tweak here

      beginShape();

      stroke(50+m, 50+m, 50+m);
      strokeWeight(0.75);
      noFill();
      //fill(50, 150, 150, 10);

      for (int i=0; i<=resolution; i=i+1)
      {
        float waveAngle = map(i, 0, resolution, 0, TWO_PI*15);//tweak here
        //float waveAngle = map(i, 0, resolution, 0, TWO_PI*5.5);
        float waveOffset = sin(waveAngle)*156;//tweak here
        // drawing around the circle
        float angle = map(i, 0, resolution, 0, TWO_PI);
        float circumPointX = (waveOffset + radius)*cos(angle);
        float circumPointY = (waveOffset + radius)*sin(angle);
        //drawing points for the shape.
        float x = circleX + circumPointX;
        float y = circleY + circumPointY;
        //ellipse(x, y, 10, 10);
        vertex(x, y);
      }
      endShape(CLOSE);
    
  }
  
 
   // rotate();

    for (int v=100; v<=300; v=v+5)
    {
      radius = v;
      //tweak here

      beginShape();

      stroke(v, v-100, v, 50);
      smooth();
      strokeWeight(0.5);
      noFill();
      //fill(50, 150, 150, 50);

      for (int i=0; i<=resolution; i=i+1)
      {
        float waveAngle = map(i, 0, resolution, 0, TWO_PI*30);//tweak here
        //float waveAngle = map(i, 0, resolution, 0, TWO_PI*5.5);
        float waveOffset = sin(waveAngle)*156;//tweak here
        // drawing around the circle
        float angle = map(i, 0, resolution, 0, TWO_PI);
        float circumPointX = (waveOffset + radius)*cos(angle);
        float circumPointY = (waveOffset + radius)*sin(angle);
        //drawing points for the shape.
        float x = circleX + circumPointX;
        float y = circleY + circumPointY;
        //ellipse(x, y, 10, 10);
        vertex(x, y);
      }
      endShape(CLOSE);
    
  }
  
  
   // rotate(radians(ang));

    for (int s=200; s<=300; s=s+10)
    {
      radius = s;

      beginShape();

      stroke(5+s, s-55, 20+s);
      strokeWeight(1);
      noFill();
      

      for (int i=0; i<=resolution; i=i+1)
      {
        float waveAngle = map(i, 0, resolution, 0, TWO_PI*10);//tweak here
        //float waveAngle = map(i, 0, resolution, 0, TWO_PI*5.5)
        float waveOffset = sin(waveAngle)*156;//tweak here
        // drawing around the circle
        float angle = map(i, 0, resolution, 0, TWO_PI);
        float circumPointX = (waveOffset + radius)*cos(angle);
        float circumPointY = (waveOffset + radius)*sin(angle);
        //drawing points for the shape.
        float x = circleX + circumPointX;
        float y = circleY + circumPointY;
        //ellipse(x, y, 10, 10);
        vertex(x, y);
      }
      endShape(CLOSE);
    }
  
}

