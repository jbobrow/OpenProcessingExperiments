
size(500,500);
 
background(0); 
stroke(0);
noFill();
smooth(); 
//cara
fill(250,109,0);
    ellipse(230,250,350,310);
//corneas
    fill(255);
     ellipse(180,210,80,80);
     ellipse(280,210,80,80);
//pupilas
fill(0);
     ellipse(180,210,30,30);
     ellipse(280,210,30,30);
//nariz
fill(255,196,196);
ellipse(230,250,70,70);
//lengua
fill(255,0,0);
ellipse(230,300,70,70);
//trompa
fill(255,156,80);
 ellipse(185,280,100,100);
     ellipse(275,280,100,100);
     
//melena bezier
translate(250,250);
smooth();
strokeWeight(5);
stroke(2);
float i;
for (i=0;i<200;i++){
  rotate(0.2);
  fill(255,0,0);
 
bezier(100-(i/2.0), 80+i, 310, 50, 320, 250, 220-(i/8.0), 150+(i/4.0));


}


