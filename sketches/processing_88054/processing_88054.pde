
float fade = 0;
int passedTime = 0;
boolean boolFade = false;
int x= 0;
void setup(){
  size(500,500);  
  background(255);
}

void draw(){
 

 
 if (x==0) {
    fill(random(0,255),random(0,255),random(0,255));
   stroke(random(00,250),0,random(50,200), 80);
   strokeWeight(0.3);
      line (mouseX,mouseY,random(0,500),random(0,500));  
      }
     
     else if (x==1) {
       fill(255);
     noStroke();
     background(0);
     rect (mouseX-27,mouseY-27,55,55); 
     }
         else if (x==2) {
            fill(random(0,255),random(0,255),random(0,255));
     noStroke();
     ellipse (mouseX,mouseY,50,50); 
}

else if (x==3) { link("http://swagaisvasta.tumblr.com"); }

}
void mouseReleased(){
    x=x+1;
}


