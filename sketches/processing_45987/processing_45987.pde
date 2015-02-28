
final int MAX = 1000;

float[] locationx = new float[MAX];
float[] locationy = new float[MAX];
float[] locationz = new float[MAX];
float[] changez = new float[MAX];
float[] sphereSize = new float[MAX];
color[] col = new color[MAX];

void setup()
{
 size(400, 400,P3D);
 noStroke(); 
 
sphereDetail(10);
prepArrays();
 

}

void draw()
{
translate(width/2, height/2, 0); 

background(0);

figure();
}


void figure()
{
    lights();
    

    for(int i = 0; i < locationx.length; i++){
   locationz[i] = locationz[i] + changez[i];
    if (locationz[i] > 400)
    {
      locationz[i] = -600;
    }
   pushMatrix();
    translate(locationx[i], locationy[i], locationz[i]);
    fill(col[i]);
    sphere(sphereSize[i]); 
   popMatrix();
    }
  
}
///////////////////////////////////////////////
void prepArrays()
{
 for( int i = 0; i <locationx.length; i++)
 {
  locationx[i] = random(-width/2,width/2); 
  locationy[i] = random(-height/2,height/2);
  locationz[i] = -600;
  changez[i] = random(2,15);
  sphereSize[i] = random(10,50);
  col[i] = color(random(200,250),random(200,250),random(200,250),10);
  }
}               
