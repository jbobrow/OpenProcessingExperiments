
//_ks

float points = 100000;
float arrPt;
float x = 1.0; 
float y = 1.0; 
float z = 1.0;
float h = 0.001;

float a; float b; float c;

float col = 100;


void setup(){
  
  size(700,400, P3D);
  background(255);
}


void draw (){
   for (int i = 0; i < points; i ++){

     x = (x + h * dx(x,y,z));
     y = (y + h * dy(x,y,z));
     z = (z + h * dz(x,y,z));
     
     a = map(x, 1, 20000, 0, 255);
     b = map(y, 1, 20000, 0, 255);
     c = map(z, 1, 20000, 0, 255);
     
     stroke(col*h*i, random(25,150), random(10,255));
     point(x,y,z);
     scale (200);
   }
  scale (200);
}

float dx (float x1, float y1, float z1){
  return 10 * (y1 - x1) ;
}

float dy (float x2, float y2, float z2){
 return -x2 * z2 + 28 * x2 - y2;
}

float dz (float x3, float y3, float z3){
 return x3 * y3 - 2.65 * z3; 
}

