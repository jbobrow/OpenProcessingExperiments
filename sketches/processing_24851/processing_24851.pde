


//what happens if you change these both to 50? what are they doing tothe pattern?
int patternSeperationX = 75;
int patternSeperationY = 75;


void setup(){
 size(300,600);

 smooth();
 //the white box simply shows you the space your pattern gets drawn in

 rect(0,0,patternSeperationX,patternSeperationY);

 background(255);

 for(int i = 0; i < 500/patternSeperationX; i++){
     for(int j = 0; j < 500/patternSeperationY; j++){
       pushMatrix();
       translate(i*patternSeperationX, j*patternSeperationY);
       yourFunction();
       popMatrix();
     }
 }

}


void yourFunction(){

 //-------------------------------------YOUR PATTERN GOES INHERE-------------------------------
 //try making pleasant designs :-)
fill(50, 54, 118, 30);
noStroke();
int rectwidth = 300;

for(int positionx=0; positionx<height; positionx=positionx+25){

     rect(positionx,0, 100, rectwidth);
   }




 int a = 0;

while(a < 20)
{


 stroke(0, 17, 70);
 strokeWeight(2);
 line(0, 11*a, width, 11*a);
 a = a+1;
}

}








