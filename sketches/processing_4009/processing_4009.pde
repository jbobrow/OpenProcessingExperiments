
void setup(){ 
size(200,200);} 
void draw(){float z=100;float p=random(3*z);int b=second();{line(z-b,z-p,z-p,z-b);line(z+b,z-p,z+p,z-b);line(z-b,z+p,z-p,z+b);line(z+b,z+p,z+p,z+b);stroke(b+b+p/2);}}

