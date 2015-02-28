
void setup(){
size (600,600);
background(255);

}
 void draw (){
 for (int x = 0; x <600; x++){
 float n = norm(x, 0.0, 600);
 float y = pow(n,2);
y *= 600;
stroke(x,y,100,100);
line(x,y,x/2,600);

}
}


