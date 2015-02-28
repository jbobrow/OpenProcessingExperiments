
float [] memory= 
{  
0.715133531,  //long term average
0.543026706  //short term average
};



void setup()  {

size(600, 400);
background(6,84,129);
}


void draw(){  

int x=0;  
for(int i=0;i<2;i++){  

//title
PFont font;
font = loadFont("Arial-Black-25.vlw");
textFont(font);
text("LONG TERM VS. SHORT TERM MEMORY", 25, 50); 

  



//display memory graph
float g = map(memory[i], 1,0.2,0,400);  
rect(x+80,height-g,30,g);
fill(255,255,255);


x+=80; 

//variable for y pos
int p;
p=220;

PFont fontText;

fontText = loadFont("Arial-Black-16.vlw");
textFont(fontText);
text("Long term memory is higher in all", 250, p);
text("ages compared to short term memory.", 250, p+20);
text("Reasearch data shows that the ratio", 250, p+40); 
text("for short term to long term is", 250, p+60);
text("11:14", 250, p+100);
} 
   
}

