
void setup(){
    size(500,500);
    background(#734379);
    smooth();
}
    
void draw(){
  //body
  fill(#1EE6FA);
  noStroke();
  ellipse(width/2,height/2-50,250,250);//head
  //body
  fill(#E01EFA);
  ellipse(width/2,height/2+300,400,400);
  stroke(#1EE6FA);
  line(width/2,height/2+180,width/2,height/2+250);
  noStroke();
  fill(#1EE6FA);
  ellipse(width/2+20,height/2+200,10,10);
  ellipse(width/2+20,height/2+230,10,10);
  
  //neck
  fill(#1EE6FA);
  noStroke();
  rect(width/2-35,height/2+50,80,60);
  ellipse(width/2+4,height/2+100,80,80);
  
  //ears
  noStroke();
  fill(#1EE6FA);
  rect(width/2-150,height/2-66,50,30);
  rect(width/2+100,height/2-66,50,30);
  ellipse(width/2-150,height/2-51,30,30);
  ellipse(width/2+150,height/2-51,30,30);
  fill(#E01EFA);
  ellipse(width/2-150,height/2-51,15,15);
  ellipse(width/2+150,height/2-51,15,15);
 
  
  //face
  //eyes
  stroke(#734379);
  strokeWeight(18);
  ellipse(200,200,30,30);
  strokeWeight(12);
  ellipse(300,200,20,20);
  //nariz
  strokeWeight(25);
  stroke(#E01EFA);
  line(220,240,280,240);
  //boca
  fill(#734379);
  noStroke();
  rect(width/2-40,height/2+20,80,10);
  //strokeWeight(0);
  
   
  //hands
  fill(#1EE6FA);
  quad(width/2-190,height/2+120,  width/2-150,height/2+120,  width/2-115,height/2+250,  width/2-220,height/2+250);
  ellipse(width/2-171,height/2+100,80,80);
  //fingers
  ellipse(width/2-171,height/2+50,20,20);
  ellipse(width/2-141,height/2+60,20,20);
  ellipse(width/2-200,height/2+60,20,20);
  ellipse(width/2-220,height/2+90,20,20);
  ellipse(width/2-122,height/2+98,20,20);
  
  //hat
  //stroke(0);
  //strokeWeight(0);
  noStroke();
  fill(#E01EFA);
  triangle(width/2,height/2-225, width/2+31,height/2-170, width/2-30,height/2-170);
  ellipse(width/2,height/2-170,58,40);
  fill(#1EE6FA);
  ellipse(width/2,height/2-225,20,20);
  
  //hat lines
  strokeWeight(11);
  strokeCap(ROUND);
  stroke(#1EE6FA);
  line(width/2-70,height/2-225,width/2-30,height/2-225);
  line(width/2+30,height/2-225,width/2+70,height/2-225);
  
  //dientes
  //stroke(0);
  //strokeWeight(1);
  noStroke();
  fill(#734379);
  triangle(width/2,height/2+50, width/2+15,height/2+20, width/2-15,height/2+20);
  triangle(width/2+25,height/2+50, width/2+40,height/2+20, width/2+10,height/2+20);
  //stroke(0);
  //strokeWeight(1);
  triangle(width/2-25,height/2+50, width/2-40,height/2+20, width/2-10,height/2+20);
  
  //hair
  //stroke(#E01EFA);
  //strokeWeight(0);
  //noFill();
  //curve(240,250,200,280,240,250,240,250);
  
  
  
  //rect(width/2+150,height/2+100,60,300);
  //ellipse(width/2+180,height/2+100,60,60);
  
  
  
  
  
    
  
}
