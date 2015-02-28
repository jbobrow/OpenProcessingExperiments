
float x=0.0;
float y=50.0;
float vx=0.0;
float vy=0.5;

int num = 10;
int[] a = new int[num];
int[] b = new int[num];
 PImage img;
float freq=0.01;
void setup()
{
  size(600,600,P3D);
 noStroke();

//img = loadImage("universe.jpg");
//image(img,0,0);

}

void draw()
{
background(10);

  
 vx+=random(-0.3,0.3);
 x+= vx*noise(10)*freq+vy;
 y+=vx*noise(10)+vy;
  


  
  translate(width/2,height/2);
  pointLight(200,100,100,
            200,-150,0);
  directionalLight(100,102,170,
                  1,0,0);
  spotLight(255,255,109,
            0,40,200,
            0,-0.5,-0.5,
            PI/2,2);

for(int i=num-1; i>0; i--)
{

       rotateY(map(x,0,width,0,PI*0.5));
  rotateX(map(y,0,height,0,PI*0.5));
  box(100);
  fill(255,100);

  a[i] = a[i-1];
  b[i] = b[i-1];
   rotate(500);
pushMatrix();
  
  translate(height/2,width/2);
    //box(100);
  
  popMatrix();
  
} 
  
}


