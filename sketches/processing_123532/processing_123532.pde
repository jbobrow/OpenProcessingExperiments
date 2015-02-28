
float rectLength=0;
void setup(){
size(800,600);
}
void draw(){
background(0);
renderRect();


}

void renderRect(){
while(rectLength<100){
rectLength+=.5;
}
rect(width/2,height/2,rectLength,20);
}
