
// Initial 3d
//Copyright Felipe Castelblanco. October 10th, 2011

void setup()
{
  size(600,600,P3D);
  smooth();
  fill(0,200,255);
  
}

void draw() 
{
  

directionalLight(126, 90, 126, 0, 0, -1);//light adjustment
ambientLight(150, 105, 80);//light adjusment
 
fig();

}

void fig()
{
  background(10);
  pushMatrix();
  translate(.5*width,.5*height,30);
  rotateY(radians(frameCount));
  noStroke();
//  line(0,-100,0,100); //locate center
//  line(-100,0,100,0); //locate center
    box(.1*width, .5*height, 30);//vertical
     pushMatrix();
       translate(.1*width,0,35);
       box(.2*width,.05*height,22);//horizontal samll
     popMatrix();
     pushMatrix();
       translate(.15*width,-.20*height,-30);
       box(.3*width,.1*height,20);//horizontal long
     popMatrix();
    popMatrix();  
}

