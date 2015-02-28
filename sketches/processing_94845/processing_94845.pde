
int x=0;//defines x


void setup(){
 background(255);
size(300, 200);
noStroke();
}
void draw(){
  background(255);
  x=(x-4)%700;//what x=
  ash(300+x, 20);
  pikachu(300+x, 20);
}

void ash(int x, int y){
 fill(0);// black
 rect(60+x, 20+y, 60, 10);// black part of sketch 
 rect(50+x, 30+y, 10, 10);
 rect(40+x, 40+y, 10, 10);
 rect(30+x, 50+y, 20, 10);
 rect(20+x, 60+y, 10, 10);
 rect(30+x, 70+y, 20, 10);
 rect(40+x, 80+y, 10, 30);
 rect(50+x, 110+y, 10, 10);
 rect(60+x, 120+y, 60, 10);
 rect(40+x, 130+y, 60, 10);
 rect(30+x, 140+y, 10, 10);
 rect(40+x, 150+y, 10, 10);
 rect(50+x, 160+y, 30, 10);
 rect(60+x, 140+y, 10, 10);
 rect(90+x, 140+y, 10, 10);
 rect(70+x, 150+y, 50, 10);
 rect(120+x, 130+y, 10, 20);
 rect(120+x, 160+y, 20, 10);
 rect(140+x, 140+y, 10, 20);
 rect(130+x, 110+y, 10, 30);
 rect(100+x, 110+y, 20, 10);
 rect(120+x, 90+y, 10, 20);
 rect(130+x, 90+y, 10, 10);
 rect(90+x, 90+y, 10, 20);
 rect(90+x, 80+y, 60, 10);
 rect(80+x, 70+y, 70, 10); 
 rect(120+x, 60+y, 30, 10);
 rect(130+x, 40+y, 10, 20);
 rect(120+x, 30+y, 10, 10);
 rect(60+x, 80+y, 10, 20);// end of black parts(eye)
 fill(180, 16, 16);// red
 rect(60+x, 30+y, 60, 10);// red hat
 rect(50+x, 40+y, 80, 10);
 rect(60+x, 50+y, 70, 10);
 rect(70+x, 60+y, 50, 10);
 rect(50+x, 70+y, 30, 10);// end of red hat
 rect(40+x, 140+y, 20, 10);//red shoes
 rect(50+x, 150+y, 20, 10);
 rect(120+x, 150+y, 20, 10);
 rect(130+x, 140+y, 10, 10);//end of red shoes
 fill(25, 100, 190);//blue
 rect(120+x, 110+y, 10, 20);//blue pants or shirt
 rect(70+x, 140+y, 20, 10);//end of blue pants and shirt
 fill(227, 191, 133);//skin colored
 rect(100+x, 130+y, 20, 20);//hand
 rect(100+x, 90+y, 20, 20);//ear
 rect(50+x, 80+y, 10, 30);//face
 rect(60+x, 100+y, 30, 10);
 rect(60+x, 110+y, 40, 10);
 rect(70+x, 80+y, 20, 20);
}

void pikachu(int x, int y){
  fill(0);//black
  rect(290+x, 20+y, 10, 10);//black parts
  rect(300+x, 20+y, 10, 10);
  rect(260+x, 30+y, 90, 10);
  rect(230+x, 40+y, 30, 10);
  rect(220+x, 50+y, 10, 10);
  rect(210+x, 60+y, 10, 20);
  rect(200+x, 80+y, 10, 20);
  rect(210+x, 100+y, 10, 40);
  rect(220+x, 130+y, 10, 10);
  rect(200+x, 140+y, 10, 10);
  rect(210+x, 150+y, 20, 10);
  rect(230+x, 140+y, 10, 10);
  rect(230+x, 110+y, 10, 20);
  rect(230+x, 80+y, 10, 10);
  rect(240+x, 120+y, 10, 10);
  rect(240+x, 150+y, 40, 10);
  rect(280+x, 160+y, 20, 10);
  rect(280+x, 140+y, 20, 10);
  rect(290+x, 130+y, 30, 10);
  rect(300+x, 90+y, 10, 40);
  rect(290+x, 80+y, 10, 20);
  rect(280+x, 60+y, 10, 20);
  rect(290+x, 50+y, 10, 20);
  rect(280+x, 40+y, 30, 10);
  rect(340+x, 40+y, 10, 10);
  rect(330+x, 50+y, 10, 10);
  rect(320+x, 60+y, 10, 10);
  rect(310+x, 70+y, 10, 20);
  rect(320+x, 80+y, 20, 10);
  rect(330+x, 90+y, 10, 10);
  rect(320+x, 100+y, 10, 10);
  rect(330+x, 110+y, 10, 10);
  rect(320+x, 120+y, 10, 10);
  rect(310+x, 140+y, 10, 10);
  rect(300+x, 150+y, 10, 10);//end of black part
  fill(206, 187, 10);//yellow
  rect(260+x, 40+y, 20, 10);//yellow parts
  rect(230+x, 50+y, 60, 10);
  rect(220+x, 60+y, 60, 20);
  rect(210+x, 80+y, 20, 20);
  rect(220+x, 100+y, 10, 30);
  rect(240+x, 80+y, 50, 10);
  rect(230+x, 90+y, 20, 20);
  rect(250+x, 100+y, 20, 10);
  rect(260+x, 90+y, 30, 10);
  rect(240+x, 110+y, 60, 10);
  rect(250+x, 120+y, 20, 10);
  rect(230+x, 130+y, 60, 10);
  rect(240+x, 140+y, 40, 10);
  rect(210+x, 140+y, 20, 10);
  rect(280+x, 150+y, 20, 10);
  rect(300+x, 140+y, 10, 10);
  rect(310+x, 90+y, 20, 10);
  rect(300+x, 50+y, 10, 40);
  rect(290+x, 70+y, 10, 10);
  rect(310+x, 40+y, 10, 30);
  rect(320+x, 40+y, 10, 20);
  rect(330+x, 40+y, 10, 10);//end of yellow parts
  fill(57, 38, 9);//brown
  rect(310+x, 100+y, 10, 30);//brown parts
  rect(320+x, 110+y, 10, 10);
  rect(270+x, 100+y, 30, 10);
  rect(270+x, 120+y, 30, 10);//end of brown parts
  fill(180, 16, 16);// red
  rect(250+x, 90+y, 10, 10);//red cheek end of red parts
}


