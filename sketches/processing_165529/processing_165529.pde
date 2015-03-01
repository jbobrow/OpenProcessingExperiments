
float i; //a normal initial
float r; //controls the radius of the galaxy together with mouse
float a; // 
float t;

public void setup(){
background (0);
size(400,400,P3D);
}

public void draw(){
stroke (-100,240);
strokeWeight (3); 
background (0);

for(i=0; i<14; i++) { 
a=noise(i/64)*9+t/r;
point(200+cos(a)*r,200+sin(a)*r/2);
point(200+cos(a)*r*2,200+sin(a)*r/1.5);
r=abs(noise(i))*mouseY;
point(200+cos(a)*r/1.1,200+sin(a)*r/2);
point(200+cos(a)*r/1.6,200+sin(a)*r/1.5);
r=abs(noise(i))*mouseX;
t+=3;

}
}


