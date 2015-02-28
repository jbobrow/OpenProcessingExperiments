
void draw(){
  background(5,255,250);
  PFont mono;
  mono = loadFont("AppleCasual-48.vlw");
fill (255, 5,5);
rect( 100,150, 300,300);
fill(5,255,36);
rect(0,450, 500, 50);
fill(255,94,0);
triangle(250,8,450,150,50,150);
fill(255,255,0);
fill(170,88,21);
rect(440,310,30,140);
fill(21,170,49);
triangle(455,270,500,340,410,340);
fill(255,0,251);
rect(240, 380, 40, 70);
fill(0,0,0);
ellipse(270,420, 10,10);
fill(0,124,252);
ellipse(250,190, 60,60);
line(250, 160, 250, 220);
line(220,190, 280,190);
fill(126,166,232);
rect(140,240,40, 50);
line(160,240,160 ,290);
line(140,260, 180,260);
fill(126,166,232);
rect(320,240,40,50);
line(340,240,340,290);
line(320,260,360, 260);
fill(184,126,232);
triangle(220,410,235,450,210,450);

textFont(mono);
textSize(32);
text("Score: "+score, 0, 490); 
fill(0,0,0);
ellipse(220,405,50,50);
fill(255,255,255);
ellipse(220,405,40,40);
fill(0,125,255);
ellipse(220,405,30,30);
fill(255,0,0);
ellipse(220,405,20,20);
fill(255,255,0);
ellipse(220,405,10,10);
  fill(255,255,0);
  ellipse(60,50,100,100);
  if(i>530){i=0;
//s=s+5;
}
  i=i+s;
  fill(random(255),random(255),random(255));
ellipse(i,50, 50,50);
fill(255,3,112);
triangle(20+i,40,50+i,50, 20+i,60);
fill(0,0,0);
ellipse(i,40, 5,5);
fill(0,0,0);
ellipse(i+10,40, 5,5);
if(i>530){i=0;//s=s+1;
}
//i=i+s;
fill(135,0,255);
ellipse(i,90,15,15);
if (keyPressed){
if(key==CODED){
if(keyCode==40){
  if(Y>450){
    Y=90;}
    ellipse(i,Y=Y+5,20,20);
    if(i>195 && i<245 && Y>375 && Y<435){
    score=score+1;
    }
    else if(i<195 &&Y>430){
      text("You lose!!!", 300,300);
    }else if(i>245 &&Y>430){
      text("You lose!!!", 300,300);
    }
}
}
}else{Y=100;}

}

int i=0;
int s=2;
int Y= 100;
int score=0;
void setup(){
size(500,500);  
  

}






