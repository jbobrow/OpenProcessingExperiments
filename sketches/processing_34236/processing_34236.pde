
void setup(){
size(600,600);
smooth();


}



void draw(){
  
background(0);
if(key == 'a'){

noFill();

strokeWeight(2);
stroke(60,232,246);
ellipse(300,300,80,80);

stroke(104,236,107);
ellipse(300,300,120,120);

stroke(237,52,52);
ellipse(300,300,240,240);

stroke(228,255,0);
ellipse(300,300,420,420);


float d = dist(300,300,mouseX,mouseY);
if(d < 40){
PImage a;

a = loadImage("coffee.jpg");

image(a, 0, 0,600,600); 

strokeWeight(4);
stroke(255);
ellipse(300,300,80,80);

strokeWeight(2);
stroke(0,0,170);
ellipse(300,300,120,120);

stroke(0,0,170);
ellipse(300,300,240,240);

stroke(0,0,170);
ellipse(300,300,420,420);

PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
fill(0);
textFont(font, 37); 
text("Cups of coffee", 370, 50);
textFont(font, 50); 
text("13", 520, 500);

}

else if(d > 40 && d < 60){
 PImage b;

b = loadImage("music.jpg");

image(b, 0, 0,600,600); 
  
strokeWeight(2);
stroke(0,0,170);
ellipse(300,300,80,80);

strokeWeight(6);
stroke(255);
ellipse(300,300,120,120);

strokeWeight(2);
stroke(0,0,170);
ellipse(300,300,240,240);

stroke(0,0,170);
ellipse(300,300,420,420);

PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
fill(255,0,0);
textFont(font, 37); 
text("Hours spent on", 355, 50);
textFont(font, 43); 
text("MUSIC", 450, 120);
textFont(font, 50); 
text("21.5", 470, 500);



}



else if(d > 60 && d < 120){
PImage c;

c = loadImage("sleepnight.jpg");

image(c, 0, 0,600,600);
strokeWeight(2);
stroke(0,0,170);
ellipse(300,300,80,80);

strokeWeight(2);
stroke(0,0,170);
ellipse(300,300,120,120);

strokeWeight(8);
stroke(255);
ellipse(300,300,240,240);
strokeWeight(2);
stroke(0,0,170);
ellipse(300,300,420,420);

PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
textFont(font, 45); 
fill(0);
fill(255);
text("Hours slept", 193, 50);
textFont(font, 57); 
text("96", 490, 490);
textFont(font, 50); 
text("ZZZ...", 420, 580);
}


else if(d > 120 && d < 210){
PImage e;

e = loadImage("homework.jpg");

image(e, 0, 0,600,600);

strokeWeight(2);
stroke(0,0,170);
ellipse(300,300,80,80);


stroke(0,0,170);
ellipse(300,300,120,120);


stroke(0,0,170);
ellipse(300,300,240,240);
strokeWeight(12);
stroke(0);
ellipse(300,300,420,420);

PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
fill(228,255,0); 
textFont(font, 45); 
text("Hours spent on", 40, 50);
fill(104,236,107);
textFont(font, 45); 
text("HOMEWORK", 340, 50);

fill(0,200,230); 
textFont(font, 50); 
text("193", 450, 550);

}
}

else if(key == 'b'){
PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
fill(0,200,230); 
textFont(font, 50);
text("But I still love Bootcamp !!", 40, 230);
fill(255);
textFont(font, 35);
text("Boshan Zhou(Demmy)", 40, 333);
textFont(font, 29);
text("2011.8.1 - 2011.8.19", 40, 263);
}












else{
PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
textFont(font, 35); 
text("Bootcamp Life", 300, 300);

textFont(font, 35); 
text("Press a to start", 300, 335);

textFont(font, 35); 
text("Demmy", 300, 375);
}
}

