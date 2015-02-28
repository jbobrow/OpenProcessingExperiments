
background(100,100,100);
size(450, 250); 
noFill();
strokeWeight(5);
stroke (200,200,200);
//H 
line(50, 20, 50, 100);
line(100,20,100,100);
line(50,60,100,60); 
 //E
 rect(120,20,50,80);
 rect(120,20,50,40);
 stroke(100,100,100);
 line(170,20,170,100); 
 //L
 stroke(200,200,200);
 line(190,20,190,100);
 line(190,100,240,100);
 //L
 line(260,20,260,100);
 line(260,100,310,100); 
  //o
ellipse(355, 60, 50, 80);   
 
//w
curveTightness(4);
beginShape();  
  curveVertex(50, 120); 
  curveVertex(50, 120);
  curveVertex(65, 220);  
  curveVertex(80, 120);  
  curveVertex(95, 220);  
  curveVertex(110, 120);  
  curveVertex(110,120);  
endShape();
//o
ellipse(155, 170, 50, 80); 
//r  arc x,y,w,h,sta,sto
line(200,125,200,220);
line(200,175,235,220);
arc(200,150,70,50, PI*-0.5, PI*0.5);
//l
line(255,125,255,205);
 line(255,205,305,205); 
 
//d
arc(330,165,90,90, PI*-0.5, PI*0.5);
line(330,120,330,210);


