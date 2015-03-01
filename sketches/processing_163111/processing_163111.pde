
void setup() {
  size(800, 800);
}

void draw() {
  
  background(#243D48);
  
  // tegn cirkler
  fill(#182634);
   ellipse(400,400,800,800);
   
  stroke(#243D48);
  fill(#74674E, 70);

  ellipse(400,200,350,350);
  ellipse(400,600,350,350);
  
  for (int i = 0; i<5; i++){
    println(i);
    ellipse(400, 400, 600-i*100, 600-i*100);    
   
  }
  //tegn streger
  for (int i = 0; i<height; i=i+20) {
    line (400,400,10,i);
    line (400,400,i,10);
    line (400,400,width-10,i);
    line (400,400,i,height-10);
}
 //tegn 2 cirkler øverts
 
  fill (#74674E,70);
  ellipse(200,400,400,400);
  ellipse(250,400,300,300);
  ellipse(300,400,200,200);
   
  fill (#74674E,70);
  ellipse(600,400,400,400);
  ellipse(550,400,300,300);
  ellipse(500,400,200,200);

//nye streger
 stroke(#243D48);
 
for (int i = 0; i<width; i=i+20) {
  line(400,400,10,i); 
  line(400,400,width-10,i); 
}}

