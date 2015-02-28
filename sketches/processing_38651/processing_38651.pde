


void setup(){
   size(400,400);
   frameRate(7);
}



void draw(){
 background(159,232,244);
  stroke(255,236,77,random(140,225));
  
fill(255,236,77,random(140,225));


float Vx=random(4,230);
float Vy=-random(6,230);
float Va=random(4,50);
float Vb=-random(6,50);
float g=5;
float time=0;
float y=0;

beginShape();
vertex(mouseX,mouseY-250);
vertex(mouseX+24,mouseY+70-250);
vertex(mouseX+94,mouseY+70-250);
vertex(mouseX+40,mouseY+115-250);
vertex(mouseX+64,mouseY+181-250);
vertex(mouseX,mouseY+142-250);
vertex(mouseX-64,mouseY+181-250);
vertex(mouseX-40,mouseY+115-250);
vertex(mouseX-94,mouseY+70-250);
vertex(mouseX-24,mouseY+70-250);
endShape(CLOSE);

  strokeWeight(5);
   smooth();
 
 //while((mouseY+g*time*time/2)<800){  
   
  // ellipse(mouseX+time*Vx,mouseY-150+g*time*time/2,20,20);
   //time=time+0.3;
 //}
   strokeWeight(3);
   fill(255,148,22,random(0,225));
   stroke(255,148,22,random(0,225));
   ellipse(mouseX,mouseY-150,Vx,Vy);
   
      strokeWeight(1);
   fill(199,32,32,random(0,225));
   stroke(199,32,32,random(0,225));
   
   ellipse(mouseX,mouseY-150,Va,Vb);
}





