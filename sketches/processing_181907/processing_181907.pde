
int mida = 200;
float x = 50;
float y = 40;
//float velocitat = x + 1;
//float velocitat2 =2;
float a = 100;
float b = 100;

void setup(){
  size(600,400);
  //stroke(202,90,250,50);
  //fill(255,0,0);
  //background(255);
}
void draw(){
  background(166 - mouseX,220 -mouseX/2,245 -mouseX/4);
//pluja
fill(103 + mouseX/5,220 + mouseX/5 ,230 - mouseX/20, mouseX + 10);
stroke(166 + mouseX/5,220 + mouseX/5 ,245 - mouseX/20, mouseX + 0.001);
rect(random(0,600),random(0,400),1,40);
rect(random(0,600),random(0,400),1,40);
rect(random(0,600),random(0,400),1,40);
rect(random(0,600),random(0,400),1,40);


  //núvols
a = a + 0.01;
fill(245 -mouseX/5);
stroke(245 -mouseX/5);
ellipse(a,100,75,55);
ellipse(a+50,100,75,65);
ellipse(a+100,100,75,55);

b = b - 0.03;

ellipse(b+300,200,75,55);
ellipse(b+350,200,75,65);
ellipse(b+400,200,75,55);

ellipse(500,50,75,55);
ellipse(550,50,75,65);
ellipse(600,50,75,55);

  //parts cos color marró
  fill(240 - mouseX/20,203 -mouseX/20,82 -mouseX/200);
  stroke(240 - mouseX/20,203 -mouseX/20,82-mouseX/200);
ellipse(mouseX,mouseY,mida,mida);
ellipse(mouseX-30,mouseY+100,30,40);
ellipse(mouseX+30,mouseY+100,30,40);
triangle(mouseX-80,mouseY-60,mouseX-75,mouseY-125,mouseX-15,mouseY-100);
triangle(mouseX+15,mouseY-100,mouseX+75,mouseY-125,mouseX+80,mouseY-60);
//orellesroses
fill(250 -mouseX/20,126 -mouseX/20, 201 -mouseX/200);
stroke(250 -mouseX/20,126 -mouseX/20, 201 -mouseX/200);
triangle(mouseX-70,mouseY-65,mouseX-70,mouseY-115,mouseX-25,mouseY-90);
triangle(mouseX+25,mouseY-90,mouseX+70,mouseY-115,mouseX+70,mouseY-65);
//parts negres
fill(0);
stroke(0);
ellipse(mouseX-30,mouseY-20,10,10);
ellipse(mouseX+30,mouseY-20,10,10);
ellipse(mouseX,mouseY+20, 10, mouseY/15);
//naset i bigotis
triangle(mouseX-5,mouseY-5,mouseX,mouseY,mouseX+5,mouseY-5);
line(mouseX-60,mouseY-10,mouseX-50,mouseY-3);
line(mouseX-60,mouseY+3,mouseX-50,mouseY+3);
line(mouseX-60,mouseY+16,mouseX-50,mouseY+9);
line(mouseX+50,mouseY-3,mouseX+60,mouseY-10);
line(mouseX+50,mouseY+3,mouseX+60,mouseY+3);
line(mouseX+50,mouseY+9,mouseX+60,mouseY+16);


//mar
stroke(41 -mouseX/200,109 -mouseX/200,142 -mouseX/15);
fill(41 -mouseX/200,109 -mouseX/200,142 -mouseX/15);
rect(0,300 -mouseY/15,600,100 + mouseY/15);

//peixet de colors

//if (x>600){
  //x = x - 0.5;
//}else{
  //if(x<1){
   // x = x + 0.5;
  //}

x = x + 0.2;
fill(245 - mouseX/10,137 -mouseX/100,64 -mouseX/200);
stroke(245 - mouseX/10,137 -mouseX/100,64 -mouseX/200);
ellipse(x,height-50,70,40);
triangle(x-50,height-70,x-20,height-50,x-50,height-30);
fill(0);
ellipse(x+20,height-50,5,5);


}

