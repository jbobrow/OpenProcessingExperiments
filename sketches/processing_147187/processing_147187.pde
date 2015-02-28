
/**-- APPLYMATRIX example  --
 * -- Jacques Maire  .     --
 * -- www.alcys.com        --
 * -- www.xelyx.fr         --
 *
 **/



float angle;
PVector axe;

void setup(){
size(500, 500, P3D);
 axe=new PVector(1,2,3);
axe.normalize();
noFill();

}

void draw(){
  background(0);
  angle=0.001*millis();
translate(250, 250, 0);

  directionalLight(51, 240, 240, 0, -1, 0);
  spotLight(204, 153, 0, 360, 300, 600, 0, 0, -1, PI/2, 600); 

  spotLight(102, 153, 204, 360, mouseX-width/2, 500, 0, 1, -1, PI/2, 10000); 
  
rotateY(map(mouseX-width/2,-width/2,width/2,0,TWO_PI)); 
rotateX(map(mouseY-height/2,-height/2,height/2,0,TWO_PI));
pushMatrix();
stroke(255);
fill(255,0,0);
 tourne( -angle, axe.y,axe.z,axe.x); 
box(200);
popMatrix();
 tourne( angle, axe.x,axe.y,axe.z);                     
 fill(0,0,255);            
stroke(255,0,0);
box(200);
}
//------------------------------------------------

void tourne(float angle,float x,float y,float z){
  //rotation d' Olindes Rodrigues
 float  c = cos(angle);
 float s = sin(angle);
 float t = 1.0 - c;
applyMatrix(
        (t * x * x) + c,(t * x * y) - (s * z),(t * x * z) + (s * y),0,               
        (t * x * y) + (s * z),(t * y * y) + c,(t * y * z) - (s * x),0,
        (t * x * z) - (s * y),(t * y * z) + (s * x),(t * z * z) + c,0,
                   0, 0, 0, 1
         );
      }
