
size(800,800);

noStroke();
fill(121, 196, 102);
rect(0, 0, 20, 800);
fill(121, 190, 102);
rect(20, 0, 20, 800);
fill(121, 185, 102);
rect(40, 0, 20, 800);
fill(121,180,102);
rect(60, 0, 20, 800);
fill(121,175,102);
rect(80, 0, 20, 800);
fill(121,170, 102);
rect(100, 0, 20, 800);
fill(121, 165, 102);
rect(120, 0 , 20, 800);
fill(121, 160, 102);
rect(140, 0, 20, 800);
fill(121, 155, 102);
rect(160, 0, 20, 800);
fill(121, 150, 102);
rect(180, 0, 20, 800);
fill(121,145,102);
rect(200,0,20,800);
fill(121,140,102);
rect(220,0,20,800);
fill(121, 135, 102);
rect(240, 0, 20, 800);
fill(121,130,102);
rect(260, 0, 20, 800);
fill(121, 125, 102);
rect(280, 0, 20, 800);
fill(121, 115, 102);
rect(300, 0, 20, 800);
fill(121, 105, 102);
rect(320, 0, 20,800);
fill(121, 95, 102);
rect(340, 0,20,800);
fill(121, 85, 102);
rect(360, 0, 20, 800);
fill(121, 75, 102);
rect(380,0,20,800);
fill(121, 73, 102);
rect(380,0,40,800);
fill(121, 70, 102);
rect(400,0, 80,800);
fill(121, 60, 102);
rect(480,0,120,800);
fill(121, 45,102);
rect(600, 0, 160, 800);
fill(121,39,102);
rect(750, 0, 60, 800);

fill(60);{
ellipse(400, 100, 350, 350);
}
noStroke();{
fill(255, 195, 145);
rect(325, 330, 150, 140);

noStroke();{
fill(255, 200, 145);//skin test
quad(300, 300, 500, 300, 520, 200, 280, 200);
quad(300, 300, 500, 300, 470, 370, 330, 370);
quad(330, 370, 470, 370, 420, 410, 380, 410);

rect(285, 100, 230, 150);
arc(400,100, 230, 100, PI, TWO_PI);

}
fill(245);//whites of eyes
ellipse(340, 200, 50, 40 );
ellipse(460, 200, 50, 40);

fill(120, 78, 84);//browns of eyes
ellipse(340, 200, 30, 30);
ellipse(460,200, 30, 30);

fill(10);//pupils
ellipse(340, 199, 10, 10);
ellipse(460, 199, 10, 10);

fill(110, 78, 84);//left eyebrow
noStroke();{
quad(300, 185, 320, 160, 350, 150, 345, 170);
quad(349, 150, 344, 170, 365, 170, 370, 155);
}

}
fill(110, 78, 84);//right eyebrow
noStroke();{
quad(500, 185, 480, 160, 450, 150, 455, 170);
quad(456, 170, 451, 150, 430, 155, 435, 170);

}
fill(10);{
arc(379, 297, 10, 20, HALF_PI, PI+HALF_PI);
}
stroke(120);
fill(255, 200, 145); //nose
arc(400, 300, 30, 25, TWO_PI, TWO_PI+PI);
arc(380, 296, 10, 20, HALF_PI, PI+HALF_PI);
arc(420, 296, 10, 20, PI+HALF_PI, TWO_PI+HALF_PI);

stroke(196, 104, 102);{
line(380, 355, 420, 355);
}


