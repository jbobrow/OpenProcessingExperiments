
void setup(){
  size(600,600);
}

void draw(){
  background(255,255,255);
  //squares
    //red square
  fill(255,0,0);
  strokeWeight(2);
  rect(75,75,275,150);
    //black square
   fill(0,0,0);
   rect(350,0,500,50);
     //blue square
   fill(0,0,225);
   rect(50,475,275,100);
     //yellow square
    fill(255,255,0);
    rect(450,300,63,150);
  
  
  //lines
    //vert. lines
  strokeWeight(2);
  line(50,0,50,600);
  line(325,225,325,600);
  line(350,0,350,600);
  line(75,0,75,475);
  line(450,0,450,600);
  line(513,0,513,600);
    //hoiz. lines
  strokeWeight(2);
  line(0,75,600,75);
  line(0,225,600,225);
  line(0,475,600,475);
  line(0,575,600,575);
  line(0,50,600,50);
  line(0,300,600,300);
  line(0,450,600,450);
  strokeWeight(1);
 
}


