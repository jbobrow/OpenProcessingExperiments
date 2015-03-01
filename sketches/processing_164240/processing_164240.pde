
void setup(){
 size(500,500);
 smooth();

 }
 
void draw(){

strokeWeight(2);
background(#004008);

//cames i peus
fill(#458373);
noStroke();
quad(250,350,265,350,265,450,250,450);
quad(150,350,165,350,165,450,150,450);
ellipse(145,450,40,20);
ellipse(245,450,40,20);

//estructura
stroke(1);
fill(#67C1AA);
quad(100, 80, 310, 60, 310,390,100, 370);
fill(#458373);
quad(310, 60, 310,390,380,370,380,80);
//pantalla
fill(#E1FAF3);
quad(130,100,280,85,280,225,130,220);
//botons
fill(#0A3927);
quad(130,250,170,253,170,258,130,255);
ellipseMode(CENTER);
fill(#0E175F);
ellipse(260,260,20,20);
fill(#03FF15);
ellipse(260,320,10,10);
fill(#FF2403);
ellipse(240,345,25,25);
fill(#03FFFD);
triangle(240,322,220,320,230,300);
fill(#FEFF03);

quad(130,322,160,324,160,333,130,330);
quad(140,312,150,314,150,343,140,340);

//cara

//braç

line(330,200,330,286);
line(350,200,350,286);
noFill();
bezier(330,286,330,290,350,290,350,286);

 if (mousePressed == true) {
    fill(0,0,0);
ellipse(243,140,10,10);
ellipse(163,140,10,10);
bezier(190,160,190,180,210,180,210,160);

  
  } else {
   noFill();
bezier(190,160,190,180,210,180,210,160);
bezier(155,140,163,130,167,130,175,140);
bezier(235,140,243,130,247,130,255,140);

  }
}

