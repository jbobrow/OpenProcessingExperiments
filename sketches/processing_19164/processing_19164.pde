
float red2 = 10;
// set variable for vertical length of circles
void setup(){
size(250,250);
background(#F2D3AB);
}

void draw(){
fill(255,0);
strokeWeight(1);
stroke(random(20,243));
//randomize stroke values
ellipse(10,130,10,red2);
ellipse(20,140,10,red2);
ellipse(30,150,10, red2);
ellipse(40,160,10,red2);
ellipse(50,170,10,red2);
ellipse(60,180,10,red2);
ellipse(70,190,10,red2);
ellipse(80,200,10,red2);
ellipse(90,210,10,red2);
ellipse(100,220,10,red2);
ellipse(110,210,10,red2);
ellipse(120,200,10,red2);
ellipse(130,190,10,red2);
ellipse(140,180,10,red2);
ellipse(150,170,10,red2);
ellipse(160,160,10,red2);
ellipse(170,150,10,red2);
ellipse(180,140,10,red2);
ellipse(190,130,10,red2);
ellipse(200,120,10,red2);
ellipse(210,130,10,red2);
ellipse(220,140,10,red2);
ellipse(230,150,10,red2);
ellipse(240,160,10,red2);
ellipse(250,170,10,red2);
ellipse(260,180,10,red2);
ellipse(0,120,10,red2);
}

void mouseMoved(){
red2+= 10;// when mouse moves, circles drag in both directions

if(red2>800){
  stroke(random(20,50));
  red2=random(-10);
  //if circles past the restriction, starts from the top again
}}

