
int x;
int y;

void setup()
{
  size(455,410);//canviar a 400,400
  background(255);
}

void draw()

{
  background(255); 
  
  for(x=0;x<width;x+=75)
  {
    for(y=0;y<height; y+=102){
  pushMatrix();
  translate(x,y);
  gru();
  popMatrix();
    }
}
}

void gru()
{
translate(-160,-150);
  noStroke();
  smooth();
  
//cuerpo//

  fill(252,224,3);
  rect(175,160,50,80,100);

//ull//

fill(95,95,95);
ellipse(200,180,35,35);
fill(252,224,3);
ellipse(200,180,25,25);
fill(255);
ellipse(200,180,25,23);
fill(98,50,10);
ellipse(200,180,10,10);
fill(0);
ellipse(200,180,4,4);

stroke(0);
strokeWeight(4);
line(182.5,180,174,178);
line(217.5,180,225,178);


//pel//

strokeWeight(0.1);
noFill();

bezier(217,166,217,166,219,163,222,163);
bezier(216,165,216,164,214,158,223,160);
bezier(213,164,213,163,210,157,219,155);
bezier(205,162,205,162,205,156,212,153);
bezier(202,162,202,162,201,160,204,153);
bezier(200,161,200,161,202,157,195,152);
bezier(194,162,194,162,197,157,186,153);
bezier(187,163,187,163,189,154,180,157);
bezier(184,164,184,164,181,160,175,165);


//boca//
strokeWeight(0.4);
bezier(190,200,190,200,200,205,210,198);

//brazos//

strokeWeight(5);
stroke(252,224,3);
bezier(177,207,177,207,165,218,170,230);
bezier(223,207,223,207,235,218,230,230);


//peto//
noStroke();
fill(64,108,115);
rect(185,210,30,25);
strokeWeight(4);
stroke(64,108,115);
line(187,212,175,205);
line(213,212,225,205);


fill(0);
noStroke();
ellipse(187,212,2,2);
ellipse(213,212,2,2);//botons//

fill(64,108,115);
rect(175,218,50,25,0,0,100,100);//part baix//

stroke(0);
strokeWeight(0.5);
noFill();
rect(195,215,10,10,1,1,20,20);//butxaca//

//cames//

fill(64,108,115);
noStroke();
quad(180,237,197,240,197,248,185,248);//esq//
quad(203,240,220,237,215,248,203,248);//dreta//

//mans
pushMatrix();
fill(0);
noStroke();
translate(166,228);
rotate(-0.47);
rect(0,0,7,7);
popMatrix();//guants//

pushMatrix();
translate(228,226);
rotate(0.47);
rect(0,0,7,7);
popMatrix();//guants//

ellipse(169,233,4,6);

pushMatrix();
translate(172,233);
rotate(-0.50);
ellipse(0,0,4,6);
popMatrix();

pushMatrix();
translate(175,231);
rotate(-0.78);
ellipse(0,0,4,6);
popMatrix(); //dedos izq//


ellipse(231,234,4,6);

pushMatrix();
translate(228,234);
rotate(0.47);
ellipse(0,0,4,6);
popMatrix();

pushMatrix();
translate(225,232);
rotate(0.78);
ellipse(0,0,4,6);
popMatrix();//dedos derecha//

//peus//

noStroke();
fill(0);
quad(185,248,197,248,197,251,183,251);//esq//
quad(203,248,215,248,217,251,203,251);//dreta//

  //popMatrix();
}


