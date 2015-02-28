
void setup() {
size(500,500);
smooth();
ellipseMode(CENTER);
 
}
 
void draw () {
background (255);
randomSeed(mouseY);
 
 
//VARIA
int BLUBB1 = 20;
int BLUBB2 = 20;
int BLUBB3 = 20*2;
//int BLUBB4 = 50; 
 
//SCHLEIFCHEN
  for(int j = 1; j<BLUBB1; j++) {
  for(int i = 1; i<BLUBB2; i++) {
 
//FORM    
      BLUBB2 (height*BLUBB1*j,width*BLUBB2/i,i,random(255),random(100),random(255));
      BLUBB1 (width/BLUBB1*j,height/BLUBB2*i,j,random(255),random(155),random(255));
      BLUBB3 (height/BLUBB1*j,width/BLUBB2*i,j,random(255),random(155),random(255));
     // BLUBB4 (mouseX/BLUBB2*j,height/BLUBB3*2,i,random(255),random(155),random(255));
    }
    }
  }
 
 
 
//FUNKTION
  void BLUBB1(float x, float y,float r,float rot, float gruen, float blau) {
 
   
    fill(rot,gruen,blau,100);
    ellipse(x,y,r,r);
    
  }
 
 
  void BLUBB2(float x, float y,float r,float rot, float gruen, float blau) {
     
     
    fill(rot,gruen,blau,100);
    ellipse(random(-500,500),random (-500,500),r*4,r*4);
      
  }
   
   
   void BLUBB3(float x, float y,float r,float rot, float gruen, float blau) {
     
    noStroke();
 
    fill(rot,gruen,blau,200);
    ellipse(random(-500,500),random(-500,500),r*4,r*4);
      
 //void BLUBB4(float x, float y,float r,float rot, float gruen, float blau) {
     
    //noStroke();
 
   // fill(rot,gruen,blau,200);
    //ellipse(random(-500,500),random(-500,500),r*3,r*3);
           
 //}
   }

