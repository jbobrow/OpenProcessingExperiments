
void setup(){size(300,300);
background(0);
stroke(0);


}
void draw(){

smooth();
float x;
float y;

for(int i=0;i<30;i++){
x=100*cos(i*2*PI/30);
y=100*sin(i*2*PI/30);
fill(random(0,255),random(0,255),random(0,255));

ellipse(150+x,150+y,20,20);
ellipse(150+x*0.4,150+y*0.4,20,20);
ellipse(150+x*0.6,150+y*0.6,20,20);
ellipse(150+x*1.2,150+y*1.2,20,20);
ellipse(150+x*0.8,150+y*0.8,20,20);

delay(5);

print(x);
print("||");
}
}

