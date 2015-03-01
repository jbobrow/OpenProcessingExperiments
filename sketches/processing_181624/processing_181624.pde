

int x = 500;
int y = 500;
float mida = 100;
    

void setup (){
  
  size(x,y);
  background(123,207,214);
  

fill(17,170,28);
rect(0,mida*4,mida*2,x);
noFill();

}
  

void draw (){
  

  background(123,207,214);
  strokeWeight(4);
  strokeCap(ROUND);
 /* stroke(random(255),random(255),random(255)); */

 /*terra*/
noStroke();
fill(17,170,28);
rect(0,mida*4,mida*5,x);
noFill();

/*Colorstrokehoritzontal*/
 if(mouseX<=x/2){
stroke(random(255),random(80),random(80));
 }
 if(mouseX>=x/2){
stroke(random(80),random(80),random(255));

 }
  if(mouseX==x/2){
  
stroke(245,222,47);
}

 
line(mouseX,mouseY,x/2,x/2);

/*fill(random(255),random(255),random(255));*/


/*4 elipses*/

ellipse(mouseX+mida/4,mouseY+mida/4,mouseY/2,mouseY/2);
ellipse(mouseX-mida/4,mouseY-mida/4,mouseY/2,mouseY/2);
ellipse(mouseX+mida/4,mouseY-mida/4,mouseY/2,mouseY/2);
ellipse(mouseX-mida/4,mouseY+mida/4,mouseY/2,mouseY/2);


/*elipse centre*/

ellipse(mouseX,mouseY,mouseY,mouseY);
ellipse(mouseX,mouseY,mouseY/1.5,mouseY/1.5);

ellipse(mouseX,mouseY,random(mouseY/1.5),random(mouseY/1.5));

noFill();


/*pal*/
stroke(0);
strokeWeight(5);
line(x/2,x/2,x/2,mida*4.5);


}
