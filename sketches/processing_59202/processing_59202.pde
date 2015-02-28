
void setup(){
size(600,600);
background(187,230,231);
smooth();
}

void mousePressed(){
 println(mouseX+" "+mouseY);
}



void draw(){
  
noStroke();
fill(185,164,109);
rectMode(CORNER);
rect(0,500,600,100);  
  
  
//Flügel vorn
stroke(150);
strokeWeight(3);
fill(0);
arc(315,210,130,400,PI/2, PI);
  
  
//Schwanz
noStroke();
fill(0);
quad(440,290,520,310,540,280,510,270);

noStroke();
fill(0);
quad(440,305,530,300,550,320,520,330);

noStroke();
fill(0);
quad(440,315,520,330,530,355,490,360);
  
  
//Körper
noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(300,160,160,120);

noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(340,280,240,220);

noStroke();
fill(200);
ellipseMode(CENTER);
ellipse(300,310,120,130);
//drehen?


//Auge
stroke(150);
strokeWeight(3);
fill(0);
ellipseMode(CENTER);
ellipse(300,150,15,15);

stroke(150);
strokeWeight(3);
fill(0);
ellipseMode(CENTER);
ellipse(230,150,15,15);


//Schnabel
noStroke();
fill(208,169,101);
quad(250,150,300,170,280,200,220,175);

noStroke();
fill(255,243,109);
quad(250,160,290,175,280,200,160,215);


//Beine
noStroke();
fill(255,243,109);
ellipseMode(CENTER);
ellipse(380,380,15,15);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(380,380,420,470);

noStroke();
fill(255,243,109);
ellipseMode(CENTER);
ellipse(420,470,15,15);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(420,470,380,560);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(380,560,420,560);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(380,560,320,560);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(380,560,330,570);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(380,560,330,550);


noStroke();
fill(255,243,109);
ellipseMode(CENTER);
ellipse(330,390,15,15);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(330,390,340,460);

noStroke();
fill(255,243,109);
ellipseMode(CENTER);
ellipse(340,460,15,15);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(340,460,310,550);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(310,550,345,550);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(310,550,255,555);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(310,550,270,565);

stroke(255,243,109);
strokeWeight(6);
fill(255,243,109);
line(310,550,265,545);


//Flügel vorn
stroke(150);
strokeWeight(3);
fill(0);
translate(390,210);  
rotate(radians(340));
arc(0,0,130,400,PI/2, PI);

}




