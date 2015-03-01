

int x;
int y;
int z;
int count;
int radius;
float ry;
float pz;
float res;
float var_radius;
void setup() {
  size(640, 360,P3D);
  color b = color(255,0,230);
  color a = color(255,247,0);
//  setGradient(0, 0, width, height, a ,b, width/2);
  
  x = width/2;
  y = height/2;
  z = -50 ;
  radius = 100;
 
}

void draw() {


  background(0);

  translate (x,y,z );
  rotateY(ry);
  count = 0;
  int numPoints = int(map(mouseX, 0, width, 2, 20));
  float angle = 0;
  float angleStep = 180.0/numPoints;
  
  beginShape(TRIANGLE_STRIP); 
  
  for (int j = 0; j <= numPoints; j++){
  
      float picount;
      picount = map(j,0,numPoints,-PI,PI);
      pz = radius * cos(picount) ;
      var_radius = abs(sin(picount) * radius);
     
      for (int i = 0; i <= numPoints; i++) {
  
        float px =  cos(radians(angle)) *  var_radius;
        float py =  sin(radians(angle)) *  var_radius;
        angle += angleStep;
        
        vertex(px, py,pz);
    
        j++;
        picount = map(j,0,numPoints,-PI,PI);
        pz = radius * cos(picount) ;
        var_radius = abs(sin(picount) * radius);
        px  =  cos(radians(angle))   *var_radius;
        py  =  sin(radians(angle))  *var_radius;
      
        vertex(px, py , pz); 
  
        j--;
        picount = map(j,0,numPoints,-PI,PI);
        pz = radius * cos(picount) ;
        var_radius = abs(sin(picount) * radius);
        angle += angleStep;
   
      }
     count += 1;
        if (count > numPoints) {
        count = 0; 
      }
  }
  endShape();
  ry += PI/500 ;
}


