
void setup(){
  size(300,300);
  background(255);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  
   for(int a= -90; a<270; a=a+60){
    pushMatrix();
    strokeWeight(10);
    stroke(#B22222);
    rotate(radians(a));
    noFill();
    ellipse(60,0,150,150);
    popMatrix();
  }
  
  for(int b= -90; b<270; b=b+60){
    pushMatrix();
    noStroke();
    fill(255);
    rotate(radians(b));
    ellipse(60,0,150,150);
    popMatrix();
  }
  
  //Das Ziffernblatt
  for (int i = -90; i<270; i=i+6){
    pushMatrix();
    strokeWeight(5);
    stroke(#B22222);
    rotate(radians(i));
    point(110,0);
    popMatrix();  
  }
  //Die dicken Punkte des Zifferblatts 
  for(int d= -90; d<270; d=d+30){
      pushMatrix();
      strokeWeight(6);
      stroke(#000080);     
      rotate(radians(d));
      line(110,0, 105, 0);
      popMatrix();
    }
  
  //Stundezeiger
  strokeWeight(5);
  stroke(#000080);
  pushMatrix();
  rotate(radians(hour()*30-90+minute()/2));
  line(-20,0,70,0);
 
  popMatrix();
  
  //Minutenzeiger
  strokeWeight(5);
  stroke(#000080);
  pushMatrix();
  rotate(radians(minute()*6-90));
  line(-20,0,90,0);
  popMatrix();
  
  //Sekundenzeiger
  strokeWeight(3);
  stroke(#B22222);
  pushMatrix();
  rotate(radians(second()*6-90));
  line(-20,0,102,0);
  strokeWeight(6);
  stroke(0);
  popMatrix();

  //Das Mittelpunkt
  for(int e= -90; e<270; e=e+90){
    pushMatrix();
    noStroke();
    fill(#FFD700);
    rotate(radians(e));
    ellipse(5,0,10,10);
    popMatrix();
  }
}


