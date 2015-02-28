
//Raidel C, Penguin(Azurill), CP1, Mod 14-15
//url: http://argentxorion.webs.com/Azurill/RaidelsAzurill.html

/**
  <pre>
  This is my pokemon Azurill!! :3
  
  I hope you like my level 100 Azurill
  
     
     I        I   HHHHHHHHHH 
     I        I      HHH
     I        I      HHH
     IIIIIIIIII      HHH
     I        I      HHH
     I        I      HHH
     I        I   HHHHHHHHHH
     
     
  -Raidel</pre>
*/  

    


size(600,600);
smooth();

//Background/Misc 
background(27,53,85);

noStroke();
  //Moon
fill(0,160,140);
ellipse(100,50,100,100);
fill(0,129,161);
ellipse(100,50,90,90);

  //Terrain
fill(44,85,27);
rect(0,400,600,600);


//Azurill Body
stroke(1);
fill(60);
beginShape();
vertex(400,400);
vertex(500,500);
vertex(400,600);
endShape();
  

fill(74,132,170);
ellipse(300-150,150,200,200);
ellipse(300+150,150,200,200);
ellipse(300+200,300,100,100);
ellipse(300-200,300,100,100);

fill(190,20,147);
ellipse(300-150,150,100,100);
ellipse(300+150,150,100,100);

fill(74,132,170);
ellipse(300,300,400,400);
ellipse(300,650,300,300);
ellipse(300-150,500,200,100);
ellipse(300+150,500,200,100);


//Azurill Face
  //Eye Base
noStroke();
fill(0);
ellipse(300-100,250,50,100);
ellipse(300+100,250,50,100);

   //Iris
fill(255);
ellipse(300-100,230,30,70);
ellipse(300+100,230,30,70);

  //Cheeks
ellipse(300-130,380,50,50);
ellipse(300+130,380,50,50);

  //Mouth
fill(163,74,170);
arc(300,360,60,120,0,PI);
fill(193,55,203);
arc(300,360,60,60,0,PI);
