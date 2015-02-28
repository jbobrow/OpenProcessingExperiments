
// Stephanie Noleto

void setup(){
size (1000,1400); 

}


//balão
void draw (){
  
background (37,181,245);  
smooth();
noStroke ();


if (( mouseX>0) && (mouseY>0))  

fill (50);
ellipse (245+mouseX,200+mouseY,400,350);
fill (37,181,245);
rect (0+mouseX,200+mouseY,500,175);


fill (50);
rect (200+mouseX,550+mouseY,100,80);


fill (50);
triangle (50+mouseX,210+mouseY,200+mouseX,540+mouseY,80+mouseX,210+mouseY);
fill(234,64,155);
triangle (85+mouseX,210+mouseY,145+mouseX,210+mouseY,220+mouseX,540+mouseY);
fill (50);
triangle (150+mouseX,210+mouseY,242+mouseX,210+mouseY,238+mouseX,540+mouseY);
fill (95,224,2);
triangle (247+mouseX,210+mouseY,340+mouseX,210+mouseY,253+mouseX,540+mouseY);
fill (50);
triangle (345+mouseX,210+mouseY,405+mouseX,210+mouseY,270+mouseX,540+mouseY);
fill (23,38,255);
triangle (410+mouseX,210+mouseY,440+mouseX,210+mouseY,290+mouseX,540+mouseY);

//passaros
stroke (255); 
noFill ();
pushMatrix ();
translate (mouseX+80/2, mouseY/2); 
arc (-10,0,20,20,3*PI/2,2*PI); 
translate (mouseX+100/2, mouseY/2); 
arc (-10,0,20,20,3*PI/2,2*PI); 
translate (mouseX+60/2, mouseY/2); 
arc (-10,0,20,20,3*PI/2,2*PI); 
translate (mouseX+120/2, mouseY/2); 
arc (-10,0,20,20,3*PI/2,2*PI); 
popMatrix ();

pushMatrix ();
translate (mouseX+80/2, mouseY/2);  
arc (10,0,20,20,PI,3*PI/2); 
translate (mouseX+100/2, mouseY/2); 
arc (10,0,20,20,PI,3*PI/2); 
translate (mouseX+60/2, mouseY/2); 
arc (10,0,20,20,PI,3*PI/2); 
translate (mouseX+120/2, mouseY/2); 
arc (10,0,20,20,PI,3*PI/2); 
popMatrix ();


// nuvens
fill (250);
ellipse (80,485,60,60);
ellipse (60,520,65,65);
ellipse (100,520,65,65);

ellipse (880,685,60,60);
ellipse (860,720,65,65);
ellipse (900,720,65,65);

ellipse (400,800,75,75);
ellipse (360,800,70,60);
ellipse (440,800,70,60);

ellipse (650,250,75,75);
ellipse (610,250,70,60);
ellipse (690,250,70,60);

//sol
fill (252,217,13);
ellipse (60,60,80,80);


}
