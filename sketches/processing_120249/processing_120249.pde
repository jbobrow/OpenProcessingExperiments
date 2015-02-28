
size(565,400);
background(255,250,240);
smooth();
int eSize=15;

noStroke();
for(int x = 0; x <= width; x += 20){
 
  if(x < 282){  
    fill(0); 
  }
  else if(x >200){    
    fill(255,0,0); 
  }
  
  ellipse(x, 2, eSize, eSize);
  println("x=" + x); 
}



noStroke();
for(int y = 0; y <= height; y += 20){
 fill(0);
  ellipse(2, y, eSize, eSize);

}

noStroke();
for(int y = 0; y <= height; y += 20){
 fill(255,0,0);
  ellipse(563, y, eSize, eSize);

}


noStroke();
fill(0);           //ellipse black
ellipse(292, 150, 270, 270);

noStroke();
fill(255,0,0);           //ellipse red
ellipse(292, 150, 243, 243);

noStroke();
fill(255);           //ellipse white
ellipse(292, 150, 220, 220);

int  i;
fill(250, 0, 0, 100);
for (i = 50; i < 230; i = i +40){
   ellipse(292, 150, i, i);
}   //doushinen


fill(0);
quad(80,0 , 140, 0, 215, 400 , 5, 400);
fill(255);
noStroke(); 
fill(255,0,0);  //A
triangle(110,60,80,230,140,230);
fill(255,250,240);
quad(75,270,145, 270, 175, 400 , 45, 400);

textSize(150);
textAlign(CENTER); //r
fill(0);
text("r", 295, 175);

textSize(120);
textAlign(CENTER); //r
fill(255);
text("r", 297, 170);

textSize(100);
textAlign(CENTER); //r
fill(255,0,0);
text("r", 299, 165);

fill(0);
rectMode(CENTER);
rect(560,200, 300, 40);//T
fill(255,0,0);
rect(495,375, 40, 300);

rectMode(CENTER);
noStroke();              //orange
fill(255,165,50);
rect(0, 350, 998, 66);


fill(255,250,240);
rectMode(CENTER);
rect(10, 350, 10, 60);
rect(30, 320, 30, 10);  //E
rect(30, 350, 30, 10);
rect(30, 380, 30, 10);

fill(255,250,240);
rectMode(CENTER);
rect(115, 350, 10, 66);  //H 
rect(155, 350, 10, 66);
fill(255,0,0);
rect(135, 350, 14, 14);

stroke(255,250,240);
strokeWeight(10);
line(60,318,95,380);  //X
line(95,318,60,380);


noStroke();
fill(255,0,0);
ellipse(185, 320, 20, 20);//i
fill(255,250,240);
quad(180, 333, 190, 333, 200,383 , 170, 383);

textSize(95);
textAlign(CENTER); //B
fill(255,250,240);
text("B", 228, 383);

noStroke();
fill(255,0,0);
ellipse(275, 320, 20, 20);  //i
fill(255,250,240);
quad(270, 333, 280, 333, 290, 383 , 260, 383);

fill(255,250,240);
rectMode(CENTER);
rect(315, 353, 10, 60);  //T
rect(315, 320, 40, 10);         

noStroke();
fill(255,0,0);
ellipse(355, 320, 20, 20);  //i
fill(255,250,240);
quad(350, 333, 360, 333, 370, 383 , 340, 383);

rectMode(CENTER);
rect(405, 350, 40, 66);  
rectMode(CENTER);         //O
fill(255,165,50);
rect(405, 350, 20, 40);


stroke(255,0,0);
strokeWeight(4);
line(445,320,487,380);

rectMode(CENTER);
fill(255,250,240);
noStroke();
rect(447, 350, 10, 66);
rect(487, 350, 10, 66);  //N

noStroke();
for(int x = 0; x <= width; x += 20){
 
  if(x < 282){  
    fill(0); 
  }
  else if(x >200){    
    fill(255,0,0); 
  }
  
  ellipse(x, 398, eSize, eSize);
  println("x=" + x); 
}



