
float marge;
float p;
float i;
float j;

int deplacementX=5;
int deplacementY=7;
int x=50;
int y=50;

void setup(){      
  size(1000,400); 
 background (#6C0277);     
     
}   
   
void draw(){   
  //background (#6C0277);   
  smooth(); 
  x = x + deplacementX;
  y = y + deplacementY;
  rebondir();
  for(i=  marge; i <= height-marge; i += 200){   
    for (j = marge; j <=width-marge; j +=50){ 

       p= 333 - sqrt((x - j)*(x - j)-(y - i)*(y -i));   
       ellipse(j,i,p,p); 
       stroke(#ED7F10,100);  
       ellipse(x,y,50,50); 
       fill(#DFAF2C,#A10684,50,50); 
    }   
  } 
 if (mousePressed==true){
    x=mouseX;
    y=mouseY;
  }  
}   

void rebondir() {
 
 if (x > 975) {
   deplacementX = -5;
 }
 
 if (x < 25) {
   deplacementX = 5;
 }
 
 if (y > 375) {     
   deplacementY = -3;
 }
 
 if (y < 25) {          
   deplacementY = 3;
 }

}


