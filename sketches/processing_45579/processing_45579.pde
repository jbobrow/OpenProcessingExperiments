
final int MAX = 500;

float[] depths = new float[MAX];
float[] firstX = new float[MAX];
float[] secondX = new float[MAX];
float[] thirdX = new float[MAX];
float[] firstY = new float[MAX];
float[] secondY = new float[MAX];
float[] thirdY = new float[MAX];
color[] col = new color[MAX];

void setup()
{
size(400, 400);
noStroke();
translate(width/2, height/2);
}

void draw()
{
 background(255);
 prepArrays(); 
 shapes(); 
}

void prepArrays()
{
 for (int i = 0; i < firstX.length; i++)
  {
   depths[i] = random(50,500);
   firstX[i] = random(-width,2*width);
   secondX[i] = random(-width,2*width);
   thirdX[i] = random(-width,2*width);
   firstY[i] = random(-width,2*width);
   secondY[i] = random(-width,2*width);
   thirdY[i] = random(-width,2*width);

     col[i] = color(random(255),random(255),random(255),40);
   
  } 
}

void shapes()
{
  for (int i = 0; i < firstX.length; i++)
  {
    fill(col[i]);
    triangle(firstX[i], firstY[i], secondX[i], secondY[i], thirdX[i], thirdY[i]); 
  }
}
