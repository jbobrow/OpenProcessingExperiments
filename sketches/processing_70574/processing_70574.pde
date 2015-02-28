
void setup(){
size(800,800);
smooth();
//background design
background(255);

strokeWeight(1);
fill(#E88828);
rect(0,0,800,800,1000,1000,1000,1000);
fill(#F2E11D);
rect(50,50,700,700,1000,1000,1000,1000);
fill(#C61C1F);
rect(150,100,500,500,600,600,600,600);


//THE FACE BODY
fill(255);
strokeWeight(3);
//ellipse(400,400,425,500);
beginShape();
vertex(400,140);//1
vertex(500,160);//2
vertex(550,220);//3
vertex(600,300);//4
vertex(610,400);//5
vertex(600,480);//6
vertex(550,550);//7
vertex(500,600);//8
vertex(400,630);//9
vertex(300,600);//10
vertex(215,500);//11
vertex(190,400);
vertex(190,300);
vertex(220,200);
endShape();
//HAIRRRRR
strokeWeight(1);
pushMatrix();
fill(#8AA5E8);//azul
translate(200,200);
triangle(10,10,75,0,10,90);
popMatrix();


pushMatrix();
fill(#16E4F5);//baby blue
translate(300,100);
triangle(0,0,100,60,0,75);
popMatrix();

pushMatrix();
fill(#1D3776);//deep blue
translate(200,100);
triangle(10,10,110,60,80,120);
popMatrix();

pushMatrix();
translate(400,100);
triangle(0,0,100,81,0,100);
popMatrix();

pushMatrix();
translate(500,100);
triangle(3,10,50,120,0,100);
popMatrix();

pushMatrix();
translate(300,50);
fill(#1654ED);
triangle(0,0,50,80,100,110);
popMatrix();

pushMatrix();
translate(300,0);
fill(#4D71C9);
triangle(25,77,100,160,100,100);
popMatrix();

pushMatrix();
translate(400,50);
triangle(0,50,100,131,60,50);
popMatrix();
pushMatrix();
translate(200,100);
triangle(0,4,75,10,100,57);
popMatrix();
//no translate triangles
fill(#41527C);//mud azul
triangle(260,110,300,157,300,60);
fill(#54BAFC);//a bright azul
triangle(300,51,300,100,350,130);
triangle(505,90,500,180,460,100);
triangle(267,201,210,110,200,212);

pushMatrix();
fill(#3A8984);//azul,murky green
translate(500,200);
triangle(85,80,30,0,60,-30);
popMatrix();

pushMatrix();
fill(#756BA7);//slight purple
translate(500,100);
triangle(5,13,38,92,63,68);
popMatrix();

pushMatrix();
translate(500,200);
fill(#43C9B1);
triangle(95,110,60,0,100,-30);
popMatrix();
//eyebrows
strokeWeight(2);
triangle(400,350,300,300,350,290);
triangle(400,350,500,300,450,290);
fill(255,20,20);
strokeWeight(1);
triangle(420,200,380,200,400,270);
noFill();
strokeWeight(3);
beginShape();






//vertical grid lines
//pushMatrix();
//line(0,0,0,800);//left line
//translate(100,0);
//line(0,0,0,800);
//translate(100,0);
//line(0,0,0,800);
//translate(100,0);
//line(0,0,0,800);
//translate(100,0);
//translate(100,0);
//line(0,0,0,800);
//translate(100,0);
//line(0,0,0,800);
//translate(100,0);
//line(0,0,0,800);
//translate(100,0);
//line(0,0,0,800);
//popMatrix();

//horizontal grid lines
//pushMatrix();
//line(0,400,800,400);//mid line
//line(0,0,800,0);
//translate(0,100);
//line(0,0,800,0);
//translate(0,100);
//line(0,0,800,0);
//translate(0,100);
//line(0,0,800,0);
//translate(0,100);
//line(0,0,800,0);
//translate(0,100);
//line(0,0,800,0);
//translate(0,100);
//line(0,0,800,0);
//translate(0,100);
//line(0,0,800,0);
//translate(0,100);
//line(0,0,800,0);
//popMatrix();

}//end of void setup

//animate eyes color change
float d = 0;
float i = 0;
float e = 0;
void draw(){
  i = i+2;
  d = d+1;
  e = e+.5;
  
  fill(#3D575F);
  strokeWeight(1);
  if (i>0){
    fill(0,i-50,i);
  }
  if (i>=255){
    fill(0,d,0);
  }
  if (d>255){
    i=0;
    d=0;
    fill(d,i,0);
  }
  if (e>100){
    fill(e,0,0);
  }
  if (e>290){
    e=0;
  }
  strokeWeight(3);
  beginShape();//left eye
  vertex(300,300);
  vertex(300,400);
  vertex(360,400);
  vertex(400,350);
  vertex(300,300);
  //
  endShape();
  beginShape();//right eye
  vertex(500,300);
  vertex(400,350);
  vertex(440,400);
  vertex(500,400);
  vertex(500,300);
  endShape();
  strokeWeight(3);
  
  beginShape();//mouth
  vertex(250,460);
  vertex(300,500);
  vertex(330,500);
  vertex(340,550);
  vertex(350,500);
  vertex(400,505);
  vertex(450,500);
  vertex(460,550);
  vertex(470,500);
  vertex(500,500);
  vertex(550,460);
  vertex(500,475);
  vertex(460,480);
  vertex(400,485);
  vertex(340,480);
  vertex(300,475);
  vertex(250,460);
  endShape();

}//end void draw


