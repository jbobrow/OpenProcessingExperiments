
int GREY = #999999;
int BLUE = #8FCAD3;

void setup (){
  size(600,800);
  background(BLUE);//declare a variable of BLUE that is an intager
}

void draw (){
  stroke(GREY);
 fill(GREY);
 ellipse(300,150, 150,150);
 ellipse(60,470, 10,30);
 ellipse(550,470, 10,30);
 ellipse(350,700, 25,30);
 ellipse(250,700, 25,30);
 rect(225,210,  150,300);
 strokeWeight(15);
 line(225,250,60,450);
 line(375,250,550,450);
 line(250,690,250,510);
 line(350,690,350,510);
 noStroke();
 fill(#FFFFFF);
 ellipse(270,150,50,50);
 ellipse(330,150,50,50);
 noStroke();
 fill(#000000);
 ellipse(270,150,25,25);
 ellipse(330,150,25,25);
 ellipse(300,180,30,10);
   
}


