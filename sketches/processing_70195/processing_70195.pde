
int counter;


// el seteo , aplicado al todo el programa, ajustes
size (1000,600);
background(252, 229, 179);

//la sección de dibujo
noStroke();
fill(200, 170, 116);
ellipse(200, 200, 50, 50);
ellipse(400, 400, 50, 50);
ellipse(100, 500, 100, 100);
ellipse(600, 200, 50, 50);
ellipse(800, 100, 100, 100);
ellipse(850, 550, 50, 50);

strokeWeight(2);
stroke(252,250,222);

// declaracion de variable
for( int i=20; i <width-7; i = i + 30){
 for(int j=20; j <height-7;j=j+45){
 quad( i,j,i+50,j+50,i+100,j+100,i+200,j+200);
 
//la sección de dibujo 
 fill (252,159,240);
rect (i,j,10,10);

fill (255,228,0);
rect (i-10,j+10,10,30);

}
}


noStroke();
fill(1, 159, 255);
ellipse(650, 400, 20, 20);
ellipse(160, 200, 20, 20);

fill(255,0,150);
ellipse(160, 50, 20, 20);
ellipse(220, 290, 20, 20);
