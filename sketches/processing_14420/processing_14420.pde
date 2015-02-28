
int x = 600;  

int y = 340;   

int radius = 70;  
void setup(){
  size(600,600);
  noStroke();
  noStroke();
  fill(225);
  
}
void draw(){ 
 
 //background color change   
 float mapColorR=map(mouseX,0,600,10,255);
  float mapColorG=map(mouseX,0,600,20,255);
   float mapColorB=map(mouseX,0,600,30,255);
  fill(mapColorR,mapColorG,mapColorB);
  rect(0,0,width,height);
  
  for (int y=0; y <= height; y +=25){  

  for (int x= 0; x <= width; x +=25){  

    fill (196,142,255,144);  

    ellipse(x,y,35,35); }
  }
  
 
  //rect1 color change

 if ((mouseX >0) && (mouseX <100)&&
  (mouseY > 40) && (mouseY < 340)) {
    fill(254,67,101);
  }else{fill(94,159,163);
  }
rect(0,340,100,40);
 //rect2 color change
if ((mouseX >0) && (mouseX <200)&&
  (mouseY > 40) && (mouseY < 380)) {
    fill(252,157,154);
  }else{fill(220,209,180);
  }
rect(0,380,200,40);
 //rect3 color change
  if ((mouseX >0) && (mouseX <300)&&
  (mouseY > 40) && (mouseY < 420)) {
    fill(249,205,173);
  }else{fill(250,184,127);
  }
rect(0,420,300,40);
 //rect4 color change
if ((mouseX >0) && (mouseX <400)&&
  (mouseY > 40) && (mouseY < 460)) {
    fill(200,200,169);
  }else{fill(248,126,123);
  }
rect(0,460,400,40);
 //rect5 color change
if ((mouseX >0) && (mouseX <500)&&
  (mouseY > 40) && (mouseY < 500)) {
    fill(131,175,155);
  }else{fill(176,85,116);
  }
rect(0,500,500,40);
 //rect6 color change
 if ((mouseX >0) && (mouseX <540)&&
  (mouseY > 40) && (mouseY < 600)) {
    fill(238,153,245);
  }else{fill(218,245,153);
  }
rect(0,540,600,40);
 //ellipse color change
if ((mouseX >120) && (mouseX <300)&&
  (mouseY > 120) && (mouseY < 300)) {
    fill(156,184,180);
  }else{fill(245,242,193);
  }
 triangle(180,280,300,460,420,280);
triangle(180,400,420,400,300,220);
  //
 
   if (mousePressed == true) {
    if(mouseButton == LEFT) fill(180,195,142);  
  else if (mouseButton == RIGHT) 
      fill(180,195,142); 
 } else {
    fill(237,207,148);
  }quad(200,20,280,100,100,260,20,180);
quad(100,20,280,180,200,260,20,100);
  
  println("X:"+mouseX+"Y:"+mouseY);
  ellipse(mouseX,mouseY,10,10);

 if (mousePressed == true) {
    if(mouseButton == LEFT) //fill(156,48,87);
    fill (249,205,173);
  else if (mouseButton == RIGHT) 
     // fill(172,59,150); 
     fill(250,184,127);
 } else {
fill(252,157,154);
 }quad(300,300,420,0,440,160,600,200);
 //quad(420,0,480,120,600,200,460,140);
 quad(440,0,480,120,600,180,460,140);
 


textSize(20);  

  fill(91,33,155);  

  text("School",5,580);  

  text("Name",200,580);  

  text("Date",400,580);  

  if (keyPressed) {  

    if( (key == 'S') || (key == 's')) {  

      text(":Konkuk",70,580);  

    }  

    if ((key == 'N') || (key == 'n')) {  

      text(":Hao Qingqing",255,580);  

    }  

    if ((key == 'D') || (key == 'd')) {  

      text(":Oct 27. 2010",450,580);  

    }  

  }  

//fill(220,209,180);
ellipse(520,40,40,40);
//fill(252,157,154);
ellipse(540,120,20,20);
fill(249,205,173);
ellipse(580,20,10,10);
//fill(200,200,169);
ellipse(440,360,50,50);
//fill(131,175,155);
ellipse(500,460,60,60);
//fill(176,85,116);
ellipse(160,300,15,15);

 fill(200,200,169);
  quad(200,60,240,100,100,220,60,180);
  quad(100,60,240,180,200,220,60,100);
  fill(237,207,148);
quad(415,40,420,180,560,200,340,260);
//ellipse+++    

float check = dist(x,y,mouseX, mouseY);  

if(check < radius){  

  fill(201,240,213);  

   radius++;  

}else{ fill(240,201,231);}  

ellipse(x,y,radius,radius);  

// moving ellipse  

float mx = constrain(mouseX,240,231);  

float my = constrain(mouseY,255,285);
}


