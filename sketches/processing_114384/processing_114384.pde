
PFont didot;
float x, y,t;
float f;


void setup (){
size(600,600);
didot = loadFont ( "Didot-48.vlw");
textAlign(CENTER, CENTER);


}

void draw(){
background (0);
f=255;
fill(f);
textFont(didot);
text ("Boo!",mouseX,mouseY);

}

void mousePressed () {
f=0;  
fill(f);
text ("Boo!",mouseX,mouseY);

textSize(random(300,500));
fill(255,72,0);
text ("Boo!",width/2,height/2);

textSize(random(10,30));
x=random(30,550);
y=random(100,500);
text ("Boo!",x,y);

textSize(random(10,30));
x=random(30,550);
y=random(100,500);
text ("Boo!",x,y);


textSize(random(10,30));
x=random(30,550);
y=random(100,500);
text ("Boo!",x,y);

textSize(random(10,30));
x=random(30,550);
y=random(100,500);
text ("Boo!",x,y);

}




