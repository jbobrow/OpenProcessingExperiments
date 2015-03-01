
float ang;
int s = 160;

void setup(){
  size(600,400);
  
}
void draw(){
  float x = cos(ang) * s;
  float y = sin(ang)* s;
  background(#0623BF);
  stroke(0);
  fill(#989426);
  rect(75,200,100,300);
  rect(70,100,110,100);
  fill(#09AD67);
  triangle(70,100, 180, 100, 125, 50);
  fill(#989426);
  rect(90, 50,70, 30);
  fill(#09AD67);
  triangle(90,50, 160, 50, 125, 10);
  
  
 
  
  for (int i = 80; i < 175; i +=5){
    fill(0);
    line(i, 200,i, height);
  }
  for (int i = 75; i < 180; i +=5){
    fill(0);
    line(i, 100,i, 200);
  }
   for (int i = 95; i < 160; i +=5){
  
    line(i, 50,i, 80);
  }
   fill(#585506);
   rect(85,110, 80,80);
   fill(#EDECDA);
   ellipse(125,150,80,80);
   line(125,0, 125, 10);
   line(90,30, 90, 50);
   line(160,30, 160, 50);
   line(70,80, 70, 100);
   line(180,80, 180, 100);
   fill(#F2EB05);
   ellipse(125,0, 5,5);
   ellipse(90,30, 5,5);
   ellipse(160,30, 5,5);
   ellipse(70,80, 5,5);
   ellipse(180,80, 5,5);
    line(125,150,125,205);
    line(125,150,165,150);
    fill(0);
    rect(123,110,5,10);
    rect(154,148,10,5);
    rect(123,180,5,10);
    rect(86,148,10,5);
    
    
    //London Eye
   
    fill(255);
    triangle(400,200, 200, 500, 600,500);
    fill(#0623BF);
    triangle(400, 250, 260, 450, 540, 450);
    fill(255);
    ellipse(400,200,300,300);
    
    fill(#0623BF);
    ellipse(400,200,290,290);
    fill(255);
    ellipse(400,200,260,260);
    fill(#0623BF);
    ellipse(400,200,250,250);
    
     stroke(255);
     
     line(400, 75, 400, 325);
     
     line(275,200,525,200);
     line(310,110,490,290);
     line(490,110,310,290);
    
     
     stroke(0);
     
     fill(255);
     
    ellipse(400,200,40,40);
     pushMatrix();
  translate(400,200);
  fill(255);
  
  ellipse(x,y,20,20);
  
  popMatrix();
   pushMatrix();
  translate(400,200);
  fill(255);
  rotate(PI);
  ellipse(x,y,20,20);
   rotate(PI/2);
  ellipse(x,y,20,20);
   rotate( PI/4);
  ellipse(x,y,20,20);
    rotate(3 * PI/4);
  ellipse(x,y,20,20);
   rotate(3*PI/4);
  ellipse(x,y,20,20);
   rotate(2 * PI/2);
  ellipse(x,y,20,20);
   rotate(4 * PI/8);
  ellipse(x,y,20,20);
  popMatrix();

    ang += .01;
   
  
}


