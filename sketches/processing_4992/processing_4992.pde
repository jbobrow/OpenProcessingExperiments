

  float x = 240;
  float y = 160;
  float p = 240;
  float q = 160;
  float z = 3;
void setup(){
 size(480,320); 
 smooth();
}

void draw(){
  background(200);
  fill(255);

  strokeWeight(2);
  //face

  rect(x-110,y-110,220,110);
  //left eye

  rect(x-100,y-100,90,50);
  //right eye
  rect(x+10,y-100,90,50);
  
  //pupillen
  float n = constrain(mouseX,x-45,x+35);
  float m = constrain(mouseY,y-100,y-60);
  rect(n-55,m,10,10);
  rect(n+55,m,10,10);
  
  //mouth

  rect(p-50,q-30,100,20);
  
  beginShape();
  vertex(p-40,q-32);
  vertex(p-30,q-60);
  vertex(p-20,q-32);
  vertex(p-20,q-32);
  vertex(p-10,q-45);
  vertex(p,q-32);
   vertex(p,q-32);
  vertex(p+10,q-45);
  vertex(p+20,q-32);
   vertex(p+20,q-32);
  vertex(p+30,q-60);
  vertex(p+40,q-32);
  endShape();
  
  float f = width/2;
  float v = 50;
  strokeWeight(2);
  fill(0);
beginShape();
vertex(f,v);
bezierVertex(f,v,f-20,v+10,f-20,v+20);
bezierVertex(f-20,v+30,f-10,v+30,f-10,v+30);
bezierVertex(f,v+30,f,v+20,f,v+20);
bezierVertex(f,v+20,f+35,v+45,f-10,v+45);
bezierVertex(f-25,v+45,f-50,v+25,f-40,v);
bezierVertex(f-30,v,f-20,v,f-20,v);
endShape(CLOSE);

fill(255);
strokeWeight(2);
ellipse(mouseX-20,mouseY,30,30);
ellipse(mouseX-30,mouseY-5,15,15);
ellipse(mouseX-10,mouseY-5,15,15);
fill(0);
ellipse(mouseX-30,mouseY-5,5,5);
ellipse(mouseX-10,mouseY-5,5,5);
noFill();
ellipse(mouseX-20,mouseY+10,10,10);  
  
if(mouseX>190 && mouseX<290 && mouseY>115 && mouseY<150){

    println("z" + z + " q" + q);
    
 q = constrain(q,160,190) + z; 
 if(q > 189){
  z = z*(-1); 
 }
 if(q==160){
   z = z *-1;
}


}
}

  

