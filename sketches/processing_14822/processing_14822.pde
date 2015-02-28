
int check; 
int arrowDir;



void setup() {
  int check; 
  size(600,600); 
  smooth(); 
  check = width/2; 
  strokeWeight (1);
  noCursor();
 
}

void draw() {
  background(255);
  
  {float mapColorR = map (mouseX, 0, 600, 0, 255 );
  float mapColorG = map (mouseY, 0, width, 0, 255);
  fill(mapColorR, mapColorG, 0);
  rect(0,0,width,height);
}
  
  
  
  
  
  if (mouseX > check) {
    check += 1; 
    arrowDir =- 50 ;
  } 
  else if (mouseX < check) {
    check -= 1; 
    arrowDir = 50 ;
  }
  line( check, 0, check, height);
  line( mouseX, mouseY, mouseX + arrowDir *2, mouseY);
  line( mouseX, mouseY, mouseX + arrowDir, mouseY-10);
  line( mouseX, mouseY, mouseX + arrowDir, mouseY+10);


{if ((keyPressed == true) && (key == 'a')) {  
    fill(75,16,16);  
     quad(410,400,500,380,540,440,460,520);   
 } else 
 fill(210);  
quad(410,400,500,380,540,440,460,520);  
 } 
  

{if ((keyPressed == true) && (key == 's')) {  
    fill(0,0,250);  
      quad(40,240,200,140,260,240,100,340);  
 } else 
  fill(60);
  quad(40,240,200,140,260,240,100,340); 
 } 
 

 {if ((keyPressed == true) && (key == 'd')) {  
    fill(0,240,0);  
     quad(60,320,140,320,140,400,60,400);  
 } else 
   fill(90);
   quad(60,320,140,320,140,400,60,400);  
 } 

{int x =340;
int y =60;
int w =260;
int h =10;
if((mouseX > x )&&(mouseX < x + w) && (mouseY > y) && (mouseY < y+h )){
  fill(240,221,10);
}else{
  fill(200);}

rect(x,y,w,h);
}

fill(240);
ellipse(180,440,10,10);
fill(240);
ellipse(140,400,40,40);
fill(200);
ellipse(140,140,180,180);
fill(180);
ellipse(60,60,70,70);
fill(240);
ellipse(140,10,10,10);


//rect(340,60,260,10);
fill(120);
quad(160,100,400,10,340,360,220,360);
fill(150);
ellipse(480,300,110,110);
fill(80);
ellipse(480,300,30,30);
fill(170);
ellipse(500,220,20,20);
fill(140);
ellipse(470,180,10,10);
fill(115);
quad(260,460,480,320,500,340,280,480);
fill(180);
quad(0,560,400,560,400,580,0,580);
fill(225);
ellipse(460,600,280,280);



}

