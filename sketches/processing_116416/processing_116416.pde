
float x0 = random(0,1);
float x, Q, r, box;
int count, i, j;
float a = 3.569946;

void setup(){
  size(500,550);
  background(255);
  frameRate(3);
  x = x0;
  textSize(15);
  PFont mono;
  mono = loadFont("Arimo-Bold-18.vlw");
  textFont(mono);
}

void draw(){
  background(255);

  textSize(20);
fill(0); text("0",330,30);
  fill(100,100,100,100);
  rect(320,10, 30,30);
fill(0); text("-",380,30);  
  fill(255,200,200,100);
  rect(400,10, 30,30);
fill(0); text("+",410,30);
  fill(200,200,255,100);
  rect(370,10, 30,30);
fill(0); text("/",460,30);
  fill(200,200,100,100);
  rect(450,10, 30,30);

count++ ;
Q = a * ( x * ( 1 - x) );
x = Q;
r = 1 - x;

for( i = 0; i <= width; i = i + 50){
  for( j = 0; j <= height; j = j + 50){
    textSize(12);
     float n = random(0,1);
       if(x < n ){
//         PImage Rabbit = loadImage("rabbit_50.jpg");
//         set(i, j+50, Rabbit);
         fill(x*250,100,100,150 ); rect(i,j+50,50,50);
         fill(0); text("Rabbit",i+5 , j+80);
       } else {
//        PImage Fox = loadImage("fox_50.jpg");
//        set(i, j+50, Fox);
         fill(r*250,100,x*250,150 ); rect(i,j+50,50,50);
         fill(0); text("Fox",i+10 , j+80);
       }
  }
}
  textSize(12); 
  fill(0);
  text("Aggressiveness of the Predator -> a :" + a,10,20);
  text("Rabbit / (Rabbit + Fox) -> Generation" + count + " :" + x, 10,40);

  if(x == box){ textSize(50); fill(255,0,0,255); text("Strange Attractor!",30,250); }
  box = x;

  if (mousePressed == true){
    if(mouseX>=320 && mouseX<=350 && mouseY>=10 && mouseY<=30){ a = 3.569946; }
    if(mouseX>=400 && mouseX<=430 && mouseY>=10 && mouseY<=30){ a = a + 0.01; }
    if(mouseX>=370 && mouseX<=400 && mouseY>=10 && mouseY<=30){ a = a - 0.01; }
    if(mouseX>=450 && mouseX<=480 && mouseY>=10 && mouseY<=30){ a = 2; fill(255); rect(0,0,width,height);}
    if(a <= 0){ a = 0.01; }
    if(a > 4){ a = 4; }
  }
}


