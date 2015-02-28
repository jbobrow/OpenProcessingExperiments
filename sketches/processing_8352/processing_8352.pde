
//import processing.opengl.*;
//import javax.media.opengl.*;

ArrayList Vines = new ArrayList();

float rotx,roty;

void setup() {
  size (600,600,P3D);
  colorMode (HSB, 360,100,100); 
  
  for (int i = 0; i < 40; i++)
    Vines.add(new vine(round(random(-1000,1000)),round(random(-1000,1000)),i));
}

void draw () {
  background(0);
  translate(width/2,height,-height-mouseY);
  rotx += map(mouseX, 0, width,-0.02,0.02);
  roty += map(mouseY, 0, height,-0.02,0.02);    
  rotateY(rotx);
  rotateZ(PI);
  //  rotateZ(roty);  
  for (int i = 0; i < Vines.size(); i++)  {
    vine v = (vine) Vines.get(i);
    v.display();
  }
}

class vine {
  int x,y,z;
  int id;
  int segments = round(random (20,40));
  float scaler = 5,newScaler = 5,scaleDif;
  float stemSize = 10;
  float offset;

  vine (int x, int z, int id) {  
    this.x = x;
    this.z = z;
    this.id = id;
    offset = random (5,15);   
    scaler = random (5,15);   
    newScaler = scaler; 
    stemSize = offset+scaler+segments;    
  }

  void display() {
    if (random(199) >=198) {
      newScaler = random (0,8);
      scaleDif = newScaler - scaler;    
    }
    scaleDif /= 2;
    scaler += scaleDif;
    
    stem();
  }


  void stem() {
    pushMatrix();
    translate(x,y,z);
    rotateY(radians(offset*offset));
    for (int i = 0; i < segments; i++)  { 
      //      rotateZ (radians(segments-width/2-mouseX)); 
      translate (0,offset*2);
      rotateX (radians(i*scaler*offset/segments));

      pushMatrix ();
      rotateX(HALF_PI);
      noFill();
      strokeWeight ((segments-i)/10+1);
      stroke(255);
      ellipseMode(CENTER);
      stroke (id*7%360,offset*10,75);  
      ellipse (0,0,stemSize-i,stemSize-i);
      popMatrix();     
    }
    popMatrix();
  }
}





