
float j=0;

void setup(){
 size(200,200);
frameRate(10); 

}
void draw(){
 
for(int x=0; x<width ;x+=10) {
fill(random(100 , 200), random(60,250),random(10,50));
rect(x,j,10,10);
}
j=j+10;
}
