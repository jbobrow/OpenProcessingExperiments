
int yp=0;

void setup (){

size(200,200);
background(255);


}

void draw (){
fill (6,201,50);
stroke(6,201,50);
rect (0,0,200,200);
 
fill(242,207,174);
stroke(242,207,174);
rect(0,45,200,20);
rect(90,45,20,100);
rect(90,145,150,20);
ellipse(90,45,100,100);
 
stroke(2,5,54);
fill(5,55,175);
ellipse(0,190,120,135);
 
fill(90,92,95);
stroke(0);
rect(110,105,10,40);
rect(5,65,40,10);
rect(80,105,10,40);
rect(110,165,40,10);
rect(150,65,40,10);
 
fill(237,161,103);
ellipse(90,45,80,80);
fill(242,207,174);
ellipse(90,45,50,50);
 
fill(28,160,11);
ellipse(190,25,30,30);
ellipse(167,14,20,20);
ellipse(151,32,30,30);
ellipse(147,112,30,30);
ellipse(167,124,20,20);

// passarinhos 

stroke(255);
fill(0);
ellipse (yp/4, 165, 3,10);
ellipse(yp/4, 155, 3,10);
ellipse(yp/4, 160, 10,4);

ellipse (yp/4, 5, 3,10);
ellipse(yp/4, 15, 3,10);
ellipse(yp/4, 10, 10,4);

ellipse (yp/2, 105, 3,10);
ellipse(yp/2, 95, 3,10);
ellipse(yp/2, 100, 10,4);

ellipse (yp/2, 75, 3,10);
ellipse(yp/2, 65, 3,10);
ellipse(yp/2, 70, 10,4);


if(yp<1000)
   yp++;
else
   yp=0;

fill(0);

// visitante
ellipse (100,100, 18,10);
ellipse (100,100,5,15);
ellipse ( 100,100, 10,10);

// você na praça
ellipse (mouseX,mouseY, 15,5);
ellipse (mouseX,mouseY, 10,18);
ellipse ( mouseX,mouseY, 10,10);

    
}
