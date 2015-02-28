
int i=1;
int currentRender=0;
int maxRender=101;
void setup() {
  size(800,500);

}


void draw() {
 
  translate(0,60);
   background(255);
     background(75);
      
  for (int x=0; x<width; x=x + 10) {
    for (int y=0; y <height; y=y +200) {
      noFill();
      stroke(x*.2, y*.5, (y+x)*.5);
      strokeWeight(x*.001);
      smooth();
      bezier(x, y,  58, 15,  58, 175,  x, y+100);
    }
  }
  pushMatrix(); 
  scale(.5);
  translate(width, height); 
  rotate(PI/1);  
  for (int p=width; p>0; p=p - 10) {
    for (int d=height; d>0;d=d -200) {
      noFill();
      stroke(p*.2, d*.5, (d+p)*.5);
      strokeWeight(p*.001);
      smooth();
      bezier(p, d,  58, 15,  58, 175,  p, d+100);
    }
  }
  popMatrix();
   
   
   
    filter(BLUR, 0.6);    
    pushMatrix(); 
    translate(i++*10,0/*width*.55,0*/);
    scale(.5);
    drawRobot();
    popMatrix();
    /*currentRender++;
   if(currentRender<maxRender){
	saveFrame("robot-####.jpg"); 

}
*/
  }

void mouseClicked() { 
  
    filter(INVERT);
    pushMatrix(); 
    translate(0,-300);   
    translate(mouseX/2,mouseY/2);
    scale(0.2);
    drawRobot();
    popMatrix();
    
    filter(INVERT);
    pushMatrix(); 
    translate(0,-300);   
    translate(mouseX/2,mouseY*.25);
    scale(0.2);
    drawRobot();
    popMatrix();
  
  
  filter(INVERT);
    pushMatrix();   
    translate(mouseX/2,mouseY*.75);
    scale(.5);
    drawRobot();
  
  
  filter(INVERT);
    pushMatrix();  
    translate(0,-300);  
    translate(mouseX*.25,mouseY/2);
    scale(0.7);
    drawRobot();
    popMatrix();
  
  
  filter(INVERT);
    pushMatrix();  
    translate(0,-300); 
    translate(mouseX*.75,mouseY/2);
    scale(0.9);
    drawRobot();
    
    /*rectMode(CENTER);
    fill(150);
    rect(250,450,200,200);
    ellipse(109,390,80,80);
    ellipse(391,390,80,80);
    rectMode(CENTER);
    rect(109,481,30,100);
    rect(391,481,30,100);
    ellipse(109,481+71,40,40);
    ellipse(391,481+71,40,40);
    rect(200,575,50,50);
    rect(300,575,50,50);
    rect(200,610,20,20);
    rect(300,610,20,20);
    rect(200,645,50,50);
    rect(300,645,50,50);
    rect(200,665,50,10);
    rect(300,665,50,10);
    ellipse(250,170,300,300);
    rect(250,335,10,30);
    fill(195);
    ellipse(175,150,50,50);
    ellipse(325,150,50,50);
    fill(50);
    rect(250,200,10,50);
    line(220,275,280,275);
    line(220,255,280,255);
    line(220,265,280,265);
    ellipse(175,150,20,20);
    ellipse(325,150,20,20);
    rect(82,180,40,40);
    rect(418,180,40,40);
    rect(52,180,20,20);
    rect(448,180,20,20);
    point(200,70);
    point(250,70);
    point(300,70);
    point(200,90);
    point(250,90);
    point(300,90);
    point(200,110);
    point(250,110);
    point(300,110);
    rect(250,400,150,20);
    point(200,70+400);
    point(250,70+400);
    point(300,70+400);
    point(200,90+400);
    point(250,90+400);
    point(300,90+400);
    point(200,110+400);
    point(250,110+400);
    point(300,110+400);
    */
    popMatrix();
    
    /*
    currentRender++;
   if(currentRender<maxRender){
	saveFrame("robot-####.jpg"); 
*/
    
  
  

}


void drawRobot(){
 rectMode(CENTER);
    fill(150);
    rect(250,450,200,200);
    ellipse(109,390,80,80);
    ellipse(391,390,80,80);
    rectMode(CENTER);
    rect(109,481,30,100);
    rect(391,481,30,100);
    ellipse(109,481+71,40,40);
    ellipse(391,481+71,40,40);
    rect(200,575,50,50);
    rect(300,575,50,50);
    rect(200,610,20,20);
    rect(300,610,20,20);
    rect(200,645,50,50);
    rect(300,645,50,50);
    rect(200,665,50,10);
    rect(300,665,50,10);
    ellipse(250,170,300,300);
    rect(250,335,10,30);
    fill(195);
    ellipse(175,150,50,50);
    ellipse(325,150,50,50);
    fill(50);
    rect(250,200,10,50);
    line(220,275,280,275);
    line(220,255,280,255);
    line(220,265,280,265);
    ellipse(175,150,20,20);
    ellipse(325,150,20,20);
    rect(82,180,40,40);
    rect(418,180,40,40);
    rect(52,180,20,20);
    rect(448,180,20,20);
    point(200,70);
    point(250,70);
    point(300,70);
    point(200,90);
    point(250,90);
    point(300,90);
    point(200,110);
    point(250,110);
    point(300,110);
    rect(250,400,150,20);
    point(200,70+400);
    point(250,70+400);
    point(300,70+400);
    point(200,90+400);
    point(250,90+400);
    point(300,90+400);
    point(200,110+400);
    point(250,110+400);
    point(300,110+400);

}





