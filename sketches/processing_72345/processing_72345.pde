
//Alyssa Hamilton
//Introduction to Digital Media Fall 2012
//Section A
//9.11.12
 
 
 
float x2;
float y2;
float randomDiameter = random(7,13);


int clicked =-1;

void setup()
{
 background(0);
 size(1200,600);
 smooth();
 }
 
 
 
 void draw()
 {
 
  strokeWeight(1);
  stroke(mouseX/2,random(100),mouseY/2,80);
     line(mouseX+30,mouseY+15,x2,y2);
     line(mouseX-15,mouseY-30,1200,0);
 strokeWeight(7);
     fill(random(50,150),random(50,150),random(50,150),random(50,150));
     ellipse(50,150,randomDiameter,randomDiameter);
     ellipse(300,150,randomDiameter,randomDiameter);
     ellipse(600,250,randomDiameter,randomDiameter);
     ellipse(780,50,randomDiameter,randomDiameter);
     ellipse(450,280,randomDiameter,randomDiameter);
     ellipse(900,180,randomDiameter,randomDiameter);
     ellipse(1080,300,randomDiameter,randomDiameter);
     ellipse(200,230,randomDiameter,randomDiameter);
     ellipse(700,380,randomDiameter,randomDiameter);
     ellipse(500,100,randomDiameter,randomDiameter);
     ellipse(1130,120,randomDiameter,randomDiameter);
 
   strokeWeight(1);
   noFill();
 
   line(50,470,50,390);                      //1st Building
   line(50,390,0,390);
   line(50,390,70,410);
 
   curve(500,400,150,300,50,600,400,500);    //2nd Building
   curve(500,400,150,300,150,500,400,500);
   curve(500,400,150,300,230,450,400,500);
 
   line(150,600,150,475);                     //3rd Building
   line(250,600,250,500);
   line(150,475,245,480);
   line(150,475,235,450);
 
 
   line(280,600,220,400);                    //4th Building
   line(360,600,350,330);
   line(220,400,350,330);
   line(350,330,430,350);
   line(430,350,420,400);
 
   line(390,600,390,400);                    //5th Building
   line(390,400,510,600);
   line(390,400,500,400);
   line(563,535,525,455);
   line(500,400,513,425);
 
  bezier(510,600,530,420,490,325,510,300);  //6th Building (Tower)
  bezier(530,600,510,420,550,325,530,300);
   ellipse(520,295,40,10);
   bezier(515,290,500,270,519,290,520,230);
   bezier(525,290,540,270,521,290,520,230);
 
   bezier(545,600,610,350,600,570,630,425);  //7th Building (Curvy)
   bezier(605,600,670,350,660,590,690,425);
   bezier(635,600,690,370,680,610,710,415);
   line(630,425,690,425);
   line(690,425,710,415);
   line(630,425,650,415);
   line(710,415,650,415);
   line(670,498,700,600);
 
   line(715,600,715,350);                    //8th Building (Triangle)
   line(765,600,765,400);
   line(715,350,765,400);
   line(765,400,770,340);
   line(770,600,770,340);
   line(715,350,770,340);
 
   bezier(850,600,940,500,900,560,820,400);   //9th Building (Gehry Style)
   line(820,400,770,600);
   line(900,600,890,555);
   bezier(820,400,840,450,920,450,970,420);
   line(970,420,920,600);
   line(970,420,960,600);
 
   bezier(980,600,1010,500,1010,500,980,400);   //10th Building
   bezier(1050,600,1080,500,1080,500,1050,400);
   line(973,408,973,600);
   line(973,408,980,400);
   line(980,400,1050,400);
 
   line(1120,360,1080,360);                    //11th Building
   line(1080,360,1080,600);  
   line(1080,360,1100,345);
   line(1100,345,1120,345);
   line(1080,450,1065,450);
   line(1080,435,1060,435);
 
   line(1200,320,1120,320);                    //12th Building
   line(1120,320,1120,600);
   line(1120,320,1170,300);
   line(1170,300,1200,300);
 
   line(570,515,570,450);                     //Extras
   line(570,450,625,450);
   line(570,450,585,440);
   line(585,440,625,440);
   line(540,485,570,465);
   line(570,465,530,465);
   line(675,510,715,510);
   line(715,490,695,490);
   line(770,440,810,440);
   line(770,425,813,425);
 
 String s = "City of Lights";
 fill(255);
 text(s, 10, 10, 70, 110);
 
 
 }
 
 
 void mouseClicked()
 {
    x2=random(255);
    y2=random(255);
    clicked*=-40;
 
 } 

void keyPressed(){
  if(key=='s')
  save("AlyssaHamilton.pde");
}
