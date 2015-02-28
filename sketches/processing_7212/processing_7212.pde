
float R; 
PImage b;
int s= 1;
int speed= 1;

 
void setup(){ 
size(400,400); 
//background(255,50,200); 
noCursor();
smooth();
b = loadImage("123.jpg");

 
} 
 
void draw() { 
  
//background(200,50,50); 
image(b, 0, 0);

s= s+speed;
if ((s > width) || (s < 0)) { 
speed = speed * -1; 
} 


R=random(255); 
//fill(200,200,R); 


 
//ellipse(mouseY,mouseX,40,40); 
//fill(200,0,200); 

//rect(mouseY-20,mouseX,40,50); 

{
stroke (0); 

//benen 
line(mouseX-4,mouseY-10,pmouseX-15,pmouseY+80); 
line(mouseX+4,mouseY+10,pmouseX+15,pmouseY+80);

//armen
line(mouseX-5,mouseY+30,pmouseX-40,pmouseY+10); 
line(mouseX+2,mouseY+30,pmouseX+40,pmouseY+2); 


//lichaam
fill(R,200,250); 
rect(mouseX-20,mouseY,40,50); 
fill(R,200,40); 
ellipse(mouseX,mouseY,40,40);


//ogen
 fill (255); 
  ellipse (mouseX-9,mouseY-5,10,10); 
  ellipse (mouseX+9,mouseY-5,10,10); 
}

//lijntjes
for(int a=0; a<400; a=a+5) {
  line(30, a, 90, a);
}

for(int a=0; a<400; a=a+5) {
  line(350, a, 280, a);
}

{if (mouseX <width/2) { 
fill(238,99,99,30); 
ellipse(s,200,width,height);} 
else{ 
  fill(200,100,80,100); 
  ellipse(s,200,300,300);} 
 

//balletjes
 
fill(0,206,209,50); 
ellipse(s,10,20,20); 
ellipse(s,390,20,20); 

} 


} 



