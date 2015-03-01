
//Arthur Luo//

int x=10;
boolean ear=false; //for later on the dog's ear

void setup() {
  size(250,325);
}

void draw(){
  
  //the lady herself
    //head
  background(240,230,218);
  line(85,40,125,90);//the left line that shapes the women's face
  line(95,0,90,85);//line that goes from the top
  line(90,85,121,85);//the line that goes horrizontally
  line(123,93,140,78);//bottom line for the women's face
  line(140,78,110,35);//right side for the women's face. yup, exciting stuff
  line(131,85,142,85);
  line(142,85,141,32);//the one that goes up vertically
  line(85,40,101,32);
  line(x+60,40,108,40);//eye brows. this and the one below
  line(108,40,108,x+40);//yup.
  noFill();
  arc(103.5, 40, 9, 7.5, 1, PI/1, PI/0.5);
  line( 111.5, 53, 117, 45);//nose
  line( 127, 79, 130, 74);//mouth
  
    //body
  rect( 102, 85, 32, 32);//neck, top
  rect( 92, 117, 42, 42);//nect, bot
  triangle( 92, 117, 134, 117, 165, 160);//shoulder
  line( 165, 160, 158, 130);
  line( 158, 130, 150, 130);
  line( 150, 130, 78, 200);//the collar
  line( 78, 200, 95, 215);
  line( 134, 159, 180, 159);
  line( 154, 3, 190, 220);
  quad( 78, 165, 124, 165, 124, 180, 70, 180);//left shoulder
  line( 100, 165, 102, 300);
  arc( 101, 232.5, 60, 135, PI/2, PI/0.6667);//left arm
  rect( 85, 285, 83, 25);
  ellipse( 124, 199, 35, 35);
  line( 170, 160, 165, 280);
  rect( 167, 255, 50, 20);
  
  //her dog
  fill(255,100,0);//head
  rect( 110, 250, 50, 20);
  fill( 0);
  arc( 110, 260, x+5, x, PI/1 ,PI/0.5);
  if(x==35)
    ear=false;
  if(x==10)
    ear=true;
  if(ear)
    x=x+1;
  else x=x-1;
  
  line (130, 262, 142, 262);
  fill( 171, 171, 163);
  ellipse( 130, 262, 15, 15);
  line ( 110, 270, 110, 290);
  line ( 130, 270, 130, 290);
}


