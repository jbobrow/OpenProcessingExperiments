
int r = 30; //ennohankei

size(400,565); //window
background(255,255,255);
smooth();

for(int y=0; y<=height; y+=50){ //mizutamamoyou
  for(int x=0; x<=width; x+=50){
    fill(0,x/3); //iro,toudo
    if(y >= height/5){ //sirokusuru
      fill(255);
    }
    noStroke();
    ellipse(x,y,r,r);
  }
}

stroke(0); //migiuenoen
strokeWeight(15);
noFill();
ellipse(500,160,500,500);
ellipse(500,120,300,400);

noStroke(); //ennokabuwokakusu
fill(255);
rect(200,129,200,400);

fill(255,0,0); //akaisikaku
rect(295,90,85,170);

stroke(0); //entotunagerusen
line(252,130,252,490);

strokeWeight(3); //hidarisita2honnsen
line(30,480,30,565);
line(52,500,52,565);

stroke(255,0,0); //akaiwaku
strokeWeight(7);
noFill();
rect(-10,450,360,70);

strokeWeight(1); //akaikeisen
for(int i=0; i<350; i+=5){
  line(i,450,i,520);
}

stroke(0); //hidariue
strokeWeight(1);
line(3,100,200,140);
line(50,90,195,240);
ellipse(20,70,15,15);

strokeWeight(5); //migisita2honnsen
line(370,400,370,470);
line(330,360,330,530);

fill(0); //kuroisikaku
rect(280,200,60,100);

noStroke(); //siroisikaku
fill(255);
rect(295,198,47,62);

noStroke(); //mizuironotakakukei
fill(135,206,250);
triangle(40,360,55,180,85,280);
quad(40,360,135,340,200,380,135,400);


