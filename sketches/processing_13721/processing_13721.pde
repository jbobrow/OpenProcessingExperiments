
float a=0;
void setup(){
size(300,300);rectMode(CENTER);
}
void draw(){background(255);
if(mousePressed){a=a+20;}translate(150,150);

for(int i=0;i<400;i=i+10){
fill(0,0);
rotate(a);triangle(0,0,i,i);
}
}
                
