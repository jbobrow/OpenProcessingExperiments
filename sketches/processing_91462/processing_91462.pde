
int bubbleW = 15;
int bubbleH = 15;
int fishbodyW = 40;
int fishbodyH = 25;
int fishtailW = 30;
int fishtailH = 20;
int fishfinW = 10;
int fishfinH = 30;
int value = 0;

int w = 20;
int x = 50;
int y1 = 480;
int y2 = 470;
int spacing = 100;
int endlegs = 550;

boolean yellowsubmarine=false;

PImage myImage;

void setup(){
 size(600,600);
 noStroke();
 myImage=loadImage("yellow-submarine-1.jpg");

//Ocean
background(47,240,245);
   
//Ground
fill(39,4,9);
noStroke();
rect(0,500,600,300);
   
//submarine body
fill(30,35,203);
noStroke();
ellipse(400, 400, 200, 100);
 
//submarine window
fill(170,155,155);
noStroke();
rect(420,365,45,30);
   
//submarine pipe
fill(0,0,0);
noStroke();
rect(400,305,20,50);

//submarine tail
fill(157,138,157);
noStroke();
ellipse(300,400,75,75);

//fish body 1
fill(193,62,62);
noStroke();
ellipse(50,70,fishbodyW,fishbodyH);

//fish tail 1
fill(193,62,62);
noStroke();
ellipse(40,70,fishtailW,fishtailH);

//fish fin 1
fill(193,62,62);
noStroke();
ellipse(30,70,fishfinW,fishfinH);
 
//fish body 2
fill(193,62,191);
noStroke();
ellipse(205,93,fishbodyW,fishbodyH);

//fish tail 2
fill(193,62,191);
noStroke();
ellipse(215,93,fishtailW,fishtailH);

//fish fin 3
fill(193,62,191);
noStroke();
ellipse(225,93,fishfinW,fishfinH);

//air bubble 1
fill (255);
noStroke();
ellipse(400,285,bubbleW,bubbleH);
 
//air bubble 2
fill (255);
noStroke();
ellipse(415,260,bubbleW,bubbleH);
 
//air bubble 3
fill (255);
noStroke();
ellipse(418,245,bubbleW,bubbleH);
 
}
 
void draw(){
  fill(random(255),255,255);
  while(x<=endlegs){
    rect(x,y1,w,w);
    x=x+spacing;
  }
  x=50;
  while(x<=endlegs){
    ellipse(x,y2,w,w);
    x=x+spacing;
  }
  
  
  //air bubble 4
   fill(random(255),100,255);
   ellipse(mouseX,mouseY, 25, 25);
   

}
