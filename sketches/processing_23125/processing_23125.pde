
//david alvares-indestructible nave
int w = 0;
int e = 100;
int direccion = 15;
void setup (){
size (800,600);
frameRate (30);
}
void draw(){
  background (0);
 /* for (int t=0; t<width;t=t+10){
  for (int y=0; y<height;y=y+10){
fill (255);
noStroke();
ellipse (t,y,5,5);}}*/
  fill (50,120,200);
  strokeWeight(2);
  
  rect (mouseX,mouseY,50,50);
  triangle (mouseX,mouseY,30,50,100,150);
 // rect (200,300,mouseX-40,mouseY-40);
 if (mousePressed && (mouseButton == LEFT)) {
    fill(255,0,0,80);
    ellipse (w, 500, 80, 80);
     
  } else if (mouseButton == LEFT) {
    fill(200,random (30,200),random (w,200),60);
   
    rect (w++, 500, 50, 20); 
    ellipse (w, 500, e, e); 
    noStroke();
    fill (200,random (0,200),0);
    rect (w-40, 500, random (1,50),  20);
  } else {
    fill(2,200,100+w,80);
  
  rect (w, 500, 50, 20);
  rectMode (CORNER);
  rect (w-20, 500, random (10,30), 10);

  }
    
  stroke(1);

//rect (w, 500, 50, 50);

  w= w+direccion;
  if (w>=900 || w <= -2) {
    direccion =direccion *-1 ;}
  e= e-1;
  
}

  void mousePressed() {
  for (int r=0; r<800; r=r+10){
  fill(r,20,mouseX);
  noStroke();
  rectMode(CENTER);
  ellipse(mouseX+r,mouseY+r,25+r/4,25+r/4);
  
}
}
/*void keyPressed () {
  saveFrame ("dibu-####.png");}*/
   


