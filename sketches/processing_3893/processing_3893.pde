
int z=560;
void setup(){ 
size(560,560);} 
void draw(){float x=mouseX;float y=mouseY;float r=random(y);float p=random(x);background(p);triangle(x,y,p,r,y,x);triangle(z-x,z-y,z-p,z-r,z-y,z-x);fill(p);} 


