
 float pos;
void setup(){
size(600,600);
background(60);
 
 


  
  
pos = 13;
}

void draw(){
pos = pos + 0.3;

//polze dret es mou
stroke(20,20,20);
strokeWeight(1);
fill(mouseX,mouseY,1);
ellipse(mouseX,mouseY,mouseX/5,mouseY/5);


 
//panxa
fill(255,100,5);
arc(width/2,400,height/2 ,width/2 ,-PI,0);
 
//cap
stroke(255,100,5);
fill(255,100,3);
ellipse(width/2,0.28*height,width/2,height/2);
 
//cames
stroke(255,100,5);
fill(255,100,3);
rect(41*width/120,2*height/3,width/3,3*height/40);
 
//peus
stroke(126,50,5);
fill(126,49,1);
rect(17*width/60,89*height/120,53*width/120,height/60);
 
//Cremallera
stroke(0);
line(width/2,2*height/3,width/2,7*height/12);
  
//cara marró
stroke(126,50,5);
strokeWeight(2);
fill(126,49,1);
ellipse(width/2,0.27*height,4*width/15,9*height/40);
 
//elipse carn cara
stroke(250,205,177);
strokeWeight(2);
fill(250,205,177);
ellipse(width/2,27*height/100,105,9*height/40);
 
//ull blanc esquerre
stroke(255);
strokeWeight(2);
fill(255);
ellipse(137*width/300,27*height/100,17*width/200,13*height/120);
 
//ullblanc dret
stroke(255);
strokeWeight(2);
fill(255);
ellipse(325,162,51,65);
 
//pupila esuqerra
stroke(0);
strokeWeight(1);
fill(0);
ellipse(93*width/200,4*height/15,width/60,height/60);
  
//pupila dreta
stroke(0);
strokeWeight(1);
fill(0);
ellipse(320,160,10,10);
 
//ma dreta
stroke(126,50,5);
strokeWeight(1);
fill(126,49,1);
ellipse(435,400,50,50);
 
//ma esquerra
stroke(126,50,5);
strokeWeight(1);
fill(126,49,1);
ellipse(17*width/60,2*height/3,width/12,height/12);
  
 
//polze dret es mou
stroke(20,20,20);
strokeWeight(1);
fill(126,49,1);
ellipse(410,395,30,30);
 
//polze esuquerra
stroke(126,50,5);
strokeWeight(1);
fill(126,49,1);
ellipse(19*width/60,79*height/120,width/20,height/20);




//boira
stroke(250,250,250,20);
strokeWeight(1);
fill(250,250,250,20);
ellipse(0,80,pos*2,10);
ellipse(0,100,pos*3,20);
ellipse(0,120,pos*7,10);
ellipse(0,160,pos,20);
ellipse(0,200,pos*3,5);
ellipse(0,90,pos*6,10);
ellipse(0,300,pos,40);
ellipse(0,350,pos*8,15);
ellipse(0,400,pos*6,30);

fill(250,250,250,6);
ellipse(300,2,pos*5,pos*3);
ellipse(0,5,pos*3,20);
ellipse(0,7,pos*7,10);
ellipse(0,10,pos,20);
ellipse(0,33,pos*3,5);
ellipse(0,44,pos*6,10);
ellipse(0,55,pos,40);
ellipse(0,66,pos*8,15);
ellipse(0,77,pos*6,30);


//boire controlada
//stroke(250,250,250,20);
//strokeWeight(1);
//fill(250,250,250,20);
//ellipse(0,mouseY,pos*2,mouseX/10);



}



