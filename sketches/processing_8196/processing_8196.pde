
void setup(){
  
  size(700, 670);
  background(255);
  smooth();
  
  PFont police;
  police = loadFont("BitstreamVeraSans-Roman-24.vlw");
  textFont(police, 12);
}

void draw(){

    fill(255, 100);
    noStroke();
    rect(0,0, 700,670);
    
    //dépense mauve
    noFill();
    strokeWeight(0.5);
   
   for(int i=(30+mouseX/2) ; i<(40+mouseX/2) ; i=i+4){
    stroke(100,0,50,500-i);
    if(mouseX>=690){
      ellipse(335,335,i,i);}
    else{
    ellipse(335,335,i,i);}}
    
    
    
    //dépense jaune
    noFill();
    strokeWeight(0.5); 
    for(int i=(mouseX/3) ; i<(10+mouseX/3) ; i=i+4){
      stroke(255,200,0,500-i); 
    if(mouseX>=690){
      ellipse(335,335,i,i);}
    else{
    ellipse(335,335,i,i);}
    }

    
    
    //cercle découvert
    noFill();
    strokeWeight(1.5);
    
    if(mouseX>=600){
      stroke(255,5,5);}
    else{
      stroke(250,125,5);}
    
    if(mouseX<=335){
      ellipse(random(335,337), random(335,337), 0, 0);}
    else if(mouseX>=690){
      ellipse(random(335,337), random(335,337), 34, 34);}
    else{
      ellipse(random(335,337), random(335,337), mouseX/10-35, mouseX/10-35);}
    
  
    //rond budget
    stroke(100);
    noFill();
    strokeWeight(0.5);
    ellipse(335, 335, 50, 50);
    
    fill(0);  
    noStroke();
 
    
    if(mouseX<=0){
      ellipse(random(335,337), random(335,337), 50, 50);}
    else if (mouseX>=335){
      ellipse(random(335,337), random(335,337), 1, 1);}
    else{
    ellipse(random(335,337), random(335,337), 50-mouseX/7, 50-mouseX/7);}


//les textes
fill(100);
text("début du mois", 10, 40);
text("fin du mois", 625, 40);

text("budget", 40, 570);
text("découvert autorisé", 40, 590);
text("découvert non-autorisé", 40, 610);
text("dépenses alimentaires", 40, 630);
text("dépenses vestimentaires", 40, 650);

//les ronds de légendes
strokeWeight(1);
//budget
fill(0);
noStroke();
ellipse(20, 566, 10, 10);

//découvert autorisé
noFill();
stroke(250,125,5);
ellipse(20, 586, 10, 10);

//découvert non-autorisé
noFill();
stroke(255,5,5);
ellipse(20, 606, 10, 10);

//alimentaire
noFill();
stroke(100,0,50, 150);
ellipse(20, 626, 10, 10);

//vestimentaire
noFill();
stroke(255, 200, 0, 150);
ellipse(20, 646, 10, 10);

//la flèche
fill(100);
stroke(100);
strokeWeight(1);
line(10, 15, 10, 25);
line(10, 20, 690, 20);
line(680, 15, 690, 20);
line(680, 25, 690, 20);

//le curseur chronologique
fill(20,50,70);
noStroke();
if(mouseX<=10){
  ellipse(10, 20, 6, 10);}
else if(mouseX>=690){
  ellipse(690, 20, 6, 10);}
else{
  ellipse(mouseX, 20, 6, 10);}  
}

void keyPressed(){
    background(255, 10);

}

