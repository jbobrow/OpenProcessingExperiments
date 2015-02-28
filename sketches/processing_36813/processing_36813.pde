
 void setup() {
size(450,450);
background(0);
}

void draw() {
//draw lines
strokeWeight(1);
stroke(random(255),random(255),random(255),50);
line(mouseX,mouseY,0,500);  

//draw balls 
stroke(random(255),random(255),random(255),50);

fill(random(220,256),random(30,256),random(30,256),20);
ellipse(250,250,random(100),(100));
fill(random(30,256),random(30,256),random(30,256),20);
ellipse(380,350,random(80),(80));

fill(random(30,256),random(30,256),random(30,256),20);
ellipse(100,59,random(200),(200));
fill(random(30,256),random(220,256),random(30,256),20);
ellipse(450,450,random(200),(200));
fill(random(30,256),random(220,256),random(30,256),20);
ellipse(350,230,random(60),(60));

fill(random(220,256),random(30,256),random(30,256),20);
ellipse(168,168,random(50),(50));
fill(random(220,256),random(220,256),random(30,256),20);
ellipse(190,350,random(150),(150));
}

  
      
                
