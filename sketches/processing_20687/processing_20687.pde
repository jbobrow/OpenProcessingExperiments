

DimmingStar [] stars;

void setup (){
size(400,400);
background(#1167D3);
smooth();

//sky

stroke(1,12,26,100);
strokeWeight(180);
line(0,0,400,0);

stroke(1,12,26,100);
strokeWeight(180);
line(0,100,400,0);

stroke(#010A15,100);
strokeWeight(80);
line(30,0,400,80);

stroke(#010A15,180);
strokeWeight(50);
line(259,0,400,40);

stroke(#010A15);
strokeWeight(50);
line(259,0,400,0);

stroke(#010A15,100);
strokeWeight(600);
line(0,0,400,0);

stroke(#030840,100);
strokeWeight(500);
line(200,90,400,90);

stroke(#0390A7,80);
strokeWeight(200);
line(200,400,0,200);

stroke(#0390A7,90);
strokeWeight(200);
line(0,400,0,0);

stroke(#0390A7,110);
strokeWeight(100);
line(0,300,150,400);

stroke(#0B272C,80);
strokeWeight(100);
line(0,0,400,380);

stroke(#0B272C,100);
strokeWeight(170);
line(0,0,400,200);

stroke(#0B272C,100);
strokeWeight(170);
line(400,400,0,70);

stroke(#0B272C,70);
strokeWeight(170);
line(0,0,400,0);

stroke(#0A0A0A,90);
strokeWeight(80);
line(100,0,400,0);
stroke(#0A0A0A,130);
strokeWeight(80);
line(200,0,400,0);
stroke(#0A0A0A,50);
strokeWeight(80);
line(230,50,400,0);

stroke(#0A0A0A,100);
strokeWeight(150);
line(400,400,0,50);

stroke(#095E6C,30);
strokeWeight(200);
line(0,0,400,300);

stroke(#0A0A0A,80);
strokeWeight(90);
line(100,0,400,300);
stroke(#0A0A0A,100);
strokeWeight(100);
line(200,0,400,200);
stroke(#0A0A0A,130);
strokeWeight(70);
line(300,0,400,100);
stroke(#0A0A0A,90);
strokeWeight(200);
line(100,0,400,300);

stroke(#83E5F5,80);
strokeWeight(70);
line(0,400,400,370);

stroke(#83E5F5,50);
strokeWeight(70);
line(0,370,400,340);

stroke(#83E5F5,10);
strokeWeight(100);
line(0,400,140,200);
stroke(#83E5F5,10);
strokeWeight(100);
line(0,400,180,230);
stroke(#83E5F5,10);
strokeWeight(100);
line(0,400,200,274);
stroke(#83E5F5,10);
strokeWeight(100);
line(0,400,240,300);
stroke(#83E5F5,10);
strokeWeight(100);
line(0,400,110,170);
stroke(#83E5F5,10);
strokeWeight(100);
line(0,400,80,160);
stroke(#83E5F5,10);
strokeWeight(100);
line(0,400,30,140);
line(0,400,80,160);
stroke(#83E5F5,10);
strokeWeight(100);
line(0,400,340,390);
line(0,400,80,160);
stroke(#83E5F5,10);
strokeWeight(100);
line(0,400,380,400);


stroke(#02001A,50);
strokeWeight(200);
line(400,0,200,0);

stroke(#050505);
strokeWeight(80);
line(400,0,280,0);

stroke(#050505,40);
strokeWeight(100);
line(180,400,400,300);
stroke(#050505,80);
strokeWeight(100);
line(200,400,400,370);
stroke(#050505,60);
strokeWeight(100);
line(180,400,400,400);



//water

stroke(#AAC3FF,200);
strokeWeight(102);
line(0,400,400,400);

stroke(#71FFCA,70);
strokeWeight(110);
line(0,400,400,400);

stroke(#0034B4,200);
strokeWeight(100);
line(0,400,400,400);

stroke(#021850,200);
strokeWeight(70);
line(0,400,400,400);
stroke(#021850);
strokeWeight(50);
line(0,400,400,400);
stroke(#021850,60);
strokeWeight(90);
line(0,400,400,400);
stroke(#010E2E,150);
strokeWeight(30);
line(0,400,400,400);



//rocks
stroke(1);
strokeWeight(.18);
//behindrock
fill(#1F1C1D);
beginShape();
vertex(270,400);
vertex(370,250);
vertex(375,260);
vertex(400,230);
vertex(400,400);
endShape(CLOSE);



//firstrock
fill(#363031);
beginShape();
vertex(280,400);
vertex(272,393);
vertex(286,350);
vertex(290,300);
vertex(300,290);
vertex(330,278);
vertex(349,285);
vertex(360,300);
vertex(368,300);
vertex(370,270);
vertex(374,272);
vertex(380,265);
vertex(384,269);
vertex(390,275);
vertex(400,400);
endShape(CLOSE);

stroke(#171616,100);
strokeWeight(62);
line(312,370,400,330);

noStroke();


//upsiderock
fill(#3B3B3B);
beginShape();
vertex(270,400);
vertex(298,330);
vertex(304,350);
vertex(320,310);
vertex(328,330);
vertex(340,370);
vertex(354,327);
vertex(357,365);
vertex(360,320);
vertex(400,260);//top of triangle
vertex(400,400);

endShape(CLOSE);

//frontrock
fill(#626262);
beginShape();
vertex(250,400);
vertex(248,397);
vertex(245,393);
vertex(242,390);
vertex(278,382);
vertex(300,395);
vertex(330,378);
vertex(338,375);
vertex(343,390);
vertex(351,400);
vertex(360,387);
vertex(364,390);
vertex(370,385);
vertex(379,400);
vertex(384,374);
vertex(394,400);
endShape(CLOSE);

stroke(#171616,30);
strokeWeight(30);
line(329,400,400,313);

stroke(#171616,30);
strokeWeight(60);
line(329,400,400,360);

//  random amount of stars
int amount_of_stars = int( random(100, 350 ) );
stars = new DimmingStar[amount_of_stars];
for( int i = 0; i < amount_of_stars; i++ ){
 stars[i] = new DimmingStar( #FFFFFF );
}
}

void draw() {
 int amount_of_stars = stars.length;
  for( int i = 0; i < amount_of_stars; i++ ){
   stars[i].update();
  }

}

void keyPressed(){
  // if the keypressed is 'a' new yellow stars appear
  if (key == 'a'){

    stars = (DimmingStar[]) append( stars, new DimmingStar(#DCFF1A) );
    
  }
  
}

class DimmingStar {
  int x_cord;
  int y_cord;
  int glow;
    int diameter;
  

  int star_color;
  int glow_color = #FFCC11;
  //  when it dims
  int dim_color = #F000F5;
  

  DimmingStar( int bg_color ){
    star_color = bg_color;
    //  y_cord
    y_cord = int( random( 0, 200 ) );
    //  x cord
    x_cord = int( random( 0, 400 ) );
    //  glow radius
    glow = int( random( 25, 15 ) );
    // random size
    diameter = int( random( 3, 6 ) );
    drawStar();
  }
  

  void update(){
    float s = diameter/2 + glow;
    if( abs( x_cord - mouseX ) <= s && abs( y_cord - mouseY ) <= s ){
      drawDim();
    }else{
      drawStar(); 
    }
  }
  
  // reg. star
  void drawStar(){
     fill( star_color );
     stroke( glow_color, .4 );
     strokeWeight( glow );
     ellipse( x_cord, y_cord, diameter, diameter );
  }
  
  void drawDim(){
    fill( dim_color );
    noStroke();
    ellipse( x_cord, y_cord, diameter, diameter );
  }

} 






