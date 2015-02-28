
void setup()
{size(200,200);}
void draw(){
background(#FF00FB);
noStroke();
fill(#551054);
if (mouseX<width/2){
rect(0,0,150, height);
}else{
rect(50,0,50, height);
}

fill(0);
if (mouseX<width/8){
rect(200,0,100, height);
}else{
rect(150,0,50, height);
}


fill(255);
if (mouseX<width/4){
rect(0,0,50, height);
}else{
rect(50,0,50, height);
}


fill(#7F00F0);
if (mouseX<width/8){
rect(100,0,50, height);
}else{
rect(150,0,50, height);
}
}


