
// Variables Globales
color cel=color (117,170,219);
color ama=color(252,191,73);
color bla=#EAEAEA;

void setup(){
  size(851,315);
  background(bla); 
  smooth();
  frameRate(20);
}

void draw(){
 

  
 background(cel);
    pushMatrix();
     translate(0,height/2);
   
         linea();
    
     translate(width/2,0);
   sol(mouseY,3,mouseX/2);
   popMatrix();
 //}

}

void linea(){
  stroke(bla);
  noFill();
  ///// horizontales

  float esc=map(mouseX,0,width,1,100); 
  float amp=map(mouseY,0,height,1,100);

      strokeWeight(esc);
       beginShape();  
         curveVertex(0,0);  ///control point
         for (int i=0;i<25;i++){
           curveVertex(i*40,random(-amp,amp));
         }
       endShape();   
}
  
void sol(int rep, int scal,float lar){
  stroke(ama);
  strokeWeight(scal);
 
 
 lar=lar/8;
 
  for (int i=0;i<rep*2;i++){
       float vert=random(TWO_PI);
     
     rotate(vert);
     line(i,random(-lar,0),i,random(0,lar));
 
  }
  
}  
  
  
  
  
