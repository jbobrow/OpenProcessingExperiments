
//V-Man by Kennen Pflughoeft

void setup() {
  size(200,200);
  smooth();
  strokeWeight(1);
}  

void draw(){
  background(0);
  
  noFill();
  strokeWeight(2);
  stroke(abs(mouseY*1.25));
//Outter circle and quad  
  ellipse(100,100,200,200);//large outter circle
  stroke(abs((mouseY-200)*1.25));
  quad(17,35,17,200,183,200,183,35);//large outter square
 if(mouseY > 100){
   stroke(abs(mouseY*1.25));
   ellipse(100,100,200,200);
 }
   strokeWeight(1);
 //arms
  fill(255);
  stroke(255);
    ellipse(26 +(mouseY/40),((-mouseY/6.8)+70),18,10); //left hand
    ellipse(41+(mouseY/40),70-(mouseY/8.8),22,12);
    ellipse(60 +(mouseY/40),70-(mouseY/12.8),22,12);
    ellipse(80,70-(mouseY/25),20,20); 
    ellipse(174-(mouseY/40),((-mouseY/6.8)+70),18,10); //right hand
    ellipse(159-(mouseY/40),70-(mouseY/8.8),22,12);
    ellipse (140-(mouseY/40),70-(mouseY/12.8),22,12);
    ellipse(120,70-(mouseY/25),20,20);

//legs
    ellipse(90-(mouseY/14.5),145-((mouseY/50)),16,37); //inner left leg
    ellipse(90-(mouseY/8.7),164-(mouseY/40), 12,12);
    ellipse(90-(mouseY/6.5),179-(mouseY/25), 12,26);
    ellipse(90-(mouseY/5.5),195-(mouseY/17),14,8); //inner right leg
    ellipse(110 +(mouseY/14.5),145-(mouseY/50),16,37);
    ellipse(110+(mouseY/8.7),164-(mouseY/40), 12,12);
    ellipse(110+(mouseY/6.5),179-(mouseY/25), 12,26);
    ellipse(110+(mouseY/5.5),195-(mouseY/17),14,8);  
 
 //torso  
    ellipse(100,69,10,10); //neck
    ellipse(88,80,22,22); //left peck
    ellipse(112,80,22,22); //right peck
    ellipse(92,98,14,7);
    ellipse(108,98,14,7);
    ellipse(92,108,14,7);
    ellipse(108,108,14,7);
    ellipse(92,118,14,7);
    ellipse(108,118,14,7);    
    ellipse(100,50,23,27); //head 

//face
  fill(0);
    ellipse(95,50,3,3); //left eye
    ellipse(105,50,3,3);//right eye
    stroke(0);  
    line(98,57,102,57);//mouth
}  

