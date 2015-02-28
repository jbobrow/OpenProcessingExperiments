
void setup(){  

size(600,600);  

noStroke();  

}  

void draw(){  

background(255);  

smooth();  

glasses(10,10,1,0, 255,255,255);  
glasses(320,220,1,180, 200,200,200);

glasses(500,0,1,90, 250,200,200);  
glasses(500,310,1,270, 200,250,200); 

glasses(280,270,1,135, 200,200,250);  
glasses(10,550,1,315, 250,250,150);


glasses(530,620,1.5,225, 100,100,100);  
glasses(310,450,0.5,45, 50,50,50);

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



strokeWeight(30);  
line(a-3, a, 45,a);  
line(265, a, 273,a);  

strokeWeight(20);  
beginShape();  
vertex(140, a);  
bezierVertex(140,a, 155, 30, 170, a);  
endShape();  


strokeWeight(13);  
line(30, 45, 35,85);  
line(280, 45, 275,85);  


strokeWeight(10);  
ellipse(95, 50, 90, 80);  
ellipse(215, 50, 90, 80); 

noStroke();
fill(255);
ellipse(35,35,10,5);
ellipse(275,35,10,5);


endShape();  
popMatrix();  
} 



