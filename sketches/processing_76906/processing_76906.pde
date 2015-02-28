

float y2;
float directiony;


void setup(){
size(600,600);
directiony = .20;
y2 = 10;

}

void draw(){

background(0,0.3,0);

for(float y = 1; y < 600; y +=15){


for(float x = 1; x < 600; x +=15){

rect(x,y,10,10,20,20);
}
}
for(float x = 10; x < 600; x +=15){
triangle(x,y2,202,602,20,4000);
fill(random(255));
y2 += directiony; 
if( y2 >= 600){
directiony = -directiony;

}
if( y2 <= 0){
directiony = -directiony;
}
}
}

