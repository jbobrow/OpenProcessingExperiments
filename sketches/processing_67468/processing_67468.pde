
void setup (){
size(800,800);
 
smooth();
}
 
 
 
 
 
 
//////////////////////////////// 
void draw (){
background(0);
pushMatrix();
 
 
 
 
float moveX =   mouseX/30-50;
float moveX2 =   mouseX/30+50;
float moveY=   mouseY/30;




fill(00,200,100);
ellipse(width/2,height/2,343*mouseX/100,1000);
fill(170,0,0);
ellipse(width/2,height/1,100*mouseX/100,100*mouseY/100);
fill (100,10,10);
ellipse(width/2,height/1,100*mouseX/300,100*mouseY/300);
 

 /////////OHREN/////
 noStroke();
 fill(00,200,100);
 beginShape();
vertex(400, 250);
vertex(400, 450);
vertex(800+mouseX/10,100+mouseY/10);
endShape(CLOSE);

 beginShape();
vertex(400, 250);
vertex(400, 450);
vertex(0-mouseX/10,100-mouseY/10);
endShape(CLOSE);
 
 
///////////////////////

fill(0,0,0);
ellipse(moveX+width/2,moveY+height/2,20,20);
ellipse(moveX2+width/2,moveY+height/2,20,20);
rect(moveX+width/2-20,moveY+height/2-40,40,10);
rect(moveX2+width/2-20,moveY+height/2-40,40,10);
fill (255);
ellipse(moveX+width/2,moveY+height/2,5,5);
ellipse(moveX2+width/2,moveY+height/2,5,5);


 
popMatrix();
    
 
if (mousePressed == true) {
  fill (255,0,0);
  beginShape();
vertex(400, 100);
vertex(400, 250);
vertex(mouseX,mouseY);
endShape(CLOSE);
 
  beginShape();
vertex(350, 175);
vertex(450, 175);
vertex(mouseX,mouseY);
endShape(CLOSE);

fill(0,0,0);
ellipse(moveX+width/2,moveY+height/2,20,20);
ellipse(moveX2+width/2,moveY+height/2,20,20);
 
}
}


