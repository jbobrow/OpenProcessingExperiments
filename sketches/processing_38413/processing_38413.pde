
void setup(){
size(500,500);
background(255,255,255);
colorMode(RGB,255);
rectMode(CENTER);
}
void draw(){
if(mousePressed){
background(255,255,255);
noFill();
smooth();
for( int x=10; x<= width; x+=80){
for( int a=10; a<=width; a+=80){
strokeWeight(0);
fill(random(200,250),200,250);
rect(x,a,random(10,35),random(10,35));

}
}
}

else{
for( int x=15; x< 550; x+=80){
for( int a=15; a< 550; a+=80){
strokeWeight(0);
stroke(200,200,250);
line(x-5,10,10,a-5);
}
}
for( int x=495; x> -20; x-=80){
for( int a=495; a> -20; a-=80){
strokeWeight(0);
stroke(250,200,250);
line(x-5,490,490,a-5);
}
}
}
}


