
PFont font;

void setup(){
size(250,250);
smooth();
strokeWeight(30);
font=loadFont("Baskerville-Bold-36.vlw");
textFont(font);
}

void draw(){
background(0);
stroke(102);


if(mousePressed){
stroke(0);
}else{
stroke(random(25,150));
strokeWeight(8);//controls the blinking lines
}
for(int i=0; i<400; i+=30)
{line(i,40,i+60,80);
line(i,80,i+60,80);
line(i,120,i+60,80);

line(i,40,i+60,40);
line(i,80,i+60,80);
line(i,120,i+60,120);//first set

line(40,i,80,i+60);
line(80,i,80,i+60);
line(120,i,80,i+60);

line(40,i,40,i+60);
line(80,i,80,i+60);
line(120,i,120,i+60);}//second set 
 //blinking lines
 
   if (mousePressed == true) {
    fill(255);
  } else {
    fill(0);
  }
 font=loadFont("Baskerville-Bold-48.vlw");
textFont(font);
text("M9P 1R5",20,60);

 
font=loadFont("Baskerville-Bold-24.vlw");
textFont(font);
text("M9P 1R5",40,20);

font=loadFont("Baskerville-Bold-24.vlw");
textFont(font);
text("M9P 1R5",80,80);
font=loadFont("Baskerville-Bold-36.vlw");
textFont(font);
text("M9P 1R5",10,100);
font=loadFont("Baskerville-Bold-24.vlw");
textFont(font);
text("M9P 1R5",10,120);
font=loadFont("Baskerville-Bold-24.vlw");
textFont(font);
text("M9P 1R5",30,160);
font=loadFont("Baskerville-Bold-36.vlw");
textFont(font);
text("M9P 1R5",60,200);
font=loadFont("Baskerville-Bold-48.vlw");
textFont(font);
text("M9P 1R5",0,240);
font=loadFont("Baskerville-Bold-24.vlw");
textFont(font);
text("M9P 1R5",0,145);
font=loadFont("Baskerville-Bold-24.vlw");
textFont(font);
text("M9P 1R5",0,180);
}








