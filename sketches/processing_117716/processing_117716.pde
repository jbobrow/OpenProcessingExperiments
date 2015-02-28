
//this is a connecting-dots exercise
//after connected the dots, then you may press the keyboard
//changes will be shown on the screen
//whatever you are finished the dots connection or not
//you still can press the keyboard whenever you want
//*NoiseWave example from Processing.org has been taken in this work

float yoff= 0.0; 

void setup(){
  size(700,750);
  background(#FFF9D3);
  smooth();
  
  {stroke(255,0,0);     //red line
  line(100,0,100,750);}
  
  {stroke(#5FA1D6);          //using Array function to draw blue lines
  for (int i=80; i<750; i=i+30) {
  line(0, i, 700, i);
}}

}

void draw(){
  stroke(0);                  //using MousePressed function to set mouse as a drawing pen
  
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);

  }
  fill(0);     // fill the dots to be black
  
  ellipse(370,200,3,3);  //middle finger
  ellipse(384,200,3,3);
  ellipse(356,210,3,3); 
  ellipse(356,230,3,3);
  ellipse(356,250,3,3);
  ellipse(356,270,3,3); 
  ellipse(356,290,3,3);
  ellipse(356,310,3,3);
  ellipse(356,330,3,3); 
  ellipse(356,350,3,3);
  ellipse(356,370,3,3);
  
  ellipse(398,210,3,3);  //middle finger
  ellipse(398,230,3,3);
  ellipse(398,250,3,3);
  ellipse(398,270,3,3); 
  ellipse(398,290,3,3);
  ellipse(398,310,3,3);
  ellipse(398,330,3,3); 
  ellipse(398,350,3,3);
  ellipse(398,370,3,3);
  
  ellipse(350,350,3,3);   //index finger
  ellipse(345,340,3,3);
  ellipse(335,330,3,3);
  ellipse(320,330,3,3);
  ellipse(310,335,3,3);
  ellipse(310,335,3,3);
  ellipse(305,355,3,3);
  ellipse(310,375,3,3);
  ellipse(310,395,3,3);
  ellipse(310,415,3,3);
  
  ellipse(305,395,3,3);   //thumb
  ellipse(295,385,3,3);
  ellipse(285,375,3,3);
  ellipse(275,365,3,3);
  ellipse(265,360,3,3); 
  ellipse(250,365,3,3);
  ellipse(245,380,3,3);
  ellipse(245,400,3,3);
  ellipse(255,420,3,3);
  ellipse(270,440,3,3);
  ellipse(285,460,3,3);
  ellipse(300,480,3,3);
  ellipse(310,500,3,3);
  ellipse(320,510,3,3);
  ellipse(340,520,3,3);
  ellipse(340,540,3,3);
  ellipse(340,560,3,3);
  ellipse(340,580,3,3);
  ellipse(340,600,3,3);
  
  ellipse(405,350,3,3);  //ring finger
  ellipse(405,330,3,3);
  ellipse(405,320,3,3);
  ellipse(415,315,3,3);
  ellipse(425,315,3,3);
  ellipse(440,320,3,3);
  ellipse(440,340,3,3);
  ellipse(440,360,3,3);
  ellipse(440,380,3,3);
  
  ellipse(445,380,3,3);  //baby finger
  ellipse(446,360,3,3);
  ellipse(450,350,3,3);
  ellipse(456,340,3,3);
  ellipse(465,345,3,3);
  ellipse(475,355,3,3);
  ellipse(480,365,3,3);
  ellipse(480,375,3,3);
  ellipse(480,395,3,3);
  ellipse(480,415,3,3);
  ellipse(480,435,3,3);
  ellipse(480,455,3,3);
  ellipse(470,475,3,3);
  ellipse(460,495,3,3);
  ellipse(450,510,3,3);
  ellipse(440,530,3,3);
  ellipse(440,550,3,3);
  ellipse(440,570,3,3);
  ellipse(440,590,3,3);
  ellipse(440,610,3,3);
  
  textSize(14);         // label 1-10 for the first 10 points
  text("1",330,600);    //the coordinates of the texts cannot be the same with the ellpise one
  text("2",330,580);    //becasuse the texts will covered the ellipse
  text("3",330,560);
  text("4",330,540);
  text("5",330,520);
  text("6",310,520); 
  text("7",300,508);
  text("8",285,490);
  text("9",270,470); 
  text("10",250,450);

  
  textSize(20);              //giving an instruction to the audience
  text("*Connect the dots.",100,105);
  
  stroke(255,0,0);        //set the arrow be red color 
  line(280,600,300,600);  // the arrow next to the first point
  line(300,600,300,590);
  line(280,610,300,610);
  line(320,605,300,620);
  line(320,605,300,590);
  line(300,600,300,620);
  line(280,600,280,610);
  
  textSize(25);
  text("Start Here",155,615);

   if (keyPressed == true) {    
    beginShape();                    //*source from the example of Processing.org
     float xoff = 0;
  for (float x = 0; x <= width; x += 20) {
    float y = map(noise(xoff, yoff), 0, 0.5, 560,700);
    vertex(x, y); 
    xoff +=0.08;
 }
 yoff+=0.08;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);                    //*source from the example of Processing.org
  
  ellipse(width/2, height/2,mouseX, mouseY);   // when pressing the keyboard ,the mouse will shown as different effect
  
  line(80,110,270,85);     // when pressin the keyboard, the instrcution will be crossed
    textSize(50);
    fill(255);
  text("Yes,I'm  done with this.",110,700);
  
  } else {            //there is no change if keyboard is not getting pressed

  }
}
