
void setup() {
size(1000,1000);
 

}
void draw(){ 
  //circle 1
fill(76,98,8);
stroke(random(0,250),74,98);
strokeWeight(1);
ellipse(mouseX+random(0,100),mouseY+random(0,100),25,25);



//circle 2
fill(random(0,255),56,80);
stroke(random(0,255),56,80);
strokeWeight(5);
ellipse(mouseX+random(0,100),mouseY+random(0,100),50,50);



//circle 3
fill(200,random(0,250),67);
stroke(200,random(0,250),67);
strokeWeight(3);
ellipse(mouseX+random(0,100),mouseY+random(0,100),75,75); 
}

