
float c;
int offset = 10;//for cursor

void setup(){
size(600, 600);
smooth();
c = height/2;
}

void draw(){
  background(0); //black

 //back_square
fill(35,35,35); //dark gray
noStroke();
rect(0,200,400,400);

for(int y =500; y >= 200; y -= 50) {
  stroke(0); //black
  strokeWeight(30);
  strokeCap(PROJECT);
  line(0,y,600-y,y);
  line(600-y,600,600-y,y);
  }
  
  
  //right_up_sqaure
 
  for(int x =200; x>=100; x-=50){
    stroke(35,35,35); //dark gray
    strokeWeight(15);
    strokeCap(PROJECT);
    line(600-x,x,600,x);
    line(600-x,0,600-x,x);
  
}
  
//moving bar

   if(mouseY > c) {
    c+= 0.5;
    offset = 10;
  }
    if(mouseY < c) {
      c-= 0.5;
      offset =-10;
    }
    fill(255); //white
    noStroke();
rect(360,c,200,20);

//cursor_arrow
stroke(245,20,24); //red
strokeWeight(5);
noCursor();
line(mouseX+10, mouseY+10, mouseX , mouseY +10 + 2*offset);
line(mouseX+10, mouseY+10, mouseX+20 , mouseY +10 + 2*offset);
line(mouseX , mouseY+10 + 2*offset, mouseX + 20, mouseY +10 + 2*offset);


//small bar 
noStroke();
fill(255); //white
rect(500,410,200,5);

//light gray_rect
fill(200,200,200); //light gray
rect(240,440,240,80);

fill(255,183,26); //yellow(any key ;except 'a' and 'b')
{
if(keyPressed){
  if(key=='a')fill(250,0,0); //red
  else if (key=='b') fill(255); //white
}
else{
fill(80,80,80); //dark gray
}
quad(240,40,70,300, 336,466, 500, 204); //big square(center)
}


//square_right_down_1,2
fill(80,80,80);//dark gray
rect(460,500,60,60);
rect(540,500,60,60);

//right_up_1,2
noFill();
stroke(200,200,200); //light gray
strokeWeight(2);


//left_up_1
noStroke();
fill(200,200,200);//light gray
rect(0,80,360,5);

//left_up_2
fill(255); //white
rect(0,100,260,20);

 }



