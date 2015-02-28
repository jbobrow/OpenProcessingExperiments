
size(400, 565);
background(255);





fill(128); //gure-
noStroke();
rect(60,0,300,700); //usironosikaku

fill(282,210,190); //hadairo
noStroke();
ellipse(200,300,500,500); //zentainomaru

fill(0); //black
stroke(0);
strokeWeight(1);
line(200, 120, 400, 565); //sikakunomigiue

line(100, 0, 100, 120);  //hidariue

line(0, 219, 100,219);  //hidarityokusen

stroke(0); //black
strokeWeight(3);
line(90, 400, 200,350);  //sitanohutoisen

stroke(255, 0, 0); //red
line(100, 410, 210, 360); //sitanohutoisen

fill(255, 0, 0); //red
noStroke();
rect(100, 120, 100,100); //sikaku

fill(128); //siro
rect(60,450,260,50); //sikaku

fill(0);
ellipse(330, 300, 90, 90); //maru

fill(255); //siro
noStroke();
rectMode(CENTER);
rect(375, 255,90,90); //miginosikaku

fill(0); //black
stroke(0);
strokeWeight(1);
line(330,255,374,300); //marunonanamesen

for(int i=0; i<80; i+=2){ 
  line(330+i,255,330+i,300); //marunotatesen
}

fill(255); //kuro
stroke(0);
strokeWeight(1);
line(330,255,565,110); //marunomigiuenosen

line(60,450,60,565); //hidarisitanotatesen

fill(0); //kuro
noStroke();
ellipse(132, 520,40,40); //sitanomaru

fill(255,0,0); //red
ellipse(200,525,50,50); //sitanomaru

fill(255); //siro
ellipse(240,420,60,60);

for(int y=0; y<=height; y+=30){
 if(y ==300){
  fill(128);
}
 else{
  fill(255);
}
rect(0,y,40,60);//hidarinosikaku
rect(400,y,40,60);//miginosikaku
}










