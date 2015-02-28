
void setup(){
size(400,400);
background(255);
stroke(0);
strokeWeight(0);
}
 
void draw(){
background(255);
//pushMatrix();
translate(mouseX,mouseY);

//cap
fill(62,87,245,255);
ellipse(0,-10,110,100);
stroke(0);
//cara
fill(255);
ellipse(0,10,85,65);
//nas
fill(255,0,0,255);
ellipse(0,5,15,15);
//boca
fill(255,0,0,255);
curve(-20,0,-25,25,25,25,20,15);
//ull esquerre
fill(255);
ellipse(-17,-18,25,28);
fill(0);
ellipse(-17,-18,7,7);

//ull dret
fill(255);
ellipse(17,-18,25,28);
fill(0);
ellipse(17,-18,7,7);

//cos
fill(62,87,245,255);
//rect(-35,35,70,75);
ellipse(0,70,90,80);

//peu esquerre
fill(255);
ellipse(-35,110,50,15);

//peu dret
fill(255);
ellipse(35,110,50,15);

fill(62,87,245);
noStroke();
//braç esquerre
rect(-70,35,45,15);
//braç dret
rect(25,35,45,15);

fill(255);
stroke(0);
//ma esquerra
ellipse(-75,40,20,20);
//ma dreta
ellipse(75,40,20,20);

//collar
fill(255,0,0,255);
rect(-35,30,70,7);

/*butxaca
fill(255);
stroke (0);
curve(-10,20,-45,55,55,55,50,15);
*/

//panxa
fill(255);
ellipse(0,80,60,50);

//cascabell
fill(244,245,62);
ellipse(0,43,17,17);

//popMatrix();

}


