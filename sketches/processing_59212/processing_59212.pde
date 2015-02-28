
int moveri=0;
int moverd=0;

void setup(){
size(420,420);


}

void draw(){
  
  background(255);
  
  fill(0);
beginShape();

vertex (moverd+50,120);
vertex (moverd+100,90);
vertex (moverd+110,60);
vertex (moverd+80,20);
vertex (moverd+210,60);
vertex (moverd+160,80);
vertex (moverd+200,90);
vertex (moverd+140,100);
vertex (moverd+130,120);
ellipse (moverd+155,60,8,8);
endShape();
fill(255);
ellipse (moverd+155,60,8,8);


fill(0);
beginShape();
vertex (moveri+370,120);
vertex (moveri+320,90);
vertex (moveri+310,60);
vertex (moveri+340,20);
vertex (moveri+210,60);
vertex (moveri+260,80);
vertex (moveri+220,90);
vertex (moveri+280,100);
vertex (moveri+290,120);
ellipse (moveri+265,60,8,8);

endShape();
fill(255);

ellipse (moveri+265,60,8,8);

moverd=moverd+1;
moveri=moveri-1;


}

