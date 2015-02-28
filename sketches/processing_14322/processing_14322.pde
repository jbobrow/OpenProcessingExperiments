
int x = 600;
int y = 600;
int w = 0;
int radius = 70;


void setup() {
  size(600,600); smooth(); strokeJoin(ROUND);
}


void draw() {
  background(180,45,65); strokeWeight(3);


   
  //4
 if (keyPressed == true) {
    w = key - 32;
  fill(255);   rect(w, -1, 20, 601); 
  rect(w+120, -1, 20, 601); 
  rect(w+240, -1, 20, 601); 
  rect(w+360, -1, 20, 601); 
  rect(w+480, -9, 20, 601); 
  }



  
  //1
fill(255,116,118);
triangle(100,140,200,100,180,200);
triangle(380,280,540,360,520,500);
quad(340,480,440,600,360,600,320,500);
quad(340,520,320,600,200,600,320,520);
quad(220,300,240,320,200,420,120,380);
quad(220,120,360,200,260,300,180,200);
triangle(40,260,240,280,80,300);
fill(255,142,132);
quad(380,240,360,360,300,400,260,280);
quad(380,360,320,500,300,520,300,400);
triangle(400,260,540,220,580,260);
fill(255,190,170);
triangle(0,500,200,600,0,600);

strokeWeight(2);
noFill();
ellipse(200,600,200,200);

fill(126);
ellipse(440,160,40,40);
fill(200);
ellipse(460,180,40,40);
fill(255);
ellipse(mouseX, mouseY,60,60); 
ellipse(mouseX+20, 50, 22,22); fill(126);
float normX = mouseX / float(width);
ellipse(pow(normX, 4) * width, 50, 104,104);

//2
//ellipse+++ 
float check = dist(x,y,mouseX, mouseY);
if(check < radius){
  fill(255,220,230);
   radius++;
}else{ fill(255,0,0);}
ellipse(x,y,radius,radius);
 
 
 
  //3
  if (mousePressed == true) {
   fill(255,80,90); 
  }else {
    fill(0);
  }
  ellipse(157,117,22,22);
  
 
}


