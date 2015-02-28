
float v = random(-5,8);
float vy = random(-5,8);

float x;
float y;

void setup(){

size(1000,600);
 x =random(width);
 y =random(height);
}


void draw(){
  background(250);
  
     
  dibcames();
  dibcos();
  dibcap();
  dibescopeta();
  dibmaniga();


}

void dibcos(){

  stroke(1);
fill(255,3,3);
rect(x-85,y-100,180,200,30,30,0,0);
  x = x+v;
  y = y + vy;
  
}

void dibcames(){
stroke(1);
fill(3,46,82);
rect(x+5,y+100,80,35);
fill(3,46,82);
rect(x-75,y+100,80,35);
  
fill(67,27,3);
rect(x-75,y+135,90,20);

fill(67,27,3);
rect(x+15,y+135,80,20);

  x = x+v;
  y = y + vy;

if (x+280/2 > width || x-190/2 < 0) {
    v = -v;
  }

  if (y+290/2 > height || y-485/2 < 0) {
    vy = -vy;
  }
}

void dibbala(){
noStroke();
fill(173,157,157);
ellipse(x+260,25,10,10);
rect(x+250,y-30,10,10);

}


void dibcap(){

stroke(1);
fill(255,206,147);
rect(x-55,y-220,120,120,20,20,20,20);

fill(0);
ellipse(x+5,y-238,15,15);
fill(0);
rect(x-100,y-195,120,5,20,20,20,20);
fill(0);
rect(x-57,y-240,123,50,120,120,0,0);

fill(0);
rect(x-55,y-165,120,1,20,20,20,20);
fill(x,25,25);
ellipse(x+62,y-165,25,25);
fill(x,25,25);
ellipse(x+22,y-165,25,25);
      
}

void dibescopeta(){
  
fill(183,96,30);
quad(x-40,y-30,x-85,y+10,x-60,y+45,x-10,y-30);

fill(206,190,177);
rect(x-40,y-35,190,30);

fill(183,96,30);
rect(x+50,y-15,60,20);

fill(255,206,147);
ellipse(x-35,y-10,40,40);

fill(255,206,147);
ellipse(x+82,y-2,40,40);
      
}

void dibmaniga(){

fill(255,3,3);
quad(x-15,y-30,x-67,y-17,x-80,y-75,x-35,y-93);

}



void mousePressed(){
if(dist(mouseX,mouseY,x,y)<150/2){
v = random(-5,5);
vy = random(-5,5);
}
x = mouseX;
y = mouseY;

}




