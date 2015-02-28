
  float centerPointx=400;
  float centerPointy=300;

void setup(){
 
 size(800,600);
background(0);
smooth();
stroke(8);
frameRate(5);

}


void draw(){
  noStroke();
  
 
//fill(random(255)) ;
  //ellipse(centerPointx,mouseY, mouseX,centerPointy); 
ellipse(mouseX,mouseY,mouseX,mouseY);

fill(random(255)) ;

for(float y=20;y<=height-20; y+=10){
 for(float x=20; x<=width-20; x+=10){
   ellipse(x,y,4,4);
    //draw line to center display
  
    line(x,y,centerPointx, centerPointy);
 }
}


//horse

//no wings

//tail
int x=mouseX;//this makes the tail movable
int y=mouseY;

fill(98,161,242);
arc(mouseX,mouseY,130,500,TWO_PI-PI/2, TWO_PI); 
fill(19,27,100);
arc(mouseX,mouseY,20,50,TWO_PI-PI/2, TWO_PI);

//back ear
fill(148,46,216);
arc(mouseX,mouseY,37,90, PI,TWO_PI-PI/2);

//horn
fill(180,244,255);
triangle(mouseX,mouseY,270,200,100,100);

//back flank
fill(141,46,219);
ellipse(mouseX,mouseY,67,86);

//back buttox
fill(141,48,209);
ellipse(mouseX,mouseY,160,160);

//background-back leg
fill(121,35,193);
triangle(mouseX,600,600,375,740,300);

//background-front leg
fill(121,35,193);
triangle(mouseX,mouseY-550,400,410,400,480);

//background-back knee
fill(172,88,229);
rect(mouseX,mouseY-540,37,46);

//background-back ankle
fill(197,115,252);
triangle(mouseX,mouseY-650,mouseX-520,mouseY-580,mouseX-540,mouseY-600);

//torso
fill(175,92,234);
ellipse(mouseX,mouseY-400,mouseX-350,mouseY-175);

//front buttox
fill(175,92,234);
ellipse(mouseX,400,190,190);

//Neck
arc(mouseX, 400, 250, 450, TWO_PI-PI/2, TWO_PI);

//face
ellipse(mouseX,220,100,100);
rect(mouseX,210,90,45);

//eye
fill(0);
ellipse(mouseX,202,25,20);
fill(156,248,252);
ellipse(mouseX,202,15,10);


//nose
fill(121,35,193);
triangle(mouseX,260,280,190,210,215);
arc(mouseX, 250, 50, 50, 0, PI/2);

//forefront-front flank
fill(203,143,252);
ellipse(mouseX,480,70,90);

//front leg
fill(203,143,252);
triangle(mouseX,630,420,460,450,500);

//foreground-back leg
fill(196,143,240);
triangle(mouseX,640,650,350,700,450);

//foreground-back knee
fill(191,122,237);
rect(mouseX,580,40,50);

//foreground-back ankle
fill(214,168,245);
triangle(mouseX,700,550,610,570,630);

//foreground-front knee
ellipse(mouseX,620,30,30);

//background-front knee
ellipse(mouseX,550,30,30);

//foreground-front ankle
fill(205,135,252);
triangle(mouseX,750,330,600,300,600);

//foreground-back ankle
fill(197,115,252);
triangle(mouseX,700,245,520,280,500);

//ears
fill(172,73,240);
arc(mouseX,180,40,100,TWO_PI-PI/2, TWO_PI);
}

//end of horse



