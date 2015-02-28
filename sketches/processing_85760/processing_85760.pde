
int threehundred = 300;
float percent = 50;



void setup() {
  size(600, 600);
}

void draw(){
//background(0, 150, 150);



//red square
fill(201,49,49);
rect(0,0,300,300);
fill(62,69,137);
rect(75,75,150,150);
fill(198,72,60);
ellipse(150,150,100,100);

//blue square
fill(70,165,193);
rect(300,0,300,300);
fill(242,97,12);
rect(375,75,150,150);
fill(237,146,10);
ellipse(450,150,100,100);

//green square
fill(21,70,23);
rect(0,300,300,600);
fill(191,48,48);
rect(75,375,150,150);
fill(188,73,49);
ellipse(150,450,100,100);



fill(255,192,15);
rect(300,300,600,600);

//Yellow square
fill(70,165,193);
rect(375,375,150,150);
fill(237,146,10);
ellipse(450,450,100,100);

//ellipse(mouseX,mouseY,30,30);
println("moouse x: ");
println(mouseX);
println("moouse y: ");
println(mouseY);

}


