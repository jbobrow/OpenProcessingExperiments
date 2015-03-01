
int eSize =15;
size(400, 400);
background(255);
colorMode(RGB, 400);
noStroke();

for(int y=0; y<=400; y+=10) {  
  
for(int x=0; x<=400; x+=10) {    
  fill(x, 300, y, 200);
   rect(x,y, eSize, eSize);
 }
 
}

for(int y=0; y<=400; y+=7) {


stroke(231,245,129,300);
line(400,0,y,400);
stroke(129,245,242,300);
line(0,0,y,400);

}




noStroke();
fill(74,211,168, 300);
ellipse(50, 50, 70,70);
     
fill(19,211,195, 300);
ellipse(50,230, 100,100);     

fill(19,189,211, 300);
ellipse(60, 300, 60,60);     

fill(240,140,238, 200);
ellipse(380, 380, 200,200);     

fill(250,229,22, 300); 
ellipse(350, 50, 40,40);     

fill(214,237,69, 300);
ellipse(318, 80, 70,70);     

fill(167,245,116, 300);
ellipse(300, 40, 40,40);     














































