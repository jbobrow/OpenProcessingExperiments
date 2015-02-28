
size(400,400);
background(150,40,100);
stroke(0,200,40);
for(int w =10; w < 400; w = w + 10) {
line(w, 400, w, 0);
}
for( int h = 10; h < 400; h = h + 10) {
 line(0, h, 400, h);
}

for( int a = 10; a <= 400; a = a + 10){
 for (int b = 10; b <= 400; b = b + 10){
 triangle(a, b, 10+a, 10+b, a-10, b-10);
 }
} 

//triangle(10,0, 20, 20, 0, 20);
