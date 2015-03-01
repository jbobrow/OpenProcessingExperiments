
void setup(){
size(500,500);
background(255);
smooth();
frameRate(4);
}
void draw(){
for(int y = 0; y<=height; y+=50){
for(int x = 0; x <=width; x +=50){
for(int j = 0; j<=height; j+=50){
for(int i = 0; i <=width; i +=50){
fill(255,140,78);
ellipse(x,y,random(50,70),random(50,70));
fill(random(50,150),random(50,77),random(50,215));
ellipse(j,i,random(10,20),random(10,20));

}
}
}
}
}
