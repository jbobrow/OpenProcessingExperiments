
void setup() {
size(800,700);
}

void draw() {
background(153,200,222);
strokeWeight(1);



fill(0,0,255,250);
rect(0,500,800,200); // rio Tamisa

fill(190);
rect(200,100,50,400); // colunas
rect(600,100,50,400);


strokeWeight(30); 
float a=map(mouseX,0,width,425,425); 
float c=map(mouseX,0,width,425,425); 
float b=map(mouseY,0,height,400,260); 
float d=map(mouseY,0,height,400,260); 
stroke(190);
line(250,400,a,b); 
line(c,d,600,400); 





strokeWeight(1);
stroke(0);
rect(0,400,200,30);
rect(650,400,200,30);

noFill();
arc(20,100,360,500,0,radians(200));
arc(800,100,300,500,radians(90),radians(180));

fill(255);
rect(250,110,350,10); // passarela 
fill(190);
triangle(225,80,250,100,200,100);
triangle(625,80,650,100,600,100);

noStroke();
fill(255,255,0);
ellipse(50,70,60,60);

fill(255,200);
ellipse(450,30,80,50);
ellipse(460,40,80,50);
ellipse(700,110,100,50);
ellipse(750,90,100,50);
}
