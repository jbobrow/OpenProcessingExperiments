
size(750,500);

background(0);


for(int x=15;x<width;x=x+1){

 

 



pushMatrix();
strokeWeight(2);
rotate(PI/28);
translate(15,20);
stroke(random(255),random(255),random(245),19);
fill(random(250),random(200),random(150),0.2);
//ellipse(375,250,random(375),250);
ellipse(375,250,random(x+375),x+250);

popMatrix();
}
