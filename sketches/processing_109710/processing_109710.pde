
void setup(){
size(600,600);
smooth();
}

void draw(){
background(200,230,255);

line(0,490,200,250);
line(200,250,600,250);
line(200,250,200,0);

    
fill(#EDE2A0);
rect(230,300,20,90); //left arm
rect(340,300,20,90); //right arm
rect(270,230,50,50); //head
rect(280,280,30,50);   //neck
rect(250,300,90,150);  //body
rect(250,450,30,70);  //left leg
rect(310,450,30,70);   //right leg

fill(255,0,0);  //red
rect(250,420,90,30);   //shorts

if (mousePressed) {

  fill(#EDE2A0);
rect(250,420,90,30);   //shorts
fill(255,0,0,150);
rect(250,490,90,30);
  } else {
 fill(#EDE2A0);
rect(250,450,30,70);  //left leg
rect(310,450,30,70);   //right leg

fill(255,0,0);  //red
rect(250,420,90,30);   //shorts
 
  }
    noFill();
  ellipse(mouseX,mouseY,60,60);
  ellipse(mouseX,mouseY,40,40);
  line(mouseX-50, mouseY, mouseX+50, mouseY);
  line(mouseX, mouseY-50, mouseX, mouseY+50); 
}
