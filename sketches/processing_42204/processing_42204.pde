
size(620, 620); 
background(000000); 
smooth(); 

// background 

PImage b; 
b = loadImage("Jungle_Dreaming_1600.jpg");
background(b); 

// extra fill
noStroke(); 
beginShape();
fill(230, 220, 175); 
noStroke(); 
vertex(335, 350);
vertex(500, 300); 
vertex(450, 500); 
vertex(335, 467); 

endShape(); 

//profile

fill(#000000); 
stroke(#FC0000);
strokeWeight(5); 
line(350, 25, 300, 0);
line(350, 25, 300, 150); 
line(300, 150, 350, 200);
line(350, 200, 300, 250); 
line(300, 250, 250, 350);
line(250, 350, 300, 370); 
noFill(); 
arc(300, 380, 60, 60, .1, 1); 
arc(326, 417, 30, 30, 2, 4); 
arc(340, 450, 35, 35, 2, 4); 
line(340, 470, 360, 490);  
line(320, 530, 360, 490);
line(340, 575, 320, 530); 
line(340, 575, 500, 580); 
arc(515, 530, 80, 80, 0, 1); 
arc(440, 580, 100, 100, 0, 1); 

//head fill
noStroke(); 
beginShape();
stroke(#000000);
strokeWeight(1);
fill(230, 220, 175);
vertex(370, 0); 
vertex(350, 25); 
vertex(300, 150); 
vertex(350, 200); 
vertex(300, 250); 
vertex(250, 350); 
vertex(300, 370);
vertex(326, 417); 
vertex(620, 417);
vertex(620, 0);
endShape(CLOSE);
beginShape(); 
vertex(340, 470); 
vertex(360, 490); 
vertex(320, 530); 
vertex(360, 490); 
vertex(340, 575);
vertex(320, 530); 
vertex(340, 575); 
vertex(500, 580); 
vertex(620, 620); 
vertex(620, 500); 
endShape(CLOSE); 
beginShape(); 
vertex(515, 530); 
arc(515, 530, 80, 80, 0, 1); 
arc(440, 580, 100, 100, 0, 1); 
endShape(CLOSE); 
beginShape(); 
vertex(320, 400); 
vertex(300, 380); 
endShape(CLOSE); 

// neck fill
noStroke(); 
beginShape(); 
arc(326, 417, 30, 30, 2, 4); 
arc(340, 450, 35, 35, 2, 4); 
line(340, 470, 360, 490);  
line(320, 530, 360, 490);
line(340, 575, 320, 530); 
line(340, 575, 500, 580);  

endShape(CLOSE); 

// lips fill
noStroke(); 
beginShape(); 
fill(#F7C0D8);
arc(326, 417, 30, 30, 2, 4); 
arc(340, 450, 35, 35, 2, 4); 
endShape(CLOSE); 
beginShape(); 
noStroke();
vertex(325, 415);
vertex(370, 433);
vertex(320, 428); 
endShape(CLOSE);
beginShape(); 
vertex(334, 435);
vertex(360, 441);
vertex(330, 455);
endShape(CLOSE); 




// nose
fill(#000000);
ellipse(300, 355, 40, 10); 

// eyebrow
beginShape();
fill(#4D2209);
vertex(340, 150); 
vertex(330, 130);
vertex(380, 120); 
vertex(440, 140); 
vertex(380, 140); 
endShape(CLOSE); 

//ear


//hair

beginShape();
strokeWeight(1); 
stroke(#4D2209); 
fill(#4D2209); 
vertex(300, 0);
vertex(320, 20);
vertex(620, 100); 
vertex(620, 0); 
endShape(CLOSE); 
beginShape();
vertex(440, 50); 
vertex(475, 200);
vertex(620, 370); 
vertex(620, 0); 
endShape(CLOSE); 

  

//eye

stroke(#FC0000); 
strokeWeight(5); 
noFill(); 
arc(400, 195, 50, 50, 2, 4); 
fill(#FFFFFF); 
arc(388, 195, 20, 20, 2, 4); 
line(370, 169, 425, 200); 
line(370, 225, 425, 200); 

//nose 

stroke(#FC0000); 
strokeWeight(5); 
noFill(); 
arc(320, 350, 50, 50, 0, 1); 

//mouth
noStroke(); 
stroke(#FC0000); 
strokeWeight(5); 
line(328, 437, 400, 440); 
line(400, 440, 320, 430);

//bottom mouth fill
noStroke(); 
beginShape(); 
noStroke(); 
fill(230, 220, 175); 
vertex(620, 400); 
vertex(620, 500);
vertex(400, 500);
vertex(400, 400);  
endShape(CLOSE); 
beginShape(); 
strokeWeight(5); 
vertex(370, 485);
vertex(340, 575);
vertex(325, 530); 
endShape(CLOSE); 







