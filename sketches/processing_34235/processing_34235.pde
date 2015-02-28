
void setup(){
size(500,500);
smooth();


}



void draw(){


  
  
  
  
background(0);



if(key == 'a'){
for(int i = 0 ; i < 5; i++){
noFill();

strokeWeight(1);
stroke(random(255),random(255),random(255));
ellipse(250,250,i*80,i*80);

}



float d = dist(250,250,mouseX,mouseY);
if(d < 40){
  
  for(int i = 0 ; i < 5; i++){

noFill();
strokeWeight(1);
stroke(i*10,i*30,i*50);
ellipse(250,250,i*80,i*80);
stroke(255);
strokeWeight(2);
ellipse(250,250,80,80);

PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
textFont(font, 32); 
text("Cups of coffee", 300, 50);
textFont(font, 20); 
text("13", 300, 70);

}
}
else if(d > 40 && d < 80){

for(int i = 0 ; i < 5; i++){

noFill();
strokeWeight(1);
stroke(i*10,i*30,i*50);
ellipse(250,250,i*80,i*80);
stroke(255);
strokeWeight(4);
ellipse(250,250,160,160);

PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
textFont(font, 32); 
text("Hours spent on music", 180, 50);
textFont(font, 20); 
text("21.5", 180, 70);




}

}


else if(d > 80 && d < 120){

for(int i = 0 ; i < 5; i++){

noFill();

strokeWeight(1);
stroke(i*10,i*30,i*50);
ellipse(250,250,i*80,i*80);
stroke(255);
strokeWeight(7);
ellipse(250,250,240,240);

PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
textFont(font, 32); 
text("Hours slept", 180, 40);
textFont(font, 20); 
text("91", 180, 60);
textFont(font, 20); 
text("ZZZ...", 180, 80);

}
}

else if(d > 120 && d < 160){

for(int i = 0 ; i < 5; i++){

noFill();

strokeWeight(1);
stroke(i*10,i*30,i*50);
ellipse(250,250,i*80,i*80);

stroke(255);
strokeWeight(10);
ellipse(250,250,320,320);

PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
textFont(font, 32); 
text("Hours spent on HOMEWORK", 50, 50);
textFont(font, 20); 
text("160 and continued..", 50, 70);

}
}






}


else{
PFont font;
font = loadFont("Folks-Normal-48.vlw"); 
textFont(font, 32); 
text("Bootcamp Life", 250, 250);

textFont(font, 32); 
text("Press a to start", 250, 280);

textFont(font, 32); 
text("Demmy", 250, 320);



}
}






