
int bill;
float murray;
float yes;
float bear;
float dog;
int cats;

void setup(){
   size(600,600);
   background(247,247,230);
   //colorMode(HSB,360,100,100,100);
   bill = 0;
   murray = 0;
   yes = 0;
   bear = 0;
   dog = 0;
   cats = 0;
   smooth();
   strokeWeight(.8);
}
void draw(){
  fill(247,247,230,3);
   if(mousePressed){
     noFill();}
  rect(-1,-1,601,601);
  cats=-1;
  bill+=1.1;
  murray+=1.3;
  yes+=1.6;
  bear+=1.9;
  dog+=2.2;

  stroke(255,5,5);//red diamond
    line(150,150,300,bill);
    line(300,bill,450,150);{
    if(bill>598){
      bill=0;}
    }
    line(150,150,300,dog);
      line(300,dog,450,150);
      line(150,150,300,bear);
      line(300,bear,450,150);
      line(150,150,300,yes);
      line(300,yes,450,150);
      line(150,150,300,murray);
      line(300,murray,450,150);
  stroke(5,80,255); //blue diamond
    line(450,450,300,bill);
    line(300,bill,150,450);{
    if(mousePressed){
      stroke(5,80,255);}}
      line(450,450,300,dog);
      line(300,dog,150,450);
      line(450,450,300,bear);
      line(300,bear,150,450);
      line(450,450,300,yes);
      line(300,yes,150,450);
      line(450,450,300,murray);
      line(300,murray,150,450);

  if(mouseX>400){
    stroke(255,0,0);
    bezier(450,150,500,150,mouseX,mouseY,600,pmouseY);
    stroke(0,0,255);
    bezier(450,450,500,450,mouseX,mouseY,600,pmouseY);
    bezier(450,450,500,450,pmouseX,pmouseY,600,mouseY);}
  if(mouseX<200){
    stroke(255,0,0);
    bezier(150,150,100,150,mouseX,mouseY,0,pmouseY);
    stroke(0,0,255);
    bezier(150,450,100,450,mouseX,mouseY,0,pmouseY);
      if(mousePressed){
        stroke(0,0,yes);}}

  if(mousePressed){
      if(mouseY>400){
        stroke(yes,0,0);}
          if(mouseX>400){
            stroke(bear,0,yes);}
            else{stroke(255,0,0);}
      line(150,150,300,murray);
      line(300,murray,450,150);
      line(150,150,300,yes);
      line(300,yes,450,150);
      line(150,150,300,bear);
      line(300,bear,450,150);
      line(150,150,300,dog);
      line(300,dog,450,150);

      fill(255,0,0,2);
    noStroke();
      triangle(300,0,150,150,200,300);
      triangle(300,0,450,150,400,300);
      if(mouseY<200){
        stroke(yes,0,0);}
       if(mouseX<200){
         stroke(bear,0,yes);}
         else{stroke(0,0,255);}
      line(450,450,300,murray);
      line(300,murray,150,450);
      line(450,450,300,yes);
      line(300,yes,150,450);
      line(450,450,300,bear);
      line(300,bear,150,450);
      line(450,450,300,dog);
      line(300,dog,150,450);

      noStroke();
      fill(0,0,255,2);
      triangle(300,600,150,450,200,300);
      triangle(300,600,450,450,400,300);
     }
    if(yes>597){
      yes=0;}
    if(murray>597){
      murray=0;}
    if(bear>597){
      bear=0;}
    if(dog>597){
      dog=0;}
}

