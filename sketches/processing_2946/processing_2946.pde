
float a,b,c; 
float d=2+(random(255)/4); 
float mov=noise(d); 
void setup(){ 
a=0; 
float b= random(200,150); 
float c= random(100,155); 
size(500,500); 
noiseDetail(5,0.5); 
noStroke(); 
background(b,c,60); 
 
} 
void draw(){ 
   
  a+=0.02; 
  float tam=noise(a); 
  float x=random(width); 
  float y=random(height); 
  float r=noise(c); 
  
  float rojo=random(100,240); 
  float verde=random(20,100); 
  
 
   int se= second();
 

pushMatrix(); 
rotate((r*4)*se); 
scale(tam*2.5,tam*2.5); 
//pinta solo los circulos con alto y ancho "se" menores a 30
for(se=second(); se<=30; se+=2) {
  if (se>=30) {
  
    noTint();
    
  } 
}
ellipse(x,y,se,se);
stroke(rojo,verde,60,90);
fill(rojo,verde,60,80); 
popMatrix(); 

}

