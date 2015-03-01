
size (250,250);
color c = color(185, 50, 90);
a = 0;
void draw(){
fill(c);
rect(a,a,a,a);
    a = a + 5;
    a = a%250;
    println(a);
    
}
