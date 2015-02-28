
void setup(){
smooth();
size(500,500);

}

void draw(){
  background(253,246,134);
  randomSeed(mouseY);
  
//alle Variablen 
  int wert1 = 20;
  int wert2 = 20;

// alle Schleifen
  for(int i = 1; i<wert1; i = i + 2){
  for(int j = 1; j<wert1; j = j + 2){
  float r = sin(i/(300.0)*0.2);
    
//Die eigentliche Form
kaeseloecher(width/wert1*j,height/wert1*i,random(1, 15),i*25,j*25,0);
mickey1(width/wert1*j,height/wert1*i,random(1, 12)*mouseY*r,i*25,j*25,0);

 }
  }
}
   
void mickey1(float x, float y, float r, float rot, float gruen, float blau){
  noStroke();
  
  fill(0,0,0);
  ellipse(x,y,r+20,r+20);
  ellipse(x-11,y-11,r+13,r+13);
  ellipse(x+11,y-11,r+13,r+13);
  
  
  fill(255);
  ellipse(x-4,y-2.5,r+6,r+6);
  ellipse(x+5,y-2.5,r+6,r+6);
  ellipse(x,y+3.5,r+5,r+5);
  
  fill(0,0,0);
  ellipse(x+5,y-2.5,r+2,r+2);
  ellipse(x-4,y-2.5,r+2,r+2);
  
  fill(255);
  ellipse(x+5,y-2.5,r-7,r-7);
  ellipse(x-4,y-2.5,r-7,r-7);
  }

   
void kaeseloecher(float x, float y, float r, float rot, float gruen, float blau){
  noStroke();
  fill(198,175,66);
  ellipse(x+20,y+11,r+1,r+4);
}

