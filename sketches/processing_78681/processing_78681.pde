
/*float lux = (random(300,350));
float luy = (random(100,150));
float rux = (random(270,280));
float ruy = (random(50,100));
float lox = (random(220.380));
float loy = (random(20,110));
float rox = (random(200,400));
float roy = (random(1,200));*/
int mx = (mouseX);
int my = (mouseY);
float xr = (250);
float yr = (350);
float angle = 0.0;
float xl = (350);
float yl = (350);
void setup() {
     size(400,400);

}
    void draw() {
     background(200);
     
     println ("koordineaten (x/y): " + mouseX + "/" + mouseY);
     stroke(0);
     line(200,0,200,400);
     line(0,200,400,200);




      
      noStroke();
      fill(0);
      //links oben
      if (mouseX < 100 && mouseY < 100) {
       rect(0,0,100,100);
      } 
      //rechts oben
      else if (mouseX > 100 && mouseX < 200 && mouseY < 100) {
      rect(100,0,100,100);  
      stroke (255);
      
      noFill();
      noStroke();}
     //links unten
      else if (mouseX < 100 &&  mouseY > 100  && mouseY < 200) {
       rect(0,100,100,100);
      } 
      //rechts unten
      else if (mouseX > 100 && mouseX <200 && mouseY > 100 && mouseY <200) {
       rect(100,100,100,100);}
       
      else if (mouseX > 200 && mouseX <400 && mouseY > 200 && mouseY <400) {
        ellipse (300,300,200,200);
        frameRate(30);
        fill(255);
        ellipse (250,/*(random(240,260))*/ 250,30,40);
        ellipse (350,250,30,40);
beginShape();
       //oben links 
      vertex(xr,yr);
      vertex(250,380);
      vertex(300,380);
      vertex(350,380);
      //oben rechts
      vertex(xl,yl);}
      
      xr = xr + 1;
      yr = yr - 1;
       if (xr == 300){ 
           xr = 250;}
      if (yr == 300) {
        yr = 350;}
   
     xl = xl - 1;
     yl = yl - 1;
   if (xl == 300){
     xl = 350;}
   if (yl == 300){
   yl = 350;}
      endShape (CLOSE);
              noFill();
     smooth(); 

 if (mouseX > 0 && mouseX <100 && mouseY > 200 && mouseY <300) {
   fill(255);
arc(100,300,110,110,radians(270),radians(540));}
      
  else if (mouseX > 100 && mouseX <200 && mouseY > 200 && mouseY <300){
     fill(255);

arc(100,300,110,110,0,PI+HALF_PI);
  }
  
  else if (mouseX > 0 && mouseX <100 && mouseY > 300 && mouseY <400){
     fill(255);

arc(100,300,110,110,radians(180),radians(450));
  }
    else if (mouseX > 100 && mouseX < 200 && mouseY > 300 && mouseY <400){
     fill(255);

arc(100,300,110,110,radians(90),radians(360));
  }
  
  
  if (mouseX > 200 && mouseX <400 && mouseY > 0 && mouseY <200) {
    fill (255);
    pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  triangle (50,50,-50,50,0,10);
  angle += 0.1;
  popMatrix();
  translate(35, 10);
   /*translate(mouseX, mouseY);
     rotate(angle);
     rect(-15, -15, 30, 30);
     angle += 0.1;}*/
      
    }
      
      
/*if (!mousePressed) {
  ellipse(width/2,height/2,100,100);
} else {
  fill(255);
  rect(width/2,height/2,100,100);
}*/
}

