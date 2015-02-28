
int x=300; int y=300; int w=260; int h=260;


void setup(){ 
size(600,600);


 textSize(64);
  textAlign(CENTER);

fill(105);
smooth();
smooth();
noStroke();
}

 

void draw(){ 
   
background(25); 
ellipse(mouseX,mouseY,9,9);

noFill();
stroke(0);
strokeWeight(2);  

 

if((mouseX>x)&&(mouseX<x+w)&&(mouseY>y)&&(mouseY<y+h)){
  fill(0);
}
 else{
   fill(255,44,111);
 }
  rect(x,y,w,h);


text(key,290,290);
   

fill(0);  

rect(330,300,40,30);  

   

fill(0);  

rect(410,300,40,30);  

   

fill(0);  

rect(490,300,40,30);  

   

fill(0);  

rect(300,330,30,40);  

   

fill(0);  

rect(300,410,30,40);  

   

fill(0);  

rect(300,490,30,40);  

   

fill(0);  

rect(370,330,40,40);  

   

fill(0);  

rect(450,330,40,40);  

   

fill(0);  

rect(530,330,30,40);  

   

fill(0);  

rect(330,370,40,40);  

   

fill(0);  

rect(410,370,40,40);  

   

fill(0);  

rect(490,370,40,40);  

   

fill(0);  

rect(370,410,40,40);  

   

fill(0);  

rect(450,410,40,40);  

   

fill(0);  

rect(530,410,30,40);  

   

fill(0);  

rect(330,450,40,40);  

   

fill(0);  

rect(410,450,40,40);  

   

fill(0);  

rect(490,450,40,40);  

   

fill(0);  

rect(370,490,40,40);  

   

fill(0);  

rect(450,490,40,40);  

   

fill(0);  

rect(530,490,30,40);  

   

fill(0);  

rect(330,530,40,30);  

   

fill(0);  

rect(410,530,40,30);  

   

fill(0);  

rect(490,530,40,30);  

smooth();  

   

fill(0);  

ellipse(430,350,35,35);  

smooth();  

fill(0);  

ellipse(430,510,35,35);  

smooth();  

fill(0);  

ellipse(350,430,35,35);  

   

fill(0);  

ellipse(280,80,200,200);  

   

fill(167,65,250);  

quad(280,0,200,80,280,160,360,80);  

   

fill(0);  

ellipse(250,80,20,20);  

   

fill(0);  

ellipse(310,80,20,20);  

   

fill(0);  

triangle(180,400,0,500,180,600);  

   

fill(197,244,70);  

triangle(160,430,40,500,160,570);  

   

fill(0);  

ellipse(100,490,20,20);  

   

fill(0);  

ellipse(140,510,20,20);  

   

smooth();  

strokeWeight(4);  

line(0,200,100,500);  

smooth();  

strokeWeight(4);  

line(140,510,300,510);  

smooth();  

strokeWeight(4);  

line(420,510,365,430);  

smooth();  

fill(0);  

ellipse(510,430,33,33);  

smooth();  

strokeWeight(4);  

line(510,430,440,360);  

smooth();  

strokeWeight(4);  

line(410,300,330,120);  

strokeWeight(4);  

line(300,80,250,80);  

smooth();  

strokeWeight(4);  

line(210,50,140,-2);  

   

smooth();  

strokeWeight(4);  


if(mousePressed){
  stroke(25);
}
else{
  stroke(0);
}
line(0,360,600,100);
}



