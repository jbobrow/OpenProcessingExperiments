

 
float l_move, pop, type_size, blue, incrementor, xpos, ypos;
PFont times, arial;
 
void setup(){
  size(700,700);
  times = createFont("Times New Roman",32);
  arial = createFont("Arial",32);
   
}
 
void draw(){
   
  background(0,0,300);
  textFont(times,38);
   
  if (pop<=200) {
    if (l_move<=100){
      l_move++;
      blue= map(cos(incrementor), -1, 1, 0, 255);
      fill(0, 0, blue);
      //ellipse(600,100, 150, 150);
      incrementor +=0.05;
    }
    textFont(arial,38);
    text("Tranquility, Peace, Harmony",l_move,100);
     
    if (l_move>100 && pop<=200){
      pop++;
    }
     
    if (pop>=20){
      text("My",100,140);
    }
       
    if (pop>=40) {
      text("mind",160,140);
    }
       
    if (pop>=60) {
      text("is",260,140);
    }
       
    if (pop>=80) {
      text("ever",300,140);
    }
     
    if (pop>=100) {
      text("still.",380,140);
    }
     
}
   
  if (pop>=200 && type_size<=200){
    textFont(arial,type_size);
    fill(255,45,0);
    text("GRADUATION",100,100);
     
    textFont(times,40);
    text("PRESSURE",100,0+xpos);
    text("F***",50,120+ypos);
    text("IGNORANCE",200,250+ypos);
    text("MADNESS",300,340+xpos);
    text("JOBS",400,470+ypos);
    text("RAWR",500,140+ypos);
    type_size++;
    ypos++;
  }
 
}
   
   
   




