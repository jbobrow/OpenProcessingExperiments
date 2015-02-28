


void setup(){
 size(500,500);
 smooth(); 
}

void draw(){
  fill(255);
  rect(width/2,height/2, 500,500);
 
 //HEAD 
 fill(255);
 stroke(0);
 strokeWeight(2);
 beginShape();
 vertex(width-150,height/6);
 vertex(width-150,height/3+30);
 vertex(width/2+80,height/3+60);
 vertex(width/2+70,height/2+110);
 vertex(width/2+30,height/2+120);
 vertex(width/2-30,height/2+120);
 vertex(width/2-70,height/2+110);
 vertex(width/2-100,height/3+60);
 vertex(130,height/3+30);
 vertex(130,height/6);
 endShape(CLOSE);
  
 //GLASSES 
 stroke(0);
 strokeWeight(3);
 line(width/2-25,height/3, width/2+25,height/3); 

 fill(255);
 rectMode(CENTER);
 rect(width/2-60,height/3, 70,30);
 rect(width/2+60,height/3, 70,30);
 
 //EYES
 stroke(0);
 strokeWeight(2);
 fill(255);
 arc(width/2+60,height/3-15, 50,50, PI,PI*2);
 arc(width/2-60,height/3-15, 50,50, PI,PI*2);
 
 fill(0);
 arc(width/2+60,height/3-15, 20,20, PI,PI*2);
 arc(width/2-60,height/3-15, 20,20, PI,PI*2);
 
 //EYEBROWS
 stroke(0);
 strokeWeight(5);
 rect(width/2-60,height/3-40, 50,10);
 rect(width/2+60,height/3-40, 50,10);
 
 //SMILE
 fill(255);
 stroke(0);
 strokeWeight(2);
 beginShape();
 vertex(width/2-50,mouseY);
 vertex(width/2+60,height/2+40);
 vertex(width/2+50,height/2+80);
 vertex(width/2-50,height/2+80);
 vertex(width/2-70,height/2+30);
 endShape(CLOSE);
 
 line(width/2-50,height/2+55, width/2+50,height/2+55); 
 strokeWeight(20);
 line(width/2-25,height/2+100, width/2+25,height/2+100); 

  
}


