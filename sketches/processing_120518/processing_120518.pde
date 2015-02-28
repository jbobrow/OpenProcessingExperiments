


size(565,400);
background(0);
smooth();

noStroke();//itibanokinaen
fill(237,226,182);
ellipse(500,200,500,500);

for(int x=10; x<=150; x+=10){
for(int y=10; y<=150; y+=10){
  if(x >=10 && x <=150){
stroke(255,x,y);
  }
strokeWeight(1);//okinaennikasanatteiruen
noFill();
ellipse(400,200,x,y);


}
}

noStroke();
fill(193,192,187,100);
ellipse(170,50,50,50);//hidarigawanoen ue
ellipse(80,300,50,50);//sita

fill(255,255,255,100);
quad(400,115,485,200,400,285,315,200);//migigawanoennikabusatteirusikaku

fill(255,0,0);//hidarigawanosankaku
triangle(80,30,250,150,20,80);
triangle(110,200,310,200,110,270);
triangle(80,370,130,380,250,250);

stroke(255);
strokeWeight(2);
line(251,0,251,400);//mannakanosen

rectMode(CENTER);
noStroke();
quad(500,40,520,50,480,120,460,110);//migigawanosikaku
translate(45,-85);
rotate(0.2);
rect(525,200,80,20);
translate(400,-270);
rotate(0.8);
rect(500,350,80,20);





