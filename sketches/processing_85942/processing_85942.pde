
void setup()
{size(400,600);

}

void draw()
{

background(0);

noStroke();
//forme1
fill(#FF0000);
beginShape();
arc(200,300, 50, 50,0,PI);
arc(175, 300, 50, 50,-PI/2,0);
arc(200, 300, 50, 50,-PI/2,0);
endShape(CLOSE);

fill(#C10000);


rotate(PI/8);
translate(65,-50);
beginShape();
arc(260,300, 50, 50,0,PI);
arc(235, 300, 50, 50,-PI/2,0);
arc(260, 300, 50, 50,-PI/2,0);
endShape(CLOSE);

fill(#670000);
rotate(PI/6);
translate(165,-135);
beginShape();
arc(260,300, 50, 50,0,PI);
arc(235, 300, 50, 50,-PI/2,0);
arc(260, 300, 50, 50,-PI/2,0);
endShape(CLOSE);

fill(#360000);
rotate(PI/3);
translate(179,-395);
beginShape();
arc(260,300, 50, 50,0,PI);
arc(235, 300, 50, 50,-PI/2,0);
arc(260, 300, 50, 50,-PI/2,0);
endShape(CLOSE);

fill(#0F0000);
rotate(PI/2);
translate(25,-610);
beginShape();
arc(260,300, 50, 50,0,PI);
arc(235, 300, 50, 50,-PI/2,0);
arc(260, 300, 50, 50,-PI/2,0);
endShape(CLOSE);

fill(#0A0000);
rotate(PI/1.5);
translate(-160,-635);
beginShape();
arc(260,300, 50, 50,0,PI);
arc(235, 300, 50, 50,-PI/2,0);
arc(260, 300, 50, 50,-PI/2,0);
endShape(CLOSE);



}







