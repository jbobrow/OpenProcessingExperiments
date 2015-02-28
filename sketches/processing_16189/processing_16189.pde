
void setup(){  

size(600,600);  

noStroke();  

}  

void draw(){  

background(255);  

smooth();  

glasses(50,10,1,0, 255,255,255);  
glasses(250,220,1,180, 200,200,200);

glasses(450,40,1,90, 250,200,200);  
glasses(450,270,1,270, 200,250,200); 

glasses(270,250,1,135, 200,200,250);  
glasses(30,520,1,315, 250,250,150);


glasses(480,620,1.5,225, 100,100,100);  
glasses(310,480,0.5,45, 50,50,50);

}  

void glasses(int x, int y,float s,float r,int c, int b ,int d) {    

pushMatrix();    

 translate(x,y);    

 scale(s);    

rotate(radians(r));    

fill(c,b,d);    
smooth();    

beginShape();  


int a= 40;  

stroke(70,20,0);   
smooth();  


//glass__
strokeWeight(25);  
line(115, 60, 128,53);  
strokeWeight(22);
line(221, 17, 223,17);  


//bridge
strokeWeight(15);  
beginShape();  
vertex(170, a+10);  
bezierVertex(170,a+10, 180, 45, 200, 33);  
endShape();  



//leg
strokeWeight(16);  
line(10, 66, 120,63);  
line(10, 66, -10,80);
strokeWeight(14);  
line(110, 19, 228,14);  
line(110, 19, 95,29); 

//glass
strokeWeight(9);  
ellipse(150, 75, 50, 85);  
strokeWeight(7);  
ellipse(210, 48, 30, 75); 

//dot
noStroke();
fill(255);
ellipse(115,58,7,9);
ellipse(227,12,5,7);



endShape();  
popMatrix();  
} 




