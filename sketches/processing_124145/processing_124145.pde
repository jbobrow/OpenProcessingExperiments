

int cs = 30;

void setup(){
size(500,500);
smooth();
}
void draw(){
background(255);
 
fill(0);
for(int j = 0; j<=height/cs;j=j+5){
for(int i = 0; i<=width/cs;i++){
fill(0);
if (mouseX<50) fill(255,55,10);
if (mouseY>50) fill(25,70,150);


ellipse(i*cs,j*cs,mouseX,mouseY);

}
}



}
