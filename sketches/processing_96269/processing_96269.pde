
void setup(){

size(800,800);
}


void draw(){;
background(131,196,245);
float puntX = -190;
float puntY = -100;

//cos
fill(245,205,131);
rect(mouseX+puntX+190,mouseY+puntY+100,50,150);

//ales
fill(219,7,124);
noStroke();
ellipse(mouseX+puntX+140,mouseY+puntY+150,200,90);
ellipse(mouseX+puntX+140,mouseY+puntY+210,150,80);
//ales2
fill(219,7,124);
ellipse(mouseX+puntX+290,mouseY+puntY+150,200,90);
ellipse(mouseX+puntX+290,mouseY+puntY+210,150,80);

fill(245,205,131);
rect(mouseX+puntX+190,mouseY+puntY+100,50,150);

//rodoneta
noStroke();
fill(220,224,9);
ellipse(mouseX+puntX+140,mouseY+puntY+150,50,50);
fill(9,224,219);
ellipse(mouseX+puntX+140,mouseY+puntY+210,50,50);


//rodoneta
noStroke();
fill(9,224,219);
ellipse(mouseX+puntX+290,mouseY+puntY+150,50,50);
fill(220,224,9);
ellipse(mouseX+puntX+290,mouseY+puntY+210,50,50);
}


