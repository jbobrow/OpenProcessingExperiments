
size (250,250,P3D);
color c = color(185, 50, 90);
background(51);
a = 0;
void draw(){
fill(c);
translate(a, a, a); 
rotateY(0.5);
box(40);
rect(a,a,a,a);
    a = a + 5;
    a = a%250;
    println(a);
    
}
