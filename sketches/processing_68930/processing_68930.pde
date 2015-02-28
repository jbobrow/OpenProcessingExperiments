
size(700, 700);

background(255);

strokeWeight(4);

fill(0, 200, 900);

ellipse(350, 150, 100, 100); // Head

noFill();

line(350, 200, 370, 400);

line(300, 250, 400, 230); //Body

line(400, 230, 420, 300);

line(420, 300, 480, 285); //Rt Arm

strokeWeight(10);

ellipse(480, 285, 10, 10); //Rt Hand

strokeWeight(4);

line(300, 250, 230, 340);

line(230, 340, 300, 430); //Lft Arm

strokeWeight(10);

ellipse(300, 430, 10, 10); //Lft Hand

strokeWeight(4);

line(330, 410, 410, 390); //Body

fill(0, 200, 900);

ellipse(480, 490, 120, 120); //Circle under right knee

noFill();

line(410, 390, 470, 500);

line(470, 500, 450, 620); //Rt Leg

strokeWeight(10);

ellipse(450, 620, 10, 10); //Foot

strokeWeight(4);

fill(300, 0, 200);

ellipse(200, 510, 230, 230); //Circle under left leg

noFill();

line(330, 410, 330, 500);

line(330, 500, 230, 485); //Lft Leg

strokeWeight(10);

ellipse(230, 485, 10, 10); //Lft Foot

strokeWeight(4);

arc(0, 55, 700, 700, 0, PI/24); //Curved Hair

line(375, 105, 390, 70);

line(320, 107, 300, 90); //Straight Hair

strokeWeight(5);

ellipse(340, 140, 5, 5);

ellipse(360, 140, 5, 5); //Eyes

strokeWeight(3);

line(340, 140, 348, 165);

line(348, 165, 355, 165);

line(355, 165, 360, 140); //Nose

fill(0, 0, 200);

ellipse(290, 0, 200, 150);

noFill();

fill(200, 50, 50);

ellipse(550, 120, 130, 170); //Random ellipses 

noFill();

line(120, 170, 180, 240);

line(120, 240, 180, 170);

line(110, 205, 190, 205); //Snowflake lines

strokeWeight(7);

ellipse(120, 170, 7, 7);

ellipse(180, 240, 7, 7);

ellipse(120, 240, 7, 7);

ellipse(180, 170, 7, 7);

ellipse(110, 205, 7, 7);

ellipse(190, 205, 7, 7); //Ends of snowflake


