
size(872,877);
background(255);
stroke(0);
strokeWeight(0);

translate(85,60);
for(int i=0;i<=width;i+=175){
    for(int j=0;j<=height;j+=175){

//cap
fill(62,87,245,255);
ellipse(i+0,j-10,110,100);
stroke(0);
//cara
fill(255);
ellipse(i+0,j+10,85,65);
//nas
fill(255,0,0,255);
ellipse(i+0,j+5,15,15);

//boca
fill(255,0,0,255);
curve(i-20,j+0,i-25,j+25,i+25,j+25,i+20,j+15);


//ull esquerre
fill(255);
ellipse(i-17,j-18,25,28);
fill(0);
ellipse(i-17,j-18,7,7);

//ull dret
fill(255);
ellipse(i+17,j-18,25,28);
fill(0);
ellipse(i+17,j-18,7,7);

//cos
fill(62,87,245,255);
//rect(-35,35,70,75);
ellipse(i+0,j+70,90,80);

//peu esquerre
fill(255);
ellipse(i-35,j+110,50,15);

//peu dret
fill(255);
ellipse(i+35,j+110,50,15);

fill(62,87,245);
noStroke();
//braç esquerre
rect(i-70,j+35,45,15);
//braç dret
rect(i+25,j+35,45,15);

fill(255);
stroke(0);
//ma esquerra
ellipse(i-75,j+40,20,20);
//ma dreta
ellipse(i+75,j+40,20,20);

//collar
fill(255,0,0,255);
rect(i-35,j+30,70,7);

//panxa
fill(255);
ellipse(i+0,j+80,60,50);

//cascabell
fill(244,245,62);
ellipse(i+0,j+43,17,17);

  }//final de j
}//final de i




