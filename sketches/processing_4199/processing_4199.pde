
void setup(){ 
size(500,500);} 
void draw(){float b=mouseX;float c=mouseY;float d=random(c);for(int z=1;z<10;z +=1){quad(d,b,c,b,c,d,d,d);fill(c,b,c);PImage n=get();image(n,d,b,width/z,height/z);}}


