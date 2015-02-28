
void setup (){
size(500,500);


}

void draw() {
background(255);
fill(0);
translate(50,50);
float Schieben = map(mouseX,0,width,0.0,12.5);

fill(255,20,20);
rect(0+Schieben,0+Schieben,25,25);
fill(0);
rect(0+Schieben,50,25,25);
rect(0+Schieben,100,25,25);
rect(0+Schieben,150-Schieben,25,25);
rect(50,0+Schieben,25,25);
rect(50,50,25,25);
rect(50,100,25,25);
rect(50,150-Schieben,25,25);
rect(100,0+Schieben,25,25);
rect(100,50,25,25);
rect(100,100,25,25);
rect(100,150-Schieben,25,25);
rect(150-Schieben,0+Schieben,25,25);
rect(150-Schieben,50,25,25);
rect(150-Schieben,100,25,25);
rect(150-Schieben,150-Schieben,25,25);

translate(200,0);

rect(0+Schieben,0+Schieben,25,25);
rect(0+Schieben,50,25,25);
rect(0+Schieben,100,25,25);
rect(0+Schieben,150-Schieben,25,25);
rect(50,0+Schieben,25,25);
rect(50,50,25,25);
rect(50,100,25,25);
rect(50,150-Schieben,25,25);
rect(100,0+Schieben,25,25);
rect(100,50,25,25);
rect(100,100,25,25);
rect(100,150-Schieben,25,25);
fill(255,20,20);
rect(150-Schieben,0+Schieben,25,25);
fill(0);
rect(150-Schieben,50,25,25);
rect(150-Schieben,100,25,25);
rect(150-Schieben,150-Schieben,25,25);

translate(0,200);

rect(0+Schieben,0+Schieben,25,25);
rect(0+Schieben,50,25,25);
rect(0+Schieben,100,25,25);
rect(0+Schieben,150-Schieben,25,25);
rect(50,0+Schieben,25,25);
rect(50,50,25,25);
rect(50,100,25,25);
rect(50,150-Schieben,25,25);
rect(100,0+Schieben,25,25);
rect(100,50,25,25);
rect(100,100,25,25);
rect(100,150-Schieben,25,25);
rect(150-Schieben,0+Schieben,25,25);
rect(150-Schieben,50,25,25);
rect(150-Schieben,100,25,25);
fill(255,20,20);
rect(150-Schieben,150-Schieben,25,25);
fill(0);

translate(-200,0);

rect(0+Schieben,0+Schieben,25,25);
rect(0+Schieben,50,25,25);
rect(0+Schieben,100,25,25);
fill(255,20,20);
rect(0+Schieben,150-Schieben,25,25);
fill(0);
rect(50,0+Schieben,25,25);
rect(50,50,25,25);
rect(50,100,25,25);
rect(50,150-Schieben,25,25);
rect(100,0+Schieben,25,25);
rect(100,50,25,25);
rect(100,100,25,25);
rect(100,150-Schieben,25,25);
rect(150-Schieben,0+Schieben,25,25);
rect(150-Schieben,50,25,25);
rect(150-Schieben,100,25,25);
rect(150-Schieben,150-Schieben,25,25);


}
