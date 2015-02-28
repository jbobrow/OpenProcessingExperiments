
float j,rb,gb;
float as=2+(random(255)/4);
float mov=noise(as);
void setup(){
j=0;
float rb= random(150,200);
float gb= random(100,180);
size(669,669);
noiseDetail(6,0.7);
smooth();
noStroke();
background(rb,gb,2);

}
void draw(){
  
  j+=0.02;
  float tam=noise(j);
  float as=2+(random(255)/4);
  float x=random(width);
  float y=random(height);
  float r=random(200);
  float q=random(200);
  float reD=random(100,240);
  float greeN=random(10,100);
  //float transp=random(100,255);
  float mov=noise(as);
  

//translate(second()*0.5,mov*second(),mov);

/*rotate(r*second());
rect(x,y,r,q);
fill(reD,greeN,0,transp);*/

//translate(millis()*x,millis()*y);
pushMatrix();
rotate((r*6)*second());
scale(tam*2,tam*2);
beginShape();//pseudo estrellas/hojas artesanales
vertex(x,y);
vertex(x-10,y+10);
vertex(x-30,y+10);
vertex(x-20,y+20);
vertex(x-25,y+30);
vertex(x-1,y+25);
vertex(x-5,y+40);
vertex(x+5,y+40);
vertex(x+1,y+25);
vertex(x+25,y+30);
vertex(x+20,y+20);
vertex(x+30,y+10);
vertex(x+10,y+10);
endShape(CLOSE);
fill(reD,greeN,0);
popMatrix();
}


