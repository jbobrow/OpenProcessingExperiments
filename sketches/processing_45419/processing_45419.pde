
int x=0;
 
void setup(){  
 
size (650, 650);
}
 
void draw (){
background (0); 
fill (206,176,21);
 ellipse (x,325,100,100); 
 
x=x+11; 
  
 if (x >= width + 100) {
   x=-100;
  
}
 
strokeWeight (1);   
 
stroke(2);
fill (182,62,234,45);
for (int i=0; i<325; i+= 25){
ellipse (325,325,325,i);    
}
 
stroke(24,183,12);
strokeWeight (2);
for (int i=0; i<650; i+= 10){
  line (325,i,i,325);    
}
 
stroke (118,10,124);
fill (220,92,227,25);
triangle (50,50,325,0,0,325);
 
stroke (118,10,124);
fill (220,92,227,25);
triangle (600,600,325,650,650,325);
 
 
beginShape (LINES);
 
vertex (325,0);
vertex (650,325);
vertex (325,650);
vertex (0,325);
 
 
endShape();  
 
}

