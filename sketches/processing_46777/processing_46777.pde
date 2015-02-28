
void setup() {
size(500,800);
smooth();

}
 
void draw () {
background (255);
randomSeed(mouseX+mouseY);
 
//VARIA

int PIEKS1 = 5;
int PIEKS2 = 7;
 
//SCHLEIFCHEN

for (int i=150; i<width; i=i+50){
for (int j=400;j<height;j=j+20){

 
//PIEKS     
     
PIEKS2 (random(255),0,random(255),100);
PIEKS1 (random(255),0,random(255),100);
     
      
    }
  }
}
 
//FUNKTION
  
void PIEKS1(float x,float y, float gruen, float blau) {
fill(y,gruen,blau,100);
noStroke();
triangle (random(-500,500),random(-700,700),random(-500,500),random(-500,500),x,x);
    
}
 
 
void PIEKS2(float x,float y, float gruen, float blau) {
fill(y,gruen,blau,100);
noStroke();
triangle (random(0,500),random(0,100),random(-500,700),random(-500,500),y,y);
 
}


void keyPressed () {
  if (key == 's') {
    saveFrame ("HINTERGRUND_BEISPIELSWEISE_PLAKAT_GRÜN_BLAU####.png");
  }
}

