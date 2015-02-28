
void setup(){
size (600,600);
background(255,255,255);
strokeWeight(15);
line(250,0,250,600);

strokeWeight(3);
line(0,250,600,250);

strokeWeight(6);
line(0,400,600,400);

strokeWeight(4);
line(500,0,500,600);

strokeWeight(2);
line(100,0,100,250);

strokeWeight(7);
line(0,100,97,100);

line(0,550,250,550);

line(330,498,330,402);
line(330,543,330,600);

line(256,0,407,249);
//triangle
fill(245,45,189);
triangle(25,547,110,401,190,547);

line(103,192,243,192);
strokeWeight(4);
line(173,192,173,0);

line(331,401,501,600);
line(500,402,412,494);

//color for square on the left
fill(255,0,0);
rect(0,250,150,150);
//yellow square
fill(250,250,0);
rect(310,500,40,40);

//teal square
strokeWeight(3);
fill(24,167,181);
rect(407,0,190,400);
}
void draw(){
println("mouse x:");
println(mouseX);
println("mouse y:");
println(mouseY);

}


