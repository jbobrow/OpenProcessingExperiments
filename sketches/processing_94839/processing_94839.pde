
int x=0;
int y=0;
int z=0;

void setup(){
 size(600,600);
background(0); 
noStroke();
}

void draw(){
background(0);
x=(x+4)%400;//Moving the x
  
  
fill(255,0,0);
ellipse(300+x,300,500,500);
fill(245,138,7);
ellipse(300+x,300,460,460);
fill(245,233,7);
ellipse(300+x,300,420,420);
fill(0,255,0);
ellipse(300+x,300,380,380);
fill(79,191,196);
ellipse(300+x,300,340,340);
fill(15,35,240);
ellipse(300+x,300,300,300);
fill(68,0,111);
ellipse(300+x,300,260,260);

fill(0);
rect(50+x,300,500,450);
ellipse(300+x,300,220,220);

fill(255);
ellipse(50+x,320,50,50);
ellipse(45+x,355,50,50);
ellipse(80+x,350,50,50);
ellipse(80+x,320,50,50);
ellipse(80+x,360,50,50);
ellipse(100+x,320,50,50);
ellipse(120+x,320,50,50);
ellipse(140+x,320,50,50);
ellipse(160+x,320,50,50);
ellipse(180+x,320,50,50);
ellipse(200+x,320,50,50);
ellipse(180+x,350,50,50);
ellipse(200+x,350,50,50);
ellipse(160+x,320,50,50);
ellipse(170+x,350,50,50);
ellipse(150+x,360,50,50);
ellipse(120+x,360,50,50);
ellipse(180+x,360,50,50);



ellipse(50+350+x,320,50,50);
ellipse(45+350+x,355,50,50);
ellipse(80+350+x,350,50,50);
ellipse(80+350+x,320,50,50);
ellipse(80+350+x,360,50,50);
ellipse(100+350+x,320,50,50);
ellipse(120+350+x,320,50,50);
ellipse(140+350+x,320,50,50);
ellipse(160+350+x,320,50,50);
ellipse(180+350+x,320,50,50);
ellipse(200+350+x,320,50,50);
ellipse(180+350+x,350,50,50);
ellipse(200+350+x,350,50,50);
ellipse(160+350+x,320,50,50);
ellipse(170+350+x,350,50,50);
ellipse(150+350+x,360,50,50);
ellipse(120+350+x,360,50,50);
ellipse(180+350+x,360,50,50);



}


