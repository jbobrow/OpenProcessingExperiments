
void setup (){
size(800,500);
smooth();


}

void draw (){
noStroke();
background(150,220,200);
for(int y=0; y<=height; y=y+100){
for(int x=0; x<=width; x=x+100){

fill(150,0,75,25);
ellipse(x,y,mouseX,mouseY);

}}}
