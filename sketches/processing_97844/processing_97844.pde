
//Ariane

int yc=0;
 
 void setup(){
size(200,200);
background(88,155,19);
 }
 
 void draw(){
 fill(88,155,19);
 rect(0,0,200,200);
 
 
for(int i=0; i<100; i++)
{
  
 stroke(0,random(100,200),0);
 point(random(200), random(200));
}
strokeWeight(60);
stroke(214,207,205);
fill(153,159,160);
line(150,50,200,0);
line(0,0,50,50);
line(0,200,50,150);
line(200,200,150,150);
 
strokeWeight (1);
fill(214,207,205);
ellipse(100,100,100,100);
stroke(0);
fill(148,154,155);
ellipse(100,100,40,40);
fill(113,240,255);
ellipse (100,100,37,37);
fill(148,154,155);
ellipse(100,100, 20,20);
fill(113,240,255);
ellipse(100,100, 10,10);
 
 
fill(152,113,28);
rect(50,85,10,30);
rect(140,85,10,30);
rect(85,50,30,10);
rect(85,140,30,10);
 
fill(10,200,50);
ellipse(100,20,15,15);
ellipse(98,13,15,15);
ellipse(105,13,15,15);
 
ellipse(10,100,15,15);
ellipse(13,106,15,15);
ellipse(17,101,15,15);
 
ellipse(100,188,15,15);
ellipse(98,182,15,15);
ellipse(105,185,15,15);
 
ellipse(185,105,15,15);
ellipse(180,100,15,15);
ellipse(177,108,15,15);
 
 noStroke ();
fill(#675F66);
rect (mouseX,mouseY,20,30); //vendedor ambulante.
 
stroke(155);
fill(0);
ellipse (yc/10, 170, 8,23);
ellipse(yc/10, 155, 8,8);
if(yc<1900)
   yc++;
else
   yc=0;
    
 }
