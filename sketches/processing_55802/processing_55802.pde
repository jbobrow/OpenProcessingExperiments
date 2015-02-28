
void setup(){
size(340, 540);//canvas size
}
void draw(){
//need to rotate head
//head and neck
if (mousePressed){
  fill(200,0,0);
  rect (220,130,10,15);
  rect(70,130,10,15);
}else{
  fill(255);
}
rect(220, 130, 10,15);//ears
rect(70,130, 10,15);//ears
fill(100);
rect(80, 100, 140,80); //head
fill(200);
rect(90, 110, 120, 60);
fill(100);

rect(140,90,20,10);//antennae rectangle
line(150,90,150,40);//antennae line
  if (mousePressed){
    fill(200,0,0);
    ellipse(150,40,10,10);//antennae circle
  } else{
    fill(0);
    ellipse(150,40,10,10);
  }
  
line(160,50,175,60);//lines around antennae
line(140,50,120,60);//lines around antennae
line(140,30,120,20);//lines around antennae
line(160,30,175,20);//lines around antennae
fill(70);
quad(135,180,165,180,160,220,140,220);//neck

//torso
fill(120);
quad(90,220,210, 220, 190, 320, 110, 320);//torso
fill(200);
quad(100,230,200, 230, 180, 310, 120, 310);

//head and legs
fill(75);
quad(120,320,145,320,140,360,125,360);//left leg
quad(155,320,180,320,175,360,160,360);//right leg
fill(255);
ellipse(110,150,30,30);//Eyes
ellipse(190, 150,30,30);//eyes
fill(0);
ellipse(111,149,20,20);//pupils
ellipse(189,149,20,20);//pupils

//feet/legs
fill(50);
rect(120,360,25,10);//left foot
rect(155,360,25,10);//right foot

//arms
fill(100);
beginShape();//left upper arm
vertex(85,210);
vertex(90,230);
vertex (60,270);
vertex(50,270);
endShape(CLOSE);
beginShape();//right upper arm
vertex(210,210);
vertex(205,230);
vertex(240,270);
vertex(250 ,270);
endShape(CLOSE);
fill(100);
rect(245,270,12.5,40);//forearm right
fill(255);
ellipse(250,270,20,20);//elbow right
ellipse(90,220,30,30); //left arm shoulder
ellipse(210,220,30,30);//right arm shoulder
fill(100);
rect(45,270,12.5,40);//forearm left
fill(255);
ellipse(50,270, 20,20);//elbow joint left
rect( 37.5,310, 27.5,10);//hand left
rect (39,320,10,15);//hand left
rect (52.5,320, 10,15);//hand left
rect(237.5,310,27.5,10);//hand right
rect(240, 320,10, 15);//hand right
rect(253.5, 320, 10,15);//hand right
fill(255);
ellipse(190, 145, 5,5);
ellipse(110,145,5,5);
    }




