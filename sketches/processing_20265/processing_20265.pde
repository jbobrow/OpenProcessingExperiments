
void setup () {
  size(400,400);
  background(255);
  rectMode(CENTER);
 
}
 

float roofWidthLeft = 50;
float roofWidthright = 350;
float pilotisRight =200;
float pilotisLeft =200;
float roofGarden =130;
 
void draw () {
}
void keyPressed() {
  if (key == 'w' || key == 'W') {
   roofGarden-=10;

 showBuilding();
  }
  
  else if (key == 's' || key == 'S') {
   roofGarden+=10;

 showBuilding();
  }
  else if (key == 'd' || key == 'D') {
   pilotisRight--;
   pilotisLeft++;
 showBuilding();
  }
  
  else if (key == 'a' || key == 'A') {
   pilotisRight++;
   pilotisLeft--;
 showBuilding();
  }

 }
 
 
 
void  showBuilding(){
  background(255);
  
fill(27,147,1);
beginShape();
vertex(20,130);
vertex(60,roofGarden);
vertex(100,130);
vertex(140,roofGarden);
vertex(180,130);
vertex(220,roofGarden);
vertex(260,130);
vertex(300,roofGarden);
vertex(340,130);
vertex(380,roofGarden);
vertex(380,130);
  
endShape();


 fill(255);
 rect(pilotisLeft-240,315,15,170);
  rect(pilotisLeft-180,315,15,170);
rect(pilotisLeft-60,315,15,170);
rect( pilotisRight+60,315,15,170);
rect(pilotisRight+180,315,15,170);
rect(pilotisRight+240,315,15,170);
 rect(200,180,360,100);
for (int x=width/4; x<380; x+=width/4)
{   fill(95,143,144,50);
  if(x%2==0) {
    rect(x,180,100,height/12);
   
  }
  }
}
   





